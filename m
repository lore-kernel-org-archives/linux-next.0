From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] staging: dgrp: Add missing #include
 <linux/uaccess.h>
Date: Wed, 17 Oct 2012 13:56:43 -0700
Message-ID: <20121017205643.GA23462@kroah.com>
References: <1348771106-14105-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdXpAkyc+xDWTnmvNn-4WcHL7DE-NryAmFdwvCY_UbY9QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:32998 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756016Ab2JQU4r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Oct 2012 16:56:47 -0400
Received: by mail-pa0-f46.google.com with SMTP id hz1so7540508pad.19
        for <linux-next@vger.kernel.org>; Wed, 17 Oct 2012 13:56:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAMuHMdXpAkyc+xDWTnmvNn-4WcHL7DE-NryAmFdwvCY_UbY9QQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bill Pemberton <wfp5p@virginia.edu>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 11, 2012 at 02:40:30PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 27, 2012 at 8:38 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On m68k:
>=20
> Now also in mainline, cfr.
> http://kisskb.ellerman.id.au/kisskb/buildresult/7344531/
>=20
> > drivers/staging/dgrp/dgrp_mon_ops.c: In function =E2=80=98dgrp_mon_=
read=E2=80=99:
> > drivers/staging/dgrp/dgrp_mon_ops.c:304: error: implicit declaratio=
n of function =E2=80=98copy_to_user=E2=80=99
> > drivers/staging/dgrp/dgrp_specproc.c: In function =E2=80=98config_p=
roc_write=E2=80=99:
> > drivers/staging/dgrp/dgrp_specproc.c:470: error: implicit declarati=
on of function =E2=80=98copy_from_user=E2=80=99
> > drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98drp_wmove=E2=80=
=99:
> > drivers/staging/dgrp/dgrp_tty.c:1284: error: implicit declaration o=
f function =E2=80=98copy_from_user=E2=80=99
> > drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98get_modem_inf=
o=E2=80=99:
> > drivers/staging/dgrp/dgrp_tty.c:2267: error: implicit declaration o=
f function =E2=80=98put_user=E2=80=99
> > drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98set_modem_inf=
o=E2=80=99:
> > drivers/staging/dgrp/dgrp_tty.c:2283: error: implicit declaration o=
f function =E2=80=98access_ok=E2=80=99
> > drivers/staging/dgrp/dgrp_tty.c:2283: error: =E2=80=98VERIFY_READ=E2=
=80=99 undeclared (first use in this function)
> > drivers/staging/dgrp/dgrp_tty.c:2283: error: (Each undeclared ident=
ifier is reported only once
> > drivers/staging/dgrp/dgrp_tty.c:2283: error: for each function it a=
ppears in.)
> > drivers/staging/dgrp/dgrp_tty.c:2287: error: implicit declaration o=
f function =E2=80=98get_user=E2=80=99
> > drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98dgrp_tty_digi=
getedelay=E2=80=99:
> > drivers/staging/dgrp/dgrp_tty.c:2474: error: implicit declaration o=
f function =E2=80=98copy_to_user=E2=80=99
> > drivers/staging/dgrp/dgrp_tty.c: In function =E2=80=98dgrp_tty_ioct=
l=E2=80=99:
> > drivers/staging/dgrp/dgrp_tty.c:2618: error: =E2=80=98VERIFY_WRITE=E2=
=80=99 undeclared (first use in this function)
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Yes, now in my tree, will go to Linus this week.

thanks,

greg k-h
