From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree with Linus' tree
Date: Tue, 24 Feb 2009 12:21:20 +1100
Message-ID: <20090224122120.b03d701a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Feb_2009_12_21_20_+1100_8yr49k6N9Rf.1F0Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44517 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751339AbZBXBV3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2009 20:21:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__24_Feb_2009_12_21_20_+1100_8yr49k6N9Rf.1F0Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/mach-default/setup.c between commit
936577c61d0c10b8929608a92c98d839b22053bc ("x86: Add IRQF_TIMER to legacy
x86 timer interrupt descriptors") from Linus' tree and commit
6bda2c8b32febeb38ee128047253751e080bad52 ("x86: remove subarchitecture
support") from the x86 tree.

I fixed it up by removing arch/x86/mach-default/setup.c and applying the
following patch (I am not sure if that is all that is necessary) and can
carry this for a while.
--=20
Cheers,
Stephen Rothwell

diff --git a/arch/x86/kernel/probe_32.c b/arch/x86/kernel/probe_32.c
index 22337b7..31493c5 100644
--- a/arch/x86/kernel/probe_32.c
+++ b/arch/x86/kernel/probe_32.c
@@ -333,7 +333,7 @@ void __init trap_init_hook(void)
=20
 static struct irqaction irq0  =3D {
 	.handler =3D timer_interrupt,
-	.flags =3D IRQF_DISABLED | IRQF_NOBALANCING | IRQF_IRQPOLL,
+	.flags =3D IRQF_DISABLED | IRQF_NOBALANCING | IRQF_IRQPOLL | IRQF_TIMER,
 	.mask =3D CPU_MASK_NONE,
 	.name =3D "timer"
 };

--Signature=_Tue__24_Feb_2009_12_21_20_+1100_8yr49k6N9Rf.1F0Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmjS5AACgkQjjKRsyhoI8xrZQCfcmAMCggQoZoRDzWU4TEdLIsn
6wwAni+ZrvwlRFQH68foFfHhcuYPnPx+
=H/Zq
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Feb_2009_12_21_20_+1100_8yr49k6N9Rf.1F0Q--
