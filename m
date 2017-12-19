From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xtensa tree with Linus' tree
Date: Tue, 19 Dec 2017 11:32:29 +1100
Message-ID: <20171219113229.29dc8cd1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55377 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759627AbdLSAcb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Dec 2017 19:32:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Adam Borowski <kilobyte@angband.pl>, Jonathan Corbet <corbet@lwn.net>

Hi Max,

Today's linux-next merge of the xtensa tree got a conflict in:

  Documentation/features/debug/KASAN/arch-support.txt

between commit:

  d19cd4bb2343 ("Documentation/features/KASAN: mark KASAN as supported only on 64-bit on x86")

from Linus' tree and commit:

  c633544a6154 ("xtensa: add support for KASAN")

from the xtensa tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

7d580ca2ecda7312f7f328dd64ec34bf75e811f5
diff --cc Documentation/features/debug/KASAN/arch-support.txt
index f377290fe48e,8abb013db8d1..3406fae833c3
--- a/Documentation/features/debug/KASAN/arch-support.txt
+++ b/Documentation/features/debug/KASAN/arch-support.txt
@@@ -34,6 -34,6 +34,6 @@@
      |        tile: | TODO |
      |          um: | TODO |
      |   unicore32: | TODO |
 -    |         x86: |  ok  |
 +    |         x86: |  ok  | 64-bit only
-     |      xtensa: | TODO |
+     |      xtensa: |  ok  |
      -----------------------
