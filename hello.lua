#!/usr/bin/env wsapi.cgi

    local orbit = require "orbit"

 
    module("hello", package.seeall, orbit.new)

    

    function index(web)
      return render_index()
    end

    function say(web, name)
      return render_say(web, name)
    end

   
    hello:dispatch_get(index, "/", "/index")
    hello:dispatch_get(say, "/say/(%a+)")

    
    function render_layout(inner_html)
       return html{
         head{ title"Hello" },
         body{ inner_html }
       }
    end

    function render_hello()
       return p.hello"Hello!!! My name is Atira. (0~o)\ "
    end

    function render_index()
       return render_layout(render_hello())
    end

    function render_say(web, name)
       return render_layout(render_hello() .. 
         p.hello((web.input.greeting or "Hello ") .. name .. "!"))
    end

    orbit.htmlify(hello, "render_.+")

    return _M
