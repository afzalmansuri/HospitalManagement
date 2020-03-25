using HospitalManagement.Context;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using HospitalManagement.Models;

namespace HospitalManagement.Controller
{
    class HospitalController
    {
        HospitalContext database = new HospitalContext();
        Program program = new Program();
        int id;
        int assistantdepartid;
        int sendpatientid;
        int drugid;
        public void HospitalAdmin()
        {   
            Console.WriteLine("\n**********      Welcome To Hospital Admin        **************");
            Console.Write("Enter Pin    :   ");
            int pin = Convert.ToInt32(Console.ReadLine());
            if(pin==123)
            {

                Console.WriteLine("     1.  Add Doctor");
                Console.WriteLine("     2.Add HealthCare Assitant");
                Console.WriteLine("     3.Add Patient");
                Console.WriteLine("     4. Back");

               


                Console.Write("Enter Your Choice    :   ");
                int hospitalChoice = Convert.ToInt32(Console.ReadLine());

                switch(hospitalChoice)
                {
                    case 1:
                            AddDoctor();
                            break;
                    case 2:
                        AddHealthCareAssistant();
                        break;

                    case 3:
                        AddPatient();
                        break;

                    case 4:
                        program.Menu();
                        break;

                    default:
                        Console.WriteLine("Invalid Choice Enter");
                        break;
                }
            }
            else
            {
                Console.WriteLine(" *********       Invalid Pin     *********");
                program.Menu();
            }
        }

                public void AddDoctor()
                {
                    Console.Write("Enter Name   :   ");
                    string name = Console.ReadLine();
                    Console.Write("Enter PhoneNumber    :   ");
                    string number = Console.ReadLine();
                    Console.Write("Enter Department Name    :   ");
                    string departmentname = Console.ReadLine();
                    
                    var departmentobj = database.Departments.Where(t => t.DepartmentName == departmentname);

                    foreach (var department in departmentobj)
                    {
                        id = department.DepartmentId;
                    }

                    Doctor doctor = new Doctor(name, number, id);
                    try
                    {
                        database.Add(doctor);
                        database.SaveChanges();
                        Console.WriteLine("Doctor  successfully added..");

                        HospitalAdmin();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                    }
                }

        public void DoctorHandle()
        {
            
            Console.Write("Enter Your Id   :   ");
            int doctorId = Convert.ToInt32(Console.ReadLine());
            int recordcount=database.Doctors.Where(t => t.DoctorId == doctorId).Count();
            if (recordcount == 0)
            {
                Console.WriteLine("Invalid Id");
                DoctorHandle();
               
            }
            else
            {
                Console.WriteLine("1. Show My Patient");
                Console.WriteLine("2. Add Drug Details To Patient");
                Console.WriteLine("3. Exit");
                Console.Write("Enter Youy Choice    :   ");
                int choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        
                       var doctorspatientobj= database.vStaffAssignToPatients.Where(t => t.DoctorId ==doctorId);
                        foreach(var single in doctorspatientobj)
                        {
                            Console.WriteLine("Patient Id   :   " + single.PatientId + "    Patient Name    :   "+single.PatientName+"      Patient Phone Number"+single.PhoneNumber);
                        }
                        DoctorHandle();
                        break;
                    case 2:
                        Console.Write("Enter Patient Id :   ");
                        int drugpatientid = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Drug Description :    ");
                        string drugdesc = Console.ReadLine();
                        Console.Write("Enter Drug Name :    ");
                        string drugname = Console.ReadLine();

                        var drugobj=database.Drugs.Where(t => t.DrugName == drugname);
                        if(drugobj.Count()==0)
                        {
                            Console.WriteLine("Drug not Available");
                        }
                        else
                        {
                            foreach (var singledrug in drugobj)
                            {
                                drugid = singledrug.DrugId;
                            }

                            try
                            {
                                PatientDrugDetail patientdrugdetail = new PatientDrugDetail(drugdesc, drugid, drugpatientid);
                                database.PatientDrugDetails.Add(patientdrugdetail);
                                database.SaveChanges();
                                Console.WriteLine("Prescription Successfully Added");
                                DoctorHandle();

                            }
                            catch
                            {
                                Console.WriteLine("Something Went Wrong....");
                            }
                        }
                        

                        break;
                    case 3:
                        System.Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("Invalid Choice Enter");
                        break;
                }

            }

        }
        public void AddHealthCareAssistant()
        {
            
            Console.Write("Enter Name    :   ");
            string assistantname = Console.ReadLine();

            Console.Write("Enter Phone Number   :   ");
            string assistantnumber = Console.ReadLine();

            Console.Write("Enter Department Name    :   ");
            string departmentname = Console.ReadLine();

            var departmentobj = database.Departments.Where(t => t.DepartmentName == departmentname);

            foreach (var department in departmentobj)
            {
                assistantdepartid = department.DepartmentId;
            }

            HealthCareAssistant healthcareassistant = new HealthCareAssistant(assistantname,assistantnumber, assistantdepartid);
            try
            {
                database.Add(healthcareassistant);
                database.SaveChanges();
                Console.WriteLine("Health Care Assistant Added Sucessfully");
                HospitalAdmin();
            }
            catch(Exception e)
            {
                Console.WriteLine(e);
                HospitalAdmin();
            }

        }




        public void  AddPatient()
        {
            int patientid;
           
           string   patientfindmobilenumber;
            Console.Write("Enter Patient Name   :   ");
            string patientname = Console.ReadLine();

            Console.Write("Enter Paient Age     :   ");
            int age = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter Patient Gender     :   ");
            string gender = Console.ReadLine();

            Console.Write("Enter Phone NUmber   :   ");
            string mobilenumber = Console.ReadLine();

            Console.Write("Patient Address      :   ");
            string address = Console.ReadLine();

            Console.Write("Patient Disease      :   ");
            string disease = Console.ReadLine();

            DateTime now = DateTime.Now;

            var patientfind = database.Patients.Where(t=>t.PhoneNumber==mobilenumber);

           

            if(patientfind.Count()>=1)
            {
                Console.WriteLine("Something Went Wrong1st");
            }
            else
            {
                Patient patient = new Patient(patientname, age, gender, mobilenumber, address, disease, now);

                try
                {
                    database.Add(patient);
                    database.SaveChanges();
                    Console.WriteLine("Patient Successfully Added..!!");

                   var patientfindid=database.Patients.Where(t => t.PhoneNumber == mobilenumber);
                    
                    foreach(var single in patientfindid)
                    {
                        Console.WriteLine("Patient Id   :  "+single.PatientId+"     Patient Name     :   "+single.PatientName+"  Patien Mobile Number    :   "+single.PhoneNumber);

                         sendpatientid = single.PatientId;
                    }

                    AssignStaff(sendpatientid);

                   
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    Console.WriteLine("Something went wrong");
                    HospitalAdmin();
                }
            }
            
           

        }

        public void AssignStaff(int sendpatientid)
        {

            Console.Write("Enter Department :   ");
            string getdepartment = Console.ReadLine();

            
            var doctorobj = database.vDoctorDepartments.Where(t=>t.DepartmentName==getdepartment);
            var assistantobj = database.vHealthCareAssistants.Where(t => t.DepartmentName == getdepartment);
            if(doctorobj.Count()==0)
            {
                Console.WriteLine("*Invalid DepartMent Name");
                AssignStaff(sendpatientid);
            }
            else
            {
                Console.WriteLine("Department Doctors");
                foreach (var singledoctor in doctorobj)
                {
                    
                    Console.WriteLine("Doctor Id    :   " + singledoctor.DoctorId + "     Doctor Name :   " + singledoctor.DoctorName + "    Doctor Department   :   " + singledoctor.DepartmentName);
                }

                Console.WriteLine("Department HealthCare Assistant");
                foreach (var singleassistant in assistantobj)
                {

                    Console.WriteLine("Health-Care Assistant Id    :   " + singleassistant.HealthCareAssistantId + "     Health-Care Assistant  Name :   " + singleassistant.HealthCareAssistantName + "    Health-Care Assistant  Department   :   " + singleassistant.DepartmentName);
                }



                Console.Write("Enter Doctor Id  :   ");
                int doctorid = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter Health Care Assistant Id   :   ");
                int assistid = Convert.ToInt32(Console.ReadLine());

                try
                {
                    StaffAssignToPatient assignpatientobj = new StaffAssignToPatient(sendpatientid,doctorid,assistid);
                    database.Add(assignpatientobj);
                    database.SaveChanges();
                    Console.WriteLine("Staff Assign SuccessFully");
                    HospitalAdmin();
                }
                catch(Exception e)
                {
                   
                    Console.WriteLine("Something Went Wrong Please Try Again");
                    AssignStaff(sendpatientid);

                }



            }
           
        }
       
        public void ViewDepartment()
        {
            var department = database.Departments;
            try
            {
                foreach(var depart in department)
                {
                    Console.WriteLine("DepartMent Name: " + depart.DepartmentName);
                }

                Console.WriteLine("1. View Doctors");
                Console.WriteLine("2. Back");
                Console.Write("Enter Your Chice     :       ");
                int viewchoice = Convert.ToInt32(Console.ReadLine());
                switch(viewchoice)
                {
                    case 1:
                        Console.Write(" Enter Department Name To View Doctor List : ");
                        string departmentname = Console.ReadLine();
                        var doctorlist = database.vDoctorDepartments.Where(t => t.DepartmentName == departmentname);
                        if(doctorlist.Count() >=1)
                        {
                            foreach (var doctor in doctorlist)
                            {
                                Console.WriteLine("DoctorName   :   " + doctor.DoctorName + "     ,   Contact No     :   " + doctor.DoctorPhoneNumber);

                            }
                            ViewDepartment();
                        }
                        else
                        {
                            Console.WriteLine("Invalid Department Name");
                            ViewDepartment();
                        }
                        

                        break;
                    case 2:
                       
                        program.Menu();
                        break;
                    default:
                        Console.WriteLine(" **  Invalid Choice Enter");
                        break;
                }




               
                program.Menu();
            }
            catch(Exception e)
            {
                Console.WriteLine(e);
            }

            
        }
    }
}
