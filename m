From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] PTI implicit declaration fix.
Date: Sat, 9 Jul 2011 10:08:32 +0200
Message-ID: <CAMuHMdV5OC6ENMK9uOXZBv3Z3MrOMiu0P6az5baM9jdRFwSAvA@mail.gmail.com>
References: <james_p_freyensee@linux.intel.com>
	<1310160851-26415-1-git-send-email-james_p_freyensee@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55447 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752538Ab1GIIId convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Jul 2011 04:08:33 -0400
In-Reply-To: <1310160851-26415-1-git-send-email-james_p_freyensee@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: james_p_freyensee@linux.intel.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, randy.dunlap@oracle.com, sfr@canb.auug.org.au, christophe.guerard@intel.com, pranav.k.sanghadia@intel.com

On Fri, Jul 8, 2011 at 23:34,  <james_p_freyensee@linux.intel.com> wrot=
e:
> From: J Freyensee <james_p_freyensee@linux.intel.com>
>
> In a certain compile configuration, functions like
> 'kmalloc' and 'copy_from_user' were coming up as
> implicit errors. =C2=A0This patch adds slab.h and
> uaccess.h to the driver.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Please don't add "Acked-by" lines before people have ack'ed your patche=
s.

> Signed-off-by: J Freyensee <james_p_freyensee@linux.intel.com>
> ---
> =C2=A0drivers/misc/pti.c | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
> index 8653bd0..4ba4e5f 100644
> --- a/drivers/misc/pti.c
> +++ b/drivers/misc/pti.c
> @@ -22,6 +22,8 @@
> =C2=A0*/
>
> =C2=A0#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/interrupt.h>
> =C2=A0#include <linux/console.h>

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
