From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the renesas tree with the arm-soc
 tree
Date: Mon, 16 Dec 2013 11:00:54 +0100
Message-ID: <52AECF56.8020508@atmel.com>
References: <20131216104738.6f845aabd0e3b609ed9ca170@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:50254 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751877Ab3LPKA4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2013 05:00:56 -0500
In-Reply-To: <20131216104738.6f845aabd0e3b609ed9ca170@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simon Horman <horms@verge.net.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Mike Turquette <mturquette@linaro.org>

On 16/12/2013 00:47, Stephen Rothwell :
> Hi Simon,
> 
> Today's linux-next merge of the renesas tree got a conflict in
> drivers/clk/Makefile between commit 0ad6125b1579 ("clk: at91: add PMC
> base support") from the arm-soc tree and commit 10cdfe9f327a ("clk:
> shmobile: Add R-Car Gen2 clocks support") from the renesas tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Fine for me.

Thanks. Bye,
-- 
Nicolas Ferre
