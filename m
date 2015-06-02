From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the arm tree
Date: Tue, 2 Jun 2015 14:52:11 +1000
Message-ID: <20150602145211.633d24a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nIz0XAZlzK9OX61SEl=cGQE"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33984 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751600AbbFBEwR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2015 00:52:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>

--Sig_/nIz0XAZlzK9OX61SEl=cGQE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in
drivers/clocksource/Makefile between commit 5261ef2ea836 ("ARM: 8366/1:
move Dual-Timer SP804 driver to drivers/clocksource") from the arm tree
and commit 17b85e25f282 ("clocksource/drivers/armv7m_systick: Add ARM
System timer driver") from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/clocksource/Makefile
index 12ec793f7fff,06919b619084..000000000000
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@@ -45,7 -46,7 +47,8 @@@ obj-$(CONFIG_MTK_TIMER)		+=3D mtk_timer.
 =20
  obj-$(CONFIG_ARM_ARCH_TIMER)		+=3D arm_arch_timer.o
  obj-$(CONFIG_ARM_GLOBAL_TIMER)		+=3D arm_global_timer.o
 +obj-$(CONFIG_ARM_TIMER_SP804)		+=3D timer-sp804.o
+ obj-$(CONFIG_ARMV7M_SYSTICK)		+=3D armv7m_systick.o
  obj-$(CONFIG_CLKSRC_METAG_GENERIC)	+=3D metag_generic.o
  obj-$(CONFIG_ARCH_HAS_TICK_BROADCAST)	+=3D dummy_timer.o
  obj-$(CONFIG_ARCH_KEYSTONE)		+=3D timer-keystone.o

--Sig_/nIz0XAZlzK9OX61SEl=cGQE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbTZ/AAoJEMDTa8Ir7ZwVjYwP/iq9uDjuLPdbrXdfNiJy8Wwi
RJcQR+4CRAAOEQ3JfO7i1BGIIXy0WUE+gOmteDSD8++Hb9KZUMFe0/pa+pI7xOa6
Q2uwsPobMVR+1gs28CLWFZz4HXJgUOh90Od+3mE1itzQi31iGE1XdAsHv2EWWMJy
jvfceClAsYH4jspC2/sqlM3wT7wLr9SJj9KkX3nv8zN8Yl9xiEd3EjoeEHNH1fyz
jzJA+dGBNmU/bksd/761ZdNPuqRhG03QElhr6SESiGVuDGFxtkOhFjmbOYKCyPE2
XmwlYH+9LKESarvzGOipqDirkiuU2I7FL22SLSn8oZ7RQ9m79DFDPgNCE/QtzIln
Rb+IoO6QmYT2h+mS+g+GZQjYbmSM3JxTDYSFph+kwcmgl57HbEhVcjBAY9UtAyFu
3I9T3Unkc1OaaeJATYH19huUJEqxHQH3hfuyPGFN+fh96g/9WV7WVXzbxl11ZQok
AZ6s3i5X0zeVCRyg/Rt3FgHHusSHtjidnPEdnbdIbiNLYDDm1xsbH/rJSCl58nLN
8Pflqvk0PfBph4gXDb1GaDrIbeC6CJVMSvQMyDy9B2f6wjoVEeRMAs1KUX3RCQLJ
em/E9lAExSYFei8l+WEmCntBZgRGip1o8SrHCi+ClTZxIFDmMWJQvtn3Y5WB5XYK
9VQDQdahEtoxdQylaO1n
=PH2k
-----END PGP SIGNATURE-----

--Sig_/nIz0XAZlzK9OX61SEl=cGQE--
