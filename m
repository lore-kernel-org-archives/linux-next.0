From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Thu, 28 Jul 2016 11:50:05 +1000
Message-ID: <20160728115005.31536fcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42042 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752762AbcG1BuH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2016 21:50:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>

Hi Michal,

Today's linux-next merge of the kbuild tree got a conflict in:

  Makefile

between commits:

  6e8d666e9253 ("Disable "maybe-uninitialized" warning globally")

from Linus' tree and commits:

  543c37cb1650 ("Add sancov plugin")

from the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Makefile
index d384848478b9,edd7af68411f..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -370,8 -370,8 +370,8 @@@ LDFLAGS_MODULE  
  CFLAGS_KERNEL	=
  AFLAGS_KERNEL	=
  LDFLAGS_vmlinux =
 -CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
 +CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im
- CFLAGS_KCOV	= -fsanitize-coverage=trace-pc
+ CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
  
  
  # Use USERINCLUDE when you must reference the UAPI directories only.
