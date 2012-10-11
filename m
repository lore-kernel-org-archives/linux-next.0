From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] staging: dgrp: Add missing #include <linux/uaccess.h>
Date: Thu, 11 Oct 2012 14:40:30 +0200
Message-ID: <CAMuHMdXpAkyc+xDWTnmvNn-4WcHL7DE-NryAmFdwvCY_UbY9QQ@mail.gmail.com>
References: <1348771106-14105-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:51948 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753462Ab2JKMkb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Oct 2012 08:40:31 -0400
In-Reply-To: <1348771106-14105-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bill Pemberton <wfp5p@virginia.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Sep 27, 2012 at 8:38 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On m68k:

Now also in mainline, cfr.
http://kisskb.ellerman.id.au/kisskb/buildresult/7344531/

> drivers/staging/dgrp/dgrp_mon_ops.c: In function =E2=80=98dgrp_mon_re=
ad=E2=80=99:
> drivers/staging/dgrp/dgrp_mon_ops.c:304: error: implicit declaration =
of function =E2=80=98copy_to_user=E2=80=99
> drivers/staging/dgrp/dgrp_specproc.c: In function =E2=80=98config_pro=
c_write=E2=80=99:
> drivers/staging/dgrp/dgrp_specproc.c:470: error: implicit declaration=
 of function =E2=80=98copy_from_user=E2=80=99
> drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98drp_wmove=E2=80=
=99:
> drivers/staging/dgrp/dgrp_tty.c:1284: error: implicit declaration of =
function =E2=80=98copy_from_user=E2=80=99
> drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98get_modem_info=E2=
=80=99:
> drivers/staging/dgrp/dgrp_tty.c:2267: error: implicit declaration of =
function =E2=80=98put_user=E2=80=99
> drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98set_modem_info=E2=
=80=99:
> drivers/staging/dgrp/dgrp_tty.c:2283: error: implicit declaration of =
function =E2=80=98access_ok=E2=80=99
> drivers/staging/dgrp/dgrp_tty.c:2283: error: =E2=80=98VERIFY_READ=E2=80=
=99 undeclared (first use in this function)
> drivers/staging/dgrp/dgrp_tty.c:2283: error: (Each undeclared identif=
ier is reported only once
> drivers/staging/dgrp/dgrp_tty.c:2283: error: for each function it app=
ears in.)
> drivers/staging/dgrp/dgrp_tty.c:2287: error: implicit declaration of =
function =E2=80=98get_user=E2=80=99
> drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98dgrp_tty_digige=
tedelay=E2=80=99:
> drivers/staging/dgrp/dgrp_tty.c:2474: error: implicit declaration of =
function =E2=80=98copy_to_user=E2=80=99
> drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98dgrp_tty_ioctl=E2=
=80=99:
> drivers/staging/dgrp/dgrp_tty.c:2618: error: =E2=80=98VERIFY_WRITE=E2=
=80=99 undeclared (first use in this function)
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> See also http://kisskb.ellerman.id.au/kisskb/buildresult/7277002/
>
>  drivers/staging/dgrp/dgrp_mon_ops.c  |    1 +
>  drivers/staging/dgrp/dgrp_specproc.c |    1 +
>  drivers/staging/dgrp/dgrp_tty.c      |    1 +
>  3 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/staging/dgrp/dgrp_mon_ops.c b/drivers/staging/dg=
rp/dgrp_mon_ops.c
> index 268dcb9..4792d05 100644
> --- a/drivers/staging/dgrp/dgrp_mon_ops.c
> +++ b/drivers/staging/dgrp/dgrp_mon_ops.c
> @@ -38,6 +38,7 @@
>  #include <linux/sched.h>
>  #include <asm/unaligned.h>
>  #include <linux/proc_fs.h>
> +#include <linux/uaccess.h>
>
>  #include "dgrp_common.h"
>
> diff --git a/drivers/staging/dgrp/dgrp_specproc.c b/drivers/staging/d=
grp/dgrp_specproc.c
> index 28f5c9a..a5840e7 100644
> --- a/drivers/staging/dgrp/dgrp_specproc.c
> +++ b/drivers/staging/dgrp/dgrp_specproc.c
> @@ -39,6 +39,7 @@
>  #include <linux/proc_fs.h>
>  #include <linux/ctype.h>
>  #include <linux/seq_file.h>
> +#include <linux/uaccess.h>
>  #include <linux/vmalloc.h>
>
>  #include "dgrp_common.h"
> diff --git a/drivers/staging/dgrp/dgrp_tty.c b/drivers/staging/dgrp/d=
grp_tty.c
> index 7d7de87..72f6fcf 100644
> --- a/drivers/staging/dgrp/dgrp_tty.c
> +++ b/drivers/staging/dgrp/dgrp_tty.c
> @@ -40,6 +40,7 @@
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
>  #include <linux/sched.h>
> +#include <linux/uaccess.h>
>
>  #include "dgrp_common.h"
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
