From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Thu, 14 Aug 2008 15:59:49 +1000
Message-ID: <20080814155949.3f89a98b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__14_Aug_2008_15_59_49_+1000_b=C=fOXAajz_2ugc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35868 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750800AbYHNGAA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 02:00:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

--Signature=_Thu__14_Aug_2008_15_59_49_+1000_b=C=fOXAajz_2ugc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David, James,

Today's linux-next merge of the creds tree got a conflict in
kernel/fork.c between commit e830620e79e0a46e16d335de655c53a271ac235d
("tty-kref") from the ttydev tree and commit
cf7c7a530e568ca54ba3a3c021c7e7efb71fe10f ("CRED: Separate per-task-group
keyrings from signal_struct") from the creds tree.

Overlapping addition/removal.  I fixed it up and can carry the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__14_Aug_2008_15_59_49_+1000_b=C=fOXAajz_2ugc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkijydUACgkQjjKRsyhoI8zjdQCeOPDe3JhIAANIHsGojSK6KSdM
8K8AoKWfSCGbJ386Orln6p7f4r4Bkua3
=sQea
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Aug_2008_15_59_49_+1000_b=C=fOXAajz_2ugc--
