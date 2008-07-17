From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Thu, 17 Jul 2008 11:43:40 +1000
Message-ID: <20080717114340.ed61e4d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_11_43_40_+1000_RDiGpZE_+RPvwN3O"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38054 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753106AbYGQBnu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 21:43:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__17_Jul_2008_11_43_40_+1000_RDiGpZE_+RPvwN3O
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/kernel/Makefile between commit
db104c724b370804d3ad736f0ef1cda46825d058 ("Merge branch 'linus' into
stackprotector") from the stackprotector tree and commit
34646bca474142e1424e5f6c4a33cb2ba0930ea1 ("x86, paravirt-spinlocks: fix
boot hang") from the x86 tree.

I fixed it up as Ingo suggested.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_11_43_40_+1000_RDiGpZE_+RPvwN3O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+o8wACgkQjjKRsyhoI8wSvACfSWS4I94dLWSDSwWyeArh8ZYX
CW4AnA4PSq/jWZft1LUuWPxHqiN38gcQ
=gadH
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_11_43_40_+1000_RDiGpZE_+RPvwN3O--
