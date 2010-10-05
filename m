From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the lost-spurious-irq tree with the
 tip tree
Date: Tue, 5 Oct 2010 08:32:27 +0200
Message-ID: <20101005063227.GB12267@elte.hu>
References: <20101005141334.6a0f15fd.sfr@canb.auug.org.au>
 <4CAABC0E.3030700@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34676 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754647Ab0JEGcn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Oct 2010 02:32:43 -0400
Content-Disposition: inline
In-Reply-To: <4CAABC0E.3030700@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Tejun Heo <tj@kernel.org> wrote:

> > I think I fixed it all up (see below).  I can carry this fix (or a 
> > better one) as necessary.
> 
> Can you please drop lost-spurious-irq for now?  It needs to be 
> reimplemented.  I'll send a merge request again when it's ready.

Please send irq merge requests to Thomas instead and wait for those 
genirq bits to show up upstream. (You did so in the past and the review 
process was ongoing AFAICS)

Otherwise we would be dilluting linux-next testing with random side 
effects from a tree that wasnt yet (in that form) scheduled to go 
upstream by its respective maintainer at that time.

We were lucky that this showed up as merge complications - what if 
instead it merged 'fine' on the textual and build/boot level but 
mis-merged on the functional level in subtle ways? Thomas would be 
sending something to Linus that was never really tested in linux-next in 
that form, caused problems upstream, and Linus would be rightfully upset 
about the situation.

Stephen, you need to enforce such things ...

Thanks,

	Ingo
