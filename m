From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 12:25:47 +0100
Message-ID: <20111219112547.GA32375@elte.hu>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
 <20111219080813.GB30432@elte.hu>
 <20111219101134.3c2c0db5@de.ibm.com>
 <20111219103513.GA17928@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49435 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752364Ab1LSL1s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Dec 2011 06:27:48 -0500
Content-Disposition: inline
In-Reply-To: <20111219103513.GA17928@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>


* Ingo Molnar <mingo@elte.hu> wrote:

> > All of it including "[S390] cputime: add sparse checking and 
> > cleanup" or just the fix for uptime ?
> 
> I suspect we can take it all if it's all scheduling/time 
> related, and add new patches to sched/core to keep it all 
> concentrated in a single tree?

Btw., i'd suggest to keep your commits as-is and merge 
tip:sched/core into your tree - and send the result to me so 
that we can make that the new sched/core.

That way your commits are preserved and the conflicts are 
resolved.

Thanks,

	Ingo
