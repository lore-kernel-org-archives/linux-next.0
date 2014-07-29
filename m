From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 slave-dma tree
Date: Tue, 29 Jul 2014 08:36:07 -0700
Message-ID: <20140729153607.GA10174@kroah.com>
References: <20140729173824.51e94ce2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:46796 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752010AbaG2Pgi (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2014 11:36:38 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by gateway1.nyi.internal (Postfix) with ESMTP id 59CA222C51
	for <linux-next@vger.kernel.org>; Tue, 29 Jul 2014 11:36:35 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140729173824.51e94ce2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Siva Yerramreddy <yshivakrishna@gmail.com>

On Tue, Jul 29, 2014 at 05:38:24PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/dma/Makefile between commit 555859308723 ("dmaengine: sun6i:
> Add driver for the Allwinner A31 DMA controller") from the slave-dma tree and
> commit 95b4ecbf759a ("dma: MIC X100 DMA Driver") from the char-misc
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
