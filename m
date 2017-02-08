From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Date: Wed, 8 Feb 2017 12:41:06 +1100
Message-ID: <20170208124106.7f5ed322@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52675 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932077AbdBHBlI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Feb 2017 20:41:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Emese Revfy <re.emese@gmail.com>

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  include/asm-generic/asm-prototypes.h

between commit:

  c7858bf16c0b ("asm-prototypes: Clear any CPP defines before declaring the functions")

from Linus' tree and commit:

  e89c98504d89 ("initify: Mark functions with the __nocapture attribute")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/asm-generic/asm-prototypes.h
index 939869c772b1,ea784e02b28e..000000000000
--- a/include/asm-generic/asm-prototypes.h
+++ b/include/asm-generic/asm-prototypes.h
@@@ -1,13 -1,7 +1,13 @@@
  #include <linux/bitops.h>
 +#undef __memset
  extern void *__memset(void *, int, __kernel_size_t);
 +#undef __memcpy
- extern void *__memcpy(void *, const void *, __kernel_size_t);
+ extern void *__memcpy(void *, const void *, __kernel_size_t) __nocapture(2);
 +#undef __memmove
- extern void *__memmove(void *, const void *, __kernel_size_t);
+ extern void *__memmove(void *, const void *, __kernel_size_t) __nocapture(2);
 +#undef memset
  extern void *memset(void *, int, __kernel_size_t);
 +#undef memcpy
- extern void *memcpy(void *, const void *, __kernel_size_t);
+ extern void *memcpy(void *, const void *, __kernel_size_t) __nocapture(2);
 +#undef memmove
- extern void *memmove(void *, const void *, __kernel_size_t);
+ extern void *memmove(void *, const void *, __kernel_size_t) __nocapture(2);
