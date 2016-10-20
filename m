From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Oct 2016 11:01:42 +1100
Message-ID: <20161020110142.41162709@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752018AbcJTABp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Oct 2016 20:01:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ido Schimmel <idosch@mellanox.com>, David Ahern <dsa@cumulusnetworks.com>

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  include/linux/netdevice.h
  net/core/dev.c

between commit:

  e4961b076885 ("net: core: Correctly iterate over lower adjacency list")

from the net tree and commit:

  1a3f060c1a47 ("net: Introduce new api for walking upper and lower devices")
  f1170fd462c6 ("net: Remove all_adj_list and its references")

from the net-next tree.

I fixed it up (I just used the net-next tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
