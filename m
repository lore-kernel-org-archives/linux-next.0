From: Matthias Kaehlcke <matthias@kaehlcke.net>
Subject: Re: linux-next: Tree for March 30: [BUG] kmemleak page fault
Date: Mon, 30 Mar 2009 14:24:37 +0200
Message-ID: <20090330122437.GA4784@traven>
References: <20090330200145.8d0da09b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758628AbZC3MY7@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090330200145.8d0da09b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com
List-Id: linux-next.vger.kernel.org

linux-next 20090330 causes the following page fault on an edb9302
(ARM) like board:

# Unable to handle kernel paging request at virtual address 00535447
pgd = c56b0000
[00535447] *pgd=00000000
Internal error: Oops: 3 [#1] PREEMPT
Modules linked in:
CPU: 0    Not tainted  (2.6.29-next-20090330 #6)
PC is at kmemleak_scan+0x158/0x3ac
LR is at find_and_get_object+0xe0/0x104
pc : [<c00aa5cc>]    lr : [<c00a99d8>]    psr: 00000013
sp : c55bff78  ip : c55bff28  fp : c55bffa4
r10: c0322718  r9 : c035fa6c  r8 : c035f048
r7 : c035f044  r6 : 00005800  r5 : 00004981  r4 : 00093020
r3 : 00535443  r2 : 414f4c5f  r1 : 00000001  r0 : c0400020
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0000717f  Table: 0567c000  DAC: 00000017
Process kmemleak (pid: 343, stack limit = 0xc55be268)
Stack: (0xc55bff78 to 0xc55c0000)
ff60:                                                       c55bff94
00000000
ff80: 00000000 c55be000 0000ea60 c035fa78 c035fa6c c0322718 c55bffd4
c55bffa8
ffa0: c00aac10 c00aa484 c55bffd4 c55be000 00000000 c00aabbc 00000000
00000000
ffc0: 00000000 00000000 c55bfff4 c55bffd8 c005b80c c00aabcc 00000000
00000000
ffe0: 00000000 00000000 00000000 c55bfff8 c0048240 c005b7b0 ffffffff
ffffffff
[<c00aa5cc>] (kmemleak_scan+0x158/0x3ac) from [<c00aac10>]
(kmemleak_scan_thread+0x54/0x1bc)
[<c00aac10>] (kmemleak_scan_thread+0x54/0x1bc) from [<c005b80c>]
(kthread+0x6c/0xa0)
[<c005b80c>] (kthread+0x6c/0xa0) from [<c0048240>] (do_exit+0x0/0x764)
Code: e0830004 e3120801 1590300c 01a03000 (e5933004)
---[ end trace 356a238970dcd5a8 ]---

the fault is reproducible and happens some seconds after having
finished the boot process. please tell me if you need more information
(like the .config, ...) in order to track this down

best regards

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

       The yellow ships hung in the air just like bricks dont do
                 (The Hitch-Hiker's Guide to the Galaxy)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
