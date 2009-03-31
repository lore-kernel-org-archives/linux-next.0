From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpus4096 tree
Date: Tue, 31 Mar 2009 13:39:53 +1100
Message-ID: <20090331133953.73d33570.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__31_Mar_2009_13_39_53_+1100_AYQT1IJ3Aa7R3cpL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57033 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753185AbZCaCkF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2009 22:40:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Robert Richter <robert.richter@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Tue__31_Mar_2009_13_39_53_+1100_AYQT1IJ3Aa7R3cpL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/oprofile/buffer_sync.c between commit
4c50d9ea9ca9e46b65aeffed3e0d6f54ff38c8d4 ("cpumask: modifiy oprofile
initialization") from the cpus4096 tree and commit
d6d66104b6a06bc0bb541ac59aff59fad46ad466 ("oprofile: Thou shalt not call
__exit functions from __init functions") from the rr tree.

The former just removed the code that the latter was modifying, so I used
the former version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__31_Mar_2009_13_39_53_+1100_AYQT1IJ3Aa7R3cpL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknRgnkACgkQjjKRsyhoI8z36gCeOSGtANKvKJ+NF1/X0mwMeOyO
QFkAnRUhjdtHMcpwwzWPDStT9IFDuTvd
=rzCk
-----END PGP SIGNATURE-----

--Signature=_Tue__31_Mar_2009_13_39_53_+1100_AYQT1IJ3Aa7R3cpL--
