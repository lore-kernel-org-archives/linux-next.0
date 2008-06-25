From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Wed, 25 Jun 2008 11:36:26 +0200
Message-ID: <20080625093626.GD11524@elte.hu>
References: <20080625115553.adf91947.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49199 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753904AbYFYJgo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 05:36:44 -0400
Content-Disposition: inline
In-Reply-To: <20080625115553.adf91947.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the sched tree got a trivial conflict in 
> kernel/sched_rt.c between commit 
> 363ab6f1424cdea63e5d182312d60e19077b892a ("core: use performance 
> variant for_each_cpu_mask_nr") from the cpus4096 tree and commit 
> eff6549b957d15d1ad168d90b8c1eb643b9c163f ("sched: rt: move some code 
> around") from the sched tree.
> 
> The latter just moved some code that the former modified.  I took the 
> latter but added the former's modification (for_each_cpu_mask -> 
> for_each_cpu_mask_nr).

thanks.

You might want to double-check such resolutions by checking that the end 
result of this file is the same as tip/auto-latest [or tip/master].

Or if it's easier for you we could offer an integration branch of all 
auto-branches in -tip that go towards linux-next. (as we do these same 
tip-internal resolutions ourselves already prior pushing out any of the 
updated -next branches)

	Ingo
