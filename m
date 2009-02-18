From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH v2] module: fix build for CONFIG_SYSFS=n
Date: Wed, 18 Feb 2009 20:15:29 +0100
Message-ID: <20090218191529.GC8889@elte.hu>
References: <20090218191640.0b023029.sfr@canb.auug.org.au> <499C4D35.9000104@oracle.com> <20090218180932.GC19995@elte.hu> <499C54E8.7060004@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756504AbZBRTPx@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <499C54E8.7060004@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>
List-Id: linux-next.vger.kernel.org


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> > Is destroy_params() dependent on SYSFS? If yes then it would be 
> 
> Yes.
> 
> > far cleaner if there was a NOP destroy_params() inline for the 
> > !SYSFS case.
> 
> 
> 
> 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix this build error when CONFIG_SYSFS=n:
> 
> kernel/built-in.o: In function `free_module':
> module.c:(.text+0x4f8a2): undefined reference to `destroy_params'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc: Rusty Russell <rusty@rustcorp.com.au>
> ---
>  kernel/params.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- linux-next-20090218.orig/kernel/params.c
> +++ linux-next-20090218/kernel/params.c
> @@ -761,6 +761,12 @@ static int __init param_sysfs_init(void)
>  }
>  subsys_initcall(param_sysfs_init);
>  
> +#else	/* !CONFIG_SYSFS */
> +
> +inline void destroy_params(const struct kernel_param *params, unsigned num)
> +{
> +}
> +
>  #endif /* CONFIG_SYSFS */

thanks!

Acked-by: Ingo Molnar <mingo@elte.hu>

	Ingo
