using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Doctor
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string DoctorPhoneNumber { get; set; }

        [ForeignKey(nameof(Department))]
        public int DepartmentId { get; set; }

        public Doctor(string name,string phonenumber,int department)
        {
            this.DoctorName = name;
            this.DoctorPhoneNumber = phonenumber;
            this.DepartmentId = department;

        }
        public Doctor()
        {

        }
    }
}
