using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
   public class vStaffAssignToPatient
    {
        [Key]
        public int PatientsDoctorId { get; set; }
        public string PatientId { get; set; }

        public string PatientName { get; set; }
        public string PhoneNumber { get; set; }
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string DoctorPhoneNumber { get; set; }
        public string HealthCareAssistantName { get; set; }
        public string HealthCareAssistantPhoneNumber { get; set; }
        public string DepartmentName { get; set; }

    }
}
