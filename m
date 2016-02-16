From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the staging
 tree
Date: Tue, 16 Feb 2016 14:00:19 +1100
Message-ID: <20160216140019.540886b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45180 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752532AbcBPDAW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 22:00:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Shraddha Barke <shraddha.6596@gmail.com>

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/staging/goldfish/goldfish_nand.c

between commit:

  814625b539d3 ("staging: goldfish: goldfish_nand: Return correct error code")

from the staging tree and commit:

  3e2fbc7feec4 ("Staging: goldfish: goldfish_nand: Add DMA Support using dmam_alloc_coherent")

from the char-misc tree.

I fixed it up (the latter incorporated the former) and can carry the
fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
