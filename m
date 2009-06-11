From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpc tree build warning
Date: Thu, 11 Jun 2009 11:39:30 +1000
Message-ID: <20090611113930.78a42893.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Jun_2009_11_39_30_+1000_3fVsuLRs9p7_AnqZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40463 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753814AbZFKBje (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 21:39:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Thu__11_Jun_2009_11_39_30_+1000_3fVsuLRs9p7_AnqZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

arch/powerpc/platforms/Kconfig.cputype:60:warning: defaults for choice valu=
es not supported

We appear to have CONFIG_PPC_BOOK3S int two places which is confusing
Kconfig.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Jun_2009_11_39_30_+1000_3fVsuLRs9p7_AnqZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkowYFIACgkQjjKRsyhoI8wSsQCghdrWz+5H8AzA/EKnpZyCGK/e
1P4An2KGXrfT4V5CFWJ24NN9+lP7Es/J
=m21z
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Jun_2009_11_39_30_+1000_3fVsuLRs9p7_AnqZ--
