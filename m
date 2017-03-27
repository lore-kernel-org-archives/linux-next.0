From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with the input-current
 tree
Date: Tue, 28 Mar 2017 09:55:32 +1100
Message-ID: <20170328095532.04abad61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40665 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752503AbdC0W4U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Mar 2017 18:56:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Naohiro Aota <naota@elisp.net>

Hi Masahiro,

Today's linux-next merge of the kbuild tree got a conflict in:

  include/uapi/linux/Kbuild

between commit:

  5659495a7a14 ("uapi: add missing install of userio.h")

from the input-current tree and commit:

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree.

I fixed it up (the latter supercedes the former, so I just used it) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
