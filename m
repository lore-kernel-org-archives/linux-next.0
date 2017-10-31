From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Date: Wed, 1 Nov 2017 10:35:37 +1100
Message-ID: <20171101103537.04a67581@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Hi Jon,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/process/index.rst

between commit:

  9ed95129ffca ("Documentation: Add a file explaining the Linux kernel license enforcement policy")

from Linus' tree and commit:

  13277782dd4b ("Documentation: add Kernel Driver Statement to the kernel")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/process/index.rst
index 61e43cc3ed17,68454319f006..000000000000
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@@ -25,7 -25,7 +25,8 @@@ Below are the essential guides that eve
     submitting-patches
     coding-style
     email-clients
 +   kernel-enforcement-statement
+    kernel-driver-statement
  
  Other guides to the community that are of interest to most developers are: 
  
