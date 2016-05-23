from django.shortcuts import render
from django.http import HttpResponse
from hub.models import HubDetails, HubCycle, TimeTable, RegistrationDetails, HubLandmark, StudentDetails, Course
from django.utils import timezone
import datetime
import calendar


def getRequirements(time, today):
    '''
    This function returns requirements at each hub at given time and day
    This function will be called at every hour and requirements and availability will be set according to this function,
    '''
    # Use this time to extract requirements
    # Currently only using day but later, consider time also.

    if today == 0:
        day = 'MON'
    elif today == 1:
        day = 'TUE'
    elif today == 2:
        day = 'WED'
    elif today == 3:
        day = 'THU'
    elif today == 4:
        day = 'FRI'
    elif today == 5:
        day = 'SAT'
    elif today == 6:
        day = 'SUN'
    #courseObj =  list(TimeTable.objects.filter(starttime__lt = currentTime, endtime__gt = currentTime, day=day))
    timetableObj =  list(TimeTable.objects.filter(day=day))
    # If current course is LUNCH then
    # Kresit requirement = A + B + C
    # A = B = C = 0
    courselist = list()
    for obj in timetableObj:
        courseObj = list(Course.objects.filter(courseno=obj.courseno))
        for x in courseObj:
            courselist.append(x)


    studentlist = list()
    for x in courselist:
        regObj = list(RegistrationDetails.objects.filter(courseno=x))
        for y in regObj:
            studentlist.append(y.student.rollno)

    hubdetails = dict()
    for obj in HubDetails.objects.all():
        hublandmarkObj = list(HubLandmark.objects.filter(hub=obj))
        count = 0
        for rollno in studentlist:
            for hlObj in hublandmarkObj:
                studentdetailObj = StudentDetails.objects.filter(rollno=rollno, location=hlObj.landmarkname)
                if len(studentdetailObj) != 0:
                    count = count + 1
        hubdetails[obj.name] = count
    return hubdetails


def adminview(request):
    # If it is get request then simply display available and requirement
    # If it is POST then calculate ratio and change available and make change in table and

    if request.method == 'POST':
        if request.POST.getlist('hubname') and request.POST.getlist('requirement'):
            name = request.POST.getlist('hubname')[0]
            hubObj = HubDetails.objects.get(name=name)
            hubObj.requirement = request.POST.getlist('requirement')[0]
            hubObj.save()
            total = 0
            totalcycle = 0
            for obj in HubDetails.objects.all():
                total = total + obj.requirement
                totalcycle = totalcycle + obj.available
            if total == 0:
                length = len(list(HubDetails.objects.all()))
                for obj in HubDetails.objects.all():
                    obj.newavailable = (totalcycle)/length
                    obj.save()
            else:
                for obj in HubDetails.objects.all():
                    obj.newavailable = float(totalcycle) * (float(obj.requirement)/float(total))
                    obj.save()

            cycles = list()
            for obj in HubDetails.objects.all():
                if obj.newavailable < obj.available:
                    num = obj.available - obj.newavailable
                    hcobj = list(HubCycle.objects.filter(hubid_id=obj.id, available=True)[:num])
                    for hc in hcobj:
                        cycles.append(hc.cycleid)
            count = 0
            for obj in HubDetails.objects.all():
                if obj.newavailable > obj.available:
                    num = obj.newavailable - obj.available
                    while num != 0:
                        hcobj = HubCycle.objects.get(cycleid=cycles[count])
                        hcobj.hubid_id = obj.id
                        hcobj.save()
                        count = count + 1
                        num = num - 1
            for obj in HubDetails.objects.all():
                obj.available = len(list(HubCycle.objects.filter(hubid_id=obj.id, available=True)))
                obj.save()

    available = list()
    for obj in HubDetails.objects.all():
        available.append(obj)
    return render(request, 'admin/admin.html',{'available': available})
