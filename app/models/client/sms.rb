module Client
  class Sms < Base
    self.element_name = "messages"

    def read
      begin
        res = self.patch(:read, user_id: self.user_id)
        self.load( JSON.parse(res.response.body), false)
      ensure
        self
      end
    end

  end
end
