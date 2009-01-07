From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 7 Jan 2009 13:16:21 +1030
Message-ID: <200901071316.21984.rusty@rustcorp.com.au>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <20090106131908.GB15228@elte.hu> <496368E0.8000801@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:47744 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752919AbZAGCq3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 21:46:29 -0500
In-Reply-To: <496368E0.8000801@sgi.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Jack Steiner <steiner@sgi.com>, Andrew Morton <akpm@linux-foundation.org>

On Wednesday 07 January 2009 00:51:20 Mike Travis wrote:
> Ingo Molnar wrote:
> > I think the complete elimination of cpumask_t should be the primary 
> > priority - before jumping to any other aspect. If we dont get rid of it it 
> > will stick around forever, like the BKL. It was a nice migration helper 
> > but now it's time to wave goodbye? :)
> > 
> > 	Ingo
> 
> I think that's possible for 2.6.30 especially with Rusty's "big hammer"
> patch that removes the definition of cpumask_t.

I have two config option patches.  One removes the old deprecated ops.  This
almost compiles now.  The other removes the struct cpumask and cpumask_t
definitions.  This breaks horribly.  Wading through that is on my TODO.

cpus_allowed in task_struct is fairly nasty.  We'll introduce an accessor
macro for that one I think since it's widespread (a "big hammer" is going to
kill us all if we try it!).

But I agree that we should get to that goal as fast as possible; it's the
only real way to stop people introducing onstack cpumasks, copying them, etc.

Cheers,
Rusty.
