From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of most trees
Date: Thu, 22 Jun 2017 18:41:16 +1000
Message-ID: <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
References: <20170622152441.3704b3d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35762 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdFVIlb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2017 04:41:31 -0400
In-Reply-To: <20170622152441.3704b3d9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alan Modra <amodra@gmail.com>

CC'ing Alan

On Thu, 22 Jun 2017 15:24:41 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Dave,
> 
> After merging almost all the trees, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> arch/sparc/lib/hweight.o: In function `__arch_hweight8':
> (.text+0x0): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight8' defined in .text section in lib/hweight.o
> arch/sparc/lib/hweight.o: In function `__arch_hweight16':
> (.text+0xc): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight16' defined in .text section in lib/hweight.o
> arch/sparc/lib/hweight.o: In function `__arch_hweight32':
> (.text+0x18): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight32' defined in .text section in lib/hweight.o
> arch/sparc/lib/hweight.o: In function `__arch_hweight64':
> (.text+0x24): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight64' defined in .text section in lib/hweight.o

After a bit of digging, this is due to that thin archives patch, but only
because it changes the order of linker inputs around slightly. You can
reproduce it with upstream kernel:

This is the final link which succeeds:

sparc64-linux-gnu-ld -m elf64_sparc --build-id -o vmlinux -T ./arch/sparc/kernel/vmlinux.lds arch/sparc/kernel/head_64.o init/built-in.o --start-group usr/built-in.o arch/sparc/built-in.o kernel/built-in.o certs/built-in.o mm/built-in.o fs/built-in.o ipc/built-in.o security/built-in.o crypto/built-in.o block/built-in.o lib/lib.a arch/sparc/prom/lib.a arch/sparc/lib/lib.a lib/built-in.o arch/sparc/prom/built-in.o arch/sparc/lib/built-in.o drivers/built-in.o sound/built-in.o firmware/built-in.o net/built-in.o virt/built-in.o --end-group .tmp_kallsyms2.o

Moving the lib.a files to the end:

sparc64-linux-gnu-ld -m elf64_sparc --build-id -o vmlinux -T ./arch/sparc/kernel/vmlinux.lds arch/sparc/kernel/head_64.o init/built-in.o --start-group usr/built-in.o arch/sparc/built-in.o kernel/built-in.o certs/built-in.o mm/built-in.o fs/built-in.o ipc/built-in.o security/built-in.o crypto/built-in.o block/built-in.o lib/built-in.o arch/sparc/prom/built-in.o arch/sparc/lib/built-in.o drivers/built-in.o sound/built-in.o firmware/built-in.o net/built-in.o virt/built-in.o lib/lib.a arch/sparc/prom/lib.a arch/sparc/lib/lib.a --end-group .tmp_kallsyms2.o

arch/sparc/lib/lib.a(hweight.o): In function `__arch_hweight8':
(.text+0x0): relocation truncated to fit: R_SPARC_WDISP19 against symbol `__sw_hweight8' defined in .text section in lib/built-in.o

If we also move lib/built-in.o to the end, then the error goes away.

Is there any way for the linker to place the inputs to avoid unresolvable
relocations where possible?

A way to work around this is to make arch/sparc/lib/hweight.o an obj-y
rather than lib-y. That's a hack because it just serves to move the
input location, but not really any more of a hack than the current code
that also only works because of input locations...

Any thoughts?

Thanks,
Nick
