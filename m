From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to
 work.
Date: Thu, 13 Apr 2017 08:03:06 -0400
Message-ID: <20170413120305.GT16239@windriver.com>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com>
 <20170413003014.4052-5-paul.gortmaker@windriver.com>
 <20170413132701.633a22a9@canb.auug.org.au>
 <87poggao2b.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:53853 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752534AbdDMMDV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2017 08:03:21 -0400
Content-Disposition: inline
In-Reply-To: <87poggao2b.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>

[Re: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to work.] On 13/04/2017 (Thu 15:12) Michael Ellerman wrote:

> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi Paul,
> >
> > On Wed, 12 Apr 2017 20:30:14 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >>
> >> Since ia64 and ppc64 don't set CONFIG_64BIT, they were already
> >> excluded by the original dependency.
> >
> > My powerpc ppc64_defconfig builds have CONFIG_64BIT set ...
> >
> > $ grep CONFIG_64BIT ~/next/powerpc_ppc64_defconfig/.config
> > CONFIG_64BIT=y
> 
> Yeah, arch/powerpc/Kconfig:
> 
> config 64BIT
> 	bool
> 	default y if PPC64

Yep, as I said to Stephen earlier in this thread, I think I mistakenly
searched for 64_BIT; unfortunately I can't tell since all history has is:

   16  make  O=../ppc-build/ pasemi_defconfig
   17  vi ../ppc-build/.config

Anyway, that mis-documentation in the commit log aside, it seems like
the driver has been pulled from the linux-next content for today;
presumably to be reworked and resubmitted with better arch coverage
to address all the issues raised here.  That is probably the right
approach - we don't need to pollute git history with all that..

Thanks,
Paul.
--

> 
> cheers
