From: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: build failure after merge of the audit tree
Date: Tue, 22 Apr 2014 11:56:42 -0400
Message-ID: <20140422155642.GA20182@madcap2.tricolour.ca>
References: <20140422162207.55e3d9f09244de281b9798cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52723 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757189AbaDVP4t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Apr 2014 11:56:49 -0400
Content-Disposition: inline
In-Reply-To: <20140422162207.55e3d9f09244de281b9798cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org

On 14/04/22, Stephen Rothwell wrote:
> Hi Eric,
> 
> After merging the audit tree, today's linux-next build (sparc defconfig)
> failed like this:
> 
> In file included from include/linux/audit.h:29:0,
>                  from mm/mmap.c:33:
> arch/sparc/include/asm/syscall.h: In function 'syscall_get_arch':
> arch/sparc/include/asm/syscall.h:131:9: error: 'TIF_32BIT' undeclared (first use in this function)
> arch/sparc/include/asm/syscall.h:131:9: note: each undeclared identifier is reported only once for each function it appears in
> 
> And many more ...
> 
> Caused by commit 374c0c054122 ("ARCH: AUDIT: implement syscall_get_arch
> for all arches").
> 
> I applied this patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 22 Apr 2014 16:18:53 +1000
> Subject: [PATCH] fix ARCH: AUDIT: implement syscall_get_arch for all arches
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Looks good to me.  Thanks.

Acked-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  arch/sparc/include/asm/syscall.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
> index fed3d511b108..a5a8153766b3 100644
> --- a/arch/sparc/include/asm/syscall.h
> +++ b/arch/sparc/include/asm/syscall.h
> @@ -128,8 +128,12 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  
>  static inline int syscall_get_arch(void)
>  {
> +#if defined(__sparc__) && defined(__arch64__)
>  	return test_thread_flag(TIF_32BIT) ? AUDIT_ARCH_SPARC
>  					   : AUDIT_ARCH_SPARC64;
> +#else
> +	return AUDIT_ARCH_SPARC;
> +#endif
>  }
>  
>  #endif /* __ASM_SPARC_SYSCALL_H */
> -- 
> 1.9.2
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



- RGB

--
Richard Guy Briggs <rbriggs@redhat.com>
Senior Software Engineer, Kernel Security, AMER ENG Base Operating Systems, Red Hat
Remote, Ottawa, Canada
Voice: +1.647.777.2635, Internal: (81) 32635, Alt: +1.613.693.0684x3545
