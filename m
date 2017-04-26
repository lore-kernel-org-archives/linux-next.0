From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the kbuild tree
Date: Wed, 26 Apr 2017 11:09:44 +1000
Message-ID: <20170426110944.3d796e97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1434184AbdDZBKU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Apr 2017 21:10:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Gerard Garcia <ggarcia@abra.uab.cat>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  include/uapi/linux/Kbuild

between commit:

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree and commit:

  0b2e66448ba2 ("VSOCK: Add vsockmon device")

from the net-next tree.

I fixed it up (I just used the kbuild tree version as new entries are not
needed any more in this file) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
