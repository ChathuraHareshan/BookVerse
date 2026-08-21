<jsp:useBean
        id="user"
        class="com.bookverse.model.Member"
        scope="session"
/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Member Dashboard · BookVerse</title>
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
    <div class="h-16 flex items-center px-5 border-b border-line"><a href="index.jsp" class="flex items-center gap-2.5 group">
      <span class="grid place-items-center w-9 h-9 rounded-lg bg-forest text-brasslight shadow-card group-hover:bg-forestdark transition-colors">
        <i data-lucide="book-marked" class="w-5 h-5"></i>
      </span>
      <span class="font-display text-forest text-xl font-semibold tracking-tight">Book<span class="text-brass">Verse</span></span>
    </a></div>
    <nav class="flex-1 overflow-y-auto py-5 px-2.5 space-y-1">
      <p class="px-4 text-[11px] font-mono uppercase tracking-wider text-ink/40 mb-2">Member Area</p>

        <a href="member-dashboard.jsp" class="tab-notch active flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm bg-card text-forest font-semibold transition-colors">
          <i data-lucide="layout-dashboard" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Dashboard</span>
        </a>
        <a href="catalogue.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="library" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Browse Catalogue</span>
        </a>
        <a href="reservations.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="bookmark" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">My Reservations</span>
        </a>
        <a href="borrowed.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="book-open-check" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">My Borrowed Books</span>
        </a>
        <a href="announcements.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="megaphone" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">Announcements</span>
        </a>
        <a href="profile.html" class="tab-notch  flex items-center gap-3 px-4 py-2.5 rounded-r-lg rounded-l-sm text-ink/70 hover:bg-card/60 hover:text-ink transition-colors">
          <i data-lucide="user-round" class="w-[18px] h-[18px] shrink-0"></i>
          <span class="text-sm">My Profile</span>
        </a>
    </nav>
    <div class="p-3 border-t border-line">
      <div class="flex items-center gap-3 px-2 py-2 rounded-lg hover:bg-card/60">
        <img src="https://i.pravatar.cc/64?img=47" class="w-9 h-9 rounded-full object-cover ring-2 ring-brass/40" alt="">
        <div class="min-w-0">
          <p class="text-sm font-semibold text-ink truncate"></p>
          <p class="text-xs text-ink/50 truncate">Member - ${user.firstName} ${user.lastName}</p>
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
      <h1 class="font-display text-lg font-semibold text-ink leading-tight truncate">Dashboard</h1>
      <p class="text-xs text-ink/50 -mt-0.5">Your library, at a glance</p>
    </div>
    <div class="flex-1"></div>

        <div class="hidden md:flex items-center gap-2 bg-parchment border border-line rounded-full px-4 py-2 w-72">
          <i data-lucide="search" class="w-4 h-4 text-ink/40"></i>
          <input type="text" placeholder="Search books, authors..." class="bg-transparent outline-none text-sm w-full placeholder:text-ink/40">
        </div>
    <button class="relative p-2 rounded-lg hover:bg-card/60"><i data-lucide="bell" class="w-5 h-5 text-ink/60"></i><span class="absolute top-1.5 right-1.5 w-2 h-2 bg-cloth rounded-full"></span></button>
    <a href="catalogue.html" class="hidden sm:flex items-center gap-1.5 bg-forest text-parchment text-sm font-semibold px-4 py-2 rounded-lg hover:bg-forestdark transition-colors"><i data-lucide="search" class="w-4 h-4"></i>Browse Catalogue</a>
  </header>
    <main class="flex-1 px-4 lg:px-8 py-7 max-w-[1400px] w-full mx-auto">

      <!-- Greeting / member card -->
      <div class="grid lg:grid-cols-3 gap-5 mb-7">
        <div class="lg:col-span-2 bg-forest text-parchment rounded-xl2 p-6 sm:p-7 relative overflow-hidden shadow-card">
          <div class="absolute -right-10 -top-10 w-56 h-56 rounded-full bg-brass/20 blur-3xl"></div>
          <p class="font-mono text-xs uppercase tracking-widest text-brasslight mb-2">Good afternoon</p>
          <h2 class="font-display text-2xl sm:text-3xl font-semibold mb-2">Welcome back, ${user.firstName}.</h2>
          <p class="text-parchment/70 text-sm max-w-md mb-6">You have <span class="text-brasslight font-semibold">1 book due in 3 days</span> and <span class="text-brasslight font-semibold">2 active reservations</span> waiting at the front desk.</p>
          <div class="flex flex-wrap gap-3">
            <a href="borrowed.html" class="bg-parchment text-forest text-sm font-semibold px-4 py-2 rounded-lg hover:bg-white transition-colors">View Due Books</a>
            <a href="catalogue.html" class="border border-parchment/40 text-parchment text-sm font-semibold px-4 py-2 rounded-lg hover:bg-parchment/10 transition-colors">Find Something New</a>
          </div>
        </div>
        <div class="bg-paper rounded-xl2 border border-line shadow-card p-6 flex flex-col justify-between">
          <div>
            <p class="text-xs font-mono uppercase text-ink/40 mb-1">Membership card</p>
            <p class="font-display text-lg font-semibold text-ink">${user.firstName} ${user.lastName}</p>
            <p class="text-xs text-ink/50 font-mono mt-0.5">${user.email} - ${user.mobile}</p>
          </div>
          <div class="flex items-center justify-between mt-6">
            <span class="stamp px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5">${user.status}</span>
            <img src="https://i.pravatar.cc/64?img=47" class="w-11 h-11 rounded-full ring-2 ring-brass/40 object-cover" alt="">
          </div>
        </div>
      </div>

      <!-- Stat strip -->
      <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <i data-lucide="book-open-check" class="w-5 h-5 text-forest mb-3"></i>
          <p class="font-display text-2xl font-semibold text-ink">3</p>
          <p class="text-xs text-ink/50">Books currently borrowed</p>
        </div>
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <i data-lucide="bookmark" class="w-5 h-5 text-brassdark mb-3"></i>
          <p class="font-display text-2xl font-semibold text-ink">2</p>
          <p class="text-xs text-ink/50">Active reservations</p>
        </div>
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <i data-lucide="clock" class="w-5 h-5 text-cloth mb-3"></i>
          <p class="font-display text-2xl font-semibold text-ink">1</p>
          <p class="text-xs text-ink/50">Due within 3 days</p>
        </div>
        <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
          <i data-lucide="history" class="w-5 h-5 text-ink/50 mb-3"></i>
          <p class="font-display text-2xl font-semibold text-ink">27</p>
          <p class="text-xs text-ink/50">Books read this year</p>
        </div>
      </div>

      <div class="grid lg:grid-cols-3 gap-6">
        <!-- Currently borrowed -->
        <div class="lg:col-span-2 bg-paper rounded-xl2 border border-line shadow-card">
          <div class="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-line">
            <h3 class="font-display font-semibold text-ink">Currently Borrowed</h3>
            <a href="borrowed.html" class="text-xs font-semibold text-brassdark hover:underline">View all</a>
          </div>
          <div class="divide-y divide-line">
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <img src="https://picsum.photos/seed/bookverse21/80/106" class="w-11 h-14 rounded object-cover shadow-card" alt="">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm text-ink truncate">The Quiet Cartographer</p>
                <p class="text-xs text-ink/50">Lena Whitfield · Fiction</p>
              </div>
              <div class="text-right">
                <p class="text-xs font-mono text-cloth">DUE IN 3 DAYS</p>
                <p class="text-[11px] text-ink/40">28 Jul 2026</p>
              </div>
            </div>
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <img src="https://picsum.photos/seed/bookverse22/80/106" class="w-11 h-14 rounded object-cover shadow-card" alt="">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm text-ink truncate">Structures of Silence</p>
                <p class="text-xs text-ink/50">Dr. R. Fonseka · Non-fiction</p>
              </div>
              <div class="text-right">
                <p class="text-xs font-mono text-ink/50">DUE 04 AUG</p>
                <p class="text-[11px] text-ink/40">11 days left</p>
              </div>
            </div>
            <div class="flex items-center gap-4 px-5 sm:px-6 py-4">
              <img src="https://picsum.photos/seed/bookverse23/80/106" class="w-11 h-14 rounded object-cover shadow-card" alt="">
              <div class="flex-1 min-w-0">
                <p class="font-medium text-sm text-ink truncate">Almanac of Tidewater Towns</p>
                <p class="text-xs text-ink/50">M. Herath · Travel</p>
              </div>
              <div class="text-right">
                <p class="text-xs font-mono text-ink/50">DUE 09 AUG</p>
                <p class="text-[11px] text-ink/40">16 days left</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Announcements -->
        <div class="bg-paper rounded-xl2 border border-line shadow-card">
          <div class="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-line">
            <h3 class="font-display font-semibold text-ink">Library Notices</h3>
            <a href="announcements.html" class="text-xs font-semibold text-brassdark hover:underline">View all</a>
          </div>
          <div class="p-5 sm:p-6 space-y-5">
            <div class="flex gap-3">
              <span class="w-1.5 h-1.5 rounded-full bg-brass mt-1.5 shrink-0"></span>
              <div>
                <p class="text-sm font-medium text-ink">Extended reading-room hours this week</p>
                <p class="text-xs text-ink/45 mt-0.5">Posted 2 days ago</p>
              </div>
            </div>
            <div class="flex gap-3">
              <span class="w-1.5 h-1.5 rounded-full bg-brass mt-1.5 shrink-0"></span>
              <div>
                <p class="text-sm font-medium text-ink">New arrivals: Sri Lankan short fiction shelf</p>
                <p class="text-xs text-ink/45 mt-0.5">Posted 5 days ago</p>
              </div>
            </div>
            <div class="flex gap-3">
              <span class="w-1.5 h-1.5 rounded-full bg-brass mt-1.5 shrink-0"></span>
              <div>
                <p class="text-sm font-medium text-ink">Scheduled system maintenance, 2 Aug</p>
                <p class="text-xs text-ink/45 mt-0.5">Posted 1 week ago</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Recommended -->
      <div class="mt-8">
        <div class="flex items-center justify-between mb-4">
          <h3 class="font-display font-semibold text-ink text-lg">Because you read Fiction</h3>
          <a href="catalogue.html" class="text-xs font-semibold text-brassdark hover:underline">See full catalogue</a>
        </div>
        <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-4">

        <a href="book-details.html" class="catalog-card block bg-paper rounded-xl2 border border-line shadow-card overflow-hidden spine border-forest">
          <div class="aspect-[3/4] w-full bg-card overflow-hidden">
            <img src="https://picsum.photos/seed/bookverse1/400/533" alt="Cover of The Salt Orchard" class="w-full h-full object-cover">
          </div>
          <div class="p-3.5">
            <p class="font-mono text-[10px] uppercase tracking-wider text-brassdark mb-1">Fiction</p>
            <h3 class="font-display font-semibold text-ink leading-snug line-clamp-2">The Salt Orchard</h3>
            <p class="text-xs text-ink/50 mt-0.5">Nadia Bloom</p>
            <div class="mt-3 flex items-center justify-between">
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">AVAILABLE</span>
              <i data-lucide="arrow-up-right" class="w-4 h-4 text-ink/30"></i>
            </div>
          </div>
        </a>

        <a href="book-details.html" class="catalog-card block bg-paper rounded-xl2 border border-line shadow-card overflow-hidden spine border-brass">
          <div class="aspect-[3/4] w-full bg-card overflow-hidden">
            <img src="https://picsum.photos/seed/bookverse2/400/533" alt="Cover of Letters from Havelock" class="w-full h-full object-cover">
          </div>
          <div class="p-3.5">
            <p class="font-mono text-[10px] uppercase tracking-wider text-brassdark mb-1">Fiction</p>
            <h3 class="font-display font-semibold text-ink leading-snug line-clamp-2">Letters from Havelock</h3>
            <p class="text-xs text-ink/50 mt-0.5">T. Jayasuriya</p>
            <div class="mt-3 flex items-center justify-between">
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">AVAILABLE</span>
              <i data-lucide="arrow-up-right" class="w-4 h-4 text-ink/30"></i>
            </div>
          </div>
        </a>

        <a href="book-details.html" class="catalog-card block bg-paper rounded-xl2 border border-line shadow-card overflow-hidden spine border-cloth">
          <div class="aspect-[3/4] w-full bg-card overflow-hidden">
            <img src="https://picsum.photos/seed/bookverse3/400/533" alt="Cover of The Longform Silence" class="w-full h-full object-cover">
          </div>
          <div class="p-3.5">
            <p class="font-mono text-[10px] uppercase tracking-wider text-brassdark mb-1">Poetry</p>
            <h3 class="font-display font-semibold text-ink leading-snug line-clamp-2">The Longform Silence</h3>
            <p class="text-xs text-ink/50 mt-0.5">K. Amarasekera</p>
            <div class="mt-3 flex items-center justify-between">
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-brassdark bg-brass/10 ">RESERVED</span>
              <i data-lucide="arrow-up-right" class="w-4 h-4 text-ink/30"></i>
            </div>
          </div>
        </a>

        <a href="book-details.html" class="catalog-card block bg-paper rounded-xl2 border border-line shadow-card overflow-hidden spine border-forestlight">
          <div class="aspect-[3/4] w-full bg-card overflow-hidden">
            <img src="https://picsum.photos/seed/bookverse4/400/533" alt="Cover of Monsoon Ledger" class="w-full h-full object-cover">
          </div>
          <div class="p-3.5">
            <p class="font-mono text-[10px] uppercase tracking-wider text-brassdark mb-1">Fiction</p>
            <h3 class="font-display font-semibold text-ink leading-snug line-clamp-2">Monsoon Ledger</h3>
            <p class="text-xs text-ink/50 mt-0.5">S. Rathnayake</p>
            <div class="mt-3 flex items-center justify-between">
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-cloth bg-cloth/5 ">BORROWED</span>
              <i data-lucide="arrow-up-right" class="w-4 h-4 text-ink/30"></i>
            </div>
          </div>
        </a>

        <a href="book-details.html" class="catalog-card block bg-paper rounded-xl2 border border-line shadow-card overflow-hidden spine border-brassdark">
          <div class="aspect-[3/4] w-full bg-card overflow-hidden">
            <img src="https://picsum.photos/seed/bookverse5/400/533" alt="Cover of Cartography of Doubt" class="w-full h-full object-cover">
          </div>
          <div class="p-3.5">
            <p class="font-mono text-[10px] uppercase tracking-wider text-brassdark mb-1">Fiction</p>
            <h3 class="font-display font-semibold text-ink leading-snug line-clamp-2">Cartography of Doubt</h3>
            <p class="text-xs text-ink/50 mt-0.5">Lena Whitfield</p>
            <div class="mt-3 flex items-center justify-between">
              <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">AVAILABLE</span>
              <i data-lucide="arrow-up-right" class="w-4 h-4 text-ink/30"></i>
            </div>
          </div>
        </a>
        </div>
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