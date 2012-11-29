From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 slave-dma tree
Date: Thu, 29 Nov 2012 09:16:06 +0530
Message-ID: <CAKohpokZJqEvpDcZ8nf2d6DB1JXb=LB-8LY9OqT8REf0KjAOuQ@mail.gmail.com>
References: <20121129144042.add4ee11c35fa8d5f5876282@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:48890 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755939Ab2K2DqH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Nov 2012 22:46:07 -0500
Received: by mail-ob0-f174.google.com with SMTP id wc20so12651306obb.19
        for <linux-next@vger.kernel.org>; Wed, 28 Nov 2012 19:46:06 -0800 (PST)
In-Reply-To: <20121129144042.add4ee11c35fa8d5f5876282@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Vinod Koul <vinod.koul@intel.com>

On 29 November 2012 09:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> diff --cc drivers/dma/dw_dmac.c

>  +#ifdef CONFIG_OF
>  +static struct dw_dma_platform_data *
>  +__devinit dw_dma_parse_dt(struct platform_device *pdev)

Do we need a separate patch to fix this place? I believe yes.

> - static int __devinit dw_probe(struct platform_device *pdev)
> + static int dw_probe(struct platform_device *pdev)

Thanks for this.
