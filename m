From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the net tree
Date: Fri, 10 Feb 2017 18:27:14 +1100
Message-ID: <20170210182714.0a186a25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751515AbdBJH1S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Feb 2017 02:27:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Stefan =?UTF-8?B?QnLDvG5z?= <stefan.bruens@rwth-aachen.de>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/net/usb/sierra_net.c

between commit:

  5a70348e1187 ("sierra_net: Add support for IPv6 and Dual-Stack Link Sense Indications")

from the net tree and patch:

  "lib/vsprintf.c: remove %Z support"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/usb/sierra_net.c
index d9440bc022f2,88ace5024306..000000000000
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@@ -376,11 -349,11 +376,11 @@@ static inline int sierra_net_is_valid_a
  static int sierra_net_parse_lsi(struct usbnet *dev, char *data, int datalen)
  {
  	struct lsi_umts *lsi = (struct lsi_umts *)data;
 +	u32 expected_length;
  
 -	if (datalen < sizeof(struct lsi_umts)) {
 -		netdev_err(dev->net, "%s: Data length %d, exp %zu\n",
 -				__func__, datalen,
 -				sizeof(struct lsi_umts));
 +	if (datalen < sizeof(struct lsi_umts_single)) {
- 		netdev_err(dev->net, "%s: Data length %d, exp >= %Zu\n",
++		netdev_err(dev->net, "%s: Data length %d, exp >= %zu\n",
 +			   __func__, datalen, sizeof(struct lsi_umts_single));
  		return -1;
  	}
  
