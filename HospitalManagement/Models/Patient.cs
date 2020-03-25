using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
   public  class Patient
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string Disease { get; set; }

        public DateTime AdmitDate { get; set; }
        public Patient(string name, int age, string gender,string phonenumber,string address,string disease,DateTime admitdate)
        {
            this.PatientName = name;
            this.Age = age;
            this.Gender = gender;
            this.PhoneNumber = phonenumber;
            this.Address = address;
            this.Disease = disease;
            this.AdmitDate = admitdate;
        }
        public Patient()
        {

        }

    }
}
