// Example: How to use the template for any new assignment
// Import all template functions
#import "assignment-template.typ": *

// Apply document setup (page formatting, fonts, etc.)
#show: setup-document

// Add assignment header
#assignment-header(
  course: "COMP 421",
  number: "2",
  name: "Stanley Wang",
  date: "January 18, 2026"
)

// Simple exercise without problem description
#exercise(
  number: "01",
  title: "Database Design",
  problem: [],
  solution: [
    #qed
  ]
)

// Exercise with problem description
#exercise(
  number: "02",
  title: "Normalization",
  problem: [
    Given the relation $R(A, B, C, D, E)$ with functional dependencies:
    $ A -> B, C -> D, D -> E $
    Determine the highest normal form.
  ],
  solution: [
    Starting with the given functional dependencies...
    
    Therefore, the relation is in 3NF but not BCNF.
    
    #qed
  ]
)

// Multi-part exercise
#exercise(
  number: "03",
  title: "Query Optimization",
  problem: [
    Consider the following SQL query...
  ],
  solution: [
    #subpart(
      label: "(a) (3 points)",
      description: [Draw the relational algebra tree.],
    )[
      The relational algebra tree is...
    ]
    
    #subpart(
      label: "(b) (7 points)",
      description: [Optimize the query and explain your transformations.],
    )[
      Applying optimization rules:
      
      1. Push down selections...
      2. Push down projections...
    ]
    
    #qed
  ]
)

// Exercise with an image
#exercise(
  number: "04",
  title: "ER Diagram",
  problem: [
    Design an ER diagram for a university database system.
  ],
  solution: [
    #align(center)[
      #image("ER Model - OnStream A1.png", width: 90%)
    ]
    
    Additional constraints:
    - Each student must be enrolled in at least one course
    - Professors can teach multiple courses
    
    #qed
  ]
)
