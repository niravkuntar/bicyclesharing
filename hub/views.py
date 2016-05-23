from django.shortcuts import render
from django.http import HttpResponse
from hub.models import HubDetails, Landmark, TimeTable, RegistrationDetails, HubLandmark, StudentDetails, Course
from django.utils import timezone
import datetime
import calendar


# Create your views here.
def index(request):
    currentTime = datetime.datetime.now().time()

    # Courses that are currently running
    today = datetime.datetime.today().weekday()
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

    '''
    studentNo = list()
    for obj1 in timetableObj:
        studentObj = list(RegistrationDetails.objects.filter(courseno=obj1))
        #print obj1
    '''
    '''
        for obj2 in studentObj:
            studentNo.append(obj2.student.rollno)
    '''
    #for rollno in studentNo:
    #    print rollno


    for obj in HubDetails.objects.all():
        hublandmarkObj = list(HubLandmark.objects.filter(hub=obj))
        count = 0
        for rollno in studentlist:
            for hlObj in hublandmarkObj:
                studentdetailObj = StudentDetails.objects.filter(rollno=rollno, location=hlObj.landmarkname)
                if len(studentdetailObj) != 0:
                    count = count + 1
        hObj = HubDetails.objects.get(name=obj.name)
        hObj.requirement = count
        hObj.save()

    hubdetails = dict()
    for obj in HubDetails.objects.all():
        hubdetails[obj.name] = obj.requirement
    return render(request, 'cycleSharing/../load/templates/load/admin.html',{'data': hubdetails})
