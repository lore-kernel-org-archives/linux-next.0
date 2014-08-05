From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 slave-dma tree
Date: Tue, 5 Aug 2014 08:29:56 -0700
Message-ID: <20140805152956.GA29841@kroah.com>
References: <20140805162843.054e1383@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43190 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753691AbaHEPa3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2014 11:30:29 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by gateway1.nyi.internal (Postfix) with ESMTP id CF38F21D80
	for <linux-next@vger.kernel.org>; Tue,  5 Aug 2014 11:30:28 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140805162843.054e1383@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Siva Yerramreddy <yshivakrishna@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>

On Tue, Aug 05, 2014 at 04:28:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/dma/Makefile between commit b45b262cefd5 ("dmaengine: add a
> driver for AMBA AXI NBPF DMAC IP cores") from the slave-dma tree and
> commit 95b4ecbf759a ("dma: MIC X100 DMA Driver") from the char-misc
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
