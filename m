From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: linux-next: Tree for June 27 - build fails at
 tc6393xb_attach_irq() with randconfig build
Date: Mon, 30 Jun 2008 13:44:41 +0000 (UTC)
Message-ID: <g4ao09$be3$1@ger.gmane.org>
References: <20080627182406.a54b00c1.sfr@canb.auug.org.au>
	<48653871.9040106@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762557AbYF3NpS@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Kamalesh Babulal wrote:

> Hi Stephen,
>=20
> randconfig build fails on next-20080627 kernelk with CONFIG_MFD_TC639=
3XB
> enabled
>=20
>   CC      drivers/mfd/tc6393xb.o
> drivers/mfd/tc6393xb.c: In function =E2=80=98tc6393xb_attach_irq=E2=80=
=99:
> drivers/mfd/tc6393xb.c:269: error: implicit declaration of function
> =E2=80=98set_irq_flags=E2=80=99 drivers/mfd/tc6393xb.c:269: error: =E2=
=80=98IRQF_VALID=E2=80=99
> undeclared (first use in this function) drivers/mfd/tc6393xb.c:269:
> error: (Each undeclared identifier is reported only once
> drivers/mfd/tc6393xb.c:269: error: for each function it appears in.)
> drivers/mfd/tc6393xb.c:269: error: =E2=80=98IRQF_PROBE=E2=80=99 undec=
lared (first use in
> this function) drivers/mfd/tc6393xb.c:272: error: =E2=80=98IRQT_FALLI=
NG=E2=80=99
> undeclared (first use in this function) make[2]: ***
> [drivers/mfd/tc6393xb.o] Error 1 make[1]: *** [drivers/mfd] Error 2
> make: *** [drivers] Error 2


IRQT_FALLING will be replaced with IRQ_TYPE_FALLING_EDGE.
However I've a question. set_irq_flags is arm-only thing to change the=20
status IRQ_NOREQUEST, IRQ_NOPROBE etc. Most other arches (except ppc)=20
don't even bother touching IRQ_NOREQUEST. Should I change tc6393xb to=20
depend on ARM or make call to set_irq_flags ARM-dependant?


--=20
With best wishes
Dmitry
