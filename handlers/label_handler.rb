require 'json'

module Label_Handler
    def save_label(labels)
        arr = []
        path = '../storage/label.json'

        return unless File.exist?(path)

        labels.map do |label|
            arr << {title: label.title, color: label.color}
        end

        File.write(path, JSON.pretty_generate(arr))
    end

    def fetch_labels
        data = []
        path = '../storage/label.json'

        return data if File.zero?(path)

        JSON.parse(File.read(path)).each do |label|
            data << Label.new(label['title'], label['color'])
        end

        data
    end
end