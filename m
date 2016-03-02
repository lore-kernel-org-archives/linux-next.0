From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the samsung-krzk tree with the omap
 tree
Date: Thu, 03 Mar 2016 08:40:52 +0900
Message-ID: <56D77A04.1090802@samsung.com>
References: <20160303091631.1ef24e87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46322 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752950AbcCBXlA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Mar 2016 18:41:00 -0500
In-reply-to: <20160303091631.1ef24e87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tony Lindgren <tony@atomide.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>

On 03.03.2016 07:16, Stephen Rothwell wrote:
> Hi Krzysztof,
> 
> Today's linux-next merge of the samsung-krzk tree got a conflict in:
> 
>   drivers/clk/Kconfig
> 
> between commit:
> 
>   21330497f303 ("clk: ti: Add support for dm814x ADPLL")
> 
> from the omap tree and commit:
> 
>   b9e65ebc654d ("clk: Move vendor's Kconfig into CCF menu section")
> 
> from the samsung-krzk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Thanks!

The conflicting commit actually comes from clk tree, merged here as a
dependency for other patches.

Best regards,
Krzysztof
