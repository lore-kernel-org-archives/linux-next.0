From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] x86: devicetree.h needs export.h
Date: Sat, 30 Jul 2011 15:00:15 -0400
Message-ID: <CAP=VYLrtcQ_zWxXSqD+wHV=rk6z03wCdhivVPNt43D+Fw+b4tg@mail.gmail.com>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
	<20110729180422.07355fdb.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110729180422.07355fdb.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 29, 2011 at 9:04 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> devicetree.c needs to include linux/export.h to fix build errors.

Applied to module.h-split, thanks.

P.

>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> ---
> =A0arch/x86/kernel/devicetree.c | =A0 =A01 +
> =A01 file changed, 1 insertion(+)
>
> --- linux-next-20110729.orig/arch/x86/kernel/devicetree.c
> +++ linux-next-20110729/arch/x86/kernel/devicetree.c
> @@ -2,6 +2,7 @@
> =A0* Architecture specific OF callbacks.
> =A0*/
> =A0#include <linux/bootmem.h>
> +#include <linux/export.h>
> =A0#include <linux/io.h>
> =A0#include <linux/interrupt.h>
> =A0#include <linux/list.h>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
