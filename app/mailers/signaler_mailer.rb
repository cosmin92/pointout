class SignalerMailer < ActionMailer::Base
  default from: 'me@gmail.com'

  def send_email_to(signaler, report, agency)
    @signaler = signaler
    @report = report
    @agency = agency
    @url = report_url(@report)
    mail(to: @signaler.email, subject: "PointOut: " + @report.object)
  end

end
