From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Mon, 15 Jan 2018 15:57:10 +1100
Message-ID: <20180115155710.36e146ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54005 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752490AbeAOE5N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 23:57:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/cris/include/arch-v10/arch/bug.h

between commit:

  c8133e59edb0 ("cris: Mark end of BUG() implementation as unreachable")

from the kspp tree and commit:

  c5a1e183a75a ("bug.h: work around GCC PR82365 in BUG()")

from the akpm-current tree.

I fixed it up (I just used the akpm-current tree version) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
