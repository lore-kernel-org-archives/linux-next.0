From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 3 Dec 2008 20:48:30 -0200
Message-ID: <20081203204830.13db67f3@pedra.chehab.org>
References: <20081202103741.9b234e49.sfr@canb.auug.org.au>
	<20081202080302.2f1180e8@pedra.chehab.org>
	<20081203092354.b3727f05.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:44664 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094AbYLCWsl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 17:48:41 -0500
In-Reply-To: <20081203092354.b3727f05.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 3 Dec 2008 09:23:54 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Tue, 2 Dec 2008 08:03:02 -0200 Mauro Carvalho Chehab <mchehab@infradead.org> wrote:
> >
> > I suspect you've pulled from my tree while I was testing it, or before my last
> > update yesterday night. Anyway, I've re-merged my patches at my linux-next and
> > tested. Everything seems to be ok now.
> 
> You should do things in this order:
> 	write, and test your own patches
> 	gather patches form other people
> 	make sure all the patches have been posted on some appropriate
> 		mailing list for review
> 	put all the patches in a private tree
> 	test
All of those are done.

I also have some additional steps, since the development repository is based on mercurial:

	Convert patches to -git
	Split fixes and next patches
	Solve merge conflicts, when a linux-next patch depends on an upstream patch;
	Merge the trees again, for linux-next;
> 	publish the tree for linux-next (and others)

Cheers,
Mauro
