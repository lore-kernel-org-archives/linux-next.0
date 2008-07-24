From: Paul Moore <paul.moore@hp.com>
Subject: Re: Labeled Networking tree for linux-next
Date: Thu, 24 Jul 2008 09:47:59 -0400
Message-ID: <200807240947.59538.paul.moore@hp.com>
References: <200807231244.45084.paul.moore@hp.com> <200807231619.39629.paul.moore@hp.com> <20080724100624.6c6127ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t0014.houston.hp.com ([15.201.24.17]:31451 "EHLO
	g4t0014.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbYGXNsE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jul 2008 09:48:04 -0400
In-Reply-To: <20080724100624.6c6127ed.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

On Wednesday 23 July 2008 8:06:24 pm Stephen Rothwell wrote:
> Hi Paul,
>
> On Wed, 23 Jul 2008 16:19:39 -0400 Paul Moore <paul.moore@hp.com> 
wrote:
> > Yes, the labeled networking stuff usually affects both net/ and
> > security/.  I really don't care how it gets into linux-next as long
> > as it gets in at some point.  I sent the mail because the
> > lblnet-2.6_testing tree (currently empty, but not for much longer)
> > is currently being pulled into linux-next (I think it started in
> > the initial push to move -mm into linux-next).
> >
> > If we don't decide to drop the labeled networking git tree from
> > linux-next can we at least shift from using the lblnet-2.6_testing
> > to the lblnet-2.6_next tree?
>
> I have made the change.
>
> I have no problem with trees coming into linux-next from more than
> one source (see e.g. the wireless tree which is merged into the net
> tree). In fact it can be useful so that you will discover conflicting
> changes in the security and net trees before you have your tree
> merged into theirs. I have moved your tree after both the net and
> security-testing trees (that way if it gets merged into either of
> them its merge into linux-next becomes a noop).

That sounds like a reasonable argument, thanks for making the change.

-- 
paul moore
linux @ hp
