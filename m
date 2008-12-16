From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: lblnet tree build failure
Date: Tue, 16 Dec 2008 19:14:19 +1100
Message-ID: <20081216191419.43ae28af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_19_14_19_+1100_ue4VWxJOcWtjw7ZU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44904 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbYLPIO3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 03:14:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

--Signature=_Tue__16_Dec_2008_19_14_19_+1100_ue4VWxJOcWtjw7ZU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (x86_64 allmodconfig) failed like this:

security/smack/smackfs.c: In function 'smk_netlabel_audit_set':
security/smack/smackfs.c:118: error: 'struct task_struct' has no member nam=
ed 'security'

Caused by commit 2d22b59c5401e60c04e6258a245b8a99d103f55b ("smack: Add
support for unlabeled network hosts and networks") interacting with
commit b6dff3ec5e116e3af6f537d4caedcad6b9e5082a ("CRED: Separate task
security context from task_struct") from the security-testing tree.  This
latter commit is also in the lblnet tree (since it merges the security
testing tree).

I have dropped the lblnet tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_19_14_19_+1100_ue4VWxJOcWtjw7ZU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklHY1sACgkQjjKRsyhoI8zSKgCdEXihIwLlL3V3pIo2k7Y790O4
UnwAoKredsq9ZBEdJRYgXiJestW2nyZA
=1hte
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_19_14_19_+1100_ue4VWxJOcWtjw7ZU--
