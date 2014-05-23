From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL v2] mfd/gpio: New pull request with irq_base removed
Date: Fri, 23 May 2014 09:50:06 +0100
Message-ID: <20140523085006.GN19747@lee--X1>
References: <20140520180159.3a70193c@canb.auug.org.au>
 <CACRpkdY9taDGRKj_ivkcYaHu+Jz8LnVDt-QQSntkwrcBuLitHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:48332 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751146AbaEWIuL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 May 2014 04:50:11 -0400
Received: by mail-ig0-f178.google.com with SMTP id hl10so419316igb.5
        for <linux-next@vger.kernel.org>; Fri, 23 May 2014 01:50:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdY9taDGRKj_ivkcYaHu+Jz8LnVDt-QQSntkwrcBuLitHA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> > drivers/mfd/stmpe.c: In function 'stmpe_irq_init':
> > drivers/mfd/stmpe.c:1000:15: error: 'struct stmpe' has no member na=
med 'irq_base'
> >    base =3D stmpe->irq_base;
> >                ^
> >
> > Caused by commit 3ba1d516d5fe ("mfd: stmpe: root out static GPIO an=
d
> > IRQ assignments").
>=20
> Some mishap in merging these patches I think. I don't have that
> line in my branch with the latest patches,

I'm not sure that's true:

`git grep irq_base linusw-next/stmpe-for-lee -- drivers/mfd/stmpe.c`

  linusw-next/stmpe-for-lee:drivers/mfd/stmpe.c: base =3D stmpe->irq_ba=
se;

>I'll get the proper versions to Lee somehow.

I've fixed up the branch and re-pushed:

The following changes since commit 89ca3b881987f5a4be4c5dbaa7f0df12bbdd=
e2fd:

  Linux 3.15-rc4 (2014-05-04 18:14:42 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd=
-gpio-v3.16

for you to fetch changes up to 9e9dc7d9597bd6881b3e7ae6ae3d710319605c47=
:

  mfd: stmpe: root out static GPIO and IRQ assignments (2014-05-23 09:4=
1:01 +0100)

----------------------------------------------------------------
Immutable branch between MFD and GPIO due for the v3.16 merge window.

----------------------------------------------------------------
Linus Walleij (4):
      mfd: stmpe: mask off unused blocks properly
      mfd: stmpe: Probe properly from the Device Tree
      mfd: stmpe: add optional regulators
      mfd: stmpe: root out static GPIO and IRQ assignments

 drivers/gpio/gpio-stmpe.c | 18 +++++-------------
 drivers/mfd/Kconfig       |  1 +
 drivers/mfd/stmpe-i2c.c   | 30 +++++++++++++++++++++++++++++-
 drivers/mfd/stmpe.c       | 33 ++++++++++++++++++++++++++++-----
 drivers/mfd/stmpe.h       |  2 +-
 include/linux/mfd/stmpe.h | 19 +++++--------------
 6 files changed, 69 insertions(+), 34 deletions(-)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
