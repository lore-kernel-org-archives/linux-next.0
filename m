From: "Peter Huewe" <PeterHuewe@gmx.de>
Subject: Aw: randconfig build error with next-20150121, in
 drivers/char/tpm/tpm_tis.c
Date: Wed, 21 Jan 2015 18:31:10 +0100
Message-ID: <trinity-e585b2ff-5707-41eb-be40-241e3d5a2e16-1421861470660@3capp-gmx-bs36>
References: <CA+r1ZhiCiLc5yDABJPYR7-Jz=M+XE5RvGzTKc=zvb1M9qRjosw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:61370 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183AbbAURbb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2015 12:31:31 -0500
In-Reply-To: <CA+r1ZhiCiLc5yDABJPYR7-Jz=M+XE5RvGzTKc=zvb1M9qRjosw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, tpmdd@selhorst.net, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>



Thanks for reporting.
=C2=A0

>drivers/char/tpm/tpm_tis.c: In function =E2=80=98tpm_tis_pnp_init=E2=80=
=99:
>drivers/char/tpm/tpm_tis.c:912:45: error: invalid type argument of
>=E2=80=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
>acpi_dev_handle =3D pnp_acpi_device(pnp_dev)->handle;
>^
>make[3]: *** [drivers/char/tpm/tpm_tis.o] Error 1
I'll look into it.


sorry sorry.

Peter
