From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the galak tree
Date: Thu, 10 Jul 2008 14:15:36 +1000
Message-ID: <20080710141536.368780e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Jul_2008_14_15_36_+1000_U9r17JGngGQmCUD7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56295 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbYGJEPw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 00:15:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, ppc-dev <linuxppc-dev@ozlabs.org>

--Signature=_Thu__10_Jul_2008_14_15_36_+1000_U9r17JGngGQmCUD7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

Today's linux-next merge of the galak tree got a conflict in
Documentation/powerpc/booting-without-of.txt between commit
a5edeccb1a8432ae5d9fb9bccea5a4b64c565017 ("net: OpenFirmware GPIO based
MDIO bitbang driver") from the net tree and commit
a5b420dc2ff8423b30506e805584f30875b5fb57 ("powerpc/fsl: Refactor device
bindings") from the galak tree.

I left the "MDIO on GPIOs" section there and relabeled it as 'g'.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Jul_2008_14_15_36_+1000_U9r17JGngGQmCUD7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh1jOgACgkQjjKRsyhoI8z+ygCcDhhwhaz0zYEn6GIZ6QO0dVXW
iQMAn3ybS9i6ZBsy5vM34DpRo67u0vhK
=D0rr
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Jul_2008_14_15_36_+1000_U9r17JGngGQmCUD7--
