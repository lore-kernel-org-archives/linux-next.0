From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: error: implicit declarations of BUG/BUG_ON/WARN_ON/WARN_ON_ONCE
Date: Mon, 25 Jun 2012 12:38:36 +0800
Message-ID: <20120625043836.GA11937@localhost>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au>
 <20120615065231.GA12272@localhost>
 <4FDB6261.2030400@xenotime.net>
 <4FDF5D50.7030505@xenotime.net>
 <20120622071305.GA15102@localhost>
 <20120625025301.GB9317@linux-sh.org>
 <20120625042017.GA11705@localhost>
 <4FE7E7CA.2030706@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FE7E7CA.2030706@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Paul Mundt <lethal@linux-sh.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Sun, Jun 24, 2012 at 09:23:38PM -0700, Randy Dunlap wrote:
> On 06/24/2012 09:20 PM, Fengguang Wu wrote:
> 
> > Hi Paul,
> > 
> > The patch builds fine, thank you!
> > 
> > Tested-by: Fengguang Wu <wfg@linux.intel.com>
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>
> 
> You clearly have better build hardware than I do (a simple Core i5
> laptop).  ;)

Thanks, and it's a surprise that you caught so many bugs with a laptop! ;)

Thanks,
Fengguang

> >> I'm really starting to loathe this header. This should take care of it:
> >>
> >> ---
> >>
> >> diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
> >> index 506ec19..7d10f96 100644
> >> --- a/include/asm-generic/bug.h
> >> +++ b/include/asm-generic/bug.h
> >> @@ -3,10 +3,18 @@
> >>  
> >>  #include <linux/compiler.h>
> >>  
> >> +#ifdef CONFIG_GENERIC_BUG
> >> +#define BUGFLAG_WARNING		(1 << 0)
> >> +#define BUGFLAG_TAINT(taint)	(BUGFLAG_WARNING | ((taint) << 8))
> >> +#define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
> >> +#endif
> >> +
> >> +#ifndef __ASSEMBLY__
> >> +#include <linux/kernel.h>
> >> +
> >>  #ifdef CONFIG_BUG
> >>  
> >>  #ifdef CONFIG_GENERIC_BUG
> >> -#ifndef __ASSEMBLY__
> >>  struct bug_entry {
> >>  #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> >>  	unsigned long	bug_addr;
> >> @@ -23,17 +31,8 @@ struct bug_entry {
> >>  #endif
> >>  	unsigned short	flags;
> >>  };
> >> -#endif		/* __ASSEMBLY__ */
> >> -
> >> -#define BUGFLAG_WARNING		(1 << 0)
> >> -#define BUGFLAG_TAINT(taint)	(BUGFLAG_WARNING | ((taint) << 8))
> >> -#define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
> >> -
> >>  #endif	/* CONFIG_GENERIC_BUG */
> >>  
> >> -#ifndef __ASSEMBLY__
> >> -#include <linux/kernel.h>
> >> -
> >>  /*
> >>   * Don't use BUG() or BUG_ON() unless there's really no way out; one
> >>   * example might be detecting data structure corruption in the middle
> 
> 
> 
> -- 
> ~Randy
