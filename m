From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree
Date: Wed, 17 Dec 2008 00:18:18 -0200
Message-ID: <20081217001818.7ad1c476@caramujo.chehab.org>
References: <20081216165734.98535728.sfr@canb.auug.org.au>
	<20081216173636.7664bced@caramujo.chehab.org>
	<20081217111059.f6e7db06.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:33153 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171AbYLQCSh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Dec 2008 21:18:37 -0500
In-Reply-To: <20081217111059.f6e7db06.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 17 Dec 2008 11:10:59 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Tue, 16 Dec 2008 17:36:36 -0200 Mauro Carvalho Chehab <mchehab@infradead.org> wrote:
> >
> > On Tue, 16 Dec 2008 16:57:34 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > The v4l-dvb tree has not been in linux-next since Nov 25 due to build
> > > problems.  The tree I am fetching
> > > (git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git#master)
> > > has not been updated since Dec 2.  (The current head of branch commit is
> > > 6e65a8a8f16144b0f092915c9f89c2beb957e14b "Merge branch 'next'
> > > of ../devel")
> > > 
> > > Is there any progress in this?
> > 
> > I've just updated it today. Please let me know if you have any troubles.
> 
> Please check your procedures, as there still has been no update to the
> tree I fetch (see above).

I got the error. My update scripts weren't adding the patches at the right
branch. I fixed the scripts and checked it on master.kernel.org.

Now, you should be seen this changeset:
	53e66c026200c8de67bf188bddc6c25d78dc8809

Cheers,
Mauro
