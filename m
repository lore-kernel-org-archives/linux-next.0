From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the arm tree
Date: Tue, 09 Dec 2014 14:38:48 +0100
Message-ID: <1418132328.19339.9.camel@AMDC1943>
References: <20141209140901.685bb382@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15414 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756629AbaLINix (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2014 08:38:53 -0500
In-reply-to: <20141209140901.685bb382@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, Russell King <linux@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>

On wto, 2014-12-09 at 14:09 +1100, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Today's linux-next merge of the slave-dma tree got a conflict in
> drivers/dma/pl330.c between commits ae43b3289186 ("ARM: 8202/1:
> dmaengine: pl330: Add runtime Power Management support v12") and
> b816ccc5c01f ("ARM: 8206/1: dmaengine: pl330: Add PM sleep support")
> from the arm tree and commits 86e15941d3f5 ("dmaengine: pl330: Split
> device_control") and c9a09dacf851 ("dmaengine: pl330: Declare slave
> capabilities for the generic code") from the slave-dma tree.
> 
> I fixed it up (hopefully - see below) and can carry the fix as
> necessary (no action is required).

Looks almost good:
++      pm_runtime_mark_last_busy(pl330->ddma.dev);
++      pm_runtime_put_autosuspend(pl330->ddma.dev);1
                                                    ^here

However I am looking current next (fetched few minutes ago and the one
visible through gitweb) and I can see only mi changes (related to PM
runtime). It looks like slave-dma changes got lost on the way.

Best regards,
Krzysztof
