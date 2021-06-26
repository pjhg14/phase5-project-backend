class InterviewSerializer < ActiveModel::Serializer
    attributes :id, :application_id, :interviewer, :iv_email, :iv_date
end
