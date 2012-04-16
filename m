From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: triage for April 15, 2012
Date: Sun, 15 Apr 2012 21:25:52 -0400
Message-ID: <20120416012551.GA23010@windriver.com>
References: <20120415223049.GA17089@windriver.com>
 <20120416095829.b9b1c9fcede7bc0c86a999f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:53071 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752545Ab2DPB0C (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 15 Apr 2012 21:26:02 -0400
Content-Disposition: inline
In-Reply-To: <20120416095829.b9b1c9fcede7bc0c86a999f4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch

[Re: linux-next: triage for April 15, 2012] On 16/04/2012 (Mon 09:58) Stephen Rothwell wrote:

> Hi Paul,
> 
> On Sun, 15 Apr 2012 18:30:49 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> > All new breakage is in pagemap.h ; it seems a fix has been
> > posted already.
> > 
> > 	http://marc.info/?l=linux-kernel&m=133441945530527&w=2
> 
> And that patch has been added to the drm tree and so will be in today's
> linux-next.
> 
> > powerpc:allyesconfig
> > 	when:	May 18 2009, 22:11
> > 	why:	fat ass kernel with everything simply won't link
> > 	status:	need to fix build config to ignore the final link
> > 	fix:	
> > 	ref:	http://kisskb.ellerman.id.au/kisskb/buildresult/5806793/
> 
> This is well known, so is probably not worth reporting any more.  I am
> having a (slow) look at fixing it properly, but that is a long term goal.

True.  Maybe I should shove all failures that are >6mo old off the pier.

Paul.

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
