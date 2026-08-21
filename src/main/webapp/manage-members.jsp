<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%
    com.bookverse.service.MemberService memberService = new com.bookverse.service.MemberService();
    request.setAttribute("members", memberService.getAllMembers());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>BookVerse - Manage Members</title>
    <jsp:include page="includes/head.jsp"/>

</head>

<body class="font-body text-ink">

<jsp:include page="includes/sidebar.jsp">
    <jsp:param name="role" value="admin"/>
    <jsp:param name="active" value="members"/>
</jsp:include>

<div id="sidebar-backdrop" class="fixed inset-0 bg-ink/40 z-30 hidden lg:hidden"></div>
<div class="lg:pl-64 min-h-screen flex flex-col">

    <header class="sticky top-0 z-20 h-16 bg-paper/90 backdrop-blur border-b border-line flex items-center gap-4 px-4 lg:px-8">
        <button id="menu-btn" class="lg:hidden p-2 -ml-2 rounded-lg hover:bg-card/60"><i data-lucide="menu"
                                                                                         class="w-5 h-5"></i></button>
        <div class="min-w-0">
            <h1 class="font-display text-lg font-semibold text-ink leading-tight truncate">Manage Members</h1>
            <p class="text-xs text-ink/50 -mt-0.5">Search, review, and update member cards</p>
        </div>
        <div class="flex-1"></div>

        <div class="hidden md:flex items-center gap-2 bg-parchment border border-line rounded-full px-4 py-2 w-72">
            <i data-lucide="search" class="w-4 h-4 text-ink/40"></i>
            <input type="text" placeholder="Search members, books..."
                   class="bg-transparent outline-none text-sm w-full placeholder:text-ink/40">
        </div>
        <button class="relative p-2 rounded-lg hover:bg-card/60"><i data-lucide="bell"
                                                                    class="w-5 h-5 text-ink/60"></i><span
                class="absolute top-1.5 right-1.5 w-2 h-2 bg-cloth rounded-full"></span></button>
        <button onclick="openMemberModal()"
                class="flex items-center gap-1.5 bg-forest text-parchment text-sm font-semibold px-4 py-2 rounded-lg hover:bg-forestdark transition-colors">
            <i data-lucide="user-plus" class="w-4 h-4"></i><span class="hidden sm:inline">Add Member</span></button>
    </header>
    <main class="flex-1 px-4 lg:px-8 py-7 max-w-[1400px] w-full mx-auto">

        <div class="grid sm:grid-cols-3 gap-4 mb-6">
            <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
                <p class="font-display text-2xl font-semibold text-ink">${fn:length(members)} </p>
                <p class="text-xs text-ink/50">Total members</p>
            </div>
            <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
                <p class="font-display text-2xl font-semibold text-forest">3,041</p>
                <p class="text-xs text-ink/50">Active cards</p>
            </div>
            <div class="bg-paper rounded-xl2 border border-line p-5 shadow-card">
                <p class="font-display text-2xl font-semibold text-cloth">79</p>
                <p class="text-xs text-ink/50">Suspended / overdue fees</p>
            </div>
        </div>

        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 mb-5">
            <div class="flex items-center gap-2">
                <button class="px-3.5 py-1.5 rounded-full text-xs font-semibold bg-forest text-parchment">All Members
                </button>
                <button class="px-3.5 py-1.5 rounded-full text-xs font-semibold border border-line text-ink/60 bg-paper hover:border-forest">
                    Active
                </button>
                <button class="px-3.5 py-1.5 rounded-full text-xs font-semibold border border-line text-ink/60 bg-paper hover:border-forest">
                    Suspended
                </button>
            </div>
            <div class="relative w-full sm:w-64">
                <i data-lucide="search" class="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-ink/35"></i>
                <input type="text" placeholder="Search name, member ID, email..."
                       class="w-full pl-10 pr-3 py-2 rounded-lg border border-line bg-paper text-sm focus:border-forest outline-none">
            </div>
        </div>

        <div class="bg-paper rounded-xl2 border border-line shadow-card overflow-hidden">
            <div class="overflow-x-auto">

                <c:choose>
                <c:when test="${empty members}">
                    <p class="text-sm text-stone-400 p-6">No members registered yet.</p>
                </c:when>
                <c:otherwise>

                <table class="w-full text-left border-collapse min-w-[820px]">
                    <thead>
                    <tr class="border-b border-line bg-card/40">
                        <th class="py-3 pl-5 sm:pl-6 w-10"><input type="checkbox"
                                                                  class="card-check rounded border-line"></th>
                        <th class="py-3 pr-4 text-xs font-semibold text-ink/50 uppercase tracking-wide">Member</th>
                        <th class="py-3 pr-4 text-xs font-semibold text-ink/50 uppercase tracking-wide">Email</th>
                        <th class="py-3 pr-4 text-xs font-semibold text-ink/50 uppercase tracking-wide">Branch</th>
                        <th class="py-3 pr-4 text-xs font-semibold text-ink/50 uppercase tracking-wide">Activity</th>
                        <th class="py-3 pr-4 text-xs font-semibold text-ink/50 uppercase tracking-wide">Status</th>
                        <th class="py-3 pr-5 sm:pr-6 text-xs font-semibold text-ink/50 uppercase tracking-wide text-right">
                            Actions
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="m" items="${members}">

                    <tr class="border-b border-line last:border-0 hover:bg-card/30">
                        <td class="py-3.5 pr-4">
                            <div class="flex items-center gap-3">
                                <img src="https://i.pravatar.cc/64?img=47" class="w-9 h-9 rounded-full object-cover"
                                     alt="">
                                <div class="min-w-0"><p class="font-medium text-sm text-ink truncate">${m.fullName}</p>
                                </div>
                            </div>
                        </td>
                        <td class="py-3.5 pr-4 text-xs text-ink/60 truncate max-w-[180px]">${m.email}</td>
                        <td class="py-3.5 pr-4 text-xs text-ink/60">${m.mobile}</td>
                        <td class="py-3.5 pr-4 text-xs text-ink/50">3 books out</td>
                        <td class="py-3.5 pr-4">

                            <c:choose>
                                <c:when test="${m.status == '1'}">
                                    <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">ACTIVE</span>

                                </c:when>
                                <c:otherwise>
                                    <span class="stamp inline-block px-2.5 py-1 text-[11px] font-semibold uppercase rounded text-forest bg-forest/5 ">Inactive</span>

                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="py-3.5 pr-5 sm:pr-6">
                            <div class="flex items-center justify-end gap-1">
                                <c:choose>
                                    <c:when test="${m.status == '1'}">
                                        <a href="${pageContext.request.contextPath}/member?action=disable&id=${m.id}" class="text-amber-700 text-sm font-medium hover:underline">Disable</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/member?action=enable&id=${m.id}" class="text-emerald-700 text-sm font-medium hover:underline">Enable</a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="${pageContext.request.contextPath}/member?action=delete&id=${m.id}"
                                   onclick="return confirm('Remove this member account?');"
                                   class="text-red-600 text-sm font-medium hover:underline">Delete</a>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>


                    </tbody>
                </table>
                </c:otherwise>
                </c:choose>
            </div>
            <div class="flex items-center justify-between px-5 sm:px-6 py-4 border-t border-line">
                <p class="text-xs text-ink/45">Showing 6 of 3,120 members</p>
                <div class="flex items-center gap-1.5">
                    <button class="w-8 h-8 rounded-lg border border-line text-ink/40 grid place-items-center"><i
                            data-lucide="chevron-left" class="w-4 h-4"></i></button>
                    <button class="w-8 h-8 rounded-lg bg-forest text-parchment text-xs font-semibold">1</button>
                    <button class="w-8 h-8 rounded-lg border border-line text-xs hover:border-forest">2</button>
                    <button class="w-8 h-8 rounded-lg border border-line text-ink/60 grid place-items-center hover:border-forest">
                        <i data-lucide="chevron-right" class="w-4 h-4"></i></button>
                </div>
            </div>
        </div>

        <!-- Add/Edit member modal -->
        <div id="member-modal" class="fixed inset-0 z-50 hidden">
            <div class="absolute inset-0 bg-ink/50 backdrop-blur-sm" onclick="closeMemberModal()"></div>
            <div class="absolute inset-0 overflow-y-auto flex items-start sm:items-center justify-center p-4 py-8">
                <div class="relative bg-paper rounded-xl2 shadow-lift w-full max-w-lg border border-line">
                    <div class="flex items-center justify-between px-6 py-4 border-b border-line">
                        <h3 class="font-display text-lg font-semibold text-ink">Add New Member</h3>
                        <button onclick="closeMemberModal()" class="p-1.5 rounded-lg hover:bg-card text-ink/50"><i
                                data-lucide="x" class="w-5 h-5"></i></button>
                    </div>
                    <form class="p-6 space-y-4" onsubmit="return false;">
                        <div class="flex items-center gap-4">
                            <img src="https://i.pravatar.cc/80?img=68"
                                 class="w-14 h-14 rounded-full object-cover ring-2 ring-line" alt="">
                            <button type="button"
                                    class="text-xs font-semibold text-brassdark border border-line rounded-lg px-3 py-1.5 hover:border-brass">
                                Upload photo
                            </button>
                        </div>
                        <div class="grid grid-cols-2 gap-3">
                            <div><label class="block text-xs font-semibold text-ink/60 mb-1.5">First name</label><input
                                    type="text"
                                    class="w-full px-3.5 py-2.5 rounded-lg border border-line bg-parchment text-sm focus:border-forest outline-none">
                            </div>
                            <div><label class="block text-xs font-semibold text-ink/60 mb-1.5">Last name</label><input
                                    type="text"
                                    class="w-full px-3.5 py-2.5 rounded-lg border border-line bg-parchment text-sm focus:border-forest outline-none">
                            </div>
                        </div>
                        <div><label class="block text-xs font-semibold text-ink/60 mb-1.5">Email address</label><input
                                type="email"
                                class="w-full px-3.5 py-2.5 rounded-lg border border-line bg-parchment text-sm focus:border-forest outline-none">
                        </div>
                        <div class="grid grid-cols-2 gap-3">
                            <div><label class="block text-xs font-semibold text-ink/60 mb-1.5">Branch</label>
                                <select class="w-full px-3.5 py-2.5 rounded-lg border border-line bg-parchment text-sm focus:border-forest outline-none">
                                    <option>Negombo Central</option>
                                    <option>Colombo Reading Hall</option>
                                    <option>Kandy Digital Annex</option>
                                </select>
                            </div>
                            <div><label class="block text-xs font-semibold text-ink/60 mb-1.5">Status</label>
                                <select class="w-full px-3.5 py-2.5 rounded-lg border border-line bg-parchment text-sm focus:border-forest outline-none">
                                    <option>Active</option>
                                    <option>Suspended</option>
                                </select>
                            </div>
                        </div>
                        <div class="flex justify-end gap-3 pt-2 border-t border-line mt-2">
                            <button type="button" onclick="closeMemberModal()"
                                    class="px-4 py-2.5 rounded-lg text-sm font-semibold text-ink/60 hover:bg-card/60">
                                Cancel
                            </button>
                            <button type="button" onclick="closeMemberModal()"
                                    class="px-5 py-2.5 rounded-lg text-sm font-semibold bg-forest text-parchment hover:bg-forestdark">
                                Save Member
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="delete-modal" class="fixed inset-0 z-50 hidden">
            <div class="absolute inset-0 bg-ink/50 backdrop-blur-sm" onclick="closeDeleteModal()"></div>
            <div class="absolute inset-0 flex items-center justify-center p-4">
                <div class="relative bg-paper rounded-xl2 shadow-lift w-full max-w-sm border border-line p-6 text-center">
                    <span class="w-12 h-12 rounded-full bg-cloth/10 text-cloth grid place-items-center mx-auto mb-4"><i
                            data-lucide="user-x" class="w-5 h-5"></i></span>
                    <h3 class="font-display text-lg font-semibold text-ink mb-1.5">Suspend this member?</h3>
                    <p id="delete-modal-text" class="text-sm text-ink/55 mb-6">This member card will be suspended and
                        borrowing privileges paused.</p>
                    <div class="flex gap-3">
                        <button onclick="closeDeleteModal()"
                                class="flex-1 px-4 py-2.5 rounded-lg text-sm font-semibold border border-line text-ink/60 hover:bg-card/60">
                            Cancel
                        </button>
                        <button onclick="closeDeleteModal()"
                                class="flex-1 px-4 py-2.5 rounded-lg text-sm font-semibold bg-cloth text-white hover:bg-cloth/90">
                            Suspend
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function openMemberModal() {
                document.getElementById('member-modal').classList.remove('hidden');
            }

            function closeMemberModal() {
                document.getElementById('member-modal').classList.add('hidden');
            }

            function openDeleteModal(name) {
                document.getElementById('delete-modal-text').textContent = 'Suspend ' + name + '\'s card? Borrowing privileges will be paused until reactivated.';
                document.getElementById('delete-modal').classList.remove('hidden');
            }

            function closeDeleteModal() {
                document.getElementById('delete-modal').classList.add('hidden');
            }
        </script>


    </main>
    <footer class="px-4 lg:px-8 py-5 text-xs text-ink/40 border-t border-line">BookVerse Online Library Portal — UI
        Prototype for HF2K Web Component Development II
    </footer>
</div>
<script>lucide.createIcons();</script>

<script>
    const menuBtn = document.getElementById('menu-btn');
    const sidebar = document.getElementById('sidebar');
    const backdrop = document.getElementById('sidebar-backdrop');

    function toggleNav(open) {
        sidebar.classList.toggle('-translate-x-full', !open);
        backdrop.classList.toggle('hidden', !open);
    }

    menuBtn && menuBtn.addEventListener('click', () => toggleNav(true));
    backdrop && backdrop.addEventListener('click', () => toggleNav(false));
</script>
</body>
</html>