From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the jc_docs
 tree
Date: Tue, 13 Jun 2017 16:23:41 +1000
Message-ID: <20170613162341.627e2095@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55235 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752294AbdFMGXn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 02:23:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever <andreas.noever@gmail.com>

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  Documentation/admin-guide/index.rst

between commit:

  504f231cda56 ("doc: ReSTify and split LSM.txt")

from the jc_docs tree and commit:

  163f15115203 ("thunderbolt: Add documentation how Thunderbolt bus can be used")

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

diff --cc Documentation/admin-guide/index.rst
index e14c374aaf60,6d99a7ce6e21..000000000000
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@@ -61,7 -61,7 +61,8 @@@ configure specific aspects of kernel be
     java
     ras
     pm/index
 +   LSM/index
+    thunderbolt
  
  .. only::  subproject and html
  
