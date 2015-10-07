From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the usb tree
Date: Wed, 7 Oct 2015 15:26:08 +1100
Message-ID: <20151007152608.2ba8f7a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57151 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750725AbbJGE0K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 00:26:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>, Mel Gorman <mgorman@techsingularity.net>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/usb/host/u132-hcd.c

between commit:

  d5f9e73309b7 ("USB: u132-hcd: Fix seperate word in printk message")

from the usb tree and commit:

  ac4f832eb227 ("mm, page_alloc: distinguish between being unable to sleep, unwilling to sleep and avoiding waking kswapd")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/host/u132-hcd.c
index 0a94895a358d,67b3b9d9dfd1..000000000000
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@@ -2244,8 -2244,9 +2244,8 @@@ static int u132_urb_enqueue(struct usb_
  {
  	struct u132 *u132 = hcd_to_u132(hcd);
  	if (irqs_disabled()) {
- 		if (__GFP_WAIT & mem_flags) {
+ 		if (gfpflags_allow_blocking(mem_flags)) {
 -			printk(KERN_ERR "invalid context for function that migh"
 -				"t sleep\n");
 +			printk(KERN_ERR "invalid context for function that might sleep\n");
  			return -EINVAL;
  		}
  	}
