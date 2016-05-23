from __future__ import unicode_literals
from django.utils import timezone
from django.db import models

class HubDetails(models.Model):
    name = models.CharField(max_length=255)
    requirement = models.IntegerField()
    available = models.IntegerField(default=0)
    newavailable = models.IntegerField(default=0)

class Landmark(models.Model):
    name = models.CharField(max_length=255)

class HubLandmark(models.Model):
    hub = models.ForeignKey(HubDetails)
    landmark = models.ForeignKey(Landmark)
    landmarkname = models.CharField(max_length=255,default='')

class StudentDetails(models.Model):
    rollno = models.IntegerField()
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)

class Course(models.Model):
    courseno = models.CharField(max_length=255)
    coursename = models.CharField(max_length=255)

class RegistrationDetails(models.Model):
    student = models.ForeignKey(StudentDetails)
    courseno = models.ForeignKey(Course)

class TimeTable(models.Model):
    courseno = models.CharField(max_length=30)
    coursename = models.CharField(max_length=255)
    starttime = models.TimeField(null='true')
    endtime = models.TimeField(null='true')
    day = models.CharField(max_length=30)

class HubCycle(models.Model):
    hubid = models.ForeignKey(HubDetails)
    cycleid = models.IntegerField()
    available = models.BooleanField(default=True)

class History(models.Model):
    studentname = models.CharField(max_length=255)
    cycleid = models.IntegerField()
    fromlocation = models.CharField(max_length=255)
    tolocation = models.CharField(max_length=255)