From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the tip tree
Date: Thu, 14 Jul 2016 13:49:43 +1000
Message-ID: <20160714134943.557b3ccd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41363 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751079AbcGNDtp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jul 2016 23:49:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

In file included from tools/include/linux/hashtable.h:12:0,
                 from elf.h:24,
                 from builtin-check.c:33:
tools/include/linux/bitops.h:12:0: error: "BITS_PER_LONG" redefined [-Werror]
 #define BITS_PER_LONG __WORDSIZE
 ^
In file included from /usr/include/powerpc64le-linux-gnu/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from elf.h:23,
                 from builtin-check.c:33:
tools/include/asm-generic/bitsperlong.h:10:0: note: this is the location of the previous definition
 #define BITS_PER_LONG 32
 ^
In file included from tools/include/linux/hashtable.h:12:0,
                 from elf.h:24,
                 from special.h:22,
                 from special.c:26:
tools/include/linux/bitops.h:12:0: error: "BITS_PER_LONG" redefined [-Werror]
 #define BITS_PER_LONG __WORDSIZE
 ^
In file included from /usr/include/powerpc64le-linux-gnu/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from elf.h:23,
                 from special.h:22,
                 from special.c:26:
tools/include/asm-generic/bitsperlong.h:10:0: note: this is the location of the previous definition
 #define BITS_PER_LONG 32
 ^
In file included from tools/include/linux/hashtable.h:12:0,
                 from elf.h:24,
                 from elf.c:30:
tools/include/linux/bitops.h:12:0: error: "BITS_PER_LONG" redefined [-Werror]
 #define BITS_PER_LONG __WORDSIZE
 ^
In file included from /usr/include/powerpc64le-linux-gnu/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from elf.h:23,
                 from elf.c:30:
tools/include/asm-generic/bitsperlong.h:10:0: note: this is the location of the previous definition
 #define BITS_PER_LONG 32
 ^
cc1: all warnings being treated as errors
In file included from tools/include/linux/hashtable.h:12:0,
                 from arch/x86/../../elf.h:24,
                 from arch/x86/decode.c:26:
tools/include/linux/bitops.h:12:0: error: "BITS_PER_LONG" redefined [-Werror]
 #define BITS_PER_LONG __WORDSIZE
 ^
In file included from /usr/include/powerpc64le-linux-gnu/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from arch/x86/../../elf.h:23,
                 from arch/x86/decode.c:26:
tools/include/asm-generic/bitsperlong.h:10:0: note: this is the location of the previous definition
 #define BITS_PER_LONG 32
 ^

Introduced (I think) by commit

  bb9707077b4e ("tools: Copy the bitsperlong.h files from the kernel")

I saw some discussion of this, so I assume ti will be fixed soon.

-- 
Cheers,
Stephen Rothwell
