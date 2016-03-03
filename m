From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the samsung-krzk tree with the omap
 tree
Date: Thu, 3 Mar 2016 08:32:13 -0800
Message-ID: <20160303163213.GG4469@atomide.com>
References: <20160303091631.1ef24e87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:47912 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751530AbcCCQcR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 11:32:17 -0500
Content-Disposition: inline
In-Reply-To: <20160303091631.1ef24e87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>

* Stephen Rothwell <sfr@canb.auug.org.au> [160302 14:16]:
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

Thanks yes that's correct thanks!

Regards,

Tony
