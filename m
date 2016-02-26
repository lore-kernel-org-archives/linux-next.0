From: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 26 Feb 2016 12:10:06 -0800
Message-ID: <56D0B11E.2050402@linux.intel.com>
References: <20160226164406.065a1ffc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160226164406.065a1ffc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>
List-Id: linux-next.vger.kernel.org

On 02/25/2016 09:44 PM, Stephen Rothwell wrote:
> Fixes: cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/ia64/include/uapi/asm/siginfo.h | 2 +-
>  arch/mips/include/uapi/asm/siginfo.h | 2 +-
>  include/uapi/asm-generic/siginfo.h   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/ia64/include/uapi/asm/siginfo.h b/arch/ia64/include/uapi/asm/siginfo.h
> index 0151cfab929d..0c660bbccd3f 100644
> --- a/arch/ia64/include/uapi/asm/siginfo.h
> +++ b/arch/ia64/include/uapi/asm/siginfo.h
> @@ -70,7 +70,7 @@ typedef struct siginfo {
>  					void __user *_upper;
>  				} _addr_bnd;
>  				/* used when si_code=SEGV_PKUERR */
> -				u64 _pkey;
> +				int _pkey;
>  			};
>  		} _sigfault;

Considering Peter's feedback on my 'unsigned long' approach, I'm fine
with your patch, Stephen.  Can it just be picked up in to the tip tree?

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
