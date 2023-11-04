require 'openai'
module Books
    module Interactors
        class RequestGptInfo
            include Interactor

            def call
                mensagem_gerada = generate_text(context.prompt)
                context.predictions = mensagem_gerada.dig("choices", 0, "message", "content")
            end

            private

            def client
                OpenAI::Client.new(access_token: "sk-")
            end

            def generate_text(prompt)
                response = client.chat(
                parameters: {
                    model: "gpt-3.5-turbo", # Required.
                    messages: [{ role: "user", content: prompt}], # Required.
                    temperature: 0.7,
                })
            end
        end
    end
end