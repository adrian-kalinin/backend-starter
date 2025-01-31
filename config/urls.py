from django.contrib import admin
from django.urls import path
from drf_spectacular.views import SpectacularAPIView
from drf_spectacular.views import SpectacularSwaggerView

urlpatterns = [
    # Django admin site
    path("admin/", admin.site.urls),
    # OpenAPI schema and Swagger UI
    path("api/v1/schema/", SpectacularAPIView.as_view(), name="openapi-schema"),
    path("api/v1/docs/swagger/", SpectacularSwaggerView.as_view(url_name="openapi-schema"), name="swagger-ui"),
]
