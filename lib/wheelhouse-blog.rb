require "wheelhouse"

module Blog
  class Plugin < Wheelhouse::Plugin
    isolate_namespace Blog
    
    resources do
      ::Blog::Blog.select(:id, :label).map do |blog|
        Resource(::Blog::Post, :sublabel => blog.label, :url => blog.new_post_admin_path)
      end
    end
    
    resource { Resource(::Blog::Blog) }
    
    initializer "precompile assets" do |app|
      app.config.assets.precompile << "wheelhouse-blog/admin.*"
    end
  end
end
