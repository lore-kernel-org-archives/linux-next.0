From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Thu, 5 Mar 2009 22:15:14 -0300
Message-ID: <20090305221514.66f308ff@pedra.chehab.org>
References: <20090305113550.4369fe92.sfr@canb.auug.org.au>
	<20090305185150.69d8aff9@pedra.chehab.org>
	<20090306110548.9ef01100.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:57095 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbZCFBPr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2009 20:15:47 -0500
In-Reply-To: <20090306110548.9ef01100.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Igor M. Liplianin" <liplianin@netup.ru>

On Fri, 6 Mar 2009 11:05:48 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Thu, 5 Mar 2009 18:51:50 -0300 Mauro Carvalho Chehab <mchehab@infradead.org> wrote:
> >
> > Fixed.
> 
> Thanks.
> 
> > From time to time, I got an weird message like this when updating my remote
> > repository:
> > 
> > $ git --git-dir /home/v4l/tokernel/bare/linux-next.git push -f origin
> > Counting objects: 194, done.
> > Compressing objects: 100% (70/70), done.
> > Writing objects: 100% (93/93), 14.19 KiB, done.
> > Total 93 (delta 82), reused 24 (delta 23)
> > warning: updating the currently checked out branch; this may cause confusion,
> > as the index and working tree do not reflect changes that are now in HEAD.
> > To ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git
> > 
> > What's more weird is that I never touch directly
> > on /home/v4l/tokernel/bare/linux-next.git, since this is just a local bare
> > tree. My procedure is to update the patches on a work tree, then push it to the
> > bare repository and then to kernel.org.
> 
> Is there some reason that you repo on kernel.org is not bare as well?

It is bare... 

Hmm... at config, it were marked with bare = false, not sure why.
Anyway, I manually Fixed config. It seemed to solve the issue.

Thanks!
Cheers,
Mauro
