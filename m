From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 29 Nov 2016 11:22:32 +1100
Message-ID: <20161129112232.333d3363@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42013 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751726AbcK2AWf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Nov 2016 19:22:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/amd/xgbe/xgbe-main.c

between commit:

  91eefaabf102 ("amd-xgbe: Fix unused suspend handlers build warning")

from the net tree and commit:

  bd8255d8ba35 ("amd-xgbe: Prepare for supporting PCI devices")

from the net-next tree.

I fixed it up (the latter removed the code modified by the former)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
