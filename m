From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: fetch of nfsd tree failed
Date: Wed, 10 Mar 2010 10:09:11 +1100
Message-ID: <20100310100911.930ab78f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Mar_2010_10_09_11_+1100_0cTW8KCcBUGKy.Hh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40250 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752234Ab0CIXJQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Mar 2010 18:09:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__10_Mar_2010_10_09_11_+1100_0cTW8KCcBUGKy.Hh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Today's linux-next fetch of the nfsd tree failed because I killed it
after waiting for 15 minutes.  I can get a connection to the git server on
git.linux-nfs.org, but then it just seems to hang.  I will use yesterday's
nfsd tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Mar_2010_10_09_11_+1100_0cTW8KCcBUGKy.Hh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuW1RcACgkQjjKRsyhoI8xk2gCeIarhSNn7YtHqUJyU3eOMjB80
0JoAoKVI+HRDdaLDBD+u9NRJ9Y0r69HT
=Tf9o
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Mar_2010_10_09_11_+1100_0cTW8KCcBUGKy.Hh--
