From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Wed, 4 Mar 2015 08:26:09 +0100
Message-ID: <20150304072609.GW11010@pengutronix.de>
References: <20150304113429.15c54218@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60503 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933456AbbCDH0P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2015 02:26:15 -0500
Content-Disposition: inline
In-Reply-To: <20150304113429.15c54218@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>

Hi Stephen,

On Wed, Mar 04, 2015 at 11:34:29AM +1100, Stephen Rothwell wrote:
> Hi Lee,
> 
> After merging the mfd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/mfd/mt6397-core.c: In function 'mt6397_irq_domain_map':
> drivers/mfd/mt6397-core.c:124:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
>   set_irq_flags(irq, IRQF_VALID);
>   ^
> drivers/mfd/mt6397-core.c:124:21: error: 'IRQF_VALID' undeclared (first use in this function)
>   set_irq_flags(irq, IRQF_VALID);
>                      ^
> drivers/mfd/mt6397-core.c:124:21: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit 06d1bcedc888 ("mfd: Add support for the MediaTek
> MT6397 PMIC").
> 
> I have used the mfd tree from next-20150303 for today.

Thanks for noting. I have just sent a patch fixing this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
