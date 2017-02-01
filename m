From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the driver-core
 tree
Date: Wed, 1 Feb 2017 15:28:26 +1100
Message-ID: <20170201152826.3fe2c518@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750917AbdBAE2e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 23:28:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, Alexander Dahl <post@lespocky.de>

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  Documentation/driver-api/index.rst

between commit:

  113ccc38378b ("firmware: revamp firmware documentation")

from the driver-core tree and commit:

  cadf8106661c ("doc: convert UIO howto from docbook to sphinx")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/driver-api/index.rst
index 2359618746ec,c5a1cd0a4ae7..000000000000
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@@ -31,7 -30,7 +31,8 @@@ available subsections can be seen below
     miscellaneous
     vme
     80211/index
 +   firmware/index
+    uio-howto
  
  .. only::  subproject and html
  
