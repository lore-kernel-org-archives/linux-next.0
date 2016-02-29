From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2] signals, pkeys: make si_pkey 32 bits
Date: Mon, 29 Feb 2016 08:57:32 +0100
Message-ID: <20160229075732.GA31950@gmail.com>
References: <20160226173427.54A6949F@viggo.jf.intel.com>
 <6C5C3B9B-CAD6-4010-9A3E-AFFF7E13FAE3@zytor.com>
 <20160227091013.6e0606d1@canb.auug.org.au>
 <20160227114154.GA16200@gmail.com>
 <56D1F61C.5050308@sr71.net>
 <9E8119F8-1F37-4084-AE31-34CA6DE8C15E@zytor.com>
 <20160228102629.0ef4ef4f@canb.auug.org.au>
 <20160228104019.429defad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33819 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751925AbcB2H5i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Feb 2016 02:57:38 -0500
Content-Disposition: inline
In-Reply-To: <20160228104019.429defad@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, tglx@linutronix.de, peterz@infradead.org, Dave Hansen <dave@sr71.net>, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, mingo@elte.hu, linux-next@vger.kernel.org, deller@gmx.de


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In order to prevent a change of alignment of the _sifields union in the
> siginfo structure on (some) 32 bit platforms and an ABI breakage, we
> change the type of _pkey to unsigned int.  If more bits are needed in
> the future, a second unsigned int could be added.
> 
> Fixes: cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/ia64/include/uapi/asm/siginfo.h | 2 +-
>  arch/mips/include/uapi/asm/siginfo.h | 2 +-
>  include/uapi/asm-generic/siginfo.h   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/ia64/include/uapi/asm/siginfo.h b/arch/ia64/include/uapi/asm/siginfo.h
> index 0151cfab929d..19e7db0c9453 100644
> --- a/arch/ia64/include/uapi/asm/siginfo.h
> +++ b/arch/ia64/include/uapi/asm/siginfo.h
> @@ -70,7 +70,7 @@ typedef struct siginfo {
>  					void __user *_upper;
>  				} _addr_bnd;
>  				/* used when si_code=SEGV_PKUERR */
> -				u64 _pkey;
> +				unsigned int _pkey;
>  			};
>  		} _sigfault;
>  
> diff --git a/arch/mips/include/uapi/asm/siginfo.h b/arch/mips/include/uapi/asm/siginfo.h
> index 6f4edf0d794c..3cc14f4a5936 100644
> --- a/arch/mips/include/uapi/asm/siginfo.h
> +++ b/arch/mips/include/uapi/asm/siginfo.h
> @@ -93,7 +93,7 @@ typedef struct siginfo {
>  					void __user *_upper;
>  				} _addr_bnd;
>  				/* used when si_code=SEGV_PKUERR */
> -				u64 _pkey;
> +				unsigned int _pkey;
>  			};
>  		} _sigfault;
>  
> diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
> index 90384d55225b..f4459dc3d31b 100644
> --- a/include/uapi/asm-generic/siginfo.h
> +++ b/include/uapi/asm-generic/siginfo.h
> @@ -98,7 +98,7 @@ typedef struct siginfo {
>  					void __user *_upper;
>  				} _addr_bnd;
>  				/* used when si_code=SEGV_PKUERR */
> -				u64 _pkey;
> +				unsigned int _pkey;
>  			};
>  		} _sigfault;
>  

Please use the standard ABI integer type pattern: __u32.

The advantage of only using __[su][8|16|32|64] integer types is that it's 
"obvious" at a glance that an ABI is bitness-invariant.

For example include/uapi/linux/perf_event.h only uses such ABI-safe types, and 
arch/x86/include/uapi is using these types 95%+ of the time.

( The various struct siginfo definitions should probably be harmonized as well, 
  but in a separate patch. )

Thanks,

	Ingo
