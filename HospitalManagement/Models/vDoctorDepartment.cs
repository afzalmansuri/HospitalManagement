using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace HospitalManagement.Models
{
   public  class vDoctorDepartment
    {
        [Key]
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string DoctorPhoneNumber { get; set; }
        public string DepartmentName { get; set; }
    }
}
