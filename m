From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the s390 tree
Date: Mon, 5 Sep 2016 14:56:15 +1000
Message-ID: <20160905145615.5423e1ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750720AbcIEE4T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 00:56:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gayatri Kammela <gayatri.kammela@intel.com>, Megha Dey <megha.dey@linux.intel.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  include/linux/raid/pq.h

between commit:

  f5b55fa1f81d ("RAID/s390: provide raid6 recovery optimization")

from the s390 tree and commit:

  a5e49b04af05 ("lib/raid6: Add AVX512 optimized recovery functions")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/raid/pq.h
index 395a4c674168,1abd89584568..000000000000
--- a/include/linux/raid/pq.h
+++ b/include/linux/raid/pq.h
@@@ -102,8 -102,10 +102,11 @@@ extern const struct raid6_calls raid6_a
  extern const struct raid6_calls raid6_avx2x1;
  extern const struct raid6_calls raid6_avx2x2;
  extern const struct raid6_calls raid6_avx2x4;
+ extern const struct raid6_calls raid6_avx512x1;
+ extern const struct raid6_calls raid6_avx512x2;
+ extern const struct raid6_calls raid6_avx512x4;
  extern const struct raid6_calls raid6_tilegx8;
 +extern const struct raid6_calls raid6_s390vx8;
  
  struct raid6_recov_calls {
  	void (*data2)(int, size_t, int, int, void **);
@@@ -116,7 -118,7 +119,8 @@@
  extern const struct raid6_recov_calls raid6_recov_intx1;
  extern const struct raid6_recov_calls raid6_recov_ssse3;
  extern const struct raid6_recov_calls raid6_recov_avx2;
+ extern const struct raid6_recov_calls raid6_recov_avx512;
 +extern const struct raid6_recov_calls raid6_recov_s390xc;
  
  extern const struct raid6_calls raid6_neonx1;
  extern const struct raid6_calls raid6_neonx2;
