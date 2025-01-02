using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WorkoutApp.Resources.Services
{
    public interface IDataTransferService
    {
        void SetData<T>(T data);
        T GetData<T>();
    }
    public class DataTransferService : IDataTransferService
    {
        private object _data;
        public void SetData<T>(T data)
        {
            _data = data;
        }
        public T GetData<T>()
        {
            return (T)_data;
        }
    }
}
