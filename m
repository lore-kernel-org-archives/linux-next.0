From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Tue, 16 Dec 2008 21:55:59 +0100
Message-ID: <20081216205559.GH14787@elte.hu>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au> <200812151711.36134.rusty@rustcorp.com.au> <4946855D.7070403@sgi.com> <200812161610.58496.rusty@rustcorp.com.au> <49474471.2090409@sgi.com> <20081216170940.3c74d4d0.sfr@canb.auug.org.au> <4947D13F.6020105@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:60305 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752087AbYLPU4S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 15:56:18 -0500
Content-Disposition: inline
In-Reply-To: <4947D13F.6020105@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>


* Mike Travis <travis@sgi.com> wrote:

> Stephen Rothwell wrote:
> > Hi Mike,
> > 
> > On Mon, 15 Dec 2008 22:02:25 -0800 Mike Travis <travis@sgi.com> wrote:
> >> Yes, I did finally figure that out.  Thanks for rebasing the part that Ingo needed
> >> so maybe the rest can be pushed.  There was a problem when the 'for-ingo' tree was
> >> merged as there were mixed up API calls in io_apic.c, but I fixed them in the first
> >> x86 only patch.  I wasn't sure of what else to do.
> > 
> > You could have fixed them up as part of the actual merge commit.  If each
> > tree was correct on it own, then the merge is the place for such
> > resolutions.
> > 
> 
> Thanks, I will try that next time.

actually, it's a quite obscure place for it and easy to miss (git log -p 
does not display them by default, etc.) - it's better to have an explicit 
commit after the merge. 'git bisect next' works if someone happens to hit 
this bisection breakage.

> Ingo - if you need a small patch to make the post-merge tree buildable, 
> let me know. I can extract that from the 1st patch (that modifies the 
> smp api).

yes, please put that fix as the first patch in your tree that i'll 
hopefully be able to pull :)

	Ingo
