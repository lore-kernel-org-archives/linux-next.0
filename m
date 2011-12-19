From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Mon, 19 Dec 2011 09:32:36 +0800
Message-ID: <20111219013235.GA4962@S2100-06.ap.freescale.net>
References: <20111219105548.d30839e148800b38bc93d001@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]:12156
	"EHLO AM1EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752053Ab1LSBTa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Dec 2011 20:19:30 -0500
Content-Disposition: inline
In-Reply-To: <20111219105548.d30839e148800b38bc93d001@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Russell King <rmk@arm.linux.org.uk>, Richard Zhao <richard.zhao@linaro.org>

On Mon, Dec 19, 2011 at 10:55:48AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
Hi Stephen,

> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-imx/mach-imx6q.c between commit 1237f0f6ecf6 ("ARM: 7198/1:
> arm/imx6: add restart support for imx6q") from the arm tree and commit
> 477fce49aef4 ("arm/imx6q-sabrelite: add enet phy ksz9021rn fixup") from
> the arm-soc tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

It looks all right.  Thanks.

-- 
Regards,
Shawn
