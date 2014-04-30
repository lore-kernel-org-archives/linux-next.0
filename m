From: Fabio Estevam <festevam@gmail.com>
Subject: Re: kissb mkimage doesn't support extensa
Date: Wed, 30 Apr 2014 15:31:53 -0300
Message-ID: <CAOMZO5AuVyZ9Dqo2wUjeN2E0CZVjXoCgR5t8zje-37yPtr_tHA@mail.gmail.com>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
	<1398743403.8217.7.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:59520 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422692AbaD3Sby (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Apr 2014 14:31:54 -0400
Received: by mail-ve0-f182.google.com with SMTP id jw12so2734332veb.27
        for <linux-next@vger.kernel.org>; Wed, 30 Apr 2014 11:31:53 -0700 (PDT)
In-Reply-To: <1398743403.8217.7.camel@concordia>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>

On Tue, Apr 29, 2014 at 12:50 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
>> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
>>
>> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
>> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
>> blackfin, avr32
>
> I've upgraded to the latest version in Debian (2014.01), but it still doesn't
> seem to support xtensa.
>
>   $ /usr/bin/mkimage -A xtensa
>
>   Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
>   mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
>   nds32, or1k, sandbox, arm64

As mainline U-boot does not support xtensa currently, what about
dropping the uImage format to be built?

--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -22,8 +22,8 @@ subdir-y      := lib
 # Subdirs for the boot loader(s)

 bootdir-$(CONFIG_XTENSA_PLATFORM_ISS)   += boot-elf
-bootdir-$(CONFIG_XTENSA_PLATFORM_XT2000) += boot-redboot boot-elf boot-uboot
-bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-redboot boot-elf boot-uboot
+bootdir-$(CONFIG_XTENSA_PLATFORM_XT2000) += boot-redboot boot-elf
+bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-redboot boot-elf

 zImage Image: $(bootdir-y)

@@ -41,4 +41,3 @@ vmlinux.bin.gz: vmlinux.bin FORCE

 boot-elf: vmlinux.bin
 boot-redboot: vmlinux.bin.gz
-boot-uboot: vmlinux.bin.gz
