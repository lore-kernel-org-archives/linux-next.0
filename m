From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the arm-soc tree with the pinctrl tree
Date: Thu, 20 Dec 2012 19:38:53 -0800
Message-ID: <027101cddf2c$b4f2f9b0$1ed8ed10$@samsung.com>
References: <20121221132014.0bf8772fb3e48c51cec1548a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33945 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750875Ab2LUDjC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Dec 2012 22:39:02 -0500
In-reply-to: <20121221132014.0bf8772fb3e48c51cec1548a@canb.auug.org.au>
Content-language: en-us
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Axel Lin' <axel.lin@ingics.com>, 'Linus Walleij' <linus.walleij@linaro.org>

Stephen Rothwell wrote:
> 
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got conflicts in
> drivers/pinctrl/pinctrl-exynos5440.c and
> drivers/pinctrl/pinctrl-samsung.c between commit e5b4c9d4ab55 ("pinctrl:
> exynos5440: Fix compile error in pinctrl-exynos5440/samsung.c") from the
> pinctrl tree and commit d5fd5da290ce ("pinctrl: exynos5440/samsung:
> Staticize pcfgs") from the arm-soc tree.
> 
Oops, the commit d5fd5da290ce already sent to Linus Torvalds via arm-soc
tree today. In addition, I applied with Linus Walleij's ack ;-)

Linus Walleij, please drop the patch in your tree. Sorry I didn't notify
about that when I got the patch from Choi.

Thanks.

- Kukjin

> The former is a superset of the latter, so I used that (no action
> is required).
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
