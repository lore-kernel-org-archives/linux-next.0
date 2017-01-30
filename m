From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Mon, 30 Jan 2017 21:34:35 +0000
Message-ID: <20170130213435.GM31613@codeblueprint.co.uk>
References: <20160921133813.31976-8-matt@codeblueprint.co.uk>
 <tip-cb42c9a3ebbbb23448c3f9a25417fae6309b1a92@git.kernel.org>
 <87tw8gutp6.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38424 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754544AbdA3Vei (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2017 16:34:38 -0500
Received: by mail-wm0-f53.google.com with SMTP id r141so52286800wmg.1
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2017 13:34:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <87tw8gutp6.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: fweisbec@gmail.com, tglx@linutronix.de, pmladek@suse.com, hpa@zytor.com, efault@gmx.de, sergey.senozhatsky.work@gmail.com, peterz@infradead.org, mgorman@techsingularity.net, wanpeng.li@hotmail.com, umgwanakikbuti@gmail.com, byungchul.park@lge.com, jack@suse.cz, mingo@kernel.org, riel@redhat.com, luca.abeni@unitn.it, yuyang.du@intel.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Tue, 31 Jan, at 08:24:53AM, Michael Ellerman wrote:
> 
> I'm hitting this on multiple powerpc systems:
> 
> [   38.339126] rq->clock_update_flags < RQCF_ACT_SKIP
> [   38.339134] ------------[ cut here ]------------
> [   38.339142] WARNING: CPU: 2 PID: 1 at kernel/sched/sched.h:804 detach_task_cfs_rq+0xa0c/0xd10

[...]
 
> I assume I should be worried?

Thanks for the report. No need to worry, the bug has existed for a
while, this patch just turns on the warning ;-)

The following commit queued up in tip/sched/core should fix your
issues (assuming you see the same callstack on all your powerpc
machines):

  https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=sched/core&id=1b1d62254df0fe42a711eb71948f915918987790
