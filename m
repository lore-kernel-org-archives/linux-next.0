From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the clk tree with Linus' tree
Date: Wed, 29 Jan 2014 09:53:18 +0100
Message-ID: <52E8C17E.4050002@atmel.com>
References: <20140129142551.6e6e27fc1a9440c762370af1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:24618 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268AbaA2IxX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jan 2014 03:53:23 -0500
In-Reply-To: <20140129142551.6e6e27fc1a9440c762370af1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>

On 29/01/2014 04:25, Stephen Rothwell :
> Hi Mike,
> 
> Today's linux-next merge of the clk tree got a conflict in
> drivers/clk/Makefile between commit 0ad6125b1579 ("clk: at91: add PMC
> base support") from Linus' tree and commit fd3fdaf09f26 ("clk: sort
> Makefile") from the clk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Your fix is correct. Thanks Stephen.

Best regards,
-- 
Nicolas Ferre
