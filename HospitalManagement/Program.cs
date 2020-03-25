using HospitalManagement.Controller;
using System;

namespace HospitalManagement
{
    class Program
    {
        public void Menu()
        {
            HospitalController hospitalController = new HospitalController();
            Console.WriteLine("************         Welcome To Hospital Management Application           **************!");
            Console.WriteLine("     1.   Hospital Admin Site ");
            Console.WriteLine("     2.   View Departments & Doctors ");
            Console.WriteLine("     3.   Doctor Handle ");
            Console.WriteLine("     4.   Exit ");
            Console.Write("Enter Choice : ");
            int choice = Convert.ToInt32(Console.ReadLine());

            switch (choice)
            {
                case 1:
                    hospitalController.HospitalAdmin();
                    break;

                case 2:
                    hospitalController.ViewDepartment();
                    break;

                case 3:
                    hospitalController.DoctorHandle();
                    break;
                case 4:
                    System.Environment.Exit(0);
                    break;

                default:
                    Console.WriteLine("*********       Invalid Choice Enter !!!!! ");
                    break;
            }
        }
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Menu();
        }
    }
}
