From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 10 Mar 2015 16:08:15 +0100
Message-ID: <20150310150815.GA28071@kroah.com>
References: <20150310160728.7213b9fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35841 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753326AbbCJPIT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 11:08:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0D7EB20F76
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2015 11:08:17 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150310160728.7213b9fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

On Tue, Mar 10, 2015 at 04:07:28PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from include/linux/module.h:17:0,
>                  from drivers/staging/sm750fb/sm750.c:2:
> drivers/staging/sm750fb/sm750.c: In function '__check_g_option':
> drivers/staging/sm750fb/sm750.c:1436:14: error: 'g_option' undeclared (first use in this function)
>  module_param(g_option,charp,S_IRUGO);
>               ^
> 
> Caused by commit 81dee67e215b ("staging: sm750fb: add sm750 to staging").
> 
> This driver also produced a large number of warnings ... a lot like this:
> 
> drivers/staging/sm750fb/sm750.c: In function 'lynxfb_ops_mmap':
> drivers/staging/sm750fb/sm750.c:533:2: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat=]
>   printk("lynxfb mmap pgoff: %x\n", vma->vm_pgoff);
>   ^
> 
> Also note:
> 
> In file included from drivers/staging/sm750fb/ddk750_mode.h:4:0,
>                  from drivers/staging/sm750fb/ddk750.h:15,
>                  from drivers/staging/sm750fb/sm750_hw.c:24:
> drivers/staging/sm750fb/ddk750_chip.h:4:0: warning: "SM750LE_REVISION_ID" redefined
>  #define SM750LE_REVISION_ID (char)0xfe
>  ^
> In file included from drivers/staging/sm750fb/sm750_hw.c:23:0:
> drivers/staging/sm750fb/sm750_hw.h:8:0: note: this is the location of the previous definition
>  #define SM750LE_REVISION_ID (unsigned char)0xfe
>  ^
> 
> I have disabled this driver for now, please let me know when it is OK
> to enable it again.

Sorry about that.  Yes, I know it's a mess.  The build error on ppc
should now be fixed in my tree.  The build warnings are still there
(some are gone).  I should just go fix them up myself, and will do so
tonight if I don't get a patch from someone else that does so first...

So it should be safe to enable again.

thanks,

greg k-h
