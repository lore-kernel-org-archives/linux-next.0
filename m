From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the powerpc tree
Date: Tue, 2 Aug 2016 13:39:54 +1000
Message-ID: <20160802133954.00eac68c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40071 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933482AbcHBDj5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Aug 2016 23:39:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Hao <haokexin@gmail.com>, Jason Baron <jbaron@akamai.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  kernel/jump_label.c

between commit:

  e3f91083facb ("jump_label: Make it possible for arches to invoke jump_label_init() earlier")

from the powerpc tree and patch:

   "jump_label: remove bug.h, atomic.h dependencies for HAVE_JUMP_LABEL"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/jump_label.c
index 85b7105fdd86,20400055f177..000000000000
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@@ -235,9 -279,15 +279,18 @@@ void __init jump_label_init(void
  	struct static_key *key = NULL;
  	struct jump_entry *iter;
  
+ 	/*
+ 	 * Since we are initializing the static_key.enabled field with
+ 	 * with the 'raw' int values (to avoid pulling in atomic.h) in
+ 	 * jump_label.h, let's make sure that is safe. There are only two
+ 	 * cases to check since we initialize to 0 or 1.
+ 	 */
+ 	BUILD_BUG_ON((int)ATOMIC_INIT(0) != 0);
+ 	BUILD_BUG_ON((int)ATOMIC_INIT(1) != 1);
+ 
 +	if (static_key_initialized)
 +		return;
 +
  	jump_label_lock();
  	jump_label_sort_entries(iter_start, iter_stop);
  
