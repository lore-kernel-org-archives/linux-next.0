From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: mm/ipw2200 regression (was: Re: linux-next: Tree for August 6)
Date: Sun, 16 Aug 2009 12:17:12 +0200
Message-ID: <200908161217.12963.bzolnier@gmail.com>
References: <20090806192209.513abec7.sfr@canb.auug.org.au> <200908151856.48596.bzolnier@gmail.com> <20090816173101.6e47b702.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f215.google.com ([209.85.220.215]:57064 "EHLO
	mail-fx0-f215.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887AbZHPKSJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Aug 2009 06:18:09 -0400
In-Reply-To: <20090816173101.6e47b702.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-mm@kvack.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>


Hi,

On Sunday 16 August 2009 09:31:01 Stephen Rothwell wrote:
> Hi Bart,
> 
> On Sat, 15 Aug 2009 18:56:48 +0200 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:
> >
> > The bug managed to slip into Linus' tree..
> > 
> > ipw2200: Firmware error detected.  Restarting.
> > ipw2200/0: page allocation failure. order:6, mode:0x8020
> > Pid: 945, comm: ipw2200/0 Not tainted 2.6.31-rc6-dirty #69
>                                                    ^^^^^
> So, this is rc6 plus what?  (just in case it is relevant).

In this case plus upcoming staging/rt{286,287,307}0 patches (irrelevant,
they are not used on this machine and the problem happened many times
with vanilla -next kernels in the past)..

After going through mm commits in Linus' tree I think that the bug came
the other way around, from akpm's tree to Linus' tree and then to -next
(page allocator changes seem to match "the suspect's profile")..
