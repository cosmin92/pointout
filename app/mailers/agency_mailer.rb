class AgencyMailer < ActionMailer::Base
  default from: 'me@gmail.com'

  def send_email_to(agency, report)
    @agency = agency
    @report = report
    @signaler = @report.signaler
    @url = report_url(@report.id)
    @report.images.each_with_index do |image, index|
      attachments[image.url.split("/").last ] = File.read("public"+image.url)
    end
    mail(to: @agency.email, subject: @report.object)
  end

end
