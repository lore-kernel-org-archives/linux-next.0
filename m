From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Thu, 27 Apr 2017 13:29:17 +1000
Message-ID: <20170427132917.3843cedc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harald Freudenberger <freude@linux.vnet.ibm.com>, "Jason J. Herne" <jjherne@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  arch/s390/include/asm/cpacf.h

between commit:

  985a9d20daa6 ("s390/crypto: Renaming PPNO to PRNO.")

from the s390 tree and commit:

  152c1c8d60eb ("s390/cpacf: Introduce kma instruction")

from the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/cpacf.h
index 7707a35176c4,31cac7d17b48..000000000000
--- a/arch/s390/include/asm/cpacf.h
+++ b/arch/s390/include/asm/cpacf.h
@@@ -25,7 -25,8 +25,8 @@@
  #define CPACF_KMO		0xb92b		/* MSA4 */
  #define CPACF_PCC		0xb92c		/* MSA4 */
  #define CPACF_KMCTR		0xb92d		/* MSA4 */
 -#define CPACF_PPNO		0xb93c		/* MSA5 */
 +#define CPACF_PRNO		0xb93c		/* MSA5 */
+ #define CPACF_KMA		0xb929		/* MSA8 */
  
  /*
   * En/decryption modifier bits
