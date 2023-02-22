require 'json'

module Label_Handler
    def save_label(labels)
        arr = []
        path = '../storage/label.json'

        return unless File.exist?(path)

        labels.map do |e|
          arr << {title: e.title, color: e.color}
        end

        File.write(path, JSON.generate(arr))
      end

      def fetch_label 
        path = '../storage/label.json'

        return [] unless File.exist?(path)

        json_data = File.read(path)
        parsed_data = JSON.parse(json_data)
      
        parsed_data.map do |label|
          Label.new(label['title'], label['color'])
        end
    end
end
