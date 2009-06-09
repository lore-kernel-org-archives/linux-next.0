From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Tue, 09 Jun 2009 08:49:19 -0500
Message-ID: <1244555359.4137.10.camel@mulgrave.site>
References: <1244477423.4079.228.camel@mulgrave.site>
	 <20090609194515.7a1adebd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:55532 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759849AbZFINtV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 09:49:21 -0400
In-Reply-To: <20090609194515.7a1adebd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 2009-06-09 at 19:45 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> On Mon, 08 Jun 2009 11:10:23 -0500 James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> >
> > Could you add this (as a postmerge tree) somewhere after the x86 trees,
> > please (it depends on the auto-x86-next branch).
> > 
> > I'll be sending the pull request for it to Linus somewhere in the next
> > merge window (probably towards the end) and if he takes it, linux-next
> > inclusion for a small number of patches it contains will probably be a
> > recurring feature.
> > 
> > The tree is at:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/jejb/voyager-2.6.git#master
> 
> I added it near the end for today (but see my other emails for the
> results).  I will move it up just after the x86 tree tomorrow and hope
> for better results.
> 
> (You have seen the following before, this is just for "form")
> 
> What I tell everyone: all patches/commits in the tree/series must
> have been:
> 
> 	posted to a relevant mailing list
> 	reviewed
> 	unit tested
> 	destined for the next merge window (or the current release)

Check on all of those.

> *before* they are included.  The linux-next tree is for integration
> testing and to lower the impact of conflicts between subsystems in the
> next merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Right ... what I really need is wider build testing of the pieces I
can't check easily here (especially random configuration testing).

I'm just trying to set up a build env for the 64 bit failure now.

Thanks,

James
