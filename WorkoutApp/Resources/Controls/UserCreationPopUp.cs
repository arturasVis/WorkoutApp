using CommunityToolkit.Maui.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WorkoutApp.Models;

namespace WorkoutApp.Resources.Controls
{
    public class UserCreationPopUp : Popup
    {
        public UserCreationPopUp(User user)
        {
            var nameEntry = new Entry
            {
                Text = user?.Name??"",
                TextColor = Color.FromArgb("#000000"),
                Placeholder = "Name",
                PlaceholderColor = Color.FromArgb("#3a3b3d"),
                Margin = new Thickness(0, 0, 0, 20)

            };
            var weightEntry = new Entry
            {
                Text = user?.Weight.ToString() ?? "",
                TextColor = Color.FromArgb("#000000"),
                Placeholder = "Weight",
                PlaceholderColor = Color.FromArgb("#3a3b3d"),
                Margin = new Thickness(0, 0, 0, 20)

            };
            var heightEntry = new Entry
            {
                Text = user?.Height.ToString() ?? "",
                TextColor = Color.FromArgb("#000000"),
                Placeholder = "Height",
                PlaceholderColor = Color.FromArgb("#3a3b3d"),
                Margin = new Thickness(0, 0, 0, 20)

            };
            var ageEntry = new Entry
            {
                Text = user?.Age ?? "",
                TextColor = Color.FromArgb("#000000"),
                Placeholder = "Age",
                PlaceholderColor = Color.FromArgb("#3a3b3d"),
                Margin = new Thickness(0, 0, 0, 20)

            };
            var saveButton = new Button
            {
                Text = "Save",
                BackgroundColor = Color.FromArgb("#000000"),
                TextColor = Color.FromArgb("#ffffff"),
                Margin = new Thickness(0, 0, 0, 20),
                Command = new Command(() => {
                    if (nameEntry.Text == null || weightEntry.Text == null || heightEntry.Text == null || ageEntry.Text == null)
                    {
                        return;
                    }
                    var item = new User
                    {
                        Id = user?.Id ?? 0,
                        Name = nameEntry.Text,
                        Weight = Convert.ToDouble(weightEntry.Text),
                        Height = Convert.ToDouble(heightEntry.Text),
                        Age = ageEntry.Text
                    };
                    Close(item);
                })
            };
            var closebutton= new Button
            {
                Text = "Close",
                BackgroundColor = Color.FromArgb("#000000"),
                TextColor = Color.FromArgb("#ffffff"),
                Margin = new Thickness(0, 0, 0, 20),
                Command = new Command(() => { Close(); })
            };
            Content = new VerticalStackLayout
            {
                Padding=10,
                WidthRequest = 300,
                Children = 
                {
                    nameEntry,
                    weightEntry,
                    heightEntry,
                    ageEntry,
                    saveButton
                }
            };
        }
    }
}
