From: Vignesh R <vigneshr@ti.com>
Subject: Re: linux-next: build warning after merge of the spi tree
Date: Mon, 27 Mar 2017 11:03:08 +0530
Message-ID: <82070773-ba5f-aeeb-517a-18b0a2f550a2@ti.com>
References: <20170327134112.69ff893d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:18097 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751902AbdC0FeI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Mar 2017 01:34:08 -0400
In-Reply-To: <20170327134112.69ff893d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



On Monday 27 March 2017 08:11 AM, Stephen Rothwell wrote:
> Hi Mark,
> 
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/spi/spi-ti-qspi.c: In function 'ti_qspi_dma_xfer':
> drivers/spi/spi-ti-qspi.c:398:21: warning: unused variable 'dma_dev' [-Wunused-variable]
>   struct dma_device *dma_dev = chan->device;
>                      ^
> 
> Introduced by commit
> 
>   1351aaeb50b2 ("spi: spi-ti-qspi: Use dma_engine wrapper for dma memcpy call")
> 

Sorry, I have posted a fix for the same.

-- 
Regards
Vignesh
