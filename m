From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] x86: files need export.h
Date: Sat, 30 Jul 2011 14:51:41 -0400
Message-ID: <CAP=VYLqx8eqjt4V+fLyJLv7FVrhLF++XF+qHOeRbMHiYWotyRg@mail.gmail.com>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
	<20110729120734.cec5168f.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:39762 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271Ab1G3Svo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 14:51:44 -0400
In-Reply-To: <20110729120734.cec5168f.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 29, 2011 at 3:07 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> Fix multiple build errors due to missing export.h header file.

I'd already pushed equivalent changes to the branch before seeing
this one.

Thanks,
Paul.

>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> ---
> =A0arch/x86/kernel/e820.c =A0 =A0| =A0 =A01 +
> =A0arch/x86/kernel/pci-dma.c | =A0 =A01 +
> =A0arch/x86/kernel/rtc.c =A0 =A0 | =A0 =A01 +
> =A03 files changed, 3 insertions(+)
>
> --- linux-next-20110729.orig/arch/x86/kernel/e820.c
> +++ linux-next-20110729/arch/x86/kernel/e820.c
> @@ -16,6 +16,7 @@
> =A0#include <linux/pfn.h>
> =A0#include <linux/suspend.h>
> =A0#include <linux/acpi.h>
> +#include <linux/export.h>
> =A0#include <linux/firmware-map.h>
> =A0#include <linux/memblock.h>
> =A0#include <linux/sort.h>
> --- linux-next-20110729.orig/arch/x86/kernel/pci-dma.c
> +++ linux-next-20110729/arch/x86/kernel/pci-dma.c
> @@ -1,6 +1,7 @@
> =A0#include <linux/dma-mapping.h>
> =A0#include <linux/dma-debug.h>
> =A0#include <linux/dmar.h>
> +#include <linux/export.h>
> =A0#include <linux/bootmem.h>
> =A0#include <linux/gfp.h>
> =A0#include <linux/pci.h>
> --- linux-next-20110729.orig/arch/x86/kernel/rtc.c
> +++ linux-next-20110729/arch/x86/kernel/rtc.c
> @@ -5,6 +5,7 @@
> =A0#include <linux/mc146818rtc.h>
> =A0#include <linux/acpi.h>
> =A0#include <linux/bcd.h>
> +#include <linux/export.h>
> =A0#include <linux/pnp.h>
> =A0#include <linux/of.h>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
