From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the imx-mxs tree
Date: Wed, 12 Aug 2015 13:22:39 +1000
Message-ID: <20150812132239.0ce1fe80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59848 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932684AbbHLDWn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Aug 2015 23:22:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Victoria Milhoan <vicki.milhoan@freescale.com>, Shengjiu Wang <shengjiu.wang@freescale.com>

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm/configs/imx_v6_v7_defconfig

between commit:

  351265f46291 ("ARM: imx_v6_v7_defconfig: build in audio driver")

from the imx-mxs tree and commit:

  ab86ca0755ec ("ARM: imx_v6_v7_defconfig: Select CAAM")

from the crypto tree.

I fixed it up (they both removed the same line) and can carry the fix
as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
