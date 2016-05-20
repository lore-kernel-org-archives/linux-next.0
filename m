From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with Linus' tree
Date: Fri, 20 May 2016 12:31:51 +1000
Message-ID: <20160520123151.0c8a7c47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54727 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753349AbcETCbx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2016 22:31:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Ralf Baechle <ralf@linux-mips.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  include/uapi/linux/serial_core.h

between commits:

  157b9394709e ("serial: pic32_uart: Add PIC32 UART driver")
  07b75260ebc2 ("Merge branch 'upstream' of git://git.linux-mips.org/pub/scm/ralf/upstream-linus")

from Linus' tree and commit:

  041f031def33 ("serial: mps2-uart: add MPS2 UART driver")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/serial_core.h
index 24da334af7f1,9aef04c5f7bc..000000000000
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@@ -264,7 -264,7 +264,10 @@@
  /* MVEBU UART */
  #define PORT_MVEBU	114
  
 +/* Microchip PIC32 UART */
 +#define PORT_PIC32	115
 +
+ /* MPS2 UART */
 -#define PORT_MPS2UART	115
++#define PORT_MPS2UART	116
+ 
  #endif /* _UAPILINUX_SERIAL_CORE_H */
