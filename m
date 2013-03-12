From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [-next] staging/comedi regressions
Date: Tue, 12 Mar 2013 23:13:50 +0100
Message-ID: <CAMuHMdXyBqwqn3aWpjwer5HYYqQvyMJTxJY-WeDGxLxkg_ZXQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driverdevel <devel@driverdev.osuosl.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

m68k/allmodconfig:

drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_isap=
np_find_board=E2=80=99:
drivers/staging/comedi/drivers/ni_atmio.c:353: error: =E2=80=98n_ni_boa=
rds=E2=80=99
undeclared (first use in this function)
drivers/staging/comedi/drivers/ni_atmio.c:353: error: (Each undeclared
identifier is reported only once
drivers/staging/comedi/drivers/ni_atmio.c:353: error: for each
function it appears in.)
drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_getb=
oardtype=E2=80=99:
drivers/staging/comedi/drivers/ni_atmio.c:391: error: =E2=80=98n_ni_boa=
rds=E2=80=99
undeclared (first use in this function)
drivers/staging/comedi/drivers/ni_atmio.c: In function =E2=80=98ni_atmi=
o_attach=E2=80=99:
drivers/staging/comedi/drivers/ni_atmio.c:470: error: =E2=80=98boardtyp=
e=E2=80=99
undeclared (first use in this function)

http://kisskb.ellerman.id.au/kisskb/buildresult/8392062/

Seems like the following two commits removed some macros:

commit 6293e35742550320b1720044f9969d9544a5deaa
Author: H Hartley Sweeten <hsweeten@visionengravers.com>
Date:   Tue Mar 5 10:20:41 2013 -0700

    staging: comedi: ni_stc.h: remove boardtype macro

ayla$ git show f5a1d92bf6f4fa063d5ea43613f43494896e333f
commit f5a1d92bf6f4fa063d5ea43613f43494896e333f
Author: H Hartley Sweeten <hsweeten@visionengravers.com>
Date:   Tue Mar 5 10:21:03 2013 -0700

    staging: comedi: ni_stc.h: remove n_ni_boards macro

while they're still used by drivers/staging/comedi/drivers/ni_atmio.c.

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
