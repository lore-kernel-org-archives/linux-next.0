Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE13876C1
	for <linux-next@vger.kernel.org>; Wed,  3 Jun 2026 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523788; cv=none; b=Y1UAJ2Cnm7jKXkSEcmwEKMoCUZYPJ4voxsZd186ZvFjs5GGfu7iqaFatwTRRoqmHxz0eqTYqFvbSkaENMPlvpoI0HxnkzoLdx+rBaNY9r8CyyZFgYCYSHUD7kN4mKJH3VjH0m7jLss0J+34fr2n+9qeC33gnLCsgTXpSk6OCKBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523788; c=relaxed/simple;
	bh=Ek3CTL+3JQcQOrq3gJowfdptPIb7sdYu5T9Wegq3fV8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=p7q6xeUsOtaUgg9xezExdflGuLg1iBKrV5KHzftSWr9fkQVX0EKWsy/FojvyFaPx3DsB1OyNLalehAifvpESLL9DqBepzMs+K2LzxM0cHn1zIBeKf3YloU1H7E7zxo5nke8yRHpgUv5kc/lfJ+3PCOFKIuFRehvddrq2FcM7QQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-69de23f28d5so50247eaf.2
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 14:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523786; x=1781128586;
        h=content-transfer-encoding:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1YKQ72F+SqhcZBrev9pMOW1rdhh9BcLNctDSJfFhRw=;
        b=ctezrLlBpl2NERheDEKmQ2+G2Z8BaUUv+Nybws2odTba7m/eiyn0uQKsSzQ+qz2oeV
         cIic4bbllVrSr1ca+hiQ5oVWAvSf45+JmzX2oAvb6N65shlBuVd/s8qGg+G5yPJ+jLFe
         mGuVEBa16KTPd4eIPOnHMU6SoPv8lO+BaLwdb7h41ha/zcwzUn8dcxknSVUGuQrMpo1T
         IOBaMpsBkwQNiWfqxBwM33UN7w84MJc2Sg7RnbR7OHFV5Zw2nPSnNc3OEqGp8P9cugMB
         zh7+8s9tnwDisNp6awQ8Yv745rMLnd8b03AG25QR2JmuNRDKarUCyIMWekDRYsBzX4oo
         liGg==
X-Forwarded-Encrypted: i=1; AFNElJ/QSznsRy1eqVUKgjm1EbIy/ZKiY6SrIOVkpFjywvYaZNRv6imt4Tw8CsIB/vCpe754JVOdgD/NyjY8@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBTWZ8pTN0SNkw1HX37g6pofrcCsuJ/PO+/xof+OQpHFlmLKH
	CQsyNaLMp9RHQHE7L6MiAZR1EGwWUxYmCYZ3TbzgTjg9NMwi9EGgUWlktQO6xxqNZpheawGqxMj
	417kbYrVaFOh6bbiipnuVzkxv3ypk3sYDOGlp0buXtZ4PR6J2uu6zukKO9DQ=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:569a:b0:699:b198:c278 with SMTP id
 006d021491bc7-69e47ea0885mr2419090eaf.13.1780523785708; Wed, 03 Jun 2026
 14:56:25 -0700 (PDT)
Date: Wed, 03 Jun 2026 14:56:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a20a309.85ccb786.283107.0005.GAE@google.com>
Subject: [syzbot] [mm?] linux-next test error: kernel BUG in post_alloc_hook
From: syzbot <syzbot+8ffca916f3fa5455f9b4@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com, 
	david@kernel.org, gourry@gourry.net, joshua.hahnjy@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, 
	matthew.brost@intel.com, rakie.kim@sk.com, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    a225caacc365 Add linux-next specific files for 20260603
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13b0de66580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D717edf2a5f9fc39=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D8ffca916f3fa5455f=
9b4
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-=
1~exp1~20251221153213.50), Debian LLD 21.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f799d07ea17d/disk-=
a225caac.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/72d0f0ff94e6/vmlinux-=
a225caac.xz
kernel image: https://storage.googleapis.com/syzbot-assets/99d4279e6fec/bzI=
mage-a225caac.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+8ffca916f3fa5455f9b4@syzkaller.appspotmail.com

Initmem setup node 1 [mem 0x0000000140001000-0x000000023fffffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 97 pages in unavailable ranges
On node 0, zone Normal: 3 pages in unavailable ranges
setup_percpu: NR_CPUS:8 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:2
percpu: Embedded 71 pages/cpu s253896 r8192 d28728 u1048576
pcpu-alloc: s253896 r8192 d28728 u1048576 alloc=3D1*2097152
pcpu-alloc: [0] 0 1=20
kvm-guest: PV spinlocks enabled
PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
Kernel command line: earlyprintk=3Dserial net.ifnames=3D0 sysctl.kernel.hun=
g_task_all_cpu_backtrace=3D1 ima_policy=3Dtcb nf-conntrack-ftp.ports=3D2000=
0 nf-conntrack-tftp.ports=3D20000 nf-conntrack-sip.ports=3D20000 nf-conntra=
ck-irc.ports=3D20000 nf-conntrack-sane.ports=3D20000 binder.debug_mask=3D0 =
rcupdate.rcu_expedited=3D1 rcupdate.rcu_cpu_stall_cputime=3D1 no_hash_point=
ers page_owner=3Don sysctl.vm.nr_hugepages=3D4 sysctl.vm.nr_overcommit_huge=
pages=3D4 secretmem.enable=3D1 sysctl.max_rcu_stall_to_panic=3D1 msr.allow_=
writes=3Doff coredump_filter=3D0xffff root=3D/dev/sda console=3DttyS0 vsysc=
all=3Dnative numa=3Dfake=3D2 kvm-intel.nested=3D1 spec_store_bypass_disable=
=3Dprctl nopcid vivid.n_devs=3D64 vivid.multiplanar=3D1,2,1,2,1,2,1,2,1,2,1=
,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,=
1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2 netrom.nr_ndevs=3D32 rose.rose_ndevs=3D32 s=
mp.csd_lock_timeout=3D100000 watchdog_thresh=3D55 workqueue.watchdog_thresh=
=3D140 sysctl.net.core.netdev_unregister_timeout_secs=3D140 dummy_hcd.num=
=3D32 max_loop=3D32 nbds_max=3D32 \
Kernel command line: comedi.comedi_num_legacy_minors=3D4 panic_on_warn=3D1 =
BOOT_IMAGE=3D/boot/bzImage root=3D/dev/sda1 console=3DttyS0
Unknown kernel command line parameters "nbds_max=3D32", will be passed to u=
ser space.
random: crng init done
printk: log buffer data + meta data: 262144 + 917504 =3D 1179648 bytes
software IO TLB: area num 2.
Fallback order for Node 0: 0 1=20
Fallback order for Node 1: 1 0=20
Built 2 zonelists, mobility grouping on.  Total pages: 2097051
Policy zone: Normal
mem auto-init: stack:all(zero), heap alloc:on, heap free:off
stackdepot: allocating hash table via alloc_large_system_hash
stackdepot hash table entries: 1048576 (order: 12, 16777216 bytes, linear)
stackdepot: allocating space for 8192 stack pools via memblock
**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** This system shows unhashed kernel memory addresses   **
** via the console, logs, and other interfaces. This    **
** might reduce the security of your system.            **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your system   **
** administrator!                                       **
**                                                      **
** Use hash_pointers=3Dalways to force this mode off      **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x13fe38
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x100000000000040(head|node=3D0|zone=3D2)
raw: 0100000000000040 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
head: 0100000000000040 dead000000000100 dead000000000122 0000000000000000
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
head: 0100000000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
------------[ cut here ]------------
kernel BUG at ./include/linux/page-flags.h:682!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted syzkaller #0 PREEMPT_{RT,(un=
def)}=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 05/09/2026
RIP: 0010:__ClearPagePrezeroed include/linux/page-flags.h:682 [inline]
RIP: 0010:post_alloc_hook+0x287/0x310 mm/page_alloc.c:1863
Code: ff ff 89 da be 01 00 00 00 48 c7 c7 40 50 4f 8e e8 ce 4b d4 02 e9 c5 =
fe ff ff 4c 89 ef 48 c7 c6 40 ef 7a 8b e8 2a c6 05 ff 90 <0f> 0b 31 ed f7 4=
4 24 04 00 01 00 00 0f 84 8e fd ff ff e9 86 fd ff
RSP: 0000:ffffffff8e0078e0 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffffff8e0fef40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10170c4903 R12: dffffc0000000000
R13: ffffea0004ff8e00 R14: 1ffffd40009ff1c0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125a79000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000e1b8000 CR4: 00000000000100b0
Call Trace:
 <TASK>
 prep_new_page mm/page_alloc.c:1925 [inline]
 get_page_from_freelist+0x3081/0x3320 mm/page_alloc.c:4015
 __alloc_frozen_pages_noprof+0x194/0x380 mm/page_alloc.c:5376
 __alloc_pages_mpol+0xe0/0x390 mm/mempolicy.c:2495
 alloc_slab_page mm/slub.c:3287 [inline]
 allocate_slab+0x83/0x5e0 mm/slub.c:3404
 new_slab mm/slub.c:3447 [inline]
 ___slab_alloc+0x160/0x930 mm/slub.c:4485
 __slab_alloc_node mm/slub.c:4549 [inline]
 slab_alloc_node mm/slub.c:4925 [inline]
 __do_kmalloc_node mm/slub.c:5331 [inline]
 __kmalloc_noprof+0x140/0x7b0 mm/slub.c:5345
 _kmalloc_noprof include/linux/slab.h:973 [inline]
 _kzalloc_noprof include/linux/slab.h:1286 [inline]
 __alloc_empty_sheaf mm/slub.c:2774 [inline]
 alloc_empty_sheaf mm/slub.c:2794 [inline]
 init_percpu_sheaves mm/slub.c:7555 [inline]
 do_kmem_cache_create+0x8ae/0x9a0 mm/slub.c:8595
 create_boot_cache+0xbf/0x120 mm/slab_common.c:717
 create_kmalloc_cache+0x41/0xb0 mm/slab_common.c:735
 new_kmalloc_cache+0xd4/0x180 mm/slab_common.c:982
 create_kmalloc_caches+0x14/0x50 mm/slab_common.c:1005
 kmem_cache_init+0x14a/0x1e0 mm/slub.c:8496
 mm_core_init+0x7e/0xb0 mm/mm_init.c:2728
 start_kernel+0x162/0x3e0 init/main.c:1034
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x157
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__ClearPagePrezeroed include/linux/page-flags.h:682 [inline]
RIP: 0010:post_alloc_hook+0x287/0x310 mm/page_alloc.c:1863
Code: ff ff 89 da be 01 00 00 00 48 c7 c7 40 50 4f 8e e8 ce 4b d4 02 e9 c5 =
fe ff ff 4c 89 ef 48 c7 c6 40 ef 7a 8b e8 2a c6 05 ff 90 <0f> 0b 31 ed f7 4=
4 24 04 00 01 00 00 0f 84 8e fd ff ff e9 86 fd ff
RSP: 0000:ffffffff8e0078e0 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffffff8e0fef40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10170c4903 R12: dffffc0000000000
R13: ffffea0004ff8e00 R14: 1ffffd40009ff1c0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125a79000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000e1b8000 CR4: 00000000000100b0


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
