class Student < ApplicationRecord

	validates :student_id, :student_name, :student_section, :presence => {:message => "ID can't be blank"}
	validates :student_id, :length => {:minimum => 11, :message => "ID is too short (minimum is 11 characters)"}
	validates :student_id, :uniqueness => {:message => "ID has already been taken"}
	validates_numericality_of :student_id, :only_integer => {:message => "ID should be numericality"}
	validates :student_id, :numericality => {message: "ID should be numericality"}
	end