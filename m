From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] arm: fix unresolved restart build failure in plat-iop/restart.c
Date: Mon, 5 Mar 2012 18:38:58 -0500
Message-ID: <CAP=VYLrEvqdL+S3a_XVQoHbAGJXS_sfQzxLs52YcresmGKOOXA@mail.gmail.com>
References: <1327288578-30852-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:62642 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757832Ab2CEXi7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Mar 2012 18:38:59 -0500
Received: by pbcun15 with SMTP id un15so3346625pbc.19
        for <linux-next@vger.kernel.org>; Mon, 05 Mar 2012 15:38:58 -0800 (PST)
In-Reply-To: <1327288578-30852-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux@arm.linux.org.uk
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Sun, Jan 22, 2012 at 10:16 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Upstream commit bec92b1ec67b4998b6a3bad7c2f03c846cbac71e
>
> =A0"ARM: restart: iop3xx: use new restart hook"
>
> created this file, but it needs asm/system.h since upstream
> commit e879c862fb81b986095ae7a4676b2281c2f97957
>
> =A0"ARM: restart: only perform setup for restart when soft-restarting=
"
>
> added the soft_restart() entry. =A0Add in that header to resolve
> the below build failure:

Just checking that this didn't fall through the cracks, as I don't
see it in linux-next yet.  I just re-tested on today's linux-next and
it still fixes these defconfig build failures:

http://kisskb.ellerman.id.au/kisskb/target/1257/

Thanks,
Paul.
--

>
> =A0CC =A0 =A0 =A0arch/arm/plat-iop/restart.o
> =A0arch/arm/plat-iop/restart.c: In function 'iop3xx_restart':
> =A0arch/arm/plat-iop/restart.c:18: error: implicit declaration of fun=
ction 'soft_restart'
> =A0make[3]: *** [arch/arm/plat-iop/restart.o] Error 1
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> diff --git a/arch/arm/plat-iop/restart.c b/arch/arm/plat-iop/restart.=
c
> index 6a85a0c..728b5c7 100644
> --- a/arch/arm/plat-iop/restart.c
> +++ b/arch/arm/plat-iop/restart.c
> @@ -7,6 +7,7 @@
> =A0* it under the terms of the GNU General Public License version 2 a=
s
> =A0* published by the Free Software Foundation.
> =A0*/
> +#include <asm/system.h>
> =A0#include <asm/hardware/iop3xx.h>
> =A0#include <mach/hardware.h>
>
> --
> 1.7.7.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
