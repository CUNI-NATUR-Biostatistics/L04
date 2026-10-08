-- Glossary links in headings otherwise nest inside Quarto's TOC links.
-- Keep the native tooltip and first-occurrence markup, using an inline Span
-- only in headings. Body glossary links and Typst output are unchanged.
local function glossary_spans(inlines)
  local result = pandoc.Inlines({})
  local i = 1
  while i <= #inlines do
    local inline = inlines[i]
    local definition
    if inline.t == "RawInline" and inline.format == "html" then
      local quote
      quote, definition = inline.text:match(
        [[^<a%s+class=['"]glossary['"]%s+title=(['"])(.-)%1[^>]*>$]]
      )
    end
    if definition then
      local closing = i + 1
      while closing <= #inlines do
        local candidate = inlines[closing]
        if candidate.t == "RawInline" and candidate.text == "</a>" then
          break
        end
        closing = closing + 1
      end
      if closing <= #inlines then
        local content = pandoc.Inlines({})
        for j = i + 1, closing - 1 do
          content:insert(inlines[j])
        end
        -- Convert HTML entities into a native attribute value.
        local title = definition:gsub("&quot;", '"'):gsub("&lt;", "<")
          :gsub("&gt;", ">"):gsub("&#39;", "'"):gsub("&apos;", "'")
          :gsub("&amp;", "&")
        result:insert(pandoc.Span(content, pandoc.Attr("", {"glossary"}, {title = title})))
        i = closing + 1
      else
        result:insert(inline)
        i = i + 1
      end
    else
      result:insert(inline)
      i = i + 1
    end
  end
  return result
end

function Header(header)
  if quarto.doc.is_format("html") then
    -- Walk nested emphasis as well as the heading's top-level inlines.
    return header:walk({Inlines = glossary_spans})
  end
end
