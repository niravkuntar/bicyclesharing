from django.shortcuts import redirect, render
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from hub.models import HubDetails, HubCycle, TimeTable, RegistrationDetails, HubLandmark, StudentDetails, Course
import datetime
import time
from threading import Timer


def requirement():
    while True:
        currentTime = datetime.datetime.now().time()
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
        timetableObj =  list(TimeTable.objects.filter(starttime__lt = currentTime, endtime__gt = currentTime, day=day))
        if len(timetableObj) == 1 and timetableObj[0].courseno == 'Lunch':
            temp = 0
            for obj in HubDetails.objects.all():
                if obj.name != 'Kresit':
                    temp = temp + obj.requirement
                    obj.requirement = 0
            for obj in HubDetails.objects.all():
                obj.requirement = temp

        else:
            # Extract courses running in current time slot.
            courselist = list()
            for obj in timetableObj:
                courseObj = list(Course.objects.filter(courseno=obj.courseno))
                for x in courseObj:
                    courselist.append(x)


            # Extract roll numbers of the students, registered for given courses.
            studentlist = list()
            for x in courselist:
                regObj = list(RegistrationDetails.objects.filter(courseno=x))
                for y in regObj:
                    studentlist.append(y.student.rollno)

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

        # Find current time and see after how much time we should run this  again.
        currentTime = datetime.datetime.now().time().minute
        if currentTime <= 30:
            time.sleep((30-currentTime) * 60)
        else:
            time.sleep((90-currentTime) * 60)


def welcome(request):
    t = Timer(0, requirement)
    t.start()
    return render(request, 'cycleSharing/welcome.html')

def availability(request):
    available = list()
    for obj in HubDetails.objects.all():
        available.append(obj)
    return render(request,'cycleSharing/availability.html',{'available' : available})

def adminview(request):
    return render(request, 'cycleSharing/../load/templates/load/admin.html')

def how(request):
    return render(request, 'cycleSharing/how.html')

def use(request):
    return render(request, 'cycleSharing/use.html')