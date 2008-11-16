From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: next-20081114 build failure
Date: Sun, 16 Nov 2008 22:30:08 +1100
Message-ID: <20081116223008.4772920e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__16_Nov_2008_22_30_08_+1100_rwaj5lZGR10WwveT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48470 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751601AbYKPLaf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 06:30:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

--Signature=_Sun__16_Nov_2008_22_30_08_+1100_rwaj5lZGR10WwveT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James, David,

Today's linux-next build (mips defconfig) failed like this:

fs/nfsctl.c:45: error: implicit declaration of function 'current_cred'

This is why you need explicit includes ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__16_Nov_2008_22_30_08_+1100_rwaj5lZGR10WwveT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkgBEAACgkQjjKRsyhoI8yrwgCgjB3XAr8f+Pr9LMNiDCry0wlU
4zYAniHPV2i8W36DdeykCmuavGCNrU79
=MHyH
-----END PGP SIGNATURE-----

--Signature=_Sun__16_Nov_2008_22_30_08_+1100_rwaj5lZGR10WwveT--
