From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the xen-two
 tree
Date: Wed, 26 Oct 2011 15:30:38 -0400
Message-ID: <20111026193038.GA6385@windriver.com>
References: <20111025193442.66255eed8e72d5e88cce192f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:42708 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185Ab1JZTau (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Oct 2011 15:30:50 -0400
Content-Disposition: inline
In-Reply-To: <20111025193442.66255eed8e72d5e88cce192f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Magenheimer <dan.magenheimer@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

[linux-next: manual merge of the moduleh tree with the xen-two tree] On 25/10/2011 (Tue 19:34) Stephen Rothwell wrote:

> Hi Paul,
> 
> Today's linux-next merge of the moduleh tree got a conflict in
> drivers/xen/xen-selfballoon.c between commit 38a1ed4f039d ("xen: Fix
> selfballooning and ensure it doesn't go too far") from the xen-two tree
> and commit 29ff02027c68 ("xen: fix implicit stat.h/module.h include usage
> in xen-selfballoon.c") from the moduleh tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/xen/xen-selfballoon.c
> index d93c708,e21e3ce..0000000
> --- a/drivers/xen/xen-selfballoon.c
> +++ b/drivers/xen/xen-selfballoon.c
> @@@ -68,8 -68,8 +68,10 @@@
>    */
>   
>   #include <linux/kernel.h>
>  +#include <linux/bootmem.h>
>  +#include <linux/swap.h>
> + #include <linux/stat.h>
> + #include <linux/module.h>
>   #include <linux/mm.h>
>   #include <linux/mman.h>
>   #include <linux/module.h>

Thanks, Stephen.

I'll just drop the module.h commit, since there is clearly two module.h
listings above, as 4fec0e0bde09095b6349dc6206dbf19cebcd0a7e from
v3.1-rc3 and forward added the last line above.  The stat.h addition,
while correct, isn't critical, since module.h has to include stat.h

Paul.
