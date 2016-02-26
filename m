From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 26 Feb 2016 13:33:50 -0800
Message-ID: <20160226133350.911293e1582f07134febdf48@linux-foundation.org>
References: <20160226164406.065a1ffc@canb.auug.org.au>
	<56D0B11E.2050402@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58758 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755158AbcBZVdv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Feb 2016 16:33:51 -0500
In-Reply-To: <56D0B11E.2050402@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>

On Fri, 26 Feb 2016 12:10:06 -0800 Dave Hansen <dave.hansen@linux.intel.com> wrote:

> On 02/25/2016 09:44 PM, Stephen Rothwell wrote:
> > Fixes: cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/ia64/include/uapi/asm/siginfo.h | 2 +-
> >  arch/mips/include/uapi/asm/siginfo.h | 2 +-
> >  include/uapi/asm-generic/siginfo.h   | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/ia64/include/uapi/asm/siginfo.h b/arch/ia64/include/uapi/asm/siginfo.h
> > index 0151cfab929d..0c660bbccd3f 100644
> > --- a/arch/ia64/include/uapi/asm/siginfo.h
> > +++ b/arch/ia64/include/uapi/asm/siginfo.h
> > @@ -70,7 +70,7 @@ typedef struct siginfo {
> >  					void __user *_upper;
> >  				} _addr_bnd;
> >  				/* used when si_code=SEGV_PKUERR */
> > -				u64 _pkey;
> > +				int _pkey;
> >  			};
> >  		} _sigfault;
> 
> Considering Peter's feedback on my 'unsigned long' approach, I'm fine
> with your patch, Stephen.  Can it just be picked up in to the tip tree?
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

I've moved add-compile-time-check-for-__arch_si_preamble_size.patch to
be after linux-next and have added this patch (as
add-compile-time-check-for-__arch_si_preamble_size-fix.patch) to be
folded into add-compile-time-check-for-__arch_si_preamble_size.patch
later on.

So no -tip changes should be needed.
