// Assignment Template Library
// Import this file to use assignment formatting functions

// Document setup function
// This returns content with the set rules applied
#let setup-document(body) = {
  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
    header: align(right)[#context counter(page).display()],
    header-ascent: 2.0em,
  )

  // set text(
  //   font: "Charter",
  //   size: 10pt,
  // )

  set par(
    justify: true,
    leading: 0.5em,
    spacing: 1.0em,
  )

  body
}

// Header function for assignment title and name
#let assignment-header(course: "", number: "", name: "", date: "") = {
  set par(spacing: 0.5em)
  align(center)[
    #text(size: 11pt, weight: "bold")[#course - Assignment #number]

    #text(size: 10pt)[#name]

    #text(size: 10pt)[#date]
  ]
  v(1em)
}

// Exercise function with automatic indentation
// The content after the problem description will be automatically indented
#let exercise(number: "", title: "", problem: [], solution: []) = {
  // Exercise header (not indented)
  [*Exercise #number:* #emph[#title]]

  // Only add problem block if there's content
  if problem != [] {

    // Problem description (not indented)
    // Using a block to allow display math and other block-level content
    block(
      width: 100%,
    )[
      #set par(first-line-indent: 0pt)
      #problem
    ]
  }

  // Add minimal spacing if no problem, normal spacing if there was a problem
  if problem == [] {
    v(0.3em)
  }

  // Solution (indented)
  // Using a block with left padding to create the indent effect
  block(
    inset: (left: 2em),
    width: 100%,
  )[
    #set par(first-line-indent: 0pt)
    #solution
  ]

  v(1em)
}

// Convenience function for inline math
#let m(content) = $#content$

// QED symbol at the end of a proof (right-aligned on new line)
#let qed = {
  v(0.5em)
  align(right)[$square$]
}

// Subpart function for multi-part problems
// Use within solution block to create subparts at base indentation
// label: the subpart label like "(a) (5 points)"
// description: optional problem description at base indent (can contain text, math, etc.)
// content: the actual solution content (will be indented)
#let subpart(label: "", description: [], content) = {
  // Negative margin to counteract solution block's indent
  block(
    inset: (left: -2em),
  )[
    #v(0.5em)

    // Label and description at base indentation
    #block[
      #set par(first-line-indent: 0pt)
      #text(weight: "bold")[#label] #description
    ]

    // Only add spacing if there's actual content
    #if content != [] {
      v(0.3em)

      // Content is indented again (back to solution level)
      block(
        inset: (left: 2em),
      )[
        #set par(first-line-indent: 0pt)
        #content
      ]
    }
  ]
}

// Nested subpart function for subparts within subparts
// Use this inside a subpart's content to create nested subparts with additional indentation
// label: the subpart label like "(i)" or "Part 1:"
// description: optional problem description (will be at current indent level)
// content: the actual solution content (will be indented further)
#let nested-subpart(label: "", description: [], content) = {
  // No negative margin - stays at current indentation level
  block[
    #v(0.5em)

    // Label and description at current indentation
    #block[
      #set par(first-line-indent: 0pt)
      #text(weight: "bold")[#label] #description
    ]

    // Only add spacing if there's actual content
    #if content != [] {
      v(0.3em)

      // Content is indented relative to current level
      block(
        inset: (left: 2em),
      )[
        #set par(first-line-indent: 0pt)
        #content
      ]
    }
  ]
}
