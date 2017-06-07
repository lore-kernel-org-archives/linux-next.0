From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kselftest tree with the jc_docs
 tree
Date: Wed, 7 Jun 2017 14:39:24 +1000
Message-ID: <20170607143924.708d9451@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750831AbdFGEj2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jun 2017 00:39:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>

Hi Shuah,

Today's linux-next merge of the kselftest tree got a conflict in:

  Documentation/dev-tools/index.rst

between commit:

  7fb2e8a49037 ("docs-rst: convert kgdb DocBook to ReST")

from the jc_docs tree and commit:

  5714b6531b49 ("Documentation/dev-tools: Use reStructuredText markups for kselftest")

from the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/dev-tools/index.rst
index 4ac991dbddb7,e50054c6aeaa..000000000000
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@@ -23,7 -23,7 +23,8 @@@ whole; patches welcome
     kmemleak
     kmemcheck
     gdb-kernel-debugging
 +   kgdb
+    kselftest
  
  
  .. only::  subproject and html
