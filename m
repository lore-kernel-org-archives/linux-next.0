From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Mon, 28 Jul 2008 11:29:18 +0200
Message-ID: <20080728092918.GA2299@elte.hu>
References: <20080728140111.832c3bc8.sfr@canb.auug.org.au> <20080728090530.GA5732@elte.hu> <19f34abd0807280217n2c059cfkaeb194fed3f72ba9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:56129 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750728AbYG1J3i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 05:29:38 -0400
Content-Disposition: inline
In-Reply-To: <19f34abd0807280217n2c059cfkaeb194fed3f72ba9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>


* Vegard Nossum <vegard.nossum@gmail.com> wrote:

> > thanks Stephen.
> >
> > I made this fixup too, yesterday, but solved it differently: i added 
> > kmemcheck_init() to before all early initcalls. I think that's the 
> > best solution for a fundamental debug feature like kmemcheck. (which 
> > could catch bugs in early initcalls as well) What do you think?
> >
> > i've pushed out a new auto-kmemcheck-next branch, so the conflicts 
> > should go away on your next iteration.
> 
> I'm sorry, I didn't have the chance to review your conflict 
> resolutions yet.
> 
> But I think it's correct to use an early_initcall() -- we do catch 
> errors even before kmemcheck_init(); the only purpose of 
> kmemcheck_init is to prevent additional CPUs from going up. And that's 
> exactly the purpose of "early initcalls", to run just before 
> additional CPUs are upped. (Yeah, I did point out in review that 
> "presmp_initcall" would have been a better name than "early", at least 
> for our purposes, however, it seems that the idea was rejected.)
> 
> Perhaps kmemcheck_init() is a misnomer as well. We are functional 
> before that, too. If you are looking for a different init() function, 
> there isn't one :-) Just an option parser, param_kmemcheck().

ok - could you please dig out Stephen's conflict resolution and send a 
patch against tip/kmemcheck? (or better yet, a pull request ;-)

	Ingo
