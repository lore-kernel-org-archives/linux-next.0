From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the tip tree
Date: Thu, 2 Nov 2017 15:59:52 +1100
Message-ID: <20171102155952.56d90a49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750753AbdKBE7y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 00:59:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Andi Kleen <ak@linux.intel.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  include/linux/bitops.h

between commit:

  cbe96375025e ("bitops: Add clear/set_bit32() to linux/bitops.h")

from the tip tree and commit:

  5307e2ad69ab ("bitops: Introduce assign_bit()")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/bitops.h
index 15a5bcfcd0a2,9a874deee6e2..000000000000
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@@ -227,32 -227,30 +227,56 @@@ static inline unsigned long __ffs64(u6
  	return __ffs((unsigned long)word);
  }
  
 +/*
 + * clear_bit32 - Clear a bit in memory for u32 array
 + * @nr: Bit to clear
 + * @addr: u32 * address of bitmap
 + *
 + * Same as clear_bit, but avoids needing casts for u32 arrays.
 + */
 +
 +static __always_inline void clear_bit32(long nr, volatile u32 *addr)
 +{
 +	clear_bit(nr, (volatile unsigned long *)addr);
 +}
 +
 +/*
 + * set_bit32 - Set a bit in memory for u32 array
 + * @nr: Bit to clear
 + * @addr: u32 * address of bitmap
 + *
 + * Same as set_bit, but avoids needing casts for u32 arrays.
 + */
 +
 +static __always_inline void set_bit32(long nr, volatile u32 *addr)
 +{
 +	set_bit(nr, (volatile unsigned long *)addr);
 +}
 +
+ /**
+  * assign_bit - Assign value to a bit in memory
+  * @nr: the bit to set
+  * @addr: the address to start counting from
+  * @value: the value to assign
+  */
+ static __always_inline void assign_bit(long nr, volatile unsigned long *addr,
+ 				       bool value)
+ {
+ 	if (value)
+ 		set_bit(nr, addr);
+ 	else
+ 		clear_bit(nr, addr);
+ }
+ 
+ static __always_inline void __assign_bit(long nr, volatile unsigned long *addr,
+ 					 bool value)
+ {
+ 	if (value)
+ 		__set_bit(nr, addr);
+ 	else
+ 		__clear_bit(nr, addr);
+ }
+ 
  #ifdef __KERNEL__
  
  #ifndef set_mask_bits
