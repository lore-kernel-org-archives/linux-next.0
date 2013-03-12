From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [-next] staging/comedi regressions
Date: Tue, 12 Mar 2013 15:21:32 -0700
Message-ID: <20130312222132.GA12477@kroah.com>
References: <CAMuHMdXyBqwqn3aWpjwer5HYYqQvyMJTxJY-WeDGxLxkg_ZXQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:57002 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755787Ab3CLWVg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Mar 2013 18:21:36 -0400
Received: by mail-ie0-f172.google.com with SMTP id c10so533515ieb.17
        for <linux-next@vger.kernel.org>; Tue, 12 Mar 2013 15:21:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyBqwqn3aWpjwer5HYYqQvyMJTxJY-WeDGxLxkg_ZXQw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>, driverdevel <devel@driverdev.osuosl.org>, Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org

On Tue, Mar 12, 2013 at 11:13:50PM +0100, Geert Uytterhoeven wrote:
> m68k/allmodconfig:
>=20
> drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_is=
apnp_find_board=E2=80=99:
> drivers/staging/comedi/drivers/ni_atmio.c:353: error: =E2=80=98n_ni_b=
oards=E2=80=99
> undeclared (first use in this function)
> drivers/staging/comedi/drivers/ni_atmio.c:353: error: (Each undeclare=
d
> identifier is reported only once
> drivers/staging/comedi/drivers/ni_atmio.c:353: error: for each
> function it appears in.)
> drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_ge=
tboardtype=E2=80=99:
> drivers/staging/comedi/drivers/ni_atmio.c:391: error: =E2=80=98n_ni_b=
oards=E2=80=99
> undeclared (first use in this function)
> drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_at=
mio_attach=E2=80=99:
> drivers/staging/comedi/drivers/ni_atmio.c:470: error: =E2=80=98boardt=
ype=E2=80=99
> undeclared (first use in this function)
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/8392062/

Hartley already fixed it, this will show up in the next linux-next tree
as I commited the fix a few hours ago.

thanks,

greg k-h
