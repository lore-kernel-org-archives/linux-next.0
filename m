From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Thu, 14 Sep 2017 11:51:17 +1000
Message-ID: <20170914115117.0a41d4d5@canb.auug.org.au>
References: <20170908092545.15179b18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751279AbdINBvT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Sep 2017 21:51:19 -0400
In-Reply-To: <20170908092545.15179b18@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Dmitry V. Levin" <ldv@altlinux.org>

Hi Al,

On Fri, 8 Sep 2017 09:25:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the vfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> kernel/signal.c: In function 'C_SYSC_rt_sigaction':
> kernel/signal.c:3405:19: warning: unused variable 'mask' [-Wunused-variable]
>    compat_sigset_t mask;
>                    ^
> 
> Introduced by commit
> 
>   fc271087ebcb ("signal: replace sigset_to_compat() with put_compat_sigset()")

I am still getting this warning ...
-- 
Cheers,
Stephen Rothwell
