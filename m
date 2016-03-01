From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] [v3] x86, pkeys: fix siginfo ABI breakage from new field
Date: Tue, 1 Mar 2016 08:40:52 +0100
Message-ID: <20160301074052.GA7201@gmail.com>
References: <20160229221733.DC2C56B7@viggo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34699 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbcCAHk5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 02:40:57 -0500
Content-Disposition: inline
In-Reply-To: <20160229221733.DC2C56B7@viggo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de


* Dave Hansen <dave@sr71.net> wrote:

> 
> This responds to the feedback from Ingo that we should be using
> explicitly-sized types and fixes a typo in the patch description.
> 
> --
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> Stephen Rothwell reported:
> 
> 	http://lkml.kernel.org/r/20160226164406.065a1ffc@canb.auug.org.au
> 
> that the Memory Protection Keys patches from the tip tree broke
> a build-time check on an ARM build because they changed the ABI
> of siginfo.

Ok, so the reason we didn't see that build failure is because the generic 
kernel/signal.c build time check for these types of bugs is in -mm, not yet 
upstream.

> A u64 was used for the protection key field in siginfo.  When the
> containing union was aligned, this u64 unioned nicely with the
> two 'void *'s in _addr_bnd.  But, on 32-bit, if the union was
> unaligned, the u64 might grow the size of the union, breaking the
> ABI for subsequent fields.
>
> To fix this, we replace the u64 with an '__u32'.  The __u32 is
> guaranteed to union well with the pointers from _addr_bnd.  It is
> also plenty large enough to store the 16-bit pkey we have today
> on x86.
> 
> I also shouldn't have been using a u64 in a userspace API to begin
> with.

Well, it's __u64 that we use in UAPIs, and they can be used just fine, as long as 
the structure's field alignments is managed explicitly, i.e. there's no automatic 
alignment padding done by the compiler.

I think we should add a warning (to x86 at least) if the packed siginfo size is 
the same as the unpacked one.

This could be done with a bit of preprocessor trickery, I think the following 
would work, in a standalone .c file:

#define __ARCH_SI_ATTRIBUTES __attribute__((aligned(8))) __packed
#include <asm-generic/siginfo.h>

int siginfo_size_packed = sizeof(struct siginfo);

and another .c file could calculate the regular size:

#include <asm/siginfo.h>

int siginfo_size = sizeof(struct siginfo);

and then a (host side) build time check could link those two .c's, run that and 
compare the two values.

or something like that.

This checking mechanism could then be extended to other user ABI definitions as 
well, such as include/uapi/linux/perf_event.h.

Thanks,

	Ingo
