From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nand tree with the jc_docs tree
Date: Tue, 30 May 2017 11:37:23 +1000
Message-ID: <20170530113723.5b7ac9f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59391 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750798AbdE3Bh0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 21:37:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>

Hi Boris,

Today's linux-next merge of the nand tree got a conflict in:

  drivers/mtd/nand/nand_base.c

between commit:

  b6f6c29454d2 ("mtd: adjust kernel-docs to avoid Sphinx/kerneldoc warnings")

from the jc_docs tree and commit:

  c79d63fd272c ("mtd: nand: Remove support for block locking/unlocking")

from the nand tree.

I fixed it up (the latter just removed the code modified by the former,
so I did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
