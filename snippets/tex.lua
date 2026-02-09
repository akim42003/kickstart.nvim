-- LaTeX snippets for LuaSnip
-- Place this file in ~/.config/nvim/snippets/tex.lua

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

-- Helper function to get visual selection
local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return parent.snippet.env.SELECT_RAW
  else
    return ''
  end
end

return {
  -- ============================================================================
  -- DOCUMENT STRUCTURE
  -- ============================================================================

  -- Basic document template
  s(
    { trig = 'template', dscr = 'Basic LaTeX template' },
    fmta(
      [[
        \documentclass{<>}
        
        \usepackage{amsmath}
        \usepackage{amssymb}
        \usepackage{graphicx}
        
        \title{<>}
        \author{<>}
        \date{<>}
        
        \begin{document}
        
        \maketitle
        
        <>
        
        \end{document}
      ]],
      { i(1, 'article'), i(2, 'Title'), i(3, 'Author'), i(4, '\\today'), i(0) }
    )
  ),

  -- Begin/end environment
  s(
    { trig = 'beg', dscr = 'Begin/end environment' },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(2), rep(1) }
    )
  ),

  -- Section
  s({ trig = 'sec', dscr = 'Section' }, fmta([[\section{<>}]], { i(1) })),

  -- Subsection
  s({ trig = 'ssec', dscr = 'Subsection' }, fmta([[\subsection{<>}]], { i(1) })),

  -- Subsubsection
  s({ trig = 'sssec', dscr = 'Subsubsection' }, fmta([[\subsubsection{<>}]], { i(1) })),

  -- ============================================================================
  -- MATH ENVIRONMENTS
  -- ============================================================================

  -- Inline math
  s({ trig = 'mk', dscr = 'Inline math' }, fmta([[$<>$]], { i(1) })),

  -- Display math
  s(
    { trig = 'dm', dscr = 'Display math' },
    fmta(
      [[
        \[
          <>
        \]
      ]],
      { i(1) }
    )
  ),

  -- Equation environment
  s(
    { trig = 'eq', dscr = 'Equation' },
    fmta(
      [[
        \begin{equation}
          <>
        \end{equation}
      ]],
      { i(1) }
    )
  ),

  -- Align environment
  s(
    { trig = 'ali', dscr = 'Align' },
    fmta(
      [[
        \begin{align}
          <>
        \end{align}
      ]],
      { i(1) }
    )
  ),

  -- Align* environment (no numbering)
  s(
    { trig = 'ali*', dscr = 'Align* (no numbering)' },
    fmta(
      [[
        \begin{align*}
          <>
        \end{align*}
      ]],
      { i(1) }
    )
  ),

  -- ============================================================================
  -- MATH COMMANDS
  -- ============================================================================

  -- Fraction
  s({ trig = '//', dscr = 'Fraction' }, fmta([[\frac{<>}{<>}]], { i(1), i(2) })),

  -- Square root
  s({ trig = 'sq', dscr = 'Square root' }, fmta([[\sqrt{<>}]], { i(1) })),

  -- Sum
  s({ trig = 'sum', dscr = 'Sum' }, fmta([[\sum_{<>}^{<>} <>]], { i(1, 'i=1'), i(2, 'n'), i(3) })),

  -- Integral
  s({ trig = 'int', dscr = 'Integral' }, fmta([[\int_{<>}^{<>} <>]], { i(1, 'a'), i(2, 'b'), i(3) })),

  -- Limit
  s({ trig = 'lim', dscr = 'Limit' }, fmta([[\lim_{<> \to <>} <>]], { i(1, 'n'), i(2, '\\infty'), i(3) })),

  -- Subscript
  s({ trig = '__', dscr = 'Subscript' }, fmta([[_{<>}]], { i(1) })),

  -- Superscript
  s({ trig = '^^', dscr = 'Superscript' }, fmta([[^{<>}]], { i(1) })),

  -- Vector
  s({ trig = 'vec', dscr = 'Vector' }, fmta([[\vec{<>}]], { i(1) })),

  -- Hat
  s({ trig = 'hat', dscr = 'Hat' }, fmta([[\hat{<>}]], { i(1) })),

  -- Bar
  s({ trig = 'bar', dscr = 'Bar' }, fmta([[\bar{<>}]], { i(1) })),

  -- ============================================================================
  -- GREEK LETTERS
  -- ============================================================================

  s({ trig = 'alpha', dscr = 'Alpha' }, t '\\alpha'),
  s({ trig = 'beta', dscr = 'Beta' }, t '\\beta'),
  s({ trig = 'gamma', dscr = 'Gamma' }, t '\\gamma'),
  s({ trig = 'delta', dscr = 'Delta' }, t '\\delta'),
  s({ trig = 'epsilon', dscr = 'Epsilon' }, t '\\epsilon'),
  s({ trig = 'theta', dscr = 'Theta' }, t '\\theta'),
  s({ trig = 'lambda', dscr = 'Lambda' }, t '\\lambda'),
  s({ trig = 'mu', dscr = 'Mu' }, t '\\mu'),
  s({ trig = 'pi', dscr = 'Pi' }, t '\\pi'),
  s({ trig = 'sigma', dscr = 'Sigma' }, t '\\sigma'),
  s({ trig = 'phi', dscr = 'Phi' }, t '\\phi'),
  s({ trig = 'omega', dscr = 'Omega' }, t '\\omega'),

  -- ============================================================================
  -- TEXT FORMATTING
  -- ============================================================================

  -- Bold text
  s({ trig = 'tbb', dscr = 'Bold text' }, fmta([[\textbf{<>}]], { i(1) })),

  -- Italic text
  s({ trig = 'tii', dscr = 'Italic text' }, fmta([[\textit{<>}]], { i(1) })),

  -- Underline
  s({ trig = 'tuu', dscr = 'Underline' }, fmta([[\underline{<>}]], { i(1) })),

  -- Emphasize
  s({ trig = 'emph', dscr = 'Emphasize' }, fmta([[\emph{<>}]], { i(1) })),

  -- ============================================================================
  -- LISTS
  -- ============================================================================

  -- Itemize
  s(
    { trig = 'item', dscr = 'Itemize' },
    fmta(
      [[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
      { i(1) }
    )
  ),

  -- Enumerate
  s(
    { trig = 'enum', dscr = 'Enumerate' },
    fmta(
      [[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
      { i(1) }
    )
  ),

  -- Item
  s({ trig = 'itt', dscr = 'Item' }, fmta([[\item <>]], { i(1) })),

  -- ============================================================================
  -- FIGURES AND TABLES
  -- ============================================================================

  -- Figure
  s(
    { trig = 'fig', dscr = 'Figure' },
    fmta(
      [[
        \begin{figure}[<>]
          \centering
          \includegraphics[width=<>\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
      { i(1, 'htbp'), i(2, '0.8'), i(3, 'filename'), i(4, 'caption'), i(5, 'label') }
    )
  ),

  -- Table
  s(
    { trig = 'tab', dscr = 'Table' },
    fmta(
      [[
        \begin{table}[<>]
          \centering
          \begin{tabular}{<>}
            \hline
            <>
            \hline
          \end{tabular}
          \caption{<>}
          \label{tab:<>}
        \end{table}
      ]],
      { i(1, 'htbp'), i(2, 'c c c'), i(3), i(4, 'caption'), i(5, 'label') }
    )
  ),

  -- ============================================================================
  -- REFERENCES
  -- ============================================================================

  -- Label
  s({ trig = 'lbl', dscr = 'Label' }, fmta([[\label{<>}]], { i(1) })),

  -- Reference
  s({ trig = 'ref', dscr = 'Reference' }, fmta([[\ref{<>}]], { i(1) })),

  -- Equation reference
  s({ trig = 'eqref', dscr = 'Equation reference' }, fmta([[\eqref{<>}]], { i(1) })),

  -- Citation
  s({ trig = 'cite', dscr = 'Citation' }, fmta([[\cite{<>}]], { i(1) })),
}
