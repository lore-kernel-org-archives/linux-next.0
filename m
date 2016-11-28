From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Mon, 28 Nov 2016 14:56:41 +1100
Message-ID: <20161128145641.24d1cd60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752302AbcK1D4n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Nov 2016 22:56:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Luwei Kang <luwei.kang@intel.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/cpuid.c

between commit:

  c592b5734706 ("x86/fpu: Remove use_eager_fpu()")

from the tip tree and commit:

  4504b5c9414c ("kvm: x86: Add AVX512_4VNNIW and AVX512_4FMAPS support")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/cpuid.c
index 0aefb626fa8f,25f0f15fab1a..000000000000
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@@ -16,6 -16,8 +16,7 @@@
  #include <linux/export.h>
  #include <linux/vmalloc.h>
  #include <linux/uaccess.h>
+ #include <asm/processor.h>
 -#include <asm/fpu/internal.h> /* For use_eager_fpu.  Ugh! */
  #include <asm/user.h>
  #include <asm/fpu/xstate.h>
  #include "cpuid.h"
