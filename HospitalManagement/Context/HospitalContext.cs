using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Text;
using HospitalManagement.Models;

namespace HospitalManagement.Context
{
    class HospitalContext:DbContext
    {
        private const string connctionString = "server=DESKTOP-HQIELD6\\SQLEXPRESS;Database=HospitalManagementDb;Trusted_Connection=True;";
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connctionString);
        }
        public DbSet<Doctor> Doctors { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Drug> Drugs { get; set; }
        public DbSet<HealthCareAssistant> HealthCareAssistants { get; set; }
        public DbSet<Patient> Patients { get; set; }
        public DbSet<PatientDrugDetail> PatientDrugDetails { get; set; }

        public DbSet<StaffAssignToPatient> StaffAssignToPatients { get; set; }

        public DbSet<vDoctorDepartment> vDoctorDepartments { get; set; }
        public DbSet<vHealthCareAssistant> vHealthCareAssistants { get; set; }

        public DbSet<vStaffAssignToPatient> vStaffAssignToPatients { get; set; }
    }
}
