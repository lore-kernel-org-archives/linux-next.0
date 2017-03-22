From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] drivers/misc: Aspeed LPC control fix compile error and
 warning
Date: Wed, 22 Mar 2017 07:06:53 +0100
Message-ID: <20170322060653.GA14160@kroah.com>
References: <20170322031328.24043-1-cyrilbur@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57327 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751288AbdCVGHH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Mar 2017 02:07:07 -0400
Content-Disposition: inline
In-Reply-To: <20170322031328.24043-1-cyrilbur@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux-next@vger.kernel.org

On Wed, Mar 22, 2017 at 02:13:28PM +1100, Cyril Bur wrote:
> pgprot_dmachoerent() is not defined on every architecture. Having
> COMPILE_TEST set for the driver causes it to be compiled on
> architectures which do not have pgprot_dmachoerent():
>     drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_mmap':
>     drivers/misc/aspeed-lpc-ctrl.c:51:9: error: implicit declaration of
>         function 'pgprot_dmacoherent' [-Werror=implicit-function-declaration]
>         prot = pgprot_dmacoherent(prot);
> 
> There are two possible solutions:
>     1. Remove COMPILE_TEST to ensure the driver is only compiled on ARM
>     2. Use pgprot_noncached() instead of pgprot_dmachoerent()
> 
> The first option results in less compile testing of the LPC control
> driver which is undesirable.
> The second option uses a function that is declared on all architectures
> and therefore should always build. Currently there is no practical
> difference between pgprot_noncached() and pgprot_dmachoerent() for the
> aspeed chips that this driver is compatible with. The reason for
> pgprot_dmachoerent() was that there may be chips made at some point in
> the future that could include hardware that pgprot_dmachoerent() could
> optimise for. As none of this hardware has even been announced there
> isn't really a need for pgprot_dmachoerent().
> 
> Using pgprot_noncached() is completely correct and optimal for all
> existing hardware on which the LPC control driver will run.
> 
> This commit also addresses that phys_addr_t should be printed using %pap
> rather than %x:
>     In file included from include/linux/miscdevice.h:6:0,
>                      from drivers/misc/aspeed-lpc-ctrl.c:11:
>     drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
>     drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects
>         argument of type 'unsigned int', but argument 3 has type 'phys_addr_t
>         {aka long long unsigned int}' [-Wformat=]
>         dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

You forgot to include a "Reported-by:" line here giving credit to who
pointed this out (the kbuild bot).  I'll go add it myself...

thanks,

greg k-h
