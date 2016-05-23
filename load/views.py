from django.shortcuts import render
from django.contrib.auth import authenticate
from django.http import HttpResponse, HttpResponseForbidden, HttpResponseNotFound, HttpResponseRedirect
from django.contrib.auth import login, logout
from django.contrib.auth.models import User

# Create your views here.

def auth_login(request):
    print "IN aut_login"
    if request.method == 'POST':
        print "In post requrest"
        user = authenticate(username=request.POST['login'], password=request.POST['password'])
        print "username : ",request.POST['login'],request.POST['password'],user
        if user is not None:
            # the password verified for the user
            if user.is_active:
                print "User is valid and everything is fine"
                login(request, user)
                if request.user.is_staff:
                    return HttpResponseRedirect('/admin/')
                else:
                   return HttpResponseRedirect('/student/')
            else:
                print("The password is valid, but the account has been disabled!")

        else:
            # the authentication system was unable to verify the username and password
            print("The username and password were incorrect.")

    return render(request, 'load/login.html', {'nbar': 'home', 'loggedin': False})

def auth_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

def auth_signup(request):
    if request.method == 'GET':
        return render(request,'load/signup.html')
    else:
        print request.POST['username'],request.POST['password'],request.POST['fname'],request.POST['lname']
        username = request.POST['username']
        pwd = request.POST['password']
        fname = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        user = User.objects.create_user(username, email, pwd)
        user.first_name = fname
        user.last_name = lname
        user.save()
        return render(request,'load/login.html')