From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: zero based percpu build error on s390
Date: Mon, 07 Jul 2008 10:58:14 -0700
Message-ID: <48725936.2050503@sgi.com>
References: <20080703193009.GA8958@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.171.30]:45409 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756093AbYGGR6P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 13:58:15 -0400
In-Reply-To: <20080703193009.GA8958@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

Heiko Carstens wrote:
> The patch:
> "Zero based percpu: infrastructure to rebase the per cpu area to zero"
> 
> causes this build error on !CONFIG_SMP on linux-next / s390:
> 
>   CC      arch/s390/kernel/asm-offsets.s
> In file included from include/asm/percpu.h:35,
>                  from include/linux/percpu.h:9,
>                  from include/linux/rcupdate.h:39,
>                  from include/linux/pid.h:4,
>                  from include/linux/sched.h:74,
>                  from arch/s390/kernel/asm-offsets.c:7:
> include/asm-generic/percpu.h:78:1: warning: "SHIFT_PERCPU_PTR" redefined
> In file included from include/linux/percpu.h:9,
>                  from include/linux/rcupdate.h:39,
>                  from include/linux/pid.h:4,
>                  from include/linux/sched.h:74,
>                  from arch/s390/kernel/asm-offsets.c:7:
> include/asm/percpu.h:25:1: warning: this is the location of the previous definition
> 
> Fix below. Please merge with original patch.
> 
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  include/asm-generic/percpu.h |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Index: linux-next/include/asm-generic/percpu.h
> ===================================================================
> --- linux-next.orig/include/asm-generic/percpu.h
> +++ linux-next/include/asm-generic/percpu.h
> @@ -75,7 +75,9 @@ extern void setup_per_cpu_areas(void);
>  #define per_cpu(var, cpu)			(*((void)(cpu), &per_cpu_var(var)))
>  #define __get_cpu_var(var)			per_cpu_var(var)
>  #define __raw_get_cpu_var(var)			per_cpu_var(var)
> -#define SHIFT_PERCPU_PTR(__p, __offset)		(__p)
> +#ifndef SHIFT_PERCPU_PTR
> +# define SHIFT_PERCPU_PTR(__p, __offset)		(__p)
> +#endif
>  #define per_cpu_offset(x)			0L
>  
>  #endif	/* SMP */

Looks good to me, thanks!  (Not sure why I missed this the first time.)

Acked-by: Mike Travis <travis@sgi.com>
