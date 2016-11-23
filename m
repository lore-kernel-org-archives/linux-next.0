From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Wed, 23 Nov 2016 14:45:15 +1100
Message-ID: <20161123144515.10cf9236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58669 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755768AbcKWDpS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 22:45:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Janosch Frank <frankja@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  arch/s390/include/asm/facilities_src.h

between commit:

  d1f7e8f85b51 ("s390: squash facilities_src.h into gen_facilities.c")

from the s390 tree and commits:

  09ff894457e9 ("KVM: s390: gaccess: add ESOP2 handling")
  88abf0b54f51 ("KVM: s390: instruction-execution-protection support")

from the kvms390 tree.

I fixed it up (I deleted the file and then added the following merge fix
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 23 Nov 2016 14:41:34 +1100
Subject: [PATCH] KVM: s390: merge fix for squashing of facilities_src.h into
 gen_facilities.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/s390/tools/gen_facilities.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/s390/tools/gen_facilities.c b/arch/s390/tools/gen_facilities.c
index 8cc53b1e6d03..0cf802de52a1 100644
--- a/arch/s390/tools/gen_facilities.c
+++ b/arch/s390/tools/gen_facilities.c
@@ -80,6 +80,8 @@ static struct facility_def facility_defs[] = {
 			76, /* msa extension 3 */
 			77, /* msa extension 4 */
 			78, /* enhanced-DAT 2 */
+			130, /* instruction-execution-protection */
+			131, /* enhanced-SOP 2 and side-effect */
 			-1  /* END */
 		}
 	},
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
