local M = {
  gh = function(path)
    return "https://github.com/" .. path
  end,
  build_dap_title = function(title, icon)
    return function(width)
      if width <= 118 then
        return icon
      end

      return title
    end
  end

}

return M
