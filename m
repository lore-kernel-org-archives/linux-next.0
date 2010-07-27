From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the genesis tree
Date: Tue, 27 Jul 2010 14:34:30 +1000
Message-ID: <20100727143430.05c018fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54287 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750811Ab0G0Eef (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Jul 2010 00:34:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Feng Tang <feng.tang@intel.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Paul Mundt <lethal@linux-sh.org>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in
include/linux/serial_core.h between commit
75b93489b449db4a34f0424c72f51821d985f52f ("serial: add a new port type,
found on some sh-mobile SoCs") from the genesis tree and commit
c3190cf68dfc58c33de0fd59b919cbb864acbba4 ("hsu: driver for Medfield High
Speed UART device") from the tty tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/serial_core.h
index 5228320,f8fce35..0000000
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@@ -186,9 -186,12 +186,15 @@@
  #define PORT_ALTERA_JTAGUART	91
  #define PORT_ALTERA_UART	92
  
 +/* SH-SCI */
 +#define PORT_SCIFB	93
 +
+ /* MAX3107 */
+ #define PORT_MAX3107	94
+ 
+ /* High Speed UART for Medfield */
+ #define PORT_MFD	95
+ 
  #ifdef __KERNEL__
  
  #include <linux/compiler.h>
