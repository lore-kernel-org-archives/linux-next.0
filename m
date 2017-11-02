From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Thu, 2 Nov 2017 18:37:42 +1100
Message-ID: <20171102183742.53cc8fcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750836AbdKBHho (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 03:37:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@techsingularity.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, "David S. Miller" <davem@davemloft.net>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/net/ethernet/netronome/nfp/nfp_net_common.c

between commit:

  5f0ca2fb71e2 ("nfp: handle page allocation failures")

from Linus' tree and commit:

  0432d14c45bb ("mm: remove __GFP_COLD")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index eddf850a6a7f,6364c9a7a372..000000000000
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@@ -1180,14 -1180,10 +1180,14 @@@ static void *nfp_net_rx_alloc_one(struc
  {
  	void *frag;
  
 -	if (!dp->xdp_prog)
 +	if (!dp->xdp_prog) {
  		frag = netdev_alloc_frag(dp->fl_bufsz);
 -	else
 -		frag = page_address(alloc_page(GFP_KERNEL));
 +	} else {
 +		struct page *page;
 +
- 		page = alloc_page(GFP_KERNEL | __GFP_COLD);
++		page = alloc_page(GFP_KERNEL);
 +		frag = page ? page_address(page) : NULL;
 +	}
  	if (!frag) {
  		nn_dp_warn(dp, "Failed to alloc receive page frag\n");
  		return NULL;
@@@ -1207,14 -1203,10 +1207,14 @@@ static void *nfp_net_napi_alloc_one(str
  {
  	void *frag;
  
 -	if (!dp->xdp_prog)
 +	if (!dp->xdp_prog) {
  		frag = napi_alloc_frag(dp->fl_bufsz);
 -	else
 -		frag = page_address(alloc_page(GFP_ATOMIC));
 +	} else {
 +		struct page *page;
 +
- 		page = alloc_page(GFP_ATOMIC | __GFP_COLD);
++		page = alloc_page(GFP_ATOMIC);
 +		frag = page ? page_address(page) : NULL;
 +	}
  	if (!frag) {
  		nn_dp_warn(dp, "Failed to alloc receive page frag\n");
  		return NULL;
