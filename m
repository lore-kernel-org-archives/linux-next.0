From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Thu, 21 Jan 2016 09:40:22 +1100
Message-ID: <20160121094022.33e25d08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34229 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752918AbcATWkY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2016 17:40:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  MAINTAINERS

between commit:

  4a121096db9c ("MAINTAINERS: Update mailing list for Renesas SoC Development")

from Linus' tree and commit:

  804b0d7011ee ("MAINTAINERS: Remove link to oss.renesas.com which is closed")

from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc MAINTAINERS
index 5461ecc147dc,0939ce1bdb71..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -1531,9 -1526,8 +1541,8 @@@ F:	drivers/media/platform/s5p-jpeg
  ARM/SHMOBILE ARM ARCHITECTURE
  M:	Simon Horman <horms@verge.net.au>
  M:	Magnus Damm <magnus.damm@gmail.com>
 -L:	linux-sh@vger.kernel.org
 -Q:	http://patchwork.kernel.org/project/linux-sh/list/
 +L:	linux-renesas-soc@vger.kernel.org
- W:	http://oss.renesas.com
 +Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
  S:	Supported
  F:	arch/arm/boot/dts/emev2*
