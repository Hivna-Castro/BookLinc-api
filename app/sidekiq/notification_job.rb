class NotificationJob
  include Sidekiq::Job

  def perform(name)
    puts "Enviando Notificacao para #{name}..."
  end
end
