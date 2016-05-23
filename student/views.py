from django.shortcuts import render
from django.contrib.auth import authenticate
from hub.models import HubDetails, HubCycle, History
from django.http import HttpResponse, HttpResponseForbidden, HttpResponseNotFound, HttpResponseRedirect

from django.contrib.auth import login, logout
from django.contrib.auth.models import User

# Create your views here.

def studentview(request):
    if request.user.is_staff:
        return HttpResponseRedirect('/admin/')
    if request.method == 'POST':
        if request.POST.getlist('fromlocation'):
            booklocation = request.POST.getlist('fromlocation')[0]
            cycleid = request.POST.getlist('cycleid')[0]
            hubobj = HubDetails.objects.get(name=booklocation)
            if hubobj.available != 0:
                hubobj.available = hubobj.available - 1
                hubobj.save()
            hcobj = HubCycle.objects.get(cycleid=cycleid, hubid_id=hubobj.id)
            hcobj.available = False
            hcobj.save()
            historyobj = History.objects.create(studentname=request.user.username, cycleid=cycleid, fromlocation=booklocation, tolocation='')
            historyobj.save()
        elif request.POST.getlist('tolocation'):
            droplocation = request.POST.getlist('tolocation')[0]
            cycleid = request.POST.getlist('cycledropid')[0]
            hubobj = HubDetails.objects.get(name=droplocation)
            hubobj.available = hubobj.available + 1
            hcobj = HubCycle.objects.get(cycleid=cycleid, hubid_id=hubobj.id)
            hcobj.hubid_id = hubobj.id
            hcobj.available = True
            hcobj.save()
            hubobj.save()
            historyobj = History.objects.get(studentname=request.user.username, cycleid=cycleid, tolocation='')
            historyobj.tolocation = droplocation
            historyobj.save()
        # Also add some checking and all to see that its valid or not
    available = dict()
    for obj in HubDetails.objects.all():
        available[obj.name] = obj.available

    hub = list()
    for obj in HubCycle.objects.all():
        hub.append(obj)
    cyclelist = list()
    for obj in History.objects.filter(studentname=request.user.username, tolocation=''):
        cyclelist.append(obj)
    return render(request, 'student/student.html',{'available': available, 'hub': hub, 'cyclelist': cyclelist})

def currentbookings(request):
    if request.user.is_staff:
        set = True
        obj=list(History.objects.filter(tolocation=''))
    else:
        set = False
        obj=list(History.objects.filter(studentname=request.user.username, tolocation=''))
    return render(request,'student/bookings.html',{'objlist': obj, 'set': set})

def history(request):
    if request.user.is_staff:
        set = True
        obj=list(History.objects.all())
    else:
        set = False
        obj=list(History.objects.filter(studentname=request.user.username))
    return render(request,'student/history.html',{'objlist': obj, 'set': set})

