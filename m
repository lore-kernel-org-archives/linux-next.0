From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfs tree with Linus' tree
Date: Wed, 3 May 2017 10:07:02 +1000
Message-ID: <20170503100702.2defccb8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750819AbdECAHF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 20:07:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>, =?UTF-8?B?SMOldmFyZA==?= Skinnemoen <hskinnemoen@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Christoph Hellwig <hch@lst.de>

Hi Trond,

Today's linux-next merge of the nfs tree got a conflict in:

  Documentation/admin-guide/kernel-parameters.txt

between commit:

  c0c74acbb60b ("docs: remove all references to AVR32 architecture")

from Linus' tree and commit:

  6d22323b2e9f ("nfs: remove the objlayout driver")

from the nfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/admin-guide/kernel-parameters.txt
index 8d676d2a48ac,17156d66b124..000000000000
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@@ -2419,13 -2419,7 +2419,7 @@@
  			and gids from such clients.  This is intended to ease
  			migration from NFSv2/v3.
  
- 	objlayoutdriver.osd_login_prog=
- 			[NFS] [OBJLAYOUT] sets the pathname to the program which
- 			is used to automatically discover and login into new
- 			osd-targets. Please see:
- 			Documentation/filesystems/pnfs.txt for more explanations
- 
 -	nmi_debug=	[KNL,AVR32,SH] Specify one or more actions to take
 +	nmi_debug=	[KNL,SH] Specify one or more actions to take
  			when a NMI is triggered.
  			Format: [state][,regs][,debounce][,die]
  
