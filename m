Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF94432F7
	for <linux-next@vger.kernel.org>; Mon, 20 Jul 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566768; cv=none; b=b3+1+L5DUoYFK7j72htU1DvugSAx4A9J7HKtAwB0N966V0UQSHRAXBqiS0fmm8E6qBDjjFMfdmlaIo17F3A+PKf46lR6huwHuojgFJDlgomOQNmUo6btGYXruK6ssChG7IDxa7gbBoUhVaLQGOsS4POb+arSCWC7u6Pd0MJiLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566768; c=relaxed/simple;
	bh=My9RvsNpv4h4XR8aoLDxAIW1w2E+F9d1EMhHQQK+DfQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uO5EBU+YsccqnNBqa4anr3Q/NOR1PrAi0yqVaO0pGPu9+oEepYJ+H9c0SP4mJuie8EFVtUCjzoEV56/QK5BWvATxz/hFA6mkKjsWxv8tgtFTm7SxNUn/ytvwyhM4MLq1B6wEX431UFvW9XQAVyTmTCRJCKyKtKeBtJFNFABKDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-49ab6a82cd5so15575017b6e.2
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2026 09:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566765; x=1785171565;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMk3YzUa0x6oYkBsXc0ufM/BJdW+21s/x8hKtrQWViQ=;
        b=WR4cKdmLo9CuJHXJ9pRVjoO6fgl0t1czcneiBsxpz5BrbJ/Xot9AW1OaxnjkFrMa4w
         kCGnUYMKvy/Ad4CA2qQvemYm5YEbEnlNbAmfx74xFLpggMQHowE3MqHRSJUh3eyaGDr/
         LcfBibvFXaI9+Wrmj2FIaFWsRNfgQpG8NvpkvmEf2exBtuJG04y/plXJieNqxqnOxrTN
         Vq3grR9QNBvfIEuicfJ3Y674/R1utLTxt5/bYShwQRTz/sYjpFH7LB9eZY2rlhnI6hwb
         W5fajHvkRoUJnbThQcbFosBKR7nnIMVv7szugogf5pQJrGGNP8sJL6FnN31lFGYVqqUo
         rjkw==
X-Forwarded-Encrypted: i=1; AHgh+RrP4pjhmMF4ig/2qO5rSe1GEapMAr+2OZOjAnpsoA8kShIQkT0c3NQ0dw5WYtz+jKY3TQWUdaDAcn1l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1SoBlVoKm+6qvBb4wrd0X9D2KJsGt2Dlhma5bYWduUOLItgjb
	QxXJYceaUSci+s0MfSGleErZsamil8l4XkJtdrpMFTitsVnyIaIwzej9tJwYoGg2TEU1AFBB/V9
	m6zJxm/HdfCmpZiFqsZ/2B0Ne6CAV6bEWY4EF9jbrHPeT+HscI1K/G3vEv/c=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:302b:b0:49a:72a:4e45 with SMTP id
 5614622812f47-4a4d0555700mr7938436b6e.39.1784566765090; Mon, 20 Jul 2026
 09:59:25 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:59:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a5e53ed.f1649fcc.2a4208.0574.GAE@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING: locking bug in change_page_attr_set_clr
From: syzbot <syzbot+ee7ecfcd0e3f185e835a@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, luto@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1a1757b76427 Add linux-next specific files for 20260716
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16c734b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d1a274c57796a86
dashboard link: https://syzkaller.appspot.com/bug?extid=ee7ecfcd0e3f185e835a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/923ee89ba238/disk-1a1757b7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cb34d1bf205c/vmlinux-1a1757b7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bf183d434c82/bzImage-1a1757b7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ee7ecfcd0e3f185e835a@syzkaller.appspotmail.com

clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
kfence: initialized - using 2097152 bytes for 255 objects at 0xffff88823be00000-0xffff88823c000000
Console: colour VGA+ 80x25
printk: legacy console [ttyS0] enabled
printk: legacy console [ttyS0] enabled
printk: legacy bootconsole [earlyser0] disabled
printk: legacy bootconsole [earlyser0] disabled
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8192
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     1048576
... MAX_LOCKDEP_CHAINS:      1048576
... CHAINHASH_SIZE:          524288
 memory used by lock dependency info: 106625 kB
 memory used for stack traces: 8320 kB
 per task-struct memory footprint: 1920 bytes
mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
ACPI: Core revision 20260408
APIC: Switch to symmetric I/O mode setup
x2apic enabled
APIC: Switched APIC routing to: physical x2apic
..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fb63109b96, max_idle_ns: 440795265316 ns
Calibrating delay loop (skipped) preset value.. 4399.99 BogoMIPS (lpj=21999980)
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
Spectre V2 : Mitigation: IBRS
RETBleed: Mitigation: IBRS
ITS: Mitigation: Aligned branch/return thunks
Spectre V2 : User space: Mitigation: STIBP via prctl
MDS: Mitigation: Clear CPU buffers
TAA: Mitigation: Clear CPU buffers
MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on context switch and VMEXIT
Spectre V2 : Enabling IBPB for BPF
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
active return thunk: its_return_thunk
Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.

=============================
[ BUG: Invalid wait context ]
syzkaller #0 Not tainted
-----------------------------
swapper/0/0 is trying to lock:
ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: mmap_read_lock include/linux/mmap_lock.h:600 [inline]
ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: class_mmap_read_lock_constructor include/linux/mmap_lock.h:631 [inline]
ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: cpa_collapse_large_pages arch/x86/mm/pat/set_memory.c:448 [inline]
ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: cpa_flush arch/x86/mm/pat/set_memory.c:494 [inline]
ffffffff8f088c78 ((init_mm).mmap_lock){....}-{4:4}, at: change_page_attr_set_clr+0xc2c/0x1010 arch/x86/mm/pat/set_memory.c:2142
other info that might help us debug this:
context-{5:5}
locks held by swapper/0/0: 1, last CPU#0:
 #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:342 [inline]
 #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: cpa_collapse_large_pages arch/x86/mm/pat/set_memory.c:421 [inline]
 #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: cpa_flush arch/x86/mm/pat/set_memory.c:494 [inline]
 #0: ffffffff8edc2078 (cpa_lock){+.+.}-{3:3}, at: change_page_attr_set_clr+0x967/0x1010 arch/x86/mm/pat/set_memory.c:2142
stack backtrace:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/25/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4846 [inline]
 check_wait_context kernel/locking/lockdep.c:4918 [inline]
 __lock_acquire+0xef0/0x2e50 kernel/locking/lockdep.c:5204
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5906
 down_read+0x4a/0x330 kernel/locking/rwsem.c:1574
 mmap_read_lock include/linux/mmap_lock.h:600 [inline]
 class_mmap_read_lock_constructor include/linux/mmap_lock.h:631 [inline]
 cpa_collapse_large_pages arch/x86/mm/pat/set_memory.c:448 [inline]
 cpa_flush arch/x86/mm/pat/set_memory.c:494 [inline]
 change_page_attr_set_clr+0xc2c/0x1010 arch/x86/mm/pat/set_memory.c:2142
 set_memory_rox+0xbe/0x100 arch/x86/mm/pat/set_memory.c:2341
 its_pages_protect arch/x86/kernel/alternative.c:168 [inline]
 its_fini_core arch/x86/kernel/alternative.c:175 [inline]
 alternative_instructions+0x95/0x100 arch/x86/kernel/alternative.c:2264
 arch_cpu_finalize_init+0xb2/0x1f0 arch/x86/kernel/cpu/common.c:2633
 start_kernel+0x310/0x3e0 init/main.c:1153
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x137/0x1b0 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x157
 </TASK>
pid_max: default: 32768 minimum: 301
landlock: Up and running.
Yama: becoming mindful.
TOMOYO Linux initialized
AppArmor: AppArmor initialized
LSM support for eBPF active
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc hugepage)
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
VFS: Finished mounting rootfs on nullfs
Running RCU synchronous self tests
Running RCU synchronous self tests
numa_add_cpu cpu 1 node 0: mask now 0-1
numa_add_cpu cpu 1 node 1: mask now 0-1


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
