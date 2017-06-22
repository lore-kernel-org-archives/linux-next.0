From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of most trees
Date: Thu, 22 Jun 2017 15:24:41 +1000
Message-ID: <20170622152441.3704b3d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751064AbdFVFYp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jun 2017 01:24:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicholas Piggin <npiggin@gmail.com>

Hi Dave,

After merging almost all the trees, today's linux-next build (sparc64
defconfig) failed like this:

arch/sparc/lib/hweight.o: In function `__arch_hweight8':
(.text+0x0): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight8' defined in .text section in lib/hweight.o
arch/sparc/lib/hweight.o: In function `__arch_hweight16':
(.text+0xc): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight16' defined in .text section in lib/hweight.o
arch/sparc/lib/hweight.o: In function `__arch_hweight32':
(.text+0x18): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight32' defined in .text section in lib/hweight.o
arch/sparc/lib/hweight.o: In function `__arch_hweight64':
(.text+0x24): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight64' defined in .text section in lib/hweight.o

I though it may have been caused by the thin archive changes, but
disabling CONFIG_THIN_ARCHIVE did not fix it. I have cc'd Nick and
Masahiro just in case.

I am using powerpc-le hosted cross compilers:
	gcc 5.2.0
	binutsila 2.25.2

I have left it broken for now.

32 bit sparc is not affected.

-- 
Cheers,
Stephen Rothwell
