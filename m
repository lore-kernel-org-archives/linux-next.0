From: Jiada Wang <jiada_wang@mentor.com>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Tue, 23 May 2017 20:29:51 -0700
Message-ID: <5924FE2F.4000508@mentor.com>
References: <20170524110825.4bba38b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42129 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758118AbdEXD35 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 May 2017 23:29:57 -0400
In-Reply-To: <20170524110825.4bba38b1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>

Hi Mark
   
since commit 8d4a6cad7adb ("spi: imx: dynamic burst length adjust for PIO mode
")
has been reverted, then
commit 1ce1c618e6b5 ("spi: imx: only allow dynamic burst in PIO mode")
need to be reverted as well.

I can submit another version of patch set, with all founded issues be addressed
after that.

Thanks,
Jiada



On 05/23/2017 06:08 PM, Stephen Rothwell wrote:
> Hi Mark,
>
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> drivers/spi/spi-imx.c: In function 'spi_imx_can_dma':
> drivers/spi/spi-imx.c:241:9: error: 'struct spi_imx_data' has no member named 'dynamic_burst'
>    spi_imx->dynamic_burst = 0;
>           ^
>
> Caused by commit
>
>    09b3ed2d5916 ("spi: imx: Revert "spi: imx: dynamic burst length adjust for PIO mode"")
>
> interacting with commit
>
>    1ce1c618e6b5 ("spi: imx: only allow dynamic burst in PIO mode")
>
> from a separate topic branch and not fixing it up in the merge. Although
> that second commit could never have built anyway on its own :-(
>
> I have used the spi tree from next-20170523 for today.
>
