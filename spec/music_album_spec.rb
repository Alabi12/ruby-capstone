require_relative '../modules/music_album'

describe Music do
    context 'Music Album class test' do
        it 'Should have a boolean on_spotify value' do
            music = Music.new('04/10/2022', true)
            expect(music.on_spotify).to eq(true)
        end

        it 'Should return true for archived because of archived date and on_spotify is true' do
            music = Music.new('04/10/2002', true)
            music.move_to_archive
            expect(music.archived).to eq(true)
        end

        it 'Should return false for archived because of archived date' do
            music = Music.new('23/12/2022', true)
            music.move_to_archive
            expect(music.archived).to eq(false)
        end

        it 'Should return false for archived on_spotify is false' do
            music = Music.new('04/10/2002', false)
            music.move_to_archive
            expect(music.archived).to eq(false)
        end
    end
end