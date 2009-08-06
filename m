From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for August 6
Date: Thu, 6 Aug 2009 22:50:50 +0200
Message-ID: <200908062250.51498.bzolnier@gmail.com>
References: <20090806192209.513abec7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:42608 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756223AbZHFUva (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2009 16:51:30 -0400
In-Reply-To: <20090806192209.513abec7.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thursday 06 August 2009 11:22:09 Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090805:

At the moment -next is completely unusable for anything other than
detecting merge conflicts..  Running -next was never a completely
smooth experience but for a past year it was more-or-less doable.
However the last two months have been an absolute horror and I've
been hitting issues way faster than I was able to trace/report
them properly..

Right now I still have following *outstanding* issues (on just *one*
machine/distribution):

- Random (after some long hours) order:6 mode:0x8020 page allocation
  failure (when ipw2200 driver reloads firmware on firmware error).

  [ I had first thought that it was caused by SLQB (which got enabled
    as default somewhere along the way) but it also happens with SLUB
    and I have good reasons to believe that is caused by heavy mm
    changes first seen in next-20090618 (I've been testing next-20090617
    for many days and it never happened there), the last confirmed
    release with the problem is next-20090728. ]

- bdi warning, http://lkml.org/lkml/2009/7/15/262, (this one goes back
  to at least next-20090708, reconfirmed with next-20090806).

- Random OOPSes on shutdown (since the last week or so, didn't have time
  to investigate them).

- Lockup on stopping iptables (I've just noticed it in next-20090806,
  seems to also happen with next-20090731).

I give up and I'm back to using Linus' tree.. :(
