From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] drivers/misc: Aspeed LPC control fix compile error and
 warning
Date: Wed, 22 Mar 2017 07:09:10 +0100
Message-ID: <20170322060910.GA19039@kroah.com>
References: <20170322031328.24043-1-cyrilbur@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41836 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1758419AbdCVGQ2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Mar 2017 02:16:28 -0400
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

Also in the future, only do one thing per-patch, this is two different
things at the same time.  I'll take this for now, but please be more
careful going forward.

thanks,

greg k-h
