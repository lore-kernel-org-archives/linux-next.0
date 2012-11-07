From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the samsung tree with the pinctrl tree
Date: Wed, 07 Nov 2012 11:26:36 +0900
Message-ID: <0c4401cdbc8f$4ff0f8b0$efd2ea10$%kim@samsung.com>
References: <20121030144412.4a4a60dc0dace86f1a91af8c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10869 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619Ab2KGC0i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Nov 2012 21:26:38 -0500
In-reply-to: <20121030144412.4a4a60dc0dace86f1a91af8c@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi,

> Today's linux-next merge of the samsung tree got a conflict in
> arch/arm/boot/dts/exynos4210.dtsi between commit a7a8241540c3 ("ARM: dts:
> exynos4210-pinctrl: Add nodes for pin banks") from the pinctrl tree and
> commit 8d4155dbb184 ("ARM: EXYNOS: Add devicetree node for TMU driver for
> exynos4") from the samsung tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
Correct, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
