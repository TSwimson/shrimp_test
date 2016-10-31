root = <<-eos
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <title>Test</title>
      </head>
      <body>
        <h1>It works!</h1>
      </body>
    </html>
  eos
get '/' do
  root
end

get '/pdf' do
  content_type 'application/pdf'
  tmp_file = Tempfile.new(SecureRandom.uuid)
  tmp_file.write(root)
  tmp_file.close

  puts tmp_file.path
  pdf_string = Shrimp::Phantom.new(File.new(tmp_file.path)).to_string
  tmp_file.unlink
  pdf_string
end
