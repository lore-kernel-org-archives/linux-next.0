From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the samsung-krzk tree
Date: Tue, 16 Feb 2016 15:11:31 +1100
Message-ID: <20160216151131.3e1d4cb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42506 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751706AbcBPELc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 23:11:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Liao <jamesjj.liao@mediatek.com>

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/Kconfig
  drivers/clk/samsung/Kconfig

between commit:

  fa6439544887 ("clk: samsung: Enable COMPILE_TEST for Samsung clocks")

from the samsung-krzk tree and commit:

  b9e65ebc654d ("clk: Move vendor's Kconfig into CCF menu section")

from the clk tree.

I fixed it up (they both had similar effects) and can carry the fix as
necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
