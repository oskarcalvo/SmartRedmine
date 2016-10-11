require 'sinatra/base'

module Sinatra
  module FieldSettingsOptionsList
    def field_settings_options_list
      {
        "id" => "id",
        "project" => "Projecto",
        "tracker" => "Tipo",
        "status" => "Etado",
        "priority" => "Prioridad",
        "author" => "Autor",
        "assigned_to" => "Asignado a",
        "subject" => "Título",
        "start_date" => "Fecha comienzo",
        "due_date" => "Fecha de entrega",
        "done_ratio" => "% Realizado",
        "estimated_hours" => "Horas estimadas",
        "spent_hours" => "Horas gastadas",
        "created_on" => "Creacción",
        "updated_on" => "Actualización",
        "closed_on" => "Cerrado"
      }
    end
  end
  helpers FieldSettingsOptionsList
end
