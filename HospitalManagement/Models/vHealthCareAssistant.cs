using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace HospitalManagement.Models
{
   public  class vHealthCareAssistant
    {
        [Key]
        public int HealthCareAssistantId { get; set; }
        public string HealthCareAssistantName { get; set; }
        public string HealthCareAssistantPhoneNumber { get; set; }
        public string DepartmentName { get; set; }
    }
}
