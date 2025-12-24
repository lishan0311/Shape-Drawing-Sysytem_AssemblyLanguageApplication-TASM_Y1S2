<h1>Shape Drawing Implementation</h1>
<p><strong>x86 Assembly Language Application (TASM)</strong></p>

<p>
  A low-level <strong>assembly language program</strong> developed using
  <strong>x86 architecture</strong> and <strong>Turbo Assembler (TASM)</strong>.
  The system provides an interactive, menu-driven interface that allows users to
  generate various <strong>geometric shapes using ASCII characters</strong>.
</p>

<p>
  This project demonstrates strong understanding of
  <strong>computer architecture, low-level programming, CPU control flow,
  and system-level optimization concepts</strong>.
</p>

<hr/>

<h2>✨ Project Summary</h2>
<ul>
  <li><strong>Type:</strong> Assembly Language Console Application</li>
  <li><strong>Role:</strong> Assembly Programmer (Group Project)</li>
  <li><strong>Focus Areas:</strong> Low-Level Programming · CPU Control · Loops & Registers · DOS Interrupts</li>
  <li><strong>Institution:</strong> Asia Pacific University (APU)</li>
</ul>

<p>
  The program simulates a shape drawing system where users interact with the
  application via keyboard input and receive real-time visual output in the console.
</p>

<hr/>

<h2>🛠 Tech Stack</h2>
<ul>
  <li><strong>x86 Assembly Language</strong> – Core programming language</li>
  <li><strong>Turbo Assembler (TASM)</strong> – Assembly and linking</li>
  <li><strong>DOS Environment / DOSBox</strong> – Runtime execution</li>
  <li><strong>DOS Interrupt 21h</strong> – Keyboard input & screen output</li>
</ul>

<hr/>

<h2>📐 Supported Shapes</h2>
<ul>
  <li>Pyramid</li>
  <li>Triangle</li>
  <li>Rectangle (Rows & Columns)</li>
  <li>Square</li>
  <li>Diamond</li>
  <li>Exit Program</li>
</ul>

<p>
  Each shape is dynamically generated based on user input
  (validated within the range of <strong>1–9</strong>).
</p>

<hr/>

<h2>⚙️ Core Functionalities</h2>
<ul>
  <li>Menu-driven user interface</li>
  <li>Keyboard input handling via DOS interrupts</li>
  <li>Input validation with error messages</li>
  <li>Loop-based pattern generation</li>
  <li>Register-based data manipulation</li>
  <li>Return-to-menu flow after execution</li>
</ul>

<hr/>

<h2>🧠 Assembly & System Design Highlights</h2>

<h3>🔸 Low-Level Control</h3>
<p>
  Direct manipulation of CPU registers and memory enables precise control
  over execution flow and output formatting.
</p>

<h3>🔸 Loop & Branch Logic</h3>
<p>
  Nested loops and conditional jumps are used extensively to control
  row-by-row and column-by-column shape rendering.
</p>

<h3>🔸 Input Validation</h3>
<p>
  User inputs are validated at the assembly level to ensure correctness
  and prevent invalid execution paths.
</p>

<h3>🔸 Efficient I/O Handling</h3>
<p>
  All input and output operations are handled using
  <code>INT 21h</code> services, demonstrating low-level system interaction.
</p>

<hr/>

<h2>📊 Research Component (System Performance)</h2>
<p>
  In addition to implementation, this project includes a theoretical analysis of
  <strong>system performance optimization techniques</strong>.
</p>

<ul>
  <li>Branch Prediction (Static vs Dynamic)</li>
  <li>Branch Target Buffer (BTB)</li>
  <li>Caching strategies (CPU cache, disk cache)</li>
  <li>Low-level vs High-level programming comparison</li>
  <li>Security and stability considerations</li>
</ul>

<hr/>

<h2>👥 Team Collaboration</h2>
<p>
  Developed as a <strong>collaborative group project</strong> with equal contribution across:
</p>
<ul>
  <li>Assembly program design & implementation</li>
  <li>Algorithm logic & flow control</li>
  <li>System performance research</li>
  <li>Testing, debugging, and documentation</li>
</ul>

<hr/>

<h2>📄 Academic Context</h2>
<ul>
  <li><strong>Module:</strong> Integrated Computer Systems</li>
  <li><strong>Module Code:</strong> CT124-3-1-ICS</li>
  <li><strong>Lecturer:</strong> TS. Umapathy Eaganathan</li>
  <li><strong>Completion:</strong> April 2025</li>
</ul>

<hr/>

<h2>⭐ Why This Project Matters</h2>
<ul>
  <li>Demonstrates strong <strong>assembly language fundamentals</strong></li>
  <li>Applies low-level programming to real, visible output</li>
  <li>Shows understanding of <strong>CPU execution flow and system architecture</strong></li>
  <li>Bridges practical implementation with theoretical performance analysis</li>
</ul>
