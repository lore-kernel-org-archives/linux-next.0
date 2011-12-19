From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 09:08:13 +0100
Message-ID: <20111219080813.GB30432@elte.hu>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34442 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751501Ab1LSIKM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Dec 2011 03:10:12 -0500
Content-Disposition: inline
In-Reply-To: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> fs/proc/uptime.c between commit c3e0ef9a298e ("[S390] fix cputime
> overflow in uptime_proc_show") from the cputime tree and commit
> 3292beb340c7 ("sched/accounting: Change cpustat fields to an array") from
> the tip tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> 
> Generally, you guys seem to be working a little at cross purposes ...

Agreed.

Martin, could you please send Peter and me a pull request of the 
current cputime bits merged on top of tip:sched/core? Those bits 
should go upstream via the scheduler tree.

Thanks,

	Ingo
