From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 char-misc tree
Date: Thu, 6 Aug 2015 14:12:15 -0700
Message-ID: <20150806211215.GB18439@kroah.com>
References: <20150806163552.5eabeba3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58800 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755414AbbHFVMR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2015 17:12:17 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id C90A820CD9
	for <linux-next@vger.kernel.org>; Thu,  6 Aug 2015 17:12:16 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150806163552.5eabeba3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, "dyoung@redhat.com" <dyoung@redhat.com>

On Thu, Aug 06, 2015 at 04:35:52PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/kexec.h
> 
> between commit:
> 
>   2b94ed245861 ("kexec: define kexec_in_progress in !CONFIG_KEXEC case")
> 
> from the char-misc tree and commit:
> 
>   3d86985f695b ("kexec: split kexec_load syscall from kexec core code")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/kexec.h
> index b63218f68c4b,5f193d80a6fb..000000000000
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@@ -323,8 -325,7 +325,8 @@@ struct pt_regs
>   struct task_struct;
>   static inline void crash_kexec(struct pt_regs *regs) { }
>   static inline int kexec_should_crash(struct task_struct *p) { return 0; }
>  +#define kexec_in_progress false
> - #endif /* CONFIG_KEXEC */
> + #endif /* CONFIG_KEXEC_CORE */
>   
>   #endif /* !defined(__ASSEBMLY__) */

Looks good to me, thanks.

greg k-h
