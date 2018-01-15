From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 16 Jan 2018 10:31:39 +1100
Message-ID: <20180116103139.2849da57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751066AbeAOXbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jan 2018 18:31:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, William Tu <u9012063@gmail.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/openvswitch/flow_netlink.c

between commit:

  95a332088ecb ("Revert "openvswitch: Add erspan tunnel support."")

from the net tree and commit:

  1d7e2ed22f8d ("net: erspan: refactor existing erspan code")

from the net-next tree.

I fixed it up (I removed the bits of code rmeoved by the former that
were updated in the latter) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



-- 
Cheers,
Stephen Rothwell
