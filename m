Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E13845D8;
	Tue, 21 Jul 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643027; cv=none; b=AUlD56py2OCJWGdKlSYtImPa9FTEDOYt1VIPQqT/HC/NuQhXfVT6f/iu3D9XFZevsQ2nYCN8SdDLnQ7bnxqKQzWVIBsQBBRh6J8i/CXDh64Yn09Ymf9joBgFHkdTQCXlkQuafT2evsjk9XWDMktlAaWID+MJQ/Ee5lgsirw/oFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643027; c=relaxed/simple;
	bh=Hqed8LOvtwiFuBunXMB36KmctMth6OOnPBoBkI0ARzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phx1WK7flqxw3pNSn8FqEwFyajxXr/iQkMZTqI8eaSvNY9/POilxIm7AalDY9Z15Zlf8wdidrUp6mDp4dPLYDq49sWopCtW/0u8Qnc+DzpoyQrpDQCvwdlfAeNlZavNSePQlKqeS/cOUsFRowbkPyL/G+bHUwwE67mm5VhSX5yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQ7DN/FN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ7DN/FN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845191F000E9;
	Tue, 21 Jul 2026 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643025;
	bh=ueEYntSnyJWx4SKo1bftFx9hiuH49Q/XIScnLATSpIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQ7DN/FNp7NZCQG7HhRV0Z5rdYq7jxlTgxq+Hz6uaUe833I/xmUe7yJMEKmDp5sIL
	 +18mANEoNyhUWRAyXmW20mDB0YEUM+wYW4FwpYXIEwE03yTypY0zUDPaRw7vwHKRID
	 kRk7BX7CDiC0DMULiT/xHXZjbvlhpWjvbMoWS39lQaP/Yylgrj9NsKL7pUN2SOw7K7
	 jKUov8puDhNOg9zrOP68l50mYWrmTA+vSTLwZq0UfWq/pqpwvqLMngZeAiF5ZAZ41L
	 GZZZceeICA/Z3uIVeyY5l4KEprS4ftnKSbOS87O3zqcaT7nyenzwGgxrfBaWV0oVhh
	 KMtOevorKcbIw==
Date: Tue, 21 Jul 2026 15:10:07 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, 
	syzbot <syzbot+ee7ecfcd0e3f185e835a@syzkaller.appspotmail.com>, "Denis V. Lunev" <den@openvz.org>, 
	Vishal Moola <vishal.moola@gmail.com>, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, 
	tglx@kernel.org, x86@kernel.org
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING: locking bug
 in change_page_attr_set_clr
Message-ID: <al98SDZJ73ZKdEKv@lucifer>
References: <6a5e53ed.f1649fcc.2a4208.0574.GAE@google.com>
 <20260721022448.GDal7YcN_64rndpnHI@fat_crate.local>
 <al9LYQPufAfqvMYT@kernel.org>
 <al9jHTONTrsImlVV@lucifer>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al9jHTONTrsImlVV@lucifer>

On Tue, Jul 21, 2026 at 01:39:51PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Jul 21, 2026 at 01:35:13PM +0300, Mike Rapoport wrote:
> > On Mon, Jul 20, 2026 at 07:24:48PM -0700, Borislav Petkov wrote:
> > > Adding all folks who touched this recently.
> >
> > You forgot Lorenzo ;-)
>
> Yup :) thanks.
>
> OK so this is a screw up with merging.

Well nobody told me there was a v2 ([3]), that it was taken or thought to cc- me on
anything, so that goes some way towards explaining how this happened :)

[3]:https://lore.kernel.org/all/20260715183453.2381141-1-den@openvz.org/

Anyway as per below TL;DR is the latest revision of my series does NOT conflict
with this series and the HEAD of linux-next _is fixed_.

The commit message of that v2 is now not really accurate but it does solve
_another_ possible debug_pagealloc race.

Thanks, Lorenzo

>
> Two fixes are applied at once here and they are NOT compatible :)
>
> Denis's ([0]) holds a spin lock over the operation during which an older
> revision of mine ([1] - current, probable next revision [2]) tries to take a
> sleeping mmap lock, hence the report.
>
> But actually my + Denis's fixes, with the latest revision of mine ([2]) are fine
> - as I take the mmap lock prior to any spin locks being taken in the (newly
> renamed) __cpa_collapse_large_pages().
>
> TL;DR - not a real issue and next will get fixed when the newer version of my
> series is taken (with sensible coflict resolution).
>
> And in fact I can see it's fixed at -next master anyway :)
>
> I think actually my + Denis's fixes are actually potentially complimentary, will
> reply on that thread about that.
>
> Cheers, Lorenzo
>
> [0]:https://lore.kernel.org/all/20260626163213.2284080-1-den@openvz.org/
> [1]:https://lore.kernel.org/linux-mm/20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org/
> [2]:https://lore.kernel.org/all/20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org/
>
> >
> > > On Mon, Jul 20, 2026 at 09:59:25AM -0700, syzbot wrote:
> > > > Hello,
> > > >
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    1a1757b76427 Add linux-next specific files for 20260716
> > > > git tree:       linux-next
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=16c734b9580000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=8d1a274c57796a86
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=ee7ecfcd0e3f185e835a
> > > > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > > >
> > > > Downloadable assets:
> > > > disk image: https://storage.googleapis.com/syzbot-assets/923ee89ba238/disk-1a1757b7.raw.xz
> > > > vmlinux: https://storage.googleapis.com/syzbot-assets/cb34d1bf205c/vmlinux-1a1757b7.xz
> > > > kernel image: https://storage.googleapis.com/syzbot-assets/bf183d434c82/bzImage-1a1757b7.xz
> > > >
> > > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > > Reported-by: syzbot+ee7ecfcd0e3f185e835a@syzkaller.appspotmail.com
> > > >
> > > > clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> > > > kfence: initialized - using 2097152 bytes for 255 objects at 0xffff88823be00000-0xffff88823c000000
> > > > Console: colour VGA+ 80x25
> > > > printk: legacy console [ttyS0] enabled
> > > > printk: legacy console [ttyS0] enabled
> > > > printk: legacy bootconsole [earlyser0] disabled
> > > > printk: legacy bootconsole [earlyser0] disabled
> > > > Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> > > > ... MAX_LOCKDEP_SUBCLASSES:  8
> > > > ... MAX_LOCK_DEPTH:          48
> > > > ... MAX_LOCKDEP_KEYS:        8192
> > > > ... CLASSHASH_SIZE:          4096
> > > > ... MAX_LOCKDEP_ENTRIES:     1048576
> > > > ... MAX_LOCKDEP_CHAINS:      1048576
> > > > ... CHAINHASH_SIZE:          524288
> > > >  memory used by lock dependency info: 106625 kB
> > > >  memory used for stack traces: 8320 kB
> > > >  per task-struct memory footprint: 1920 bytes
> > > > mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
> > > > ACPI: Core revision 20260408
> > > > APIC: Switch to symmetric I/O mode setup
> > > > x2apic enabled
> > > > APIC: Switched APIC routing to: physical x2apic
> > > > ..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
> > > > clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fb63109b96, max_idle_ns: 440795265316 ns
> > > > Calibrating delay loop (skipped) preset value.. 4399.99 BogoMIPS (lpj=21999980)
> > > > Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
> > > > Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
> > > > mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
> > > > Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> > > > Spectre V2 : Mitigation: IBRS
> > > > RETBleed: Mitigation: IBRS
> > > > ITS: Mitigation: Aligned branch/return thunks
> > > > Spectre V2 : User space: Mitigation: STIBP via prctl
> > > > MDS: Mitigation: Clear CPU buffers
> > > > TAA: Mitigation: Clear CPU buffers
> > > > MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
> > > > Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> > > > Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on context switch and VMEXIT
> > > > Spectre V2 : Enabling IBPB for BPF
> > > > Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> > > > active return thunk: its_return_thunk
> > > > Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
> > > > x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> > > > x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> > > > x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> > > > x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> > > > x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
> > > >
> > > > =============================
> > > > [ BUG: Invalid wait context ]
> > > > syzkaller #0 Not tainted
> > > > -----------------------------
> > > > swapper/0/0 is trying to lock:
> > > > ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: mmap_read_lock include/linux/mmap_lock.h:600 [inline]
> > > > ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: class_mmap_read_lock_constructor include/linux/mmap_lock.h:631 [inline]
> > > > ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: cpa_collapse_large_pages arch/x86/mm/pat/set_memory.c:448 [inline]
> > > > ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: cpa_flush arch/x86/mm/pat/set_memory.c:494 [inline]
> > > > ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: change_page_attr_set_clr+0xc2c/0x1010 arch/x86/mm/pat/set_memory.c:2142
> > > > other info that might help us debug this:
> > > > context-{5:5}
> > > > locks held by swapper/0/0: 1, last CPU#0:
> > > >  #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:342 [inline]
> > > >  #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: cpa_collapse_large_pages arch/x86/mm/pat/set_memory.c:421 [inline]
> > > >  #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: cpa_flush arch/x86/mm/pat/set_memory.c:494 [inline]
> > > >  #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: change_page_attr_set_clr+0x967/0x1010 arch/x86/mm/pat/set_memory.c:2142
> > > > stack backtrace:
> > > > CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full)
> > > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/25/2026
> > > > Call Trace:
> > > >  <TASK>
> > > >  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
> > > >  print_lock_invalid_wait_context kernel/locking/lockdep.c:4846 [inline]
> > > >  check_wait_context kernel/locking/lockdep.c:4918 [inline]
> > > >  __lock_acquire+0xef0/0x2e50 kernel/locking/lockdep.c:5204
> > > >  lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5906
> > > >  down_read+0x4a/0x330 kernel/locking/rwsem.c:1574
> > > >  mmap_read_lock include/linux/mmap_lock.h:600 [inline]
> > > >  class_mmap_read_lock_constructor include/linux/mmap_lock.h:631 [inline]
> > > >  cpa_collapse_large_pages arch/x86/mm/pat/set_memory.c:448 [inline]
> > > >  cpa_flush arch/x86/mm/pat/set_memory.c:494 [inline]
> > > >  change_page_attr_set_clr+0xc2c/0x1010 arch/x86/mm/pat/set_memory.c:2142
> > > >  set_memory_rox+0xbe/0x100 arch/x86/mm/pat/set_memory.c:2341
> > > >  its_pages_protect arch/x86/kernel/alternative.c:168 [inline]
> > > >  its_fini_core arch/x86/kernel/alternative.c:175 [inline]
> > > >  alternative_instructions+0x95/0x100 arch/x86/kernel/alternative.c:2264
> > > >  arch_cpu_finalize_init+0xb2/0x1f0 arch/x86/kernel/cpu/common.c:2633
> > > >  start_kernel+0x310/0x3e0 init/main.c:1153
> > > >  x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
> > > >  x86_64_start_kernel+0x137/0x1b0 arch/x86/kernel/head64.c:291
> > > >  common_startup_64+0x13e/0x157
> > > >  </TASK>
> > > > pid_max: default: 32768 minimum: 301
> > > > landlock: Up and running.
> > > > Yama: becoming mindful.
> > > > TOMOYO Linux initialized
> > > > AppArmor: AppArmor initialized
> > > > LSM support for eBPF active
> > > > Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
> > > > Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc hugepage)
> > > > Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
> > > > Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
> > > > VFS: Finished mounting rootfs on nullfs
> > > > Running RCU synchronous self tests
> > > > Running RCU synchronous self tests
> > > > numa_add_cpu cpu 1 node 0: mask now 0-1
> > > > numa_add_cpu cpu 1 node 1: mask now 0-1
> > > >
> > > >
> > > > ---
> > > > This report is generated by a bot. It may contain errors.
> > > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > >
> > > > syzbot will keep track of this issue. See:
> > > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > >
> > > > If the report is already addressed, let syzbot know by replying with:
> > > > #syz fix: exact-commit-title
> > > >
> > > > If you want to overwrite report's subsystems, reply with:
> > > > #syz set subsystems: new-subsystem
> > > > (See the list of subsystem names on the web dashboard)
> > > >
> > > > If the report is a duplicate of another one, reply with:
> > > > #syz dup: exact-subject-of-another-report
> > > >
> > > > If you want to undo deduplication, reply with:
> > > > #syz undup
> > >
> > > --
> > > Regards/Gruss,
> > >     Boris.
> > >
> > > https://people.kernel.org/tglx/notes-about-netiquette
> >
> > --
> > Sincerely yours,
> > Mike.
