From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input tree with the jc_docs tree
Date: Thu, 6 Apr 2017 11:06:12 +1000
Message-ID: <20170406110612.7156f854@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755924AbdDFBGO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Apr 2017 21:06:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Kepplinger <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@s-opensource.com>

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  Documentation/input/ff.rst

between commit:

  1e4390ae1015 ("Documentation: input: fix path to struct ff_effect's definition")

from the jc_docs tree and commit:

  deeb1e902fbc ("Input: use svg files instead of xfig in force feedback documentation")

from the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/input/ff.rst
index be742eec7aab,c30f185216a0..000000000000
--- a/Documentation/input/ff.rst
+++ b/Documentation/input/ff.rst
@@@ -106,13 -126,24 +126,24 @@@ allocate a new effect
  
  Effects are file descriptor specific.
  
- See <uapi/linux/input.h> for a description of the ff_effect struct. You should
- also find help in a few sketches, contained in files shape.fig and
- interactive.fig. You need xfig to visualize these files.
 -See <linux/input.h> for a description of the ff_effect struct. You should also
++See <uapi/linux/input.h> for a description of the ff_effect struct. You should also
+ find help in a few sketches, contained in files shape.svg and interactive.svg:
+ 
+ .. figure:: shape.svg
  
- 3.3 Removing an effect from the device
- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- int ioctl(int fd, EVIOCRMFF, effect.id);
+     Shape
+ 
+ .. figure:: interactive.svg
+ 
+     Interactive
+ 
+ 
+ Removing an effect from the device
+ ----------------------------------
+ 
+ ::
+ 
+     int ioctl(int fd, EVIOCRMFF, effect.id);
  
  This makes room for new effects in the device's memory. Note that this also
  stops the effect if it was playing.
