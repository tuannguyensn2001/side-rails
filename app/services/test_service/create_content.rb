module TestService
  class CreateContent < BaseService
    def initialize(params)
      super
      @params = params
    end

    def call
      begin
        test = Test.find(@params[:test_id])
      rescue ActiveRecord::RecordNotFound
        add_error('Test not found')
        return
      end

      ActiveRecord::Base.transaction do
        content = TestContent.where(test_id: test.id).first
        content.testable.destroy if content.testable.present?
        content.destroy if content.present?

        test_multiple_choice = TestMultipleChoice.new file_path: @params[:multiple_choice][:file_path], score: @params[:multiple_choice][:score]
        test_multiple_choice.save!
        answers = []

        @params[:multiple_choice][:answers].each do |answer|
          answers << { answer: answer[:answer], score: answer[:score], test_multiple_choice_id: test_multiple_choice.id }
        end

        TestMultipleChoiceAnswer.create! answers
        test_multiple_choice.test_content = TestContent.new test_id: test.id
        test_multiple_choice.save!

      end
    end
  end
end