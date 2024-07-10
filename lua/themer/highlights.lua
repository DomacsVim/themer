local M = {defaults = {}, plugins = {}}

local themer = require("themer")

local theme = themer.themes(dvim.colorscheme)

themer.term(theme)

M.defaults = {
  Foo = { bg = theme.base0E, fg = theme.base05 },

  Comment = { fg = theme.base05, italic = true }, -- any comment
  ColorColumn = { bg = theme.base01 }, -- used for the columns set with 'colorcolumn'
  Conceal = { fg = theme.base01 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
  Cursor = { fg = theme.base01, bg = theme.base05 },
  vCursor = { fg = theme.base01, bg = theme.base05 },
  iCursor = { fg = theme.base01, bg = theme.base05 },
  lCursor = { fg = theme.base01, bg = theme.base05 },
  CursorIM = { fg = theme.base01, bg = theme.base05 },
  CursorColumn = { bg = theme.base05 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLine = { bg = theme.base00 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
  Directory = { fg = theme.base0D }, -- directory names (and other special names in listings)
  DiffAdd = { bg = theme.base0D }, -- diff mode: Added line |diff.txt|
  DiffChange = { bg = theme.base01  }, -- diff mode: Changed line |diff.txt|
  DiffDelete = { bg = theme.base08 }, -- diff mode: Deleted line |diff.txt|
  DiffText = { bg = theme.base0B }, -- diff mode: Changed text within a changed line |diff.txt|
  EndOfBuffer = { fg = theme.base01 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
  -- -- TermCursor  = { }, -- cursor in a focused terminal
  -- -- TermCursorNC= { }, -- cursor in an unfocused terminal
  ErrorMsg = { fg = theme.base08 }, -- error messages on the command line
  WinSeparator = { fg = theme.base00, bg = theme.base00 }, -- the column separating vertically split windows
  Folded = { fg = theme.base0D, bg = theme.base01 }, -- line used for closed folds
  FoldColumn = { bg = theme.base01, fg = theme.base03 }, -- 'foldcolumn'
  SignColumn = { bg = theme.base01 }, -- column where |signs| are displayed
  SignColumnSB = { bg = theme.base01, fg = theme.base01 }, -- column where |signs| are displayed
  Substitute = { bg = theme.base08, fg = theme.base01 }, -- |:substitute| replacement text highlighting
  LineNr = { fg = theme.base05 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  CursorLineNr = { fg = theme.base07, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  MatchParen = { fg = theme.base09, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  ModeMsg = { fg = theme.base05, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea = { fg = theme.base07 }, -- Area for messages and cmdline
  -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
  MoreMsg = { fg = theme.base0D }, -- |more-prompt|
  NonText = { fg = theme.base03 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  Normal = { fg = theme.base06, bg = theme.base01 }, -- normal text
  NormalNC = { fg = theme.base06, bg = theme.base01 }, -- normal text in non-current windows
  NormalSB = { fg = theme.base06, bg = theme.base01 }, -- normal text in sidebar
  NormalFloat = { fg = theme.base06, bg = theme.base00 }, -- Normal text in floating windows.
  FloatBorder = { fg = theme.base04, bg = theme.base00 },
  FloatTitle = { fg = theme.base04, bg = theme.base00 },
  Pmenu = { bg = theme.base00, fg = theme.base05 }, -- Popup menu: normal item.
  PmenuSel = { bg = theme.base0D, fg = theme.base01, bold = true }, -- Popup menu: selected item.
  PmenuSbar = { bg = theme.base0D, fg = theme.base01, bold = true }, -- Popup menu: scrollbar.
  PmenuThumb = { bg = theme.base05 }, -- Popup menu: Thumb of the scrollbar.
  Question = { fg = theme.base0D }, -- |hit-enter| prompt and yes/no questions
  QuickFixLine = { bg = theme.base00, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  Search = { bg = theme.base01, fg = theme.base09 }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
  IncSearch = { bg = theme.base09, fg = theme.base00 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  CurSearch = { bg = theme.base09, fg = theme.base00 },
  SpecialKey = { fg = theme.base09 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
  SpellBad = { sp = theme.base08, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap = { sp = theme.base0A, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal = { sp = theme.base0D, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise. SpellRare = { sp = theme.base0C, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
  StatusLine = { fg = theme.base06, bg = theme.base00 }, -- status line of current window
  StatusLineNC = { fg = theme.base06, bg = theme.base00 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  TabLine = { bg = theme.base00, fg = theme.base05 }, -- tab pages line, not active tab page label
  TabLineFill = { bg = theme.base00 }, -- tab pages line, where there are no labels
  TabLineSel = { fg = theme.base00, bg = theme.base0D }, -- tab pages line, active tab page label
  Title = { fg = theme.base0A, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
  Visual = { bg = theme.base03 }, -- Visual mode selection
  VisualNOS = { bg = theme.base00 }, -- Visual mode selection when vim is "Not Owning the Selection".
  WarningMsg = { fg = theme.base0A }, -- warning messages
  Whitespace = { fg = theme.base05 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  WildMenu = { bg = theme.base00 }, -- current match in 'wildmenu' completion
  WinBar = { fg = theme.base05, bg = theme.base00 }, -- window bar
  WinBarNC = { fg = theme.base05, bg = theme.base00 }, -- window bar in inactive windows

  -- -- These groups are not listed as default vim groups,
  -- -- but they are defacto standard group names for syntax highlighting.
  -- -- commented out groups should chain up to their "preferred" group by
  -- -- default,
  -- -- Uncomment and edit if you want more specific syntax highlighting.

  Constant = { fg = theme.base09 }, -- (preferred) any constant
  String = { fg = theme.base0B }, --   a string constant: "this is a string"
  Character = { fg = theme.base0B }, --  a character constant: 'c', '\n'
  -- -- Number        = { }, --   a number constant: 234, 0xff
  -- -- Boolean       = { }, --  a boolean constant: TRUE, false
  -- -- Float         = { }, --    a floating point constant: 2.3e10

  Identifier = { fg = theme.base0E }, -- (preferred) any variable name
  Function = { fg = theme.base0D }, -- function name (also: methods for classes)

  Statement = { fg = theme.base0E }, -- (preferred) any statement
  -- -- Conditional   = { }, --  if, then, else, endif, switch, etc.
  -- -- Repeat        = { }, --   for, do, while, etc.
  Label         = { fg = theme.base0A }, --    case, default, etc.
  Operator = { fg = theme.base08 }, -- "sizeof", "+", "*", etc.
  Keyword = { fg = theme.base0E }, --  any other keyword
  -- -- Exception     = { }, --  try, catch, throw

  PreProc = { fg = theme.base0C }, -- (preferred) generic Preprocessor
  Include = { fg = theme.base0A }, --  preprocessor #include
  -- -- Define        = { }, --   preprocessor #define
  Macro   = { fg = theme.base08 }, --    same as Define
  -- -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

  Type = { fg = theme.base0D }, -- (preferred) int, long, char, etc.
  -- -- StorageClass  = { }, -- static, register, volatile, etc.
  -- -- Structure     = { }, --  struct, union, enum, etc.
  -- -- Typedef       = { }, --  A typedef

  Special = { fg = theme.base0D }, -- (preferred) any special symbol
  SpecialChar   = { fg = theme.base08 }, --  special character in a constant
  Tag           = { fg = theme.base08 }, --    you can use CTRL-] on this
  Delimiter = { fg = theme.base08 }, --  character that needs attention
  -- -- SpecialComment= { }, -- special things inside a comment
  Debug = { fg = theme.base09 }, --    debugging statements

  Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
  Bold = { bold = true, fg = theme.base05 }, -- (preferred) any bold text
  Italic = { italic = true, fg = theme.base05 }, -- (preferred) any italic text

  -- -- ("Ignore", below, may be invisible...)
  -- -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

  Error = { fg = theme.base08 }, -- (preferred) any erroneous construct
  Todo = { bg = theme.base0A, fg = theme.base00 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  qfLineNr = { fg = theme.base00 },
  qfFileName = { fg = theme.base0D },

  htmlH1 = { fg = theme.base0E, bold = true },
  htmlH2 = { fg = theme.base0D, bold = true },

  mkdHeading = { fg = theme.base09, bold = true },
  mkdCode = { bg = theme.base02, fg = theme.base07 },
  mkdCodeDelimiter = { bg = theme.base02, fg = theme.base07 },
  mkdCodeStart = { fg = theme.base0D, bold = true },
  mkdCodeEnd = { fg = theme.base0D, bold = true },
  mkdLink = { fg = theme.base0D, underline = true },

  markdownHeadingDelimiter = { fg = theme.base09, bold = true },
  markdownCode = { fg = theme.base0D },
  markdownCodeBlock = { fg = theme.base0D },
  markdownH1 = { fg = theme.base0E, bold = true },
  markdownH2 = { fg = theme.base0D, bold = true },
  markdownLinkText = { fg = theme.base0D, underline = true },

  ["helpCommand"] = { bg = theme.base02, fg = theme.base0D },

  debugPC = { bg = theme.base00 }, -- used for highlighting the current line in terminal-debug
  debugBreakpoint = { bg = theme.base0D, fg = theme.base0D }, -- used for breakpoint colors in terminal-debug

  -- -- These groups are for the native LSP client. Some other LSP clients may
  -- -- use these groups, or use their own. Consult your LSP client's
  -- -- documentation.
  LspReferenceText = { bg = theme.base05 }, -- used for highlighting "text" references
  LspReferenceRead = { bg = theme.base05 }, -- used for highlighting "read" references
  LspReferenceWrite = { bg = theme.base05 }, -- used for highlighting "write" references

  DiagnosticError = { fg = theme.base08 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticWarn = { fg = theme.base0A }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticInfo = { fg = theme.base0D }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticHint = { fg = theme.base0C }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticUnnecessary = { fg = theme.base02 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

  DiagnosticVirtualTextError = { fg = theme.base08 }, -- Used for "Error" diagnostic virtual text
  DiagnosticVirtualTextWarn = { fg = theme.base0A }, -- Used for "Warning" diagnostic virtual text
  DiagnosticVirtualTextInfo = { fg = theme.base0D }, -- Used for "Information" diagnostic virtual text
  DiagnosticVirtualTextHint = { fg = theme.base0C }, -- Used for "Hint" diagnostic virtual text

  DiagnosticUnderlineError = { undercurl = true, sp = theme.base08 }, -- Used to underline "Error" diagnostics
  DiagnosticUnderlineWarn = { undercurl = true, sp = theme.base0A }, -- Used to underline "Warning" diagnostics
  DiagnosticUnderlineInfo = { undercurl = true, sp = theme.base0D }, -- Used to underline "Information" diagnostics
  DiagnosticUnderlineHint = { undercurl = true, sp = theme.base0C }, -- Used to underline "Hint" diagnostics

  LspSignatureActiveParameter = { bold = true },
  LspCodeLens = { fg = theme.base03 },
  LspInlayHint = { fg = theme.base03 },

  LspInfoBorder = { fg = theme.base04, bg = theme.base01 },

  ALEErrorSign = { fg = theme.base08 },
  ALEWarningSign = { fg = theme.base0A },

  -- -- These groups are for the Neovim tree-sitter highlights.
  ["@annotation"] = { link = "PreProc" },
  ["@attribute"] = { link = "PreProc" },
  ["@boolean"] = { link = "Boolean" },
  ["@character"] = { link = "Character" },
  ["@character.special"] = { link = "SpecialChar" },
  ["@character.printf"] = { link = "SpecialChar" },
  ["@comment"] = { link = "Comment" },
  ["@keyword.conditional"] = { link = "Conditional" },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { link = "Special" },
  ["@constant.macro"] = { link = "Define" },
  ["@keyword.debug"] = { link = "Debug" },
  ["@keyword.directive.define"] = { link = "Define" },
  ["@keyword.exception"] = { link = "Exception" },
  ["@number.float"] = { link = "Float" },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { link = "Special" },
  ["@function.call"] = { link = "@function" },
  ["@function.macro"] = { link = "Macro" },
  ["@keyword.import"] = { link = "Include" },
  ["@keyword.coroutine"] = { link = "@keyword" },
  ["@keyword.operator"] = { link = "@operator" },
  ["@keyword.return"] = { link = "@keyword" },
  ["@function.method"] = { link = "Function" },
  ["@function.method.call"] = { link = "@function.method" },
  ["@namespace.builtin"] = { link = "@variable.builtin" },
  ["@none"] = {},
  ["@number"] = { link = "Number" },
  ["@keyword.directive"] = { link = "PreProc" },
  ["@keyword.repeat"] = { link = "Repeat" },
  ["@keyword.storage"] = { link = "StorageClass" },
  ["@string"] = { link = "String" },
  ["@markup.link.label"] = { link = "SpecialChar" },
  ["@markup.link.label.symbol"] = { link = "Identifier" },
  ["@tag"] = { link = "Label" },
  ["@tag.attribute"] = { link = "@property" },
  ["@tag.delimiter"] = { link = "Delimiter" },
  ["@markup"] = { link = "@none" },
  ["@markup.environment"] = { link = "Macro" },
  ["@markup.environment.name"] = { link = "Type" },
  ["@markup.raw"] = { link = "String" },
  ["@markup.math"] = { link = "Special" },
  ["@markup.strong"] = { bold = true },
  ["@markup.emphasis"] = { italic = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },
  ["@markup.heading"] = { link = "Title" },
  ["@comment.note"] = { fg = theme.base0C },
  ["@comment.error"] = { fg = theme.base08 },
  ["@comment.hint"] = { fg = theme.base0C },
  ["@comment.info"] = { fg = theme.base0D },
  ["@comment.warning"] = { fg = theme.base0A },
  ["@comment.todo"] = { fg = theme.base08 },
  ["@markup.link.url"] = { link = "Underlined" },
  ["@type"] = { link = "Type" },
  ["@type.definition"] = { link = "Typedef" },
  ["@type.qualifier"] = { link = "@keyword" },

  -- --- Misc
  -- -- TODO:
  -- -- ["@comment.documentation"] = { },
  ["@operator"] = { fg = theme.base0E }, -- For any operator: `+`, but also `->` and `*` in C.

  --- Punctuation
  ["@punctuation.delimiter"] = { fg = theme.base08 }, -- For delimiters ie: `.`
  ["@punctuation.bracket"] = { fg = theme.base08 }, -- For brackets and parens.
  ["@punctuation.special"] = { fg = theme.base0A }, -- For special symbols (e.g. `{}` in string interpolation)
  ["@markup.list"] = { fg = theme.base0D }, -- For special punctutation that does not fall in the categories before.
  ["@markup.list.markdown"] = { fg = theme.base09, bold = true },

  --- Literals
  ["@string.documentation"] = { fg = theme.base0A },
  ["@string.regexp"] = { fg = theme.base0D }, -- For regexes.
  ["@string.escape"] = { fg = theme.base0E }, -- For escape characters within a string.

  --- Functions
  ["@constructor"] = { fg = theme.base0E }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
  ["@variable.parameter"] = { fg = theme.base0A }, -- For parameters of a function.
  ["@variable.parameter.builtin"] = { fg = base0A }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

  --- Keywords
  ["@keyword"] = { fg = theme.base0E }, -- For keywords that don't fall in previous categories.
  ["@keyword.function"] = { fg = theme.base0E }, -- For keywords used to define a function.

  ["@label"] = { fg = theme.base0A }, -- For labels: `label:` in C and `:label:` in Lua.

  --- Types
  ["@type.builtin"] = { fg = theme.base0D },
  ["@variable.member"] = { fg = theme.base08 }, -- For fields.
  ["@property"] = { fg = theme.base08 },

  --- Identifiers
  ["@variable"] = { fg = theme.base06 }, -- Any variable name that does not have another highlight.
  ["@variable.builtin"] = { fg = theme.base0D }, -- Variable names that are defined by the languages, like `this` or `self`.
  ["@module.builtin"] = { fg = theme.base0D }, -- Variable names that are defined by the languages, like `this` or `self`.

  --- Text
  -- ["@markup.raw.markdown"] = { fg = theme.base0D },
  ["@markup.raw.markdown_inline"] = { bg = theme.base02, fg = theme.base0D },
  ["@markup.link"] = { fg = theme.base0D },

  ["@markup.list.unchecked"] = { fg = theme.base0D }, -- For brackets and parens.
  ["@markup.list.checked"] = { fg = theme.base0B }, -- For brackets and parens.

  ["@diff.plus"] = { link = "DiffAdd" },
  ["@diff.minus"] = { link = "DiffDelete" },
  ["@diff.delta"] = { link = "DiffChange" },

  ["@module"] = { link = "Include" },

  -- tsx
  ["@tag.tsx"] = { fg = theme.base08 },
  ["@constructor.tsx"] = { fg = theme.base0D },
  ["@tag.delimiter.tsx"] = { fg = theme.base0D },

  -- LSP Semantic Token Groups
  ["@lsp.type.boolean"] = { link = "@boolean" },
  ["@lsp.type.builtinType"] = { link = "@type.builtin" },
  ["@lsp.type.comment"] = { link = "@comment" },
  ["@lsp.type.decorator"] = { link = "@attribute" },
  ["@lsp.type.deriveHelper"] = { link = "@attribute" },
  ["@lsp.type.enum"] = { link = "@type" },
  ["@lsp.type.enumMember"] = { link = "@constant" },
  ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
  ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
  ["@lsp.type.generic"] = { link = "@variable" },
  ["@lsp.type.interface"] = { fg = theme.base08 },
  ["@lsp.type.keyword"] = { link = "@keyword" },
  ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
  ["@lsp.type.namespace"] = { link = "@module" },
  ["@lsp.type.number"] = { link = "@number" },
  ["@lsp.type.operator"] = { link = "@operator" },
  ["@lsp.type.parameter"] = { link = "@variable.parameter" },
  ["@lsp.type.property"] = { link = "@property" },
  ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
  ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
  ["@lsp.type.string"] = { link = "@string" },
  ["@lsp.type.typeAlias"] = { link = "@type.definition" },
  ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = theme.base08 },
  ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
  ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
  ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
  ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
  ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
  ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
  ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.operator.injected"] = { link = "@operator" },
  ["@lsp.typemod.string.injected"] = { link = "@string" },
  ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
  ["@lsp.typemod.type.defaultLibrary"] = { fg = theme.base0D },
  ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = theme.base0D },
  ["@lsp.typemod.variable.callable"] = { link = "@function" },
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
  ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  ["@lsp.typemod.variable.static"] = { link = "@constant" },
  -- NOTE: maybe add these with distinct highlights?
  -- ["@lsp.typemod.variable.globalScope"] (global variables)

  -- Python
  ["@lsp.type.namespace.python"] = { link = "@variable" },

  -- ts-rainbow
  rainbowcol1 = { fg = theme.base08 },
  rainbowcol2 = { fg = theme.base0A },
  rainbowcol3 = { fg = theme.base0B },
  rainbowcol4 = { fg = theme.base0D },
  rainbowcol5 = { fg = theme.base0D },
  rainbowcol6 = { fg = theme.base0E },
  rainbowcol7 = { fg = theme.base0E },

  -- ts-rainbow2 (maintained fork)
  TSRainbowRed = { fg = theme.base08 },
  TSRainbowOrange = { fg = theme.base09 },
  TSRainbowYellow = { fg = theme.base0A },
  TSRainbowGreen = { fg = theme.base0B },
  TSRainbowBlue = { fg = theme.base0D },
  TSRainbowViolet = { fg = theme.base0E },
  TSRainbowCyan = { fg = theme.base0C },

  -- rainbow-delimiters
  RainbowDelimiterRed = { fg = theme.base08 },
  RainbowDelimiterOrange = { fg = theme.base09 },
  RainbowDelimiterYellow = { fg = theme.base0A },
  RainbowDelimiterGreen = { fg = theme.base0B },
  RainbowDelimiterBlue = { fg = theme.base0D },
  RainbowDelimiterViolet = { fg = theme.base0E },
  RainbowDelimiterCyan = { fg = theme.base0C },

  -- LspTrouble
  TroubleText = { fg = theme.base05 },
  TroubleCount = { fg = theme.base0E, bg = theme.base05 },
  TroubleNormal = { fg = theme.base05, bg = theme.base00 },

  -- Illuminate
  illuminatedWord = { bg = theme.base05 },
  illuminatedCurWord = { bg = theme.base05 },
  IlluminatedWordText = { bg = theme.base05 },
  IlluminatedWordRead = { bg = theme.base05 },
  IlluminatedWordWrite = { bg = theme.base05 },

  -- diff
  diffAdded = { fg = theme.base0B },
  diffRemoved = { fg = theme.base08 },
  diffChanged = { fg = theme.base09 },
  diffOldFile = { fg = theme.base0A },
  diffNewFile = { fg = theme.base09 },
  diffFile = { fg = theme.base0D },
  diffLine = { fg = theme.base03 },
  diffIndexLine = { fg = theme.base0E },

  -- Neogit
  NeogitBranch = { fg = theme.base0E },
  NeogitRemote = { fg = theme.base0E },
  NeogitHunkHeader = { bg = theme.base00, fg = theme.base05 },
  NeogitHunkHeaderHighlight = { bg = theme.base05, fg = theme.base0D },
  NeogitDiffContextHighlight = { bg = theme.base05, fg = theme.base05 },
  NeogitDiffDeleteHighlight = { fg = theme.base08, bg = theme.base08 },
  NeogitDiffAddHighlight = { fg = theme.base0B, bg = theme.base0D },

  -- Neotest
  NeotestPassed = { fg = theme.base0B },
  NeotestRunning = { fg = theme.base0A },
  NeotestFailed = { fg = theme.base08 },
  NeotestSkipped = { fg = theme.base0D },
  NeotestTest = { fg = theme.base05 },
  NeotestNamespace = { fg = theme.base0B2 },
  NeotestFocused = { fg = theme.base0A },
  NeotestFile = { fg = theme.base0D },
  NeotestDir = { fg = theme.base0D },
  NeotestBorder = { fg = theme.base0D },
  NeotestIndent = { fg = theme.base05_sidebar },
  NeotestExpandMarker = { fg = theme.base05_sidebar },
  NeotestAdapterName = { fg = theme.base0E, bold = true },
  NeotestWinSelect = { fg = theme.base0D },
  NeotestMarked = { fg = theme.base0D },
  NeotestTarget = { fg = theme.base0D },
  --[[ NeotestUnknown = {}, ]]

  -- GitGutter
  GitGutterAdd = { fg = theme.base0B }, -- diff mode: Added line |diff.txt|
  GitGutterChange = { fg = theme.base09 }, -- diff mode: Changed line |diff.txt|
  GitGutterDelete = { fg = theme.base0F }, -- diff mode: Deleted line |diff.txt|
  GitGutterAddLineNr = { fg = theme.base0B },
  GitGutterChangeLineNr = { fg = theme.base09 },
  GitGutterDeleteLineNr = { fg = theme.base0F },

  -- GitSigns
  GitSignsAdd = { fg = theme.base0D }, -- diff mode: Added line |diff.txt|
  GitSignsAddLn = { fg = theme.base0D }, -- diff mode: Added line |diff.txt|
  GitSignsAddNr = { fg = theme.base0D }, -- diff mode: Added line |diff.txt|
  GitSignsChange = { fg = theme.base05 }, -- diff mode: Changed line |diff.txt|
  GitSignsChangeLn = { fg = theme.base05 }, -- diff mode: Changed line |diff.txt|
  GitSignsChangeNr = { fg = theme.base05 }, -- diff mode: Changed line |diff.txt|
  GitSignsDelete = { fg = theme.base0F }, -- diff mode: Deleted line |diff.txt|
  GitSignsDeleteLn = { fg = theme.base0F }, -- diff mode: Deleted line |diff.txt|
  GitSignsDeleteNr = { fg = theme.base0F }, -- diff mode: Deleted line |diff.txt|

  -- mini.diff
  MiniDiffSignAdd = { fg = theme.base0B }, -- diff mode: Added line |diff.txt|
  MiniDiffSignChange = { fg = theme.base09 }, -- diff mode: Changed line |diff.txt|
  MiniDiffSignDelete = { fg = theme.base0F }, -- diff mode: Deleted line |diff.txt|

  -- Telescope
  TelescopeNormal = { fg = theme.base06, bg = theme.base00 },
  TelescopePromptPrefix = { fg = theme.base08, bg = theme.base02 },
  TelescopePreviewTitle = { fg = theme.base01, bg = theme.base0B },
  TelescopePromptTitle = { fg = theme.base01, bg = theme.base08 },
  TelescopeSelection = { bg = theme.base02 },
  TelescopeResultsDiffAdd = { fg = theme.base0B },
  TelescopeResultsDiffChange = { fg = theme.base0A },
  TelescopeResultsDiffDelete = { fg = theme.base08 },
  TelescopeBorder = { fg = theme.base00, bg = theme.base00 },
  TelescopePromptBorder = { fg = theme.base02, bg = theme.base02 },
  TelescopePromptNormal = { fg = theme.base07, bg = theme.base02 },
  TelescopePromptCounter = { fg = theme.base07, bg = theme.base02 },
  TelescopeResultsTitle = { fg = theme.base00, bg = theme.base00 },

  -- FzfLua
  FzfLuaBorder = { fg = theme.base04, bg = theme.base00 },
  FzfLuaNormal = { fg = theme.base05, bg = theme.base00 },
  FzfLuaFzfNormal = { fg = theme.base05 },
  FzfLuaTitle = { fg = theme.base09, bg = theme.base00 },
  FzfLuaPreviewTitle = { fg = theme.base04, bg = theme.base00 },
  FzfLuaFilePart = { link = "FzfLuaFzfNormal" },
  FzfLuaDirPart = { fg = theme.base03 },
  FzfLuaCursor = { link = "IncSearch" },
  FzfLuaHeaderBind = { link = "@punctuation.special" },
  FzfLuaHeaderText = { link = "Title" },
  FzfLuaPath = { link = "Directory" },
  FzfLuaFzfPointer = { fg = theme.base0E },
  FzfLuaFzfCursorLine = { link = "Visual" },
  FzfLuaFzfSeparator = { fg = theme.base09, bg = theme.base00 },

  -- NvimTree
  NvimTreeNormal = { fg = theme.base06, bg = theme.base00 },
  NvimTreeWinSeparator = { fg = theme.base00, bg = theme.base00 },
  NvimTreeNormalNC = { fg = theme.base06, bg = theme.base00 },
  NvimTreeRootFolder = { fg = theme.base0D, bold = true },
  NvimTreeGitDirty = { fg = theme.base09 },
  NvimTreeGitNew = { fg = theme.base0B },
  NvimTreeGitDeleted = { fg = theme.base08 },
  NvimTreeOpenedFile = { bg = theme.base00 },
  NvimTreeSpecialFile = { fg = theme.base0E, underline = true },
  NvimTreeIndentMarker = { fg = theme.base05 },
  NvimTreeImageFile = { fg = theme.base05 },
  NvimTreeSymlink = { fg = theme.base0D },
  NvimTreeFolderIcon = { bg = "none", fg = theme.base0D },
  -- NvimTreeFolderName= { fg = theme.base05_float },

  NeoTreeNormal = { fg = theme.base06, bg = theme.base00 },
  NeoTreeNormalNC = { fg = theme.base06, bg = theme.base00 },
  NeoTreeDimText = { fg = theme.base06 },
  NeoTreeGitModified = { fg = theme.base09 },
  NeoTreeGitUntracked = { fg = theme.base0E },
  NeoTreeGitStaged = { fg = theme.base0B1 },
  NeoTreeFileName = { fg = theme.base06 },

  -- Fern
  FernBranchText = { fg = theme.base0D },

  -- glyph palette
  GlyphPalette1 = { fg = theme.base08 },
  GlyphPalette2 = { fg = theme.base0B },
  GlyphPalette3 = { fg = theme.base0A },
  GlyphPalette4 = { fg = theme.base0D },
  GlyphPalette6 = { fg = theme.base0B },
  GlyphPalette7 = { fg = theme.base05 },
  GlyphPalette9 = { fg = theme.base08 },

  -- Dashboard
  DashboardShortCut = { fg = theme.base0C },
  DashboardHeader = { fg = theme.base0D },
  DashboardCenter = { fg = theme.base0E },
  DashboardFooter = { fg = theme.base0D1 },
  DashboardKey = { fg = theme.base09 },
  DashboardDesc = { fg = theme.base0C },
  DashboardIcon = { fg = theme.base0C, bold = true },

  -- Alpha
  AlphaShortcut = { fg = theme.base09 },
  AlphaHeader = { fg = theme.base0D },
  AlphaHeaderLabel = { fg = theme.base09 },
  AlphaFooter = { fg = theme.base0D },
  AlphaButtons = { fg = theme.base0C },

  -- WhichKey
  WhichKey = { fg = theme.base0C },
  WhichKeyGroup = { fg = theme.base0D },
  WhichKeyDesc = { fg = theme.base0E },
  WhichKeySeperator = { fg = theme.base03 },
  WhichKeySeparator = { fg = theme.base03 },
  WhichKeyFloat = { bg = theme.base00 },
  WhichKeyValue = { fg = theme.base00 },

  -- LspSaga
  DiagnosticWarning = { link = "DiagnosticWarn" },
  DiagnosticInformation = { link = "DiagnosticInfo" },

  LspFloatWinNormal = { bg = theme.base00 },
  LspFloatWinBorder = { fg = theme.base04 },
  LspSagaBorderTitle = { fg = theme.base0C },
  LspSagaHoverBorder = { fg = theme.base0D },
  LspSagaRenameBorder = { fg = theme.base0B },
  LspSagaDefPreviewBorder = { fg = theme.base0B },
  LspSagaCodeActionBorder = { fg = theme.base0D },
  LspSagaFinderSelection = { fg = theme.base00 },
  LspSagaCodeActionTitle = { fg = theme.base0D1 },
  LspSagaCodeActionContent = { fg = theme.base0E },
  LspSagaSignatureHelpBorder = { fg = theme.base08 },
  ReferencesCount = { fg = theme.base0E },
  DefinitionCount = { fg = theme.base0E },
  DefinitionIcon = { fg = theme.base0D },
  ReferencesIcon = { fg = theme.base0D },
  TargetWord = { fg = theme.base0C },

  -- NeoVim
  healthError = { fg = theme.base08 },
  healthSuccess = { fg = theme.base0B },
  healthWarning = { fg = theme.base0A },

  -- BufferLine
  BufferLineIndicatorSelected = { fg = theme.base09 },

  -- Barbar
  BufferCurrent = { bg = theme.base00, fg = theme.base05 },
  BufferCurrentERROR = { bg = theme.base00, fg = theme.base08 },
  BufferCurrentHINT = { bg = theme.base00, fg = theme.base0C },
  -- BufferCurrentIcon = { bg = theme.base00, fg = c.},
  BufferCurrentINFO = { bg = theme.base00, fg = theme.base0D },
  BufferCurrentWARN = { bg = theme.base00, fg = theme.base0A },
  BufferCurrentIndex = { bg = theme.base00, fg = theme.base0D },
  BufferCurrentMod = { bg = theme.base00, fg = theme.base0A },
  BufferCurrentSign = { bg = theme.base00, fg = theme.base00 },
  BufferCurrentTarget = { bg = theme.base00, fg = theme.base08 },
  BufferAlternate = { bg = theme.base05, fg = theme.base05 },
  BufferAlternateERROR = { bg = theme.base05, fg = theme.base08 },
  BufferAlternateHINT = { bg = theme.base05, fg = theme.base0C },
  -- BufferAlternateIcon = { bg = theme.base05_gutter, fg = c. },
  BufferAlternateIndex = { bg = theme.base05, fg = theme.base0D },
  BufferAlternateINFO = { bg = theme.base05, fg = theme.base0D },
  BufferAlternateMod = { bg = theme.base05, fg = theme.base0A },
  BufferAlternateSign = { bg = theme.base05, fg = theme.base0D },
  BufferAlternateTarget = { bg = theme.base05, fg = theme.base08 },
  BufferAlternateWARN = { bg = theme.base05, fg = theme.base0A },
  BufferVisible = { bg = theme.base00, fg = theme.base05 },
  BufferVisibleERROR = { bg = theme.base00, fg = theme.base08 },
  BufferVisibleHINT = { bg = theme.base00, fg = theme.base0C },
  BufferVisibleINFO = { bg = theme.base00, fg = theme.base0D },
  BufferVisibleWARN = { bg = theme.base00, fg = theme.base0A },
  BufferVisibleIndex = { bg = theme.base00, fg = theme.base0D },
  BufferVisibleMod = { bg = theme.base00, fg = theme.base0A },
  BufferVisibleSign = { bg = theme.base00, fg = theme.base0D },
  BufferVisibleTarget = { bg = theme.base00, fg = theme.base08 },
  BufferOffset = { bg = theme.base00, fg = theme.base00 },

  -- Sneak
  Sneak = { fg = theme.base00, bg = theme.base0E },
  SneakScope = { bg = theme.base00 },

  -- Hop
  HopNextKey = { fg = theme.base0E, bold = true },
  HopNextKey1 = { fg = theme.base0D, bold = true },
  HopNextKey2 = { fg = theme.base0D },
  HopUnmatched = { fg = theme.base03 },

  TSNodeKey = { fg = theme.base0E, bold = true },
  TSNodeUnmatched = { fg = theme.base03 },

  LeapMatch = { bg = theme.base0E, fg = theme.base05, bold = true },
  LeapLabelPrimary = { fg = theme.base0E, bold = true },
  LeapLabelSecondary = { fg = theme.base0B1, bold = true },
  LeapBackdrop = { fg = theme.base03 },

  FlashBackdrop = { fg = theme.base03 },
  FlashLabel = { bg = theme.base0E, bold = true, fg = theme.base05 },

  LightspeedGreyWash = { fg = theme.base03 },
  -- LightspeedCursor = { link = "Cursor" },
  LightspeedLabel = { fg = theme.base0E, bold = true, underline = true },
  LightspeedLabelDistant = { fg = theme.base0B1, bold = true, underline = true },
  LightspeedLabelDistantOverlapped = { fg = theme.base0B2, underline = true },
  LightspeedLabelOverlapped = { fg = theme.base0E, underline = true },
  LightspeedMaskedChar = { fg = theme.base09 },
  LightspeedOneCharMatch = { bg = theme.base0E, fg = theme.base05, bold = true },
  LightspeedPendingOpArea = { bg = theme.base0E, fg = theme.base05 },
  LightspeedShortcut = { bg = theme.base0E, fg = theme.base05, bold = true, underline = true },
  -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
  -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
  LightspeedUnlabeledMatch = { fg = theme.base0D2, bold = true },

  -- Cmp
  CmpDocumentation = { fg = theme.base05, bg = theme.base00 },
  CmpDocumentationBorder = { fg = theme.base04, bg = theme.base00 },
  CmpGhostText = { fg = theme.base01 },

  CmpItemAbbr = { fg = theme.base05 },
  CmpItemAbbrDeprecated = { fg = theme.base05, strikethrough = true },
  CmpItemAbbrMatch = { fg = theme.base0D },
  CmpItemAbbrMatchFuzzy = { fg = theme.base0D },

  CmpItemMenu = { fg = theme.base03 },

  CmpItemKindDefault = { fg = theme.base05 },

  CmpItemKindCodeium = { fg = theme.base0C },
  CmpItemKindCopilot = { fg = theme.base0C },
  CmpItemKindTabNine = { fg = theme.base0C },

  -- headlines.nvim
  CodeBlock = { bg = theme.base00 },

  -- navic
  NavicSeparator = { fg = theme.base05 },
  NavicText = { fg = theme.base05 },

  AerialNormal = { fg = theme.base05 },
  AerialGuide = { fg = theme.base05 },
  AerialLine = { link = "LspInlayHint" },

  IndentBlanklineChar = { fg = theme.base05, nocombine = true },
  IndentBlanklineContextChar = { fg = theme.base0D, nocombine = true },
  IblIndent = { fg = theme.base05, nocombine = true },
  IblScope = { fg = theme.base0D, nocombine = true },
  IndentLine = { fg = theme.base05, nocombine = true },
  IndentLineCurrent = { fg = theme.base0D1, nocombine = true },

  OctoDirty = { fg = theme.base09, bold = true },
  OctoStatusColumn = { fg = theme.base0D },
  OctoDetailsLabel = { fg = theme.base0D, bold = true },
  OctoDetailsValue = { link = "@variable.member" },
  OctoIssueTitle = { fg = theme.base0E, bold = true },
  OctoStateOpen = { link = "DiagnosticVirtualTextHint" },
  OctoStateClosed = { link = "DiagnosticVirtualTextError" },
  OctoStatePending = { link = "DiagnosticVirtualTextWarn" },
  OctoStateChangesRequested = { link = "DiagnosticVirtualTextWarn" },

  -- Scrollbar
  ScrollbarHandle = { fg = theme.base06, bg = theme.base03 },

  ScrollbarSearchHandle = { fg = theme.base09, bg = theme.base03 },
  ScrollbarSearch = { fg = theme.base09 },

  ScrollbarErrorHandle = { fg = theme.base08, bg = theme.base03 },
  ScrollbarError = { fg = theme.base08 },

  ScrollbarWarnHandle = { fg = theme.base0A, bg = theme.base03 },
  ScrollbarWarn = { fg = theme.base0A },

  ScrollbarInfoHandle = { fg = theme.base0D, bg = theme.base03 },
  ScrollbarInfo = { fg = theme.base0D },

  ScrollbarHintHandle = { fg = theme.base0C, bg = theme.base03 },
  ScrollbarHint = { fg = theme.base0C },

  ScrollbarMiscHandle = { fg = theme.base0E, bg = theme.base03 },
  ScrollbarMisc = { fg = theme.base0E },

  -- Yanky
  YankyPut = { link = "IncSearch" },
  YankyYanked = { link = "IncSearch" },

  -- Lazy
  LazyProgressDone = { bold = true, fg = theme.base0E },
  LazyProgressTodo = { bold = true, fg = theme.base06 },
  LazyH1 = {
    bg = theme.base0A,
    fg = theme.base00,
  },
  LazyButton = {fg = theme.base06, bg = theme.base02 },
  LazyButtonActive = {fg = theme.base06, bg = theme.base00},
  LazyH2 = {
    fg = theme.base08,
    bold = true,
    underline = true,
  },
  LazyReasonPlugin = { fg = theme.base08 },
  LazyDir = { fg = theme.base06 },
  LazyUrl = { fg = theme.base06 },
  LazyCommit = { fg = theme.base0A },
  LazyNoCond = { fg = theme.base08 },
  LazySpecial = { fg = theme.base0D },
  LazyReasonFt = { fg = theme.base0E },
  LazyOperator = { fg = theme.base06 },
  LazyReasonKeys = { fg = theme.base0A },
  LazyTaskOutput = { fg = theme.base06 },
  LazyCommitIssue = { fg = theme.base0E },
  LazyReasonEvent = { fg = theme.base09 },
  LazyReasonStart = { fg = theme.base06 },
  LazyReasonRuntime = { fg = theme.base0D },
  LazyReasonCmd = { fg = theme.base09 },
  LazyReasonSource = { fg = theme.base0C },
  LazyReasonImport = { fg = theme.base06 },
  LazyProgressDone = { fg = theme.base0A },

  -- Notify
  NotifyBackground = { fg = theme.base05, bg = theme.base00 },
  --- Icons
  NotifyERRORIcon = { fg = theme.base08 },
  NotifyWARNIcon = { fg = theme.base0A },
  NotifyINFOIcon = { fg = theme.base0D },
  NotifyDEBUGIcon = { fg = theme.base03 },
  NotifyTRACEIcon = { fg = theme.base0E },
  --- Title
  NotifyERRORTitle = { fg = theme.base08 },
  NotifyWARNTitle = { fg = theme.base0A },
  NotifyINFOTitle = { fg = theme.base0D },
  NotifyDEBUGTitle = { fg = theme.base03 },
  NotifyTRACETitle = { fg = theme.base0E },
  --- Body
  NotifyERRORBody = { fg = theme.base05, bg = theme.base00 },
  NotifyWARNBody = { fg = theme.base05, bg = theme.base00 },
  NotifyINFOBody = { fg = theme.base05, bg = theme.base00 },
  NotifyDEBUGBody = { fg = theme.base05, bg = theme.base00 },
  NotifyTRACEBody = { fg = theme.base05, bg = theme.base00 },

  -- Mini
  MiniCompletionActiveParameter = { underline = true },

  MiniCursorword = { bg = theme.base05 },
  MiniCursorwordCurrent = { bg = theme.base05 },

  MiniIndentscopeSymbol = { fg = theme.base0D, nocombine = true },
  MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

  MiniJump = { bg = theme.base0E, fg = "#ffffff" },

  MiniJump2dSpot = { fg = theme.base0E, bold = true, nocombine = true },

  MiniStarterCurrent = { nocombine = true },
  MiniStarterFooter = { fg = theme.base0A, italic = true },
  MiniStarterHeader = { fg = theme.base0D },
  MiniStarterInactive = { fg = theme.base03, italic = true },
  MiniStarterItem = { fg = theme.base05, bg = theme.base00 },
  MiniStarterItemBullet = { fg = theme.base04 },
  MiniStarterItemPrefix = { fg = theme.base0A },
  MiniStarterSection = { fg = theme.base0D },
  MiniStarterQuery = { fg = theme.base0D },

  MiniStatuslineDevinfo = { fg = theme.base05, bg = theme.base00 },
  MiniStatuslineFileinfo = { fg = theme.base05, bg = theme.base00 },
  MiniStatuslineFilename = { fg = theme.base05, bg = theme.base05 },
  MiniStatuslineInactive = { fg = theme.base0D, bg = theme.base00 },
  MiniStatuslineModeCommand = { fg = theme.base00, bg = theme.base0A, bold = true },
  MiniStatuslineModeInsert = { fg = theme.base00, bg = theme.base0B, bold = true },
  MiniStatuslineModeNormal = { fg = theme.base00, bg = theme.base0D, bold = true },
  MiniStatuslineModeOther = { fg = theme.base00, bg = theme.base0C, bold = true },
  MiniStatuslineModeReplace = { fg = theme.base00, bg = theme.base08, bold = true },
  MiniStatuslineModeVisual = { fg = theme.base00, bg = theme.base0E, bold = true },

  MiniSurround = { bg = theme.base09, fg = theme.base00 },

  MiniTablineCurrent = { fg = theme.base05, bg = theme.base05 },
  MiniTablineFill = { bg = theme.base00 },
  MiniTablineHidden = { fg = theme.base00, bg = theme.base00 },
  MiniTablineModifiedCurrent = { fg = theme.base0A, bg = theme.base05 },
  MiniTablineModifiedHidden = { bg = theme.base00, fg = theme.base0A },
  MiniTablineModifiedVisible = { fg = theme.base0A, bg = theme.base00 },
  MiniTablineTabpagesection = { bg = theme.base00 },
  MiniTablineVisible = { fg = theme.base05, bg = theme.base00 },

  MiniTestEmphasis = { bold = true },
  MiniTestFail = { fg = theme.base08, bold = true },
  MiniTestPass = { fg = theme.base0B, bold = true },

  MiniTrailspace = { bg = theme.base08 },

  -- Noice

  NoiceCompletionItemKindDefault = { fg = theme.base05 },
  NoiceCmdlineIconLua = { fg = theme.base0D },
  NoiceCmdlinePopupBorderLua = { fg = theme.base0D },
  NoiceCmdlinePopupTitleLua = { fg = theme.base0D },
  NoiceCmdlineIconInput = { fg = theme.base0A },
  NoiceCmdlinePopupBorderInput = { fg = theme.base0A },
  NoiceCmdlinePopupTitleInput = { fg = theme.base0A },

  Hlargs = { fg = theme.base0A },

  -- Statusline
  StatusLineArchLinux = {fg = theme.base00, bg = theme.base0D},
  StatusLineArchLinuxSep = {fg = theme.base0D, bg = theme.base00},
  StatusLineFedoraLinux = {fg = theme.base0D, bg = theme.base00},
  StatusLineSuseLinux = {fg = theme.base0B, bg = theme.base00},
  StatusLineUbuntuLinux = {fg = theme.base0F, bg = theme.base00},
  StatusLineBSD = {fg = theme.base08, bg = theme.base00},
  StatusLineDarwin = {fg = theme.base7, bg = theme.base00},
  StatusLineBlock = {fg = theme.base0D, bg = theme.base00},
  StatusLineModes = {fg = theme.base07, bg = theme.base02},
  StatusLineDiffIcons = {bg = theme.base03},
  StatusLineFileInfo = {fg = theme.base07, bg = theme.base00},
  StatusLinegitIcons = {fg = theme.base07, bg = theme.base04},
  StatusLineFTIcons = {link = "StatusLinegitIcons"},
  StatusLinelspError = {fg = theme.base08, bg = theme.base00},
  StatusLinelspWarning = {fg = theme.base0A, bg = theme.base00},
  StatusLinelspHints = {fg = theme.base0D, bg = theme.base00},
  StatusLinelspInfo = {fg = theme.base0B, bg = theme.base00},
  StatusLineLspStatus = {link = "StatusLineModes"},
  StatusLineLspStatusSep = {fg = theme.base02, bg = theme.base00},
  StatusLineEncodingIcons = {link = "StatusLineDiffIcons"},
  StatusLineNpm = {fg = theme.base0B, bg = theme.base00},
  StatusLinePythonVenv = {fg = theme.base0A, bg = theme.base00},

  -- Bufferline
  Debuging = {fg = theme.base08, bg = theme.base00},
  GitPull = {fg = theme.base0D, bg = theme.base00},
  GitCommit = {fg = theme.base0B, bg = theme.base00},
  GitPush = {fg = theme.base0B, bg = theme.base00},
  BufSep = {fg = theme.base00, bg = theme.base00},
  BufBg = {fg = theme.base08, bg = theme.base00},
  BufFilll = {bg = theme.base00},
  BufFill = {fg = theme.base07, bg = theme.base00},
  PanelHeading = {fg = theme.base06, bg = theme.base00},
}

return M
