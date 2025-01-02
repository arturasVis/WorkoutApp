using WorkoutApp.ViewModels.WorkoutPageViewmodels;
namespace WorkoutApp.UserControls;

public partial class WorkoutListControl : ContentView
{

    public static readonly BindableProperty TitleCardProperty = BindableProperty.Create(nameof(TitleCard), typeof(string), typeof(WorkoutListControl), string.Empty);
    public string TitleCard
    {
        get => (string)GetValue(WorkoutListControl.TitleCardProperty);
        set => SetValue(WorkoutListControl.TitleCardProperty, value);
    }
    public static readonly BindableProperty DescriptionProperty = BindableProperty.Create(nameof(Description), typeof(string), typeof(WorkoutListControl), string.Empty);
    public string Description
    {
        get => (string)GetValue(WorkoutListControl.DescriptionProperty);
        set => SetValue(WorkoutListControl.DescriptionProperty, value);
    }
    public WorkoutListControl()
	{
		InitializeComponent();
    }
}