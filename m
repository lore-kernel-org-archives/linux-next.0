From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree with the kbuild tree
Date: Tue, 28 Mar 2017 10:37:49 +1100
Message-ID: <20170328103749.2cfe8828@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55139 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753074AbdC0XiJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Mar 2017 19:38:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/include/uapi/asm/Kbuild

between commit:

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree and commit:

  916cda1aa1b4 ("s390: add a system call for guarded storage")

from the s390 tree.

I fixed it up (the form should supercede the latter, so I used the former)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
