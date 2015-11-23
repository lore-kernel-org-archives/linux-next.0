From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the clockevents tree with the
 samsung-krzk tree
Date: Mon, 23 Nov 2015 10:45:39 +0900
Message-ID: <56526FC3.3040009@samsung.com>
References: <20151123122247.23eb6f3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45260 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753060AbbKWBpr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 22 Nov 2015 20:45:47 -0500
In-reply-to: <20151123122247.23eb6f3d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>

On 23.11.2015 10:22, Stephen Rothwell wrote:
> Hi Daniel,
> 
> Today's linux-next merge of the clockevents tree got a conflict in:
> 
>   arch/arm/mach-exynos/Kconfig
> 
> between commit:
> 
>   23067d397616 ("ARM: EXYNOS: Switch to syscon reboot and poweroff")
> 
> from the samsung-krzk tree and commit:
> 
>   b21f38ccbc1d ("clocksource/drivers/exynos_mct: Fix Kconfig and add COMPILE_TEST option")
> 
> from the clockevents tree.
> 
> OK, so these entries were sorted at one point for a reason :-(
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks, merge fix looks good. Indeed we should have put them in
alphabetical order.

Best regards,
Krzysztof
