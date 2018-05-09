From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung-krzk tree with the
 dma-mapping tree
Date: Thu, 10 May 2018 09:16:34 +1000
Message-ID: <20180510091634.7fb3aaf2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WW99soGBEf=QXqtwQTt8NWj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/WW99soGBEf=QXqtwQTt8NWj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Today's linux-next merge of the samsung-krzk tree got a conflict in:

  arch/arm/mach-exynos/Kconfig

between commit:

  4965a68780c5 ("arch: define the ARCH_DMA_ADDR_T_64BIT config symbol in li=
b/Kconfig")

from the dma-mapping tree and commit:

  c5deb598089c ("ARM: exynos: Remove support for Exynos5440")

from the samsung-krzk tree.

I fixed it up (the latter removed the whole section modified by
the former, so I just removed the section) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/WW99soGBEf=QXqtwQTt8NWj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrzgVIACgkQAVBC80lX
0GwcTQf/bzNuHHKkZ+W/c17Gj4ti/CCEn4Vgy2z84XnbdGkf/AbMO1uiqrGxG3bb
gUq2mQ7AGxWqmDsZ37rEv+4VMWuqiIQDpRQBwGbqWK4uNGedUktHQPovTnqSewpv
RIL0qRNtDv8ZbpOP9AQHcFqmKlbwCLQuZgeWW+eaHG1TzksEeake9Zj2ENsUswqv
1Z1Y0++LHwfV8mU9mqv+ie0Zc+dYDh3FGenV+VQExKSmPlyx/wlOfv9DHY9w9w9U
XJ8FidvR4sr3D5b/tCBCI2z/4Tu2Qt/E9f1LaBq44vvF5BD/urzR5BEfyQpl4ijr
YhUTq6cLu2QhqWmiM1q4Bh/s64oYuw==
=rjMY
-----END PGP SIGNATURE-----

--Sig_/WW99soGBEf=QXqtwQTt8NWj--
