ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do


    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Reports" do
          ul do
            Report.take(5).map do |post|
              li link_to(post.object, admin_report_path(post))
            end
          end
        end
      end


      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
