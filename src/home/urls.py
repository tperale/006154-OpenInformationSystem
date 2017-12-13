from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from .views import Welcome

urlpatterns = [
    url(r'^$', Welcome.as_view(), name="home"),
]
