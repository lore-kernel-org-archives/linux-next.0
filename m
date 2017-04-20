From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm tree
Date: Fri, 21 Apr 2017 08:40:33 +1000
Message-ID: <20170421084033.5c987e13@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S948031AbdDTWki (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 18:40:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mason <slash.tmp@free.fr>

Hi Russell,

After merging the arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/bitops.h:36:0,
                 from include/linux/bitmap.h:7,
                 from drivers/dma/sun4i-dma.c:11:
drivers/dma/sun4i-dma.c: In function 'find_and_use_pchan':
include/linux/bitops.h:56:34: error: passing argument 1 of '_find_next_zero_bit_le' from incompatible pointer type [-Werror=incompatible-pointer-types]
  for ((bit) = find_next_zero_bit((addr), (size), (bit)); \
                                  ^
arch/arm/include/asm/bitops.h:200:61: note: in definition of macro 'find_next_zero_bit'
 #define find_next_zero_bit(p,sz,off) _find_next_zero_bit_le(p,sz,off)
                                                             ^
drivers/dma/sun4i-dma.c:241:2: note: in expansion of macro 'for_each_clear_bit_from'
  for_each_clear_bit_from(i, &priv->pchans_used, max) {
  ^
arch/arm/include/asm/bitops.h:163:12: note: expected 'const long unsigned int *' but argument is of type 'long unsigned int (*)[1]'
 extern int _find_next_zero_bit_le(const unsigned long *p, int size, int offset);
            ^
include/linux/bitops.h:58:34: error: passing argument 1 of '_find_next_zero_bit_le' from incompatible pointer type [-Werror=incompatible-pointer-types]
       (bit) = find_next_zero_bit((addr), (size), (bit) + 1))
                                  ^
arch/arm/include/asm/bitops.h:200:61: note: in definition of macro 'find_next_zero_bit'
 #define find_next_zero_bit(p,sz,off) _find_next_zero_bit_le(p,sz,off)
                                                             ^
drivers/dma/sun4i-dma.c:241:2: note: in expansion of macro 'for_each_clear_bit_from'
  for_each_clear_bit_from(i, &priv->pchans_used, max) {
  ^
arch/arm/include/asm/bitops.h:163:12: note: expected 'const long unsigned int *' but argument is of type 'long unsigned int (*)[1]'
 extern int _find_next_zero_bit_le(const unsigned long *p, int size, int offset);
            ^

Caused (or exposed) by commit

  c4f8ff16b46b ("ARM: 8669/1: bitops: Align prototypes to generic API")

I have used the arm tree from next-20170420 for today.

-- 
Cheers,
Stephen Rothwell
