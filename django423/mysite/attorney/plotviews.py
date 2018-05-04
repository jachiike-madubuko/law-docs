from django.http import JsonResponse


def plot(request):
    plot = [1, 2]
    print("views plot")
    return JsonResponse(plot, safe=False)
