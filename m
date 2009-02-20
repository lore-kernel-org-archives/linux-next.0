From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 13:12:41 +0200
Message-ID: <1235128361.29813.32.camel@penberg-laptop>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
	 <20090220195911.3bff30fb.sfr@canb.auug.org.au>
	 <20090220093734.GI24555@elte.hu> <1235122897.29813.28.camel@penberg-laptop>
	 <20090220095355.GL24555@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:56462 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbZBTLMo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 06:12:44 -0500
In-Reply-To: <20090220095355.GL24555@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Hi Ingo,

On Fri, 2009-02-20 at 10:53 +0100, Ingo Molnar wrote:
> > Is it a big problem, though? We could do the 
> > s/PAGE_SIZE/SLUB_MAX_SIZE/g rename as a separate preparational 
> > patch (without any of the functional changes) and see if Linus 
> > merges it to mainline...
> 
> Linus does not have to merge the changes - it's enough if both 
> you and me merge it, then there will be no conflicts if the two 
> trees are combined - Git will sort it all out.
> 
> Could you prepare such a patch please, merge it into a separate 
> (and append-only) branch your tree and then send me a pull 
> request after a bit of testing so i can merge it into the 
> tracing tree?

Aye, aye, cap'n:

  git pull git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6.git for-ingo

the commit is here in case someone wants to take a look at it:

http://git.kernel.org/?p=linux/kernel/git/penberg/slab-2.6.git;a=commitdiff;h=fe1200b63d158b28eef6d4de1e5b5f99c681ba2f

			Pekka
