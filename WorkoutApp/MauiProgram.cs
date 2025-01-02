using Microsoft.Extensions.Logging;
using WorkoutApp.ViewModels;
using WorkoutApp.Views;
using CommunityToolkit.Maui;
using WorkoutApp.Resources.Services;

namespace WorkoutApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {

            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });
            builder.Services.AddSingleton<IDataTransferService, DataTransferService>();
            builder.Services.AddTransient<MainPage>();
            builder.Services.AddTransient<HomePageViewModel>();
            builder.Services.AddTransient<WorkoutView>();
            builder.Services.AddTransient<WorkoutViewModel>();
            builder.Services.AddTransient<ExercisesView>();
            builder.Services.AddTransient<ExercisesViewModel>();
            builder.Services.AddTransient<UsersView>();
            builder.Services.AddTransient<UsersViewModel>();



#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
