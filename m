From: Paul Moore <paul.moore@hp.com>
Subject: Re: Labeled Networking tree for linux-next
Date: Wed, 23 Jul 2008 16:19:39 -0400
Message-ID: <200807231619.39629.paul.moore@hp.com>
References: <200807231244.45084.paul.moore@hp.com> <Xine.LNX.4.64.0807240415200.14401@us.intercode.com.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0029.austin.hp.com ([15.216.28.36]:42512 "EHLO
	g1t0029.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754661AbYGWUTo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 16:19:44 -0400
In-Reply-To: <Xine.LNX.4.64.0807240415200.14401@us.intercode.com.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

On Wednesday 23 July 2008 2:16:27 pm James Morris wrote:
> On Wed, 23 Jul 2008, Paul Moore wrote:
> > Hello,
> >
> > I've created a new labeled networking tree to feed bits into
> > linux-next which should replace the lblnet-2.6_testing tree which
> > is currently used.  The new tree (currently empty) can be found
> > here:
> >
> >  * git://git.infradead.org/users/pcmoore/lblnet-2.6_next
>
> Is this stuff likely to affect more of net/ or security/ ?   I think
> it should go in via either the networking or security-testing trees.

Yes, the labeled networking stuff usually affects both net/ and 
security/.  I really don't care how it gets into linux-next as long as 
it gets in at some point.  I sent the mail because the 
lblnet-2.6_testing tree (currently empty, but not for much longer) is 
currently being pulled into linux-next (I think it started in the 
initial push to move -mm into linux-next).

If we don't decide to drop the labeled networking git tree from 
linux-next can we at least shift from using the lblnet-2.6_testing to 
the lblnet-2.6_next tree?

-- 
paul moore
linux @ hp
