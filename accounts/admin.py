from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from accounts.models import User


class UserAdmin(UserAdmin):
    list_display = ("email", "first_name", "last_name")
    search_fields = ("email", "first_name", "last_name")
    ordering = ("-created_at",)

    fieldsets = (
        (None, {"fields": ("email", "password")}),
        ("Personal Information", {"fields": ("first_name", "last_name")}),
        ("Important dates", {"fields": ("last_login", "updated_at", "created_at")}),
        ("Permissions", {"fields": ("is_active", "is_staff", "is_superuser", "groups", "user_permissions")}),
    )
    readonly_fields = ("last_login", "created_at", "updated_at")

    add_fieldsets = ((None, {"fields": ("email", "password1", "password2")}),)


admin.site.register(User, UserAdmin)
