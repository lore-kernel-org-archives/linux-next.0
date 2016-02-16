From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the clk tree with the samsung-krzk tree
Date: Tue, 16 Feb 2016 13:30:05 +0900
Message-ID: <56C2A5CD.9040603@samsung.com>
References: <20160216151131.3e1d4cb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49695 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbcBPEaN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 23:30:13 -0500
In-reply-to: <20160216151131.3e1d4cb5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Liao <jamesjj.liao@mediatek.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On 16.02.2016 13:11, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the clk tree got a conflict in:
> 
>   drivers/clk/Kconfig
>   drivers/clk/samsung/Kconfig
> 
> between commit:
> 
>   fa6439544887 ("clk: samsung: Enable COMPILE_TEST for Samsung clocks")
> 
> from the samsung-krzk tree and commit:
> 
>   b9e65ebc654d ("clk: Move vendor's Kconfig into CCF menu section")
> 
> from the clk tree.
> 
> I fixed it up (they both had similar effects) and can carry the fix as
> necessary (no action is required).

Thanks!

Stephen, Mike,
James' b9e65ebc654d looks like a simpler approach to the same problem -
moving Samsung common clocks under COMMON_CLK.

If you agree I can rebase my patch on top of it so only COMPILE_TEST
would be added.

However my third patch in that set ("arm64: EXYNOS: Consolidate
ARCH_EXYNOS7 symbol into ARCH_EXYNOS" [0]) depends on it, so maybe you
could prepare a tag with everything? James patch + two of mine (also
"clk: samsung: Don't build ARMv8 clock drivers on ARMv7")?

Best regards,
Krzysztof

[0] http://www.spinics.net/lists/devicetree/msg111893.html
