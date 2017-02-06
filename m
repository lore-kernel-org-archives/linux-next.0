From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the net-next tree
Date: Mon, 6 Feb 2017 12:46:27 +1100
Message-ID: <20170206124627.6d7e2543@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45689 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751532AbdBFBqa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Feb 2017 20:46:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Pirko <jiri@mellanox.com>, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  lib/Kconfig

between commit:

  44091d29f207 ("lib: Introduce priority array area manager")

from the net-next tree and commit:

  cf4a7207b1cb ("lib: Add a simple prime number generator")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc lib/Kconfig
index 5d644f180fe5,1788a1f50d28..000000000000
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@@ -550,7 -550,11 +550,14 @@@ config STACKDEPO
  config SBITMAP
  	bool
  
 +config PARMAN
 +	tristate "parman"
 +
+ config PRIME_NUMBERS
+ 	tristate "Prime number generator"
+ 	default n
+ 	help
+ 	  Provides a helper module to generate prime numbers. Useful for writing
+ 	  test code, especially when checking multiplication and divison.
+ 
  endmenu
