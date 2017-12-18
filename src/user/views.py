from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import ProfileForm
from user.models import Purchase, UserBookPurchase

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})

@login_required
def profile(request):
    user = request.user
    message = ""

    current_info = {
        'username': user.username,
        'first_name': user.first_name,
        'last_name': user.last_name,
        'email': user.email,
    }

    # return HttpResponse("this is the user profile page for username '%s'. update first, last, email, username, and password here." % request.user.username)
    if request.method == 'POST':

        # create a form instance and populate it with data from the request
        form = ProfileForm(request.POST)

        if form.is_valid():

            if form.cleaned_data['username'] != user.username:
                user.username = form.cleaned_data['username']

            if form.cleaned_data['first_name'] != user.first_name:
                user.first_name = form.cleaned_data['first_name']

            if form.cleaned_data['last_name'] != user.last_name:
                user.last_name = form.cleaned_data['last_name']

            if form.cleaned_data['email'] != user.email:
                user.email = form.cleaned_data['email']

            if form.cleaned_data['password'] != user.password and form.cleaned_data['password'] != "":
                user.set_password(form.cleaned_data['password'])

            user.save()
            message += "Profile updated."

            return render(request, 'profile.html', {'form': form, 'message': message})

    else:
        form = ProfileForm(current_info)

    purchases = Purchase.objects.filter(by=user)
    books = []
    for p in purchases:
        for b in UserBookPurchase.objects.filter(from_purchase=p):
            books.append(b.ebook)

    return render(request, 'profile.html', {'form': form, 'purchases': books})
