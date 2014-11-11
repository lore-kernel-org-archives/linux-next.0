From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Tue, 11 Nov 2014 18:11:49 +1100
Message-ID: <20141111181149.6bfd76ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.9afIdk5GQ6RSiOzmwAkfy9"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49731 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751448AbaKKHL4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2014 02:11:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/.9afIdk5GQ6RSiOzmwAkfy9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

With Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
produced this warning:

fs/isofs/inode.c:177:1: warning: 'isofs_hash_common' defined but not used [=
-Wunused-function]
 isofs_hash_common(struct qstr *qstr, int ms)
 ^

Since commit b0afd8e5db7b ("isofs: don't bother with ->d_op for normal
case") (which turned up in Linus' tree between v3.18-rc2 and -rc3,
isofs_hash_common() is not used unless CONFIG_JOLIET is set.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/.9afIdk5GQ6RSiOzmwAkfy9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUYba5AAoJEMDTa8Ir7ZwVC/MP/2qsiEpghzM7DPwM2oIyWYYK
+56a2ZV9+jIT4WtDlZlNYvAz39qr0lyTQfGNuQwFYGc517eb+VN9uILSPPP3bQoh
aX26rQufBiB8Q7k/xc6LfLEkn4TvunQ9d0C9QBhT6WJnT69/lUW3zAXYbBALWvGu
mrZXyPQ6dM8M3X5mjjg7Zib0Lz+1HZ0XwKMJrv5N1BsZDz8K+QtnHXemzx2Kw/6F
vwbA3G2bK86CFbA2jEPwC2B4RrTfNKYEqbhmmkkqrvYkNWmWIMERZztV8LcaheWe
42o41YQJD7z/demfY9dbhPrc2E06JW2wCvTy+F96oT1pgRCzENx+pUG3K3GMgkZK
rV6ZTOzHkQYK5HWNrnPCgswcGOGQmBVyw4zv/SEka6k4lDvg31Az9V+Sryu8sdTI
P4J+whDeAmv2HsHacPRGuW5wyuVh1sv1Kf7n6F8GWrXtTLrdA5J9HBxbQ/G+5eAD
IK0hOMik/JXf9xaE+ZQUyyUU+kd4RC44/fh7Bl4PdwaK11SMroGwoa+WArKZY9Fn
hDDrwDXb4RJsE+T5vVWcUqvNn7C/0a91v2E1WDvbmeKZHJzFcWkEycXOX5SB+Hm1
LrdlylU4jlEwUpc+JOOWfV+FRFAPIh5SfhhmPHwU4qJxHHVwXTF34JMJ3x/cj6H3
rsWLc+sy5y0nbuq71DcY
=WgHe
-----END PGP SIGNATURE-----

--Sig_/.9afIdk5GQ6RSiOzmwAkfy9--
