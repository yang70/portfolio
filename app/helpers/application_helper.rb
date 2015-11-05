require 'net/http'
require 'json'

module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true,
                                  :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :lax_html_blocks => true,
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def get_readme(repo_name)

    uri = URI.parse('https://api.github.com/repos/yang70/' + repo_name + '/readme')

    https = Net::HTTP.new(uri.hostname, uri.port)
    https.use_ssl = true

    req = Net::HTTP::Get.new(uri.path, initheader = {'Accept' => 'application/vnd.github.v3.raw'})

    res = https.request(req)

    res.body
  end
end
