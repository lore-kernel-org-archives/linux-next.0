From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Thu, 2 Jun 2016 14:21:10 +0200
Message-ID: <20160602122109.GM1995@dhcp22.suse.cz>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160602120857.GA704@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36823 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753119AbcFBMVM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jun 2016 08:21:12 -0400
Content-Disposition: inline
In-Reply-To: <20160602120857.GA704@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>

On Thu 02-06-16 21:08:57, Sergey Senozhatsky wrote:
> Hello Michal,
> 
> On (06/02/16 11:21), Michal Hocko wrote:
> [..]
> > > [ 2856.323052] INFO: task cc1:4582 blocked for more than 21 seconds.
> > > [ 2856.323055]       Not tainted 4.7.0-rc1-next-20160601-dbg-00012-g52c180e-dirty #453
> > > [ 2856.323056] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > [ 2856.323059] cc1             D ffff880057e9fd78     0  4582   4575 0x00000000
> > > [ 2856.323062]  ffff880057e9fd78 ffff880057e08000 ffff880057e9fd90 ffff880057ea0000
> > > [ 2856.323065]  ffff88005dc3dc68 ffffffff00000001 ffff880057e09500 ffff88005dc3dc80
> > > [ 2856.323067]  ffff880057e9fd90 ffffffff81441e33 ffff88005dc3dc68 ffff880057e9fe00
> > > [ 2856.323068] Call Trace:
> > > [ 2856.323074]  [<ffffffff81441e33>] schedule+0x83/0x98
> > > [ 2856.323077]  [<ffffffff81443d9b>] rwsem_down_write_failed+0x18e/0x1d3
> > > [ 2856.323080]  [<ffffffff810a87cf>] ? unlock_page+0x2b/0x2d
> > > [ 2856.323083]  [<ffffffff811bdb77>] call_rwsem_down_write_failed+0x17/0x30
> > > [ 2856.323084]  [<ffffffff811bdb77>] ? call_rwsem_down_write_failed+0x17/0x30
> > > [ 2856.323086]  [<ffffffff81443630>] down_write+0x1f/0x2e
> > > [ 2856.323089]  [<ffffffff810ea4f3>] __khugepaged_exit+0x104/0x11a
> > > [ 2856.323091]  [<ffffffff8103702a>] mmput+0x29/0xc5
> > > [ 2856.323093]  [<ffffffff8103bbd8>] do_exit+0x34c/0x894
> > > [ 2856.323095]  [<ffffffff8102f9e0>] ? __do_page_fault+0x2f7/0x399
> > > [ 2856.323097]  [<ffffffff8103c188>] do_group_exit+0x3c/0x98
> > > [ 2856.323099]  [<ffffffff8103c1f3>] SyS_exit_group+0xf/0xf
> > > [ 2856.323101]  [<ffffffff81444cdb>] entry_SYSCALL_64_fastpath+0x13/0x8f
> > 
> > down_write in the exit path is certainly not nice. It is hard to tell
> > who is blocking the mmap_sem but it is clear that __khugepaged_exit
> > waits for the khugepaged to release its mmap_sem. Do you hapen to have a
> > trace of khugepaged? Note that the lock holder might be another writer
> > which just hasn't pinned mm_users so khugepaged might be blocked on read
> > lock as well. Or khugepaged might be just stuck somewhere...
> 
> sorry, no. this is all I have. the kernel was compiled with almost no
> debugging functionality enabled (no lockdep, no lock debug, nothing)
> for zram performance testing purposes.
> 
> I'll try to reproduce the problem; and give your patch some testing.
> thanks.

The patch will drop the down_write from the exit path which is, I
believe the right thing to do, so it would paper over an existing
problem when khugepaged could get stuck with mmap_sem held for read (if
that is really a problem). So reproducing without the patch still makes
some sense.

Testing with the patch makes some sense as well, but I would like to
hear from Andrea whether the approach is good because I am wondering why
he hasn't done that before - it feels so much simpler than the current
code.

Anyway, thanks a lot for testing!

-- 
Michal Hocko
SUSE Labs
