From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for March 10 (m68k/tlbflush.h)
Date: Tue, 10 Mar 2009 21:07:25 +0100
Message-ID: <10f740e80903101307v70000e0cm61e261050411a715@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757614AbZCJUHs@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Greg,

http://kisskb.ellerman.id.au/kisskb/buildresult/180587/
| arch/m68k/kernel/traps.c:274: error: implicit declaration of
function '__flush_tlb040_one'

http://kisskb.ellerman.id.au/kisskb/buildresult/180591/
| mm/vmalloc.c:555: error: implicit declaration of function
'flush_tlb_kernel_range'

Caused by:

| commit 7fa69761ea82752b97502383f7f2d3fdfa509115
| Author: Greg Ungerer <gerg@uclinux.org>
| Date:   Tue Feb 17 14:40:47 2009 +1000
|
|     m68k: merge the mmu and non-mmu versions of tlbflush.h
|
|     Simple merge of the mmu and non-mmu versions of tlbflush.h
|
|     Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Seems like you merged the wrong way:

| diff --git a/arch/m68k/include/asm/tlbflush.h
b/arch/m68k/include/asm/tlbflush.h
| index b6f93b3..79050d0 100644
| --- a/arch/m68k/include/asm/tlbflush.h
| +++ b/arch/m68k/include/asm/tlbflush.h
| @@ -1,5 +1,267 @@
| -#ifdef __uClinux__
| -#include "tlbflush_no.h"
| +#ifndef _M68K_TLBFLUSH_H
| +#define _M68K_TLBFLUSH_H
| +
| +#ifndef CONFIG_MMU
    ^^^^^
    ifdef

| +#ifndef CONFIG_SUN3

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
