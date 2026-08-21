<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard · BookVerse</title>
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
<body class="font-body text-ink">
  
  <aside id="sidebar" class="fixed inset-y-0 left-0 z-40 w-64 bg-paper border-r border-line -translate-x-full lg:translate-x-0 transition-transform duration-200 flex flex-col">
    <div class="h-16 flex items-center px-5 border-b border-line"><a href="admin-dashboard.jsp" class="flex items-center gap-2.5 group">
      <span class="grid place-items-center w-9 h-9 rounded-lg bg-forest text-brasslight shadow-card group-hover:bg-forestdark transition-colors">
        <i data-lucide="book-marked" class="w-5 h-5"></i>
      </span>
      <span class="font-display text-forest text-xl font-semibold tracking-tight">Book<span class="text-brass">Verse</span></span>
    </a></div>
    <nav class="flex-1 overflow-y-auto py-5 px-2.5 space-y-1">
      <p class="px-4 text-[11px] font-mono uppercase tracking-wider text-ink/40 mb-2">Staff Area</p>
      
        <a href="admin-dashboard.html" class="tab-notch active flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm bg-card text-forest font-semibold transition-colors">
          <i data-lucide="layout-dashboard" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Dashboard</span>
        </a>
        <a href="manage-books.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="book-copy" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Manage Books</span>
        </a>
        <a href="manage-members.jsp" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="users" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Manage Members</span>
        </a>
        <a href="admin-reservations.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="bookmark" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Reservations</span>
        </a>
        <a href="admin-announcements.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="megaphone" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Announcements</span>
        </a>
    </nav>
    <div class="p-3 border-t border-line">
      <div class="flex items-center gap-3 px-2 py-2 rounded-lg hover:bg-card/60">
        <img src="https://i.pravatar.cc/64?img=12" class="w-9 h-9 rounded-full object-cover ring-2 ring-brass/40" alt="">
        <div class="min-w-0">
          <p class="text-sm font-semibold text-ink truncate">S. Gunawardena</p>
          <p class="text-xs text-ink/50 truncate">Librarian · Staff</p>
        </div>
      </div>
      <form action="${pageContext.request.contextPath}/logoutServlet" method="get">

        <button type="submit"
                class="mt-1 flex items-center gap-3 px-4 py-2.5 rounded-lg text-cloth/80 hover:bg-cloth/10 hover:text-cloth transition-colors text-sm">

          <i data-lucide="log-out" class="w-[18px] h-[18px]"></i>
          Log Out

        </button>

      </form>
    </div>
  </aside>
  <div id="sidebar-backdrop" class="fixed inset-0 bg-ink/40 z-30 hidden lg:hidden"></div>
  <div class="lg:pl-64 min-h-screen flex flex-col">
    
  <header class="sticky top-0 z-20 h-16 bg-paper/90 backdrop-blur border-b border-line flex items-center gap-4 px-4 lg:px-8">
    <button id="menu-btn" class="lg:hidden p-2 -ml-2 rounded-lg hover:bg-card/60"><i data-lucide="menu" class="w-5 h-5"></i></button>
    <div class="min-w-0">
      <h1 class="font-display text-lg font-semibold text-ink leading-tight truncate">Staff Dashboard</h1>
      <p class="text-xs text-ink/50 -mt-0.5">Overview of BookVerse — Negombo Central</p>
    </div>
    <div class="flex-1"></div>
    
        <div class="hidden md:flex items-center gap-2 bg-parchment border border-line rounded-full px-4 py-2 w-72">
          <i data-lucide="search" class="w-4 h-4 text-ink/40"></i>
          <input type="text" placeholder="Search members, books..." class="bg-transparent outline-none text-sm w-full placeholder:text-ink/40">
        </div>
    <button class="relative p-2 rounded-lg hover:bg-card/60"><i data-lucide="bell" class="w-5 h-5 text-ink/60"></i><span class="absolute top-1.5 right-1.5 w-2 h-2 bg-cloth rounded-full"></span></button>
    <a href="manage-books.html" class="hidden sm:flex items-center gap-1.5 bg-forest text-parchment text-sm font-semibold px-4 py-2 rounded-lg hover:bg-forestdark transition-colors"><i data-lucide="plus" class="w-4 h-4"></i>Add Book</a>
  </header>
    <main class="flex-1 px-4 lg:px-8 py-7 max-w-[1400px] w-full mx-auto">

      <!-- KPI strip -->
      <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-7">
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <div class="flex items-center justify-between mb-3">
            <i data-lucide="book-copy" class="w-5 h-5 text-forest"></i>
            <span class="text-[11px] font-mono text-forest bg-forest/10 px-1.5 py-0.5 rounded">+124</span>
          </div>
          <p class="font-display text-2xl font-semibold text-ink">12,400</p>
          <p class="text-xs text-ink/50">Titles in catalogue</p>
        </div>
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <div class="flex items-center justify-between mb-3">
            <i data-lucide="users" class="w-5 h-5 text-brassdark"></i>
            <span class="text-[11px] font-mono text-forest bg-forest/10 px-1.5 py-0.5 rounded">+38</span>
          </div>
          <p class="font-display text-2xl font-semibold text-ink">3,120</p>
          <p class="text-xs text-ink/50">Registered members</p>
        </div>
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <div class="flex items-center justify-between mb-3">
            <i data-lucide="bookmark" class="w-5 h-5 text-brass"></i>
            <span class="text-[11px] font-mono text-cloth bg-cloth/10 px-1.5 py-0.5 rounded">18 pending</span>
          </div>
          <p class="font-display text-2xl font-semibold text-ink">64</p>
          <p class="text-xs text-ink/50">Open reservations</p>
        </div>
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <div class="flex items-center justify-between mb-3">
            <i data-lucide="alert-triangle" class="w-5 h-5 text-cloth"></i>
          </div>
          <p class="font-display text-2xl font-semibold text-ink">21</p>
          <p class="text-xs text-ink/50">Overdue books</p>
        </div>
      </div>

      <div class="grid lg:grid-cols-3 gap-6">
        <!-- Recent activity -->
        <div class="lg:col-span-2 bg-paper rounded-xl2 border border-line shadow-card">
          <div class="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-line">
            <h3 class="font-display font-semibold text-ink">Recent Activity</h3>
            <a href="admin-reservations.html" class="text-xs font-semibold text-brassdark hover:underline">View all</a>
          </div>
          <div class="divide-y divide-line">
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <span class="w-9 h-9 rounded-full bg-forest/10 text-forest grid place-items-center shrink-0"><i data-lucide="bookmark-plus" class="w-4 h-4"></i></span>
              <div class="flex-1 min-w-0"><p class="text-sm text-ink"><span class="font-semibold">Ishan Wickrama</span> reserved <span class="font-semibold">The Longform Silence</span></p><p class="text-xs text-ink/40">6 minutes ago</p></div>
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-brassdark bg-brass/10 ">PENDING</span>
            </div>
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <span class="w-9 h-9 rounded-full bg-brass/10 text-brassdark grid place-items-center shrink-0"><i data-lucide="user-plus" class="w-4 h-4"></i></span>
              <div class="flex-1 min-w-0"><p class="text-sm text-ink"><span class="font-semibold">Nethmi Karunaratne</span> created a member card</p><p class="text-xs text-ink/40">28 minutes ago</p></div>
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">ACTIVE</span>
            </div>
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <span class="w-9 h-9 rounded-full bg-cloth/10 text-cloth grid place-items-center shrink-0"><i data-lucide="undo-2" class="w-4 h-4"></i></span>
              <div class="flex-1 min-w-0"><p class="text-sm text-ink"><span class="font-semibold">Ruwan Silva</span> returned <span class="font-semibold">Kitchen Almanac</span> — 2 days late</p><p class="text-xs text-ink/40">1 hour ago</p></div>
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-white bg-cloth border-cloth text-white">OVERDUE</span>
            </div>
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <span class="w-9 h-9 rounded-full bg-forest/10 text-forest grid place-items-center shrink-0"><i data-lucide="book-copy" class="w-4 h-4"></i></span>
              <div class="flex-1 min-w-0"><p class="text-sm text-ink"><span class="font-semibold">Admin</span> added <span class="font-semibold">Field Notes on Rain</span> to catalogue</p><p class="text-xs text-ink/40">3 hours ago</p></div>
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">AVAILABLE</span>
            </div>
          </div>
        </div>

        <!-- Reservation queue snapshot -->
        <div class="bg-paper rounded-xl2 border border-line shadow-card">
          <div class="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-line">
            <h3 class="font-display font-semibold text-ink">Pickup Queue</h3>
            <span class="text-xs text-ink/40 font-mono">TODAY</span>
          </div>
          <div class="p-5 sm:p-6 space-y-4">
            <div class="flex items-center gap-3">
              <img src="https://i.pravatar.cc/64?img=32" class="w-9 h-9 rounded-full object-cover" alt="">
              <div class="flex-1 min-w-0"><p class="text-sm font-medium text-ink truncate">Ishan Wickrama</p><p class="text-xs text-ink/45 truncate">The Archivist's Daughter</p></div>
              <button class="text-xs font-semibold text-forest hover:underline">Approve</button>
            </div>
            <div class="flex items-center gap-3">
              <img src="https://i.pravatar.cc/64?img=15" class="w-9 h-9 rounded-full object-cover" alt="">
              <div class="flex-1 min-w-0"><p class="text-sm font-medium text-ink truncate">Sanduni Rajapaksa</p><p class="text-xs text-ink/45 truncate">Monsoon Ledger</p></div>
              <button class="text-xs font-semibold text-forest hover:underline">Approve</button>
            </div>
            <div class="flex items-center gap-3">
              <img src="https://i.pravatar.cc/64?img=8" class="w-9 h-9 rounded-full object-cover" alt="">
              <div class="flex-1 min-w-0"><p class="text-sm font-medium text-ink truncate">Kavindu Perera</p><p class="text-xs text-ink/45 truncate">Field Notes on Rain</p></div>
              <button class="text-xs font-semibold text-forest hover:underline">Approve</button>
            </div>
          </div>
          <div class="px-5 sm:px-6 pb-5"><a href="admin-reservations.html" class="block text-center text-sm font-semibold border border-line rounded-lg py-2 hover:border-forest hover:text-forest">Open Full Queue</a></div>
        </div>
      </div>

      <!-- Quick actions -->
      <div class="grid sm:grid-cols-3 gap-4 mt-6">
        <a href="manage-books.html" class="bg-forest text-parchment rounded-xl2 p-5 shadow-card flex items-center gap-4 hover:bg-forestdark transition-colors">
          <span class="w-11 h-11 rounded-lg bg-parchment/15 grid place-items-center"><i data-lucide="book-copy" class="w-5 h-5"></i></span>
          <div><p class="font-display font-semibold">Manage Books</p><p class="text-xs text-parchment/60">Add, edit, or retire titles</p></div>
        </a>
        <a href="manage-members.jsp" class="bg-paper border border-line rounded-xl2 p-5 shadow-card flex items-center gap-4 hover:border-forest transition-colors">
          <span class="w-11 h-11 rounded-lg bg-card grid place-items-center text-forest"><i data-lucide="users" class="w-5 h-5"></i></span>
          <div><p class="font-display font-semibold text-ink">Manage Members</p><p class="text-xs text-ink/50">Review and update member cards</p></div>
        </a>
        <a href="admin-announcements.html" class="bg-paper border border-line rounded-xl2 p-5 shadow-card flex items-center gap-4 hover:border-forest transition-colors">
          <span class="w-11 h-11 rounded-lg bg-card grid place-items-center text-brassdark"><i data-lucide="megaphone" class="w-5 h-5"></i></span>
          <div><p class="font-display font-semibold text-ink">Post an Announcement</p><p class="text-xs text-ink/50">Share news with all members</p></div>
        </a>
      </div>


    </main>
    <footer class="px-4 lg:px-8 py-5 text-xs text-ink/40 border-t border-line">BookVerse Online Library Portal — UI Prototype for HF2K Web Component Development II</footer>
  </div>
  <script>lucide.createIcons();</script>
  
<script>
  const menuBtn = document.getElementById('menu-btn');
  const sidebar = document.getElementById('sidebar');
  const backdrop = document.getElementById('sidebar-backdrop');
  function toggleNav(open){
    sidebar.classList.toggle('-translate-x-full', !open);
    backdrop.classList.toggle('hidden', !open);
  }
  menuBtn && menuBtn.addEventListener('click', () => toggleNav(true));
  backdrop && backdrop.addEventListener('click', () => toggleNav(false));
</script>
</body>
</html>