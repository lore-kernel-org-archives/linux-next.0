From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed to fetch the mips tree
Date: Tue, 24 Nov 2009 10:53:03 +1100
Message-ID: <20091124105303.512479aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Nov_2009_10_53_03_+1100_q2.3EmxB3cfI6JNI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48126 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756829AbZKWXxB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 18:53:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Tue__24_Nov_2009_10_53_03_+1100_q2.3EmxB3cfI6JNI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's fetch of the mips tree got this error:

git.linux-mips.org[0: 78.24.191.183]: errno=3DConnection refused
fatal: unable to connect a socket (Connection refused)

I will use the version from next-20091123 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Nov_2009_10_53_03_+1100_q2.3EmxB3cfI6JNI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksLIF8ACgkQjjKRsyhoI8y/IACff+jsQdXtOf/jo7W8Bv59jHhv
dqsAnRhEC0V82IaATKoQfsrMAp6tQ2Ew
=yg4j
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Nov_2009_10_53_03_+1100_q2.3EmxB3cfI6JNI--
