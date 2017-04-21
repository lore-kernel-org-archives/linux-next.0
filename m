From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the jc_docs tree
Date: Fri, 21 Apr 2017 14:28:23 +1000
Message-ID: <20170421142823.16997ef9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  Documentation/media/v4l-drivers/philips.rst

between commit:

  9b06f754133c ("convert philips.txt to ReST and add to media docs")

from the jc_docs tree and commit:

  21470e32ca7f ("usb: fix some references for /proc/bus/usb")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/media/v4l-drivers/philips.rst
index 620bcfea7af0,be8c80eff374..000000000000
--- a/Documentation/media/v4l-drivers/philips.rst
+++ b/Documentation/media/v4l-drivers/philips.rst
@@@ -145,8 -140,8 +145,8 @@@ dev_hin
  
     A camera is specified by its type (the number from the camera model,
     like PCA645, PCVC750VC, etc) and optionally the serial number (visible
-    in /proc/bus/usb/devices). A hint consists of a string with the following
+    in /sys/kernel/debug/usb/devices). A hint consists of a string with the following
 -   format:
 +   format::
  
        [type[.serialnumber]:]node
  
