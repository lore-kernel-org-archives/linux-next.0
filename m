From: Rui Sousa <rui.p.m.sousa@gmail.com>
Subject: Re: linux-next: tip-core build failure
Date: Mon, 15 Sep 2008 15:02:48 +0200
Message-ID: <200809151502.48849.rui.p.m.sousa@gmail.com>
References: <20080913111423.981554c3.sfr@canb.auug.org.au> <20080915054508.1a7f4a24.sfr@canb.auug.org.au> <20080915081129.GD29585@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.173]:53354 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270AbYIONC7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Sep 2008 09:02:59 -0400
Received: by ug-out-1314.google.com with SMTP id k3so780455ugf.37
        for <linux-next@vger.kernel.org>; Mon, 15 Sep 2008 06:02:58 -0700 (PDT)
In-Reply-To: <20080915081129.GD29585@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Monday 15 September 2008 10:11, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Ingo,
> >
> > On Sun, 14 Sep 2008 21:17:09 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > On Sun, 14 Sep 2008 20:36:29 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > > > > [ ... just used by 90%+ of our active testers/developers ;-) ... ]
> > > >
> > > > An irrelevant argument in this case.
> > >
> > > why is the actual usage distribution of Linux irrelevant? We make
> >
> > Notice the "in this case"?  In this case the code being changed
> > clearly could affect other architectures, so checking that x86 is OK
> > is clearly not enough (and that does not mean building it for 20+
> > other architectures, just using grep to see the consequences of the
> > change and maybe discussing it with the affected architecture
> > maintainers or on linux-arch).
>
> again, the side effects were not realized. Pretty much _any_ patch that
> is not strictly restricted to a single architecture 'could' affect other
> architectures. Any change to a common .h or .c file could do that - and
> 90% of Linux's source code is in common files.
>
> Hence your suggestion that we should have found this breakage makes no
> sense in practice as it's not reliably testable.
>
> Yes, for things like sparseirq support we pretty much expected
> cross-arch fallout so we checked a ton of architectures. For other
> patches bugs can slip through, and that's OK as we really dont want to
> dog down pretty much every patch with the requirement to cross-build.
>
> 	Ingo

Hi,

I have just subscribed to linux-arch and will work on a patch updating all 
archictures. Once I have it I will post it on the list for discussion/review.

One thing that would be nice, but I don't see how it can be done in practice,
is to have a public server, where people can submit their patches and at least
make sure they compile on all archictetures.

Thanks,
Rui
