From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the imx-mxs tree
Date: Wed, 12 Aug 2015 13:18:30 +0800
Message-ID: <20150812051830.GB6258@gondor.apana.org.au>
References: <20150812132239.0ce1fe80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:48599 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753873AbbHLFSo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 01:18:44 -0400
Content-Disposition: inline
In-Reply-To: <20150812132239.0ce1fe80@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Victoria Milhoan <vicki.milhoan@freescale.com>, Shengjiu Wang <shengjiu.wang@freescale.com>

On Wed, Aug 12, 2015 at 01:22:39PM +1000, Stephen Rothwell wrote:
> 
> Today's linux-next merge of the crypto tree got a conflict in:
> 
>   arch/arm/configs/imx_v6_v7_defconfig
> 
> between commit:
> 
>   351265f46291 ("ARM: imx_v6_v7_defconfig: build in audio driver")
> 
> from the imx-mxs tree and commit:
> 
>   ab86ca0755ec ("ARM: imx_v6_v7_defconfig: Select CAAM")
> 
> from the crypto tree.
> 
> I fixed it up (they both removed the same line) and can carry the fix
> as necessary (no action is required).

Thanks Stephen.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
