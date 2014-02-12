From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: build failure after merge of the final tree (cgroup
 tree related)
Date: Wed, 12 Feb 2014 21:36:21 +0100
Message-ID: <20140212203621.GA31074@ravnborg.org>
References: <20140212162500.242e91e4cc3541b992fa3a0c@canb.auug.org.au>
 <20140212063933.GB7984@mtj.dyndns.org>
 <20140212214743.22fd2d8e1889ae69986e58aa@canb.auug.org.au>
 <20140212142700.GJ24490@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:54738 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753822AbaBLUoj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2014 15:44:39 -0500
Content-Disposition: inline
In-Reply-To: <20140212142700.GJ24490@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Hi Tejun.

On Wed, Feb 12, 2014 at 09:27:00AM -0500, Tejun Heo wrote:
> On Wed, Feb 12, 2014 at 09:47:43PM +1100, Stephen Rothwell wrote:
> > Hi, Tejun,
> > 
> > On Wed, 12 Feb 2014 01:39:33 -0500 Tejun Heo <tj@kernel.org> wrote:
> > >
> > > On Wed, Feb 12, 2014 at 04:25:00PM +1100, Stephen Rothwell wrote:
> > > > Presumably caused by commit 2bd59d48ebfb ("cgroup: convert to kernfs")
> > > > (see the comment in commit 1ff6bbfd13ca ("arm, pm, vmpressure: add
> > > > missing slab.h includes")).  I wonder how mane more builds are broken by
> > > > this :-(
> > > 
> > > Dang, I was feeling pretty safe as kbuild bot was reporting build
> > > successes.  We better fix them at any rate.  David / Sam, can you
> > > please pick this one up?
> > 
> > It really needs to go into the tree with the cgroup commit so it doesn't
> > break there.
> 
> Hmmm... I see.  I'll route the patch once Dave or Sam acks it.
My sparc setup is broken for many reasons - so I have not been able to try it out.
But the patch is obvious enough that I do not hesitate to do:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
