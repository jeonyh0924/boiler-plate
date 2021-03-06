from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    img = models.ImageField(upload_to='user', blank=True, null=True)
