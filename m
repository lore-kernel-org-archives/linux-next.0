From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Mon, 18 Aug 2008 16:33:36 +1000
Message-ID: <20080818163336.60eb8ae6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Aug_2008_16_33_36_+1000_dXoBo8aps6zbOFbS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37003 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751156AbYHRGdo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 02:33:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__18_Aug_2008_16_33_36_+1000_dXoBo8aps6zbOFbS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David, James,

Today's linux-next merge of the creds tree got a conflict in
security/commoncap.c between commit
5cd9c58fbe9ec92b45b27e131719af4f2bd9eb40 ("security: Fix setting of
PF_SUPERPRIV by __capable()") from Linus' tree (which is also in the
creds tree) and various commits from the creds tree.

The latter commits are just further changes, so I tool the creds tree
version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Aug_2008_16_33_36_+1000_dXoBo8aps6zbOFbS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkipF8AACgkQjjKRsyhoI8w8owCeJFgikjj1IuZmfzWz5ADYsSe3
lPAAn1SkiCKtuYdtcU3O+Y7xBdMP3oVV
=px9j
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Aug_2008_16_33_36_+1000_dXoBo8aps6zbOFbS--
