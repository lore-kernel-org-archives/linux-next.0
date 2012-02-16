From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: build failure after merge of the staging tree
Date: Thu, 16 Feb 2012 13:49:53 -0800 (PST)
Message-ID: <be7afe58-43f1-4f69-b0ae-89dd7607355b@default>
References: <20120216152316.821ac82e04a5ee30327b81c3@canb.auug.org.au>
 <20120216051552.GA5676@kroah.com>
 <c6634d7c-b264-4a87-bab1-74408341dab0@default>
 <20120217082559.6a094265da2d5c203bfc445f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:48206 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752249Ab2BPVuK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Feb 2012 16:50:10 -0500
In-Reply-To: <20120217082559.6a094265da2d5c203bfc445f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>, Seth Jennings <sjenning@linux.vnet.ibm.com>, Nitin Gupta <ngupta@vflare.org>

> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Subject: Re: linux-next: build failure after merge of the staging tree
> 
> Hi Dan,

Hi Stephen --

Thanks for the reply and sorry for the hassle.  See below for
important question.

> > which changed the names of those fields from "flush*" to "invalidate*".
> > I am the author of that commit but it is pulled through Konrad Wilk
> > (cc'ed). Perhaps Konrad's pull succeeded in next-20120214 but
> > failed in next-20120215?
> 
> If a fetch fails for a particular tree on a particular day, I use the
> version of that tree from the day before, so that is not the problem (and
> in any case, the fetch did not fail).
> 
> > Kernel.org seems to be down so I can't see if that commit is
> > in next-20120215 but if it is not that would likely cause
> > the above errors.
> 
> It is in next-20120215 (and has been since next-20120124).  However, I
> merge Konrad's (tmem) tree *after* I merge the staging tree, so that commit
> was not present when I tried to build linux-next after merging the
> staging tree.

Huh?  Do you do allyesconfig/allmodconfig build testing after you pull
each individual tree or only after all trees are pulled?  (Apparently
the former, as otherwise the ordering shouldn't matter, right?)
 
> > The good news is that there seems to be an increasing number
> > of people contributing to and building things on top of
> > cleancache/frontswap stuff.  The bad news is that it is difficult
> > to avoid ordering dependencies that affect -next.  My apologies
> > and if you have any dependency-savvy processes that would solve
> > this that we are not using, please let me/us know.
> 
> Well, if anyone had bothered to tell me, I could have reordered the
> trees.  However, that does not change the fact that the staging tree is
> now broken on its own.  Which means that Greg can't even do unit testing
> on his tree with your code in it. :-(

If you are doing the after-every-individual-tree build testing,
yes, if you could pull konrad's tmem tree first, that would
solve this problem I believe.**

I suspect unit testing doesn't make much as much sense in staging
as it does in the core kernel.  I did testing of ramster in my
public git tree (which includes the tmem patchset coming to you via
konrad) but, since it is a staging driver, the bits have to go
through Greg.

> One solutions is for Greg to merge Konrad's tree (or a subset of it) into
> the staging tree.  Another is for this work to become a separate tree
> (however, I think other stuff in the staging tree depends on this work,
> right?).

Yes, there are a number of parts from different companies/timezones
now flying in close formation.  The name change (flush->invalidate)
causing this problem was insisted upon by Andrew Morton (and has been
in linux-next for several months), otherwise it wouldn't have happened
and wouldn't be causing these issues :-(  But better to work through
them in -next than in Linus' merge window I guess.

Thanks,
Dan

** I just found another problem that occurs with allmodconfig
so will be submitting a patch for that to GregKH shortly and
will cc you.
