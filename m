From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: manual merge of the renesas tree with the arm-soc
 tree
Date: Tue, 17 Dec 2013 09:19:05 +0900
Message-ID: <20131217001905.GA27171@verge.net.au>
References: <20131216104738.6f845aabd0e3b609ed9ca170@canb.auug.org.au>
 <52AECF56.8020508@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41428 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608Ab3LQATK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2013 19:19:10 -0500
Content-Disposition: inline
In-Reply-To: <52AECF56.8020508@atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Mon, Dec 16, 2013 at 11:00:54AM +0100, Nicolas Ferre wrote:
> On 16/12/2013 00:47, Stephen Rothwell :
> > Hi Simon,
> > 
> > Today's linux-next merge of the renesas tree got a conflict in
> > drivers/clk/Makefile between commit 0ad6125b1579 ("clk: at91: add PMC
> > base support") from the arm-soc tree and commit 10cdfe9f327a ("clk:
> > shmobile: Add R-Car Gen2 clocks support") from the renesas tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Fine for me.

Likewise. Thanks Stephen.
