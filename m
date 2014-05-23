From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] sound branch of STMPE cleanups
Date: Fri, 23 May 2014 09:32:08 +0100
Message-ID: <20140523083208.GM19747@lee--X1>
References: <CACRpkdZTez-OJgjNV8jKxgFEXhyXdsnv5bwSdLH_dRfok1u24g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZTez-OJgjNV8jKxgFEXhyXdsnv5bwSdLH_dRfok1u24g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

> as seen in linux-next something is screwed up on the immutable
> branch for STMPE cleanups, can you pull this instead, it is
> the known tested good version with no compilation regressions.
>=20
> I have no hurry to get this into the GPIO tree anymore, I will push
> additionall changes to the next merge window, simply.

Nope, this branch is broken too.  I don't think this is a merge error,
I think it's programmer error (even the greats make mistakes =3D:-) ).

Take a look at the patch:

  http://paste.ubuntu.com/7504677/

You remove all instances of irq_base except the one in stmpe_irq_init()=
=2E

I'll fix this up for you and re-push/tag the branch.  The references
will be the same, so you just need to re-fetch and re-merge.  I'll
give you the node once it's ready.

In the mean time, it might be worth you looking at your build system,
as it seems to be overlooking drivers/mfd/stmpe.c.

> The following changes since commit 89ca3b881987f5a4be4c5dbaa7f0df12bb=
dde2fd:
>=20
>   Linux 3.15-rc4 (2014-05-04 18:14:42 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericss=
on.git
> stmpe-for-lee
>=20
> for you to fetch changes up to decc1ca8b2e5ae947fd9679f8adbd056d3b47d=
30:
>=20
>   mfd: stmpe: mask off unused blocks properly (2014-05-23 00:19:12 +0=
200)
>=20
> ----------------------------------------------------------------
> Linus Walleij (4):
>       mfd: stmpe: root out static GPIO and IRQ assignments
>       mfd: stmpe: add optional regulators
>       mfd: stmpe: probe properly from the device tree
>       mfd: stmpe: mask off unused blocks properly
>=20
>  drivers/gpio/gpio-stmpe.c | 18 +++++-------------
>  drivers/mfd/Kconfig       |  1 +
>  drivers/mfd/stmpe-i2c.c   | 30 +++++++++++++++++++++++++++++-
>  drivers/mfd/stmpe.c       | 30 ++++++++++++++++++++++++++++--
>  drivers/mfd/stmpe.h       |  2 +-
>  include/linux/mfd/stmpe.h | 19 +++++--------------
>  6 files changed, 69 insertions(+), 31 deletions(-)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
