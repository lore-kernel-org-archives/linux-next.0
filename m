From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Fri, 18 Sep 2015 08:13:35 -0700
Message-ID: <55FC2A1F.8050207@roeck-us.net>
References: <55FAEA67.9000102@roeck-us.net>
 <20150918142507.GA30125@node.dhcp.inet.fi> <20150918145309.GG32685@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51054 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754684AbbIRPNj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2015 11:13:39 -0400
In-Reply-To: <20150918145309.GG32685@axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, Minchan Kim <minchan@kernel.org>, linux-cris-kernel@axis.com

On 09/18/2015 07:53 AM, Jesper Nilsson wrote:
> On Fri, Sep 18, 2015 at 05:25:07PM +0300, Kirill A. Shutemov wrote:
>> On Thu, Sep 17, 2015 at 09:29:27AM -0700, Guenter Roeck wrote:
>>> Hi,
>>>
>>> my crisv32 qemu test fails with next-20150917 as follows.
>>>
>>> NET: Registered protocol family 16
>>> kernel BUG at mm/slab.c:1648!
>>> Linux 4.3.0-rc1-next-20150917 #1 Wed Sep 16 23:56:59 PDT 2015
>>> Oops: 0000
>>>
>>> [ register dump follows ]
>>>
>>> See http://server.roeck-us.net:8010/builders/qemu-crisv32-next/builds/83/steps/qemubuildcommand/logs/stdio
>>> for a complete log.
>>
>> Is there a chance to get proper backtrace?
>
> Yes, it should be possible with CONFIG_KALLSYMS=y in the kconfig.
>

Good to know. I added it to my configuration.

Here it is:

kernel BUG at mm/slab.c:1648!
Linux 4.3.0-rc1-next-20150918 #1 Fri Sep 18 08:07:55 PDT 2015
Oops: 0000
CPU: 0
ERP: c0074c00 SRP: c0074c1e  CCS: 00009408 USP: 00000000 MOF: 00000000
  r0: 0000002a  r1: ffffe000   r2: c000f2ca  r3: c0074e40
  r4: c0033d00  r5: 0000000a   r6: 00000009  r7: 00000100
  r8: 0000000a  r9: c04a3254  r10: c1e97765 r11: c1fc1282
r12: c04a3240 r13: 00000000 oR10: c1e97765 acr: 00000001
  sp: c046458c
        Data MMU Cause: 00000000
Instruction MMU Cause: 00000000
Process ksoftirqd/0 (pid: 3, stackpage=c1feb3a0)

Stack from c1ff3e80:

c0004a0e c004ba7c
c04645e0 00000000
c04645d8 0000000a
c00059e8 00000001

        00000000
c046458c 00000000
c0341cfc c004ba7c
c0033d00 c0004b52
0000002a

ffffe000 c000f2ca
c0074e40 c0005898
c0074c1e c1e97765
c0074c1e c0033bd2

Call Trace: [<c0004a0e>] show_stack+0x0/0x9e
[<c004ba7c>] printk+0x0/0x2c
[<c00059e8>] show_registers+0x14a/0x1c2
[<c004ba7c>] printk+0x0/0x2c
[<c0033d00>] rcu_bh_qs+0x0/0x30
[<c0004b52>] die_if_kernel+0x7c/0x9e
[<c000f2ca>] __local_bh_enable_ip+0x0/0xb0
[<c0074e40>] kfree+0x0/0x82
[<c0005898>] do_BUG+0x2a/0x30
[<c0074c1e>] kmem_rcu_free+0x18/0x1e
[<c0074c1e>] kmem_rcu_free+0x18/0x1e
[<c0033bd2>] __rcu_process_callbacks+0x80/0xaa
[<c0033b52>] __rcu_process_callbacks+0x0/0xaa
[<c0033c14>] rcu_process_callbacks+0x18/0x2a
[<c000f15e>] __do_softirq+0xbc/0x1c2
[<c002008c>] kthread_should_stop+0x0/0x18
[<c00200a4>] kthread_should_park+0x0/0x18
[<c02d5f5e>] schedule+0x0/0x7c
[<c000f286>] run_ksoftirqd+0x22/0x32
[<c00228e8>] smpboot_thread_fn+0xe4/0x12c
[<c0022804>] smpboot_thread_fn+0x0/0x12c
[<c0028e88>] __init_waitqueue_head+0x0/0x8
[<c002048e>] kthread+0xb6/0xce
[<c00203d8>] kthread+0x0/0xce
[<c00055fa>] ret_from_kernel_thread+0xe/0x14

Code: 2a d6 6d da 87 d3 65 70 b0 05 3e e9 (7f) d2 65 e0 29 d6 84 e2 7e ba 6a c6
---[ end trace cc289b1d61e6a9a8 ]---

Kernel panic - not syncing: Aiee, killing interrupt handler!
CPU: 0 PID: 3 Comm: ksoftirqd/0 Not tainted 4.3.0-rc1-next-20150918 #1

Stack from c1ff3e28:

c1feb3a0 0000000b
c0341cfc c004ba7c
c0033d00 0000000a
c0177e2c c004b8fa

        c1feb3a0
0000000b c0341cfc
c004ba7c c0033d00
0000000a 00000009
c000dd54

c0342a14 00000000
00000061 00000000
c046458c 00000000
c0341cfc c004ba7c

Call Trace: [<c004ba7c>] printk+0x0/0x2c
[<c0033d00>] rcu_bh_qs+0x0/0x30
[<c0177e2c>] dump_stack+0x1c/0x22
[<c004b8fa>] panic+0x82/0x19c
[<c004ba7c>] printk+0x0/0x2c
[<c0033d00>] rcu_bh_qs+0x0/0x30
[<c000dd54>] do_exit+0x5e0/0x7da
[<c004ba7c>] printk+0x0/0x2c
[<c0033d00>] rcu_bh_qs+0x0/0x30
[<c004baa2>] printk+0x26/0x2c
[<c0004b6a>] die_if_kernel+0x94/0x9e
[<c0004b72>] die_if_kernel+0x9c/0x9e
[<c000f2ca>] __local_bh_enable_ip+0x0/0xb0
[<c0074e40>] kfree+0x0/0x82
[<c0005898>] do_BUG+0x2a/0x30
[<c0074c1e>] kmem_rcu_free+0x18/0x1e
[<c0074c1e>] kmem_rcu_free+0x18/0x1e
[<c0033bd2>] __rcu_process_callbacks+0x80/0xaa
[<c0033b52>] __rcu_process_callbacks+0x0/0xaa
[<c0033c14>] rcu_process_callbacks+0x18/0x2a
[<c000f15e>] __do_softirq+0xbc/0x1c2
[<c002008c>] kthread_should_stop+0x0/0x18
[<c00200a4>] kthread_should_park+0x0/0x18
[<c02d5f5e>] schedule+0x0/0x7c
[<c000f286>] run_ksoftirqd+0x22/0x32
[<c00228e8>] smpboot_thread_fn+0xe4/0x12c
[<c0022804>] smpboot_thread_fn+0x0/0x12c
[<c0028e88>] __init_waitqueue_head+0x0/0x8
[<c002048e>] kthread+0xb6/0xce
[<c00203d8>] kthread+0x0/0xce
[<c00055fa>] ret_from_kernel_thread+0xe/0x14
---[ end Kernel panic - not syncing: Aiee, killing interrupt handler!

Guenter
