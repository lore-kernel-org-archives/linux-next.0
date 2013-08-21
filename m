From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: Tree for Aug 21 [ screen corruption in graphical
 mode ]
Date: Wed, 21 Aug 2013 15:44:41 +0200
Message-ID: <20130821134441.GE26909@phenom.ffwll.local>
References: <CA+icZUUkS-UptLRM1CfcaHH=8UD-ZaHbXr8wFkA+YKyk-rPjvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:34131 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751957Ab3HUNoc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2013 09:44:32 -0400
Received: by mail-ea0-f179.google.com with SMTP id b10so240603eae.24
        for <linux-next@vger.kernel.org>; Wed, 21 Aug 2013 06:44:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CA+icZUUkS-UptLRM1CfcaHH=8UD-ZaHbXr8wFkA+YKyk-rPjvg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Aug 21, 2013 at 12:35:08PM +0200, Sedat Dilek wrote:
> On Wed, Aug 21, 2013 at 11:21 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > There will be no linux-next trees on Aug 23 or 26.
> >
> > Changes since 20130820:
> >
> > New tree: aio-direct
> >
> > Removed tree: xilinx (at maintainer's request)
> >
> > The xfs tree still had its build failure for which I reverted a commit.
> >
> > The trivial tree gained conflicts against the crypto, net-next and
> > wireless trees.
> >
> > The aio tree gained conflicts against the aio-direct tree.
> >
> > The akpm-current tree gained conflicts against the modules and aio-direct
> > trees.
> >
> > ----------------------------------------------------------------------------
> >
> 
> Hi,
> 
> I still have this issue with next-20130821 and "Linux v3.11-rc6 plus
> drm-intel-nightly on top"
> Any new development on this?
> Patches?

Tbh I'm at a loss what we could try above&beyond what Chris has already
tried out.

> Currently, I have two workarounds:
> 
> [1] Revert this commit:
> 
> commit 5456fe3882812aba251886e36fe55bfefb8e8829
> "drm/i915: Allocate LLC ringbuffers from stolen"

Since with a rather decent chance the next testing cycle I'll do this
friday will be the last chunk of features for 3.12 I'll probably drop the
above patch from my queue and we can try again in 3.13.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
