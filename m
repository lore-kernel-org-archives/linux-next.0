From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 18 Apr 2016 11:30:38 +1000
Message-ID: <20160418113038.00d78799@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50847 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbcDRBal (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Apr 2016 21:30:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/dsa/mv88e6xxx.c

between commit:

  207afda1b503 ("net: dsa: mv88e6xxx: share the same default FDB")

from the net tree and commit:

  009a2b9843bf ("net: dsa: mv88e6xxx: add number of ports to info")

from the net-next tree.

I fixed it up (the former removed some of the code updated by the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
