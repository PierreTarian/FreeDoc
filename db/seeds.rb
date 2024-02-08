# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Appel la gem faker pour créer des faux profils
require 'faker'

#destroy all data from class
Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Speciality.destroy_all

#méthode pour créer 100 villes
100.times do
  cities =  City.create!(
    name: Faker::Address.city,
  );
end

#méthode pour créer 100 spécialités
100.times do
  speciality = Speciality.create!(
    name: ["gynéchologue","radiologue","anesthésite","généraliste","rhumatologue"].sample,
  );
end

#méthode pour créer 10 docteurs
10.times do 
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city_id: City.all.sample.id,
    speciality_id: Speciality.all.sample.id
  );
end

#méthode pour créer 100 patients
100.times do 
  patient = Patient.create!(
   first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
   city_id: City.all.sample.id
  );
end

#méthode pour créer 100 rendez-vous
100.times do
  appointment = Appointment.create!(
    date: Faker::Date.between(from: '2014-05-23', to: '2014-09-25'),
    doctor_id: Doctor.all.sample.id,
    patient_id:Patient.all.sample.id,
    city_id: City.all.sample.id
  );
end