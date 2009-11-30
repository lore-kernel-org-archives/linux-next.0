From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: percpu tree build warning
Date: Mon, 30 Nov 2009 11:01:59 +1030
Message-ID: <200911301101.59416.rusty@rustcorp.com.au>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au> <200911282021.50315.rusty@rustcorp.com.au> <20091129064019.GA19916@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:52919 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751077AbZK3FQ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 00:16:57 -0500
In-Reply-To: <20091129064019.GA19916@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

On Sun, 29 Nov 2009 05:10:19 pm Ingo Molnar wrote:
> * Rusty Russell <rusty@rustcorp.com.au> wrote:
> > [...] Again, I'm explaining what you should already know before 
> > sending email about this stuff.
> > [...]
> > Stupidest debate ever.
> 
> What i am making is a somewhat subtle technical argument and making any 
> progress on it needs at least a minimal form of a working debate. I do 
> not claim i am right, but still you are dismissing my arguments in a 
> rather nasty way.

You're right, I was overly abrupt.  Apologies.

You have a point: the compile-time restrictions on per-cpu misuse was nice.  I know, I wrote it :)  But as we start to pass more per-cpu pointers around, it breaks down.  So the new sparse annotations are a better fit, and cover more.

The separate namespace was an unintended side-effect, and not one I'm fond
of.  Unfortunately it became more attractive now static-scope per-cpu vars
are banned for some platforms.  But having two names meaning different things
is bad for tags, grep and casual readers (your example is trivial enough that
we don't care, I agree).

> ... alas, i dont care _that_ much about this and i dont think my 
> concerns deserved your ad hominem attacks so i see no point in further 
> participating in this thread.

I just reviewed what I sent.  I don't think my attacks were ad-hominem.

There are very few people on this list who gracefully accept when they are wrong.  The rest of us try to come grasp at some alternate criticism instead, flailing around attacking minor surrounding issue to save face.[1]

This behavior is unbecoming and frankly embarrassing, but at least it usually
motivates people to review the patches!  And, code being what it is, they find some nit to pick and feel better about their prior mistake.

Unfortunately, this debate *is* stupid because neither of us are really going to do anything about it: ie. it did not cause either of us to review code.  It is also stupid because I know I'm not telling you anything you can't think of yourself.  Finally, it's stupid because it's all been said before in commit messages and in previous posts.

Hope that clarifies,
Rusty.
[1] If anyone cared, I'm sure they could find excruciating lkml archive
    examples of me doing this.
