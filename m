From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the net-next tree
Date: Fri, 21 Oct 2016 12:21:45 +1100
Message-ID: <20161021122145.0139d5a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33737 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753574AbcJUBVr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Oct 2016 21:21:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarod Wilson <jarod@redhat.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/wlan-ng/p80211netdev.c

between commit:

  9c22b4a34edd ("net: use core MTU range checking in wireless drivers")

from the net-next tree and commit:

  84ad1efa7d2b ("staging: wlan-ng: fix block comment warnings in p80211netdev.c")

from the staging tree.

I fixed it up (the former removed the code updates by the latter, so I
just did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
