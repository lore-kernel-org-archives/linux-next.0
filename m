From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 4 Jul 2008 13:41:11 +1000
Message-ID: <20080704134111.4ad2d444.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_13_41_11_+1000_s5MfHKg0jc.Xm9dP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38754 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755050AbYGDDlT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 23:41:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__4_Jul_2008_13_41_11_+1000_s5MfHKg0jc.Xm9dP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/Kconfig between commit efac41894df57d32b483ac622d03541b5b2692c0
("x86: fix NODES_SHIFT Kconfig range") from Linus' tree and commit
dfdf1d75efee39e9396f8384c6f3bf555349ed60 ("x86: modify Kconfig to allow
up to 4096 cpus") from the x86 tree.

I took the version from the x86 tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_13_41_11_+1000_s5MfHKg0jc.Xm9dP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhtm9cACgkQjjKRsyhoI8w85ACgvI6FNX5XtJAXb6vUj3dCKmPy
FGIAnjV4qh4NUzlyEZHv+3Q/Ix0vCUBW
=3srQ
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_13_41_11_+1000_s5MfHKg0jc.Xm9dP--
