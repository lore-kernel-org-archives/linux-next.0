From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warning
Date: Thu, 12 Mar 2009 16:58:57 +1100
Message-ID: <20090312165857.667b22d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Mar_2009_16_58_57_+1100_+uVSS/fY+fOciYda"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51582 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751077AbZCLF7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 01:59:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>

--Signature=_Thu__12_Mar_2009_16_58_57_+1100_+uVSS/fY+fOciYda
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc allyesconfig) produced these warnings:

drivers/net/wimax/i2400m/netdev.c: In function 'i2400m_net_erx':
drivers/net/wimax/i2400m/netdev.c:523: warning: format '%zu' expects type '=
size_t', but argument 7 has type 'unsigned int'
drivers/net/wimax/i2400m/netdev.c:548: warning: format '%zu' expects type '=
size_t', but argument 7 has type 'unsigned int'

Probably introduced by commit fd5c565c0c04d2716cfdac3f1de3c2261d6a457d
("wimax/i2400m: support extended data RX protocol (no need to reallocate
skbs)").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Mar_2009_16_58_57_+1100_+uVSS/fY+fOciYda
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm4pKEACgkQjjKRsyhoI8zY9QCfb/T/NwB9862cM2WT+EcBTs6o
FvYAoJRNxqIdpUw1RmtoAXX2ZGSWICN9
=neQC
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Mar_2009_16_58_57_+1100_+uVSS/fY+fOciYda--
