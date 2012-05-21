From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 21 May 2012 19:07:38 +1000
Message-ID: <20120521190738.bc74d3adced12506973c9e14@canb.auug.org.au>
References: <20120521134219.6d6396802bd6a097503bac92@canb.auug.org.au>
	<4FB9FD37.4090905@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__21_May_2012_19_07_38_+1000_IwPc+b+iQyI6_UwT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39163 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932115Ab2EUJHz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 05:07:55 -0400
In-Reply-To: <4FB9FD37.4090905@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__21_May_2012_19_07_38_+1000_IwPc+b+iQyI6_UwT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Mon, 21 May 2012 09:30:47 +0100 Lee Jones <lee.jones@linaro.org> wrote:
>
> > After merging the mfd tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >
> > In file included from drivers/mfd/ab8500-core.c:21:0:
> > include/linux/mfd/dbx500-prcmu.h:614:19: error: redefinition of 'prcmu_=
abb_read'
> > include/linux/mfd/db8500-prcmu.h:673:19: note: previous definition of '=
prcmu_abb_read' was here
> > include/linux/mfd/dbx500-prcmu.h:619:19: error: redefinition of 'prcmu_=
abb_write'
> > include/linux/mfd/db8500-prcmu.h:678:19: note: previous definition of '=
prcmu_abb_write' was here
> > include/linux/mfd/dbx500-prcmu.h:630:19: error: redefinition of 'prcmu_=
config_clkout'
> > include/linux/mfd/db8500-prcmu.h:643:19: note: previous definition of '=
prcmu_config_clkout' was here
> > include/linux/mfd/dbx500-prcmu.h:692:20: error: redefinition of 'prcmu_=
ac_wake_req'
> > include/linux/mfd/db8500-prcmu.h:683:20: note: previous definition of '=
prcmu_ac_wake_req' was here
> > include/linux/mfd/dbx500-prcmu.h:694:20: error: redefinition of 'prcmu_=
ac_sleep_req'
> > include/linux/mfd/db8500-prcmu.h:685:20: note: previous definition of '=
prcmu_ac_sleep_req' was here
> >
> > Caused (exposed?) by commit d28f1db8187d ("mfd: Remove confusing
> > ab8500-i2c file and merge into ab8500-core").  I assume that this has
> > only had very restricted build testing :-(
>=20
> I 'believe' that you 'might' be missing MFD_DB8500_PRCMU from your=20
> config. Can you check this for me please Stephen?

That is not relevent to the config I am building ...

> Can I ask how you build the kernel and which defconfig you are using plea=
se?

Its an X86_64 allmodconfig build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__21_May_2012_19_07_38_+1000_IwPc+b+iQyI6_UwT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPugXaAAoJEECxmPOUX5FEbpYP/1/9f2KJFEKIn6lAI7x/sagC
/aPTEYzGq27sSbOJSUao7J5awG6vOAlAhUpgpKOyGEsRXefKH4Q/x9ezlwQipriH
kPMce2lIE7NYJ6pVdK/5XmQDuHft3jSnhOTTTkK8wBtJ+ALl8IgkXkudkvHsE+4E
WFYxJRVyH3Tq/qrixPZ+7fbWkYorIKQUL7TQtpIu5+3+aJh2d26XWOWSgRDaQ11X
EeML7sCDKT8MuDdnY9rxHlb5aMtbLo5bFfwOS6O944Z5sYncXaghgOcAuttWskBb
hyrIf3EuM/ztdYWd99PGKJe5JCCrCqpp9qq95eFVm6tFaSKIHFxaXq86wyT4VyoG
1ViLix+T1791g+f9NSiQdBAVta8VkDlCAvPw0V1jtO54AB/S/ICf4I5TO64Wsr8E
40UM0DrUyoAz/uBM9VDTPe98JC6bKcxJH+uxA/DFd1h4vcME9YgtxJQkqGyZfQbo
YS7RHtygeLtDrEJXkZwRs0+A8KLaXu5JAGmuFxxAkQOTwNNI1+VzZ0U0qnX5GA1a
lZZDdgjbubJUrbtqX5e1NCBORxvYBCMp8lYKpBllEO+ayuA4LrPp5jJTpnwJ95mX
1kv4CQFcjcjIJ0bjSHl77EFPxp3sLAus1CX4b4I8t+RE9Th6KYWtkUCPC3CIOt6p
CKpSdfJv7RhQi0pWmH49
=PjVu
-----END PGP SIGNATURE-----

--Signature=_Mon__21_May_2012_19_07_38_+1000_IwPc+b+iQyI6_UwT--
