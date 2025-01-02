using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WorkoutApp.Models
{
    public class ExercisesItem
    {
        [SQLite.PrimaryKey, SQLite.AutoIncrement]
        public int Id { get; set; }
        public string Name { get; set; }
        public int CategoryFK { get; set; }
        public int MuscleGroupFK { get; set; }
        public string Description { get; set; }
    }
}
