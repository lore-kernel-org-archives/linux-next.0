From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the sparc
 tree
Date: Wed, 29 Mar 2017 16:37:46 +1100
Message-ID: <20170329163746.5f4df976@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39745 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752729AbdC2Fhu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 01:37:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Babu Moger <babu.moger@oracle.com>, Pavel Tatashin <pasha.tatashin@oracle.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/sparc/lib/NG4memset.S

between commit:

  0ae2d26ffe70 ("arch/sparc: Avoid DCTI Couples")

from the sparc tree and commit:

  3f506bf2a354 ("sparc64: NG4 memset 32 bits overflow")

from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/sparc/lib/NG4memset.S
index 7c0c81f18837,e7c2e70df263..000000000000
--- a/arch/sparc/lib/NG4memset.S
+++ b/arch/sparc/lib/NG4memset.S
@@@ -99,8 -99,7 +99,8 @@@ NG4bzero
  	stxa		%o4, [%o0 + %g2] ASI_BLK_INIT_QUAD_LDD_P
  	stxa		%o4, [%o0 + %g3] ASI_BLK_INIT_QUAD_LDD_P
  	stxa		%o4, [%o0 + %o5] ASI_BLK_INIT_QUAD_LDD_P
- 	bne,pt		%icc, 1b
+ 	bne,pt		%xcc, 1b
  	 add		%o0, 0x30, %o0
- 	ba,a,pt		%icc, .Lpostloop
+ 	ba,a,pt		%xcc, .Lpostloop
 +	 nop
  	.size		NG4bzero,.-NG4bzero
