module Service
  module Test
    class Create < Service::BaseService
      def initialize(params)
        super
        @params = params
      end

      def call
        test = Test.new(@params)
        unless test.valid?
          add_error(test.errors.full_messages)
        end
        if test.save
          nil
        else
          add_error(test.errors.full_messages)
        end
      end
    end
  end
end