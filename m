From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the usb tree
Date: Mon, 19 Oct 2015 17:03:56 +1100
Message-ID: <20151019170356.32dee225@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48559 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750904AbbJSGD6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Oct 2015 02:03:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>, Christoph Hellwig <hch@lst.de>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/usb/host/fusbh200-hcd.c

between commit:

  34e51ba6b65b ("usb-host: Remove fusbh200 driver")

from the usb tree and patch:

   "dma: remove external references to dma_supported"

from the akpm tree.

I fixed it up (the former removed the file, so I did that) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
