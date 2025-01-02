using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Graphics.Platform;
using WorkoutApp.Models;
using WorkoutApp.Resources.Database;

namespace WorkoutApp.Resources.Controls
{
    class CustomPopup : Popup
    {

        private int muscleGroupId=-1;
        private int excerciseCategoryId=-1;
        public CustomPopup(ExercisesItem item,List<MuscleGroups> muscleGroups,List<ExcerciseCategories> excerciseCategories)
        {

            var excerciseName = new Entry
            {
                Text = item==null?"":item.Name,
                TextColor = Color.FromArgb("#000000"),
                Placeholder = "Exercise Name",
                PlaceholderColor = Color.FromArgb("#3a3b3d"),
                Margin = new Thickness(0, 0, 0, 20)
            };
            var description = new Entry
            {
                Text = item == null ? "" : item.Description,
                TextColor = Color.FromArgb("#000000"),
                PlaceholderColor = Color.FromArgb("#3a3b3d"),
                Placeholder = "Description",
                Margin = new Thickness(0, 0, 0, 20)
            };
            var categoriesDropdown = new Picker
            {
                Title = "Select Category",
                FontAttributes = FontAttributes.Bold,
                TextColor = Color.FromArgb("#000000"),
                Margin = new Thickness(0, 0, 0, 20),
                ItemsSource = excerciseCategories,
                ItemDisplayBinding = new Binding("Name")
            };
            categoriesDropdown.SelectedIndexChanged += (sender, e) =>
            {
                excerciseCategoryId = excerciseCategories[categoriesDropdown.SelectedIndex].Id;
            };
            
            var muscleGroupsDropdown = new Picker
            {
                Title = "Select Muscle Group",
                FontAttributes = FontAttributes.Bold,
                TextColor = Color.FromArgb("#000000"),
                Margin = new Thickness(0, 0, 0, 20),
                ItemsSource = muscleGroups,
                ItemDisplayBinding = new Binding("Name")
            };
            muscleGroupsDropdown.SelectedIndexChanged += (sender, e) =>
            {
                muscleGroupId = muscleGroups[muscleGroupsDropdown.SelectedIndex].Id;
            };
            var button = new Button
            {
                Text = item==null?"Add":"Update",
                CornerRadius = 10,
                Margin = new Thickness(0, 10, 0, 0),
                Command = new Command(() => {
                    var exercise = new ExercisesItem {
                        Id = item?.Id ?? 0,
                        Name = excerciseName.Text,
                        CategoryFK = excerciseCategoryId,
                        MuscleGroupFK = muscleGroupId,
                        Description = description.Text
                    };
                    if(excerciseName.Text != "" && excerciseCategoryId!=-1 && muscleGroupId!=-1)
                    {
                        Close(exercise);
                    }
                    })
            };
            var closeButton = new Button
            {
                Text = "Close",
                CornerRadius = 10,
                Margin = new Thickness(0, 10, 0, 0),
                Command = new Command(() => Close())
            };
            Content = new VerticalStackLayout
            {
                Padding = 10,
                WidthRequest = 300,
                Children =
                {
                    new Label
                    {
                        Text = "Add Exercise",
                        TextColor = Color.FromArgb("#000000"),
                        FontSize = 20,
                        FontAttributes = FontAttributes.Bold,
                        HorizontalOptions = LayoutOptions.Center
                    },
                    excerciseName,
                    description,
                    categoriesDropdown,
                    muscleGroupsDropdown,
                    button,
                    closeButton
                }
            };
        }
    }
}
