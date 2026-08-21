<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign In · BookVerse</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"><link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700;9..144,900&family=Inter:wght@400;500;600;700;800&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">

<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          ink: '#211F1B',
          parchment: '#F6F1E4',
          paper: '#FBF8F1',
          card: '#EFE6D2',
          line: '#DDD0AF',
          forest: '#22463D',
          forestdark: '#152E28',
          forestlight: '#3A6C5D',
          brass: '#B8863E',
          brassdark: '#8F6526',
          brasslight: '#E7C077',
          cloth: '#8C3B32',
          clothlight: '#C4685C',
        },
        fontFamily: {
          display: ['Fraunces', 'serif'],
          body: ['Inter', 'sans-serif'],
          mono: ['"IBM Plex Mono"', 'monospace'],
        },
        boxShadow: {
          card: '0 1px 2px rgba(33,31,27,0.06), 0 4px 14px rgba(33,31,27,0.06)',
          lift: '0 8px 24px rgba(33,31,27,0.12)',
        },
        borderRadius: { xl2: '1.1rem' },
      }
    }
  }
</script>

<style>
  html { scroll-behavior: smooth; }
  body { background-color: #F6F1E4; background-image: radial-gradient(circle at 1px 1px, rgba(33,31,27,0.05) 1px, transparent 0); background-size: 22px 22px; }
  ::selection { background: #E7C077; color: #211F1B; }
  :focus-visible { outline: 2.5px solid #B8863E; outline-offset: 2px; border-radius: 2px; }
  .stamp { font-family: 'IBM Plex Mono', monospace; letter-spacing: .06em; border: 1.5px dashed currentColor; transform: rotate(-2.5deg); }
  .tab-notch { position: relative; }
  .tab-notch.active::before { content:""; position:absolute; left:-1px; top:0; bottom:0; width:4px; background:#B8863E; border-radius:0 4px 4px 0; }
  .spine { border-top-width: 6px; border-top-style: solid; }
  .catalog-card { transition: transform .18s ease, box-shadow .18s ease; }
  .catalog-card:hover { transform: translateY(-3px); }
  .scrollbar-thin::-webkit-scrollbar{ height:6px; width:6px; }
  .scrollbar-thin::-webkit-scrollbar-thumb{ background:#DDD0AF; border-radius:4px; }
  input[type=checkbox].card-check { accent-color: #22463D; }
  .fade-edge { -webkit-mask-image: linear-gradient(to bottom, black 85%, transparent 100%); }
</style>
  <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
</head>

<body class="font-body text-ink bg-parchment min-h-screen">
  <div class="min-h-screen grid lg:grid-cols-2">

    <div class="relative hidden lg:flex flex-col justify-between bg-forest text-parchment p-12 overflow-hidden">
      <div class="absolute inset-0 opacity-[0.07]" style="background-image: repeating-linear-gradient(90deg, transparent, transparent 38px, #F6F1E4 38px, #F6F1E4 40px);"></div>
      <div class="absolute -right-24 -bottom-24 w-96 h-96 rounded-full bg-brass/20 blur-3xl"></div>
      <div class="relative z-10"><a href="index.html" class="flex items-center gap-2.5 group">
      <span class="grid place-items-center w-9 h-9 rounded-lg bg-forest text-brasslight shadow-card group-hover:bg-forestdark transition-colors">
        <i data-lucide="book-marked" class="w-5 h-5"></i>
      </span>
      <span class="font-display text-parchment text-xl font-semibold tracking-tight">Book<span class="text-brasslight">Verse</span></span>
    </a></div>
      <div class="relative z-10 max-w-md">
        <p class="font-mono text-xs uppercase tracking-[0.2em] text-brasslight mb-4">Card No. 004 — Reading Room</p>
        <h2 class="font-display text-4xl font-medium leading-tight mb-4">A quiet shelf<br>for every book<br>you keep meaning to read.</h2>
        <p class="text-parchment/70 text-sm leading-relaxed">Reserve titles, track what's due, and browse the full BookVerse catalogue — all from one member card.</p>
      </div>
      <div class="relative z-10 flex items-center gap-6 text-parchment/50 text-xs font-mono">
        <span>12,400+ TITLES</span><span>·</span><span>3,120 MEMBERS</span><span>·</span><span>EST. 2019</span>
      </div>
    </div>


    <div class="flex items-center justify-center p-6 sm:p-12">
      <div class="w-full max-w-sm">
        <div class="lg:hidden mb-8"><a href="index.html" class="flex items-center gap-2.5 group">
      <span class="grid place-items-center w-9 h-9 rounded-lg bg-forest text-brasslight shadow-card group-hover:bg-forestdark transition-colors">
        <i data-lucide="book-marked" class="w-5 h-5"></i>
      </span>
      <span class="font-display text-forest text-xl font-semibold tracking-tight">Book<span class="text-brass">Verse</span></span>
    </a></div>
        
        <p class="font-mono text-xs uppercase tracking-wider text-brass mb-2">Welcome back</p>
        <h1 class="font-display text-3xl font-semibold text-ink mb-1">Sign in to your card</h1>
        <p class="text-sm text-ink/50 mb-8">Access your reservations, borrowed books, and the full catalogue.</p>



        <form class="space-y-5" action="${pageContext.request.contextPath}/loginServlet" method="POST">
          <div>
            <label class="block text-xs font-semibold text-ink/60 mb-1.5" for="email">Email or member ID</label>
            <div class="relative">
              <i data-lucide="mail" class="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-ink/35"></i>
              <input name="email" type="text" placeholder="you@bookverse.lk" class="w-full pl-10 pr-3.5 py-2.5 rounded-lg border border-line bg-paper text-sm focus:border-forest outline-none">
            </div>
          </div>
          <div>
            <div class="flex items-center justify-between mb-1.5">
              <label class="block text-xs font-semibold text-ink/60" for="password">Password</label>
              <a href="#" class="text-xs text-brassdark hover:underline">Forgot?</a>
            </div>
            <div class="relative">
              <i data-lucide="lock" class="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-ink/35"></i>
              <input name="password" type="password" placeholder="......." class="w-full pl-10 pr-3.5 py-2.5 rounded-lg border border-line bg-paper text-sm focus:border-forest outline-none">
            </div>
          </div>
          <label class="flex items-center gap-2 text-xs text-ink/60">
            <input type="checkbox" class="card-check rounded border-line"> Keep me signed in on this device
          </label>
          <button type="submit" class="w-full flex items-center justify-center gap-2 bg-forest text-parchment py-2.5 rounded-lg text-sm font-semibold hover:bg-forestdark transition-colors shadow-card">
            Sign In <i data-lucide="arrow-right" class="w-4 h-4"></i>
          </button>
          <p class="text-center text-[11px] text-ink/40 font-mono">STAFF DEMO → <a href="admin-dashboard.jsp" class="underline hover:text-brassdark">admin-dashboard.html</a></p>
        </form>

        <p class="text-center text-sm text-ink/60 mt-8">New to BookVerse? <a href="signup.jsp" class="text-brassdark font-semibold hover:underline">Create a member card</a></p>

      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


  <%
    String success = (String) session.getAttribute("success");

    if(success != null){
  %>

  <script>

    Swal.fire({
      icon: 'success',
      title: 'Successful',
      text: '<%= success %>',
      confirmButtonColor: '#22463D'
    });

  </script>


  <%
      session.removeAttribute("success");
    }
  %>

  <%
    String error = (String) session.getAttribute("error");

    if(error != null){
  %>

  <script>

    Swal.fire({
      icon:'error',
      title:' Failed',
      text:'<%=error%>'
    });

  </script>


  <%
      session.removeAttribute("error");
    }
  %>



  <script>lucide.createIcons();</script>
</body>
</html>