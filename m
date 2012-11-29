From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the slave-dma tree
Date: Thu, 29 Nov 2012 17:14:42 +1100
Message-ID: <20121129171442.8b1c7eee80ce567cd9b8b15f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__29_Nov_2012_17_14_42_+1100_yCfpNVkHjxsAW3KF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__29_Nov_2012_17_14_42_+1100_yCfpNVkHjxsAW3KF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) produced these warning:

drivers/dma/dmaengine.c: At top level:
include/linux/of_dma.h:47:12: warning: 'of_dma_controller_register' defined=
 but not used [-Wunused-function]
include/linux/of_dma.h:55:12: warning: 'of_dma_controller_free' defined but=
 not used [-Wunused-function]
include/linux/of_dma.h:65:25: warning: 'of_dma_simple_xlate' defined but no=
t used [-Wunused-function]

These dummy functions need an inline keyword.

Introduced by commit 7a74a3a0e055 ("of: dma- fix build break for
!CONFIG_OF").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__29_Nov_2012_17_14_42_+1100_yCfpNVkHjxsAW3KF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQtv1SAAoJEECxmPOUX5FEGzcQAKXnBFzQivBwrn4zKPk0tNI+
Ks34uXxN3kWLg96/Stn/dnpRTrXfqlgRrNz/PUnvMrbn2rELmT3t948ZYwy0Bcdh
HeZ1pkix8bUyrz/wMb/1igBGlwP97+06Xj9u6LMWjnCQqG0Ltw0+jzaclIaAuXPG
dyyPysbQjC2TRj6mGh9tiVlqFZ+8IZXdRbsPRmGLIVTBs0Ht5LYHY5NUJcIys8BN
h350dSATCQl7U8d3+UDsRIVVY/6w0MbNnlpPZT/THuHinbiEofIKBm+UqpBCQ/Lh
x3rncWGzGWB21POTWfJ8rG71RlJYYcT15V0ICv427Fg3tFbdlDwTFwiGYVLGg3Hf
EhddmC8Jp6ic+TBEmOpfrOpxddJxxRz4jvu+DZ7IO2dvIZfhfkES8BssSVif3/eZ
pNkPhz+GvI60b3u0qAFFcc4MHHGWtALBveZR4Fymwx0w2j7HjxoRnzeXo1EeIILs
6ki6b9Bh3qUOXPXdqjdQXaSDDRh244JsHdgCAuGcQkj4RknZfLMhElTCXXkxOwdv
N5TefymJAUFIUiUmswDrCJjG0IbhneG9Q+bn81iJ6bnELu/s8v6ylZa7E3mQqrxQ
6NhCs3hraYyn0J522p0EFL7su4v7Kr9RhF+4TEC7Sbe1KjOvqdph/7iT4qk66JlB
KHbNy5JBU+if5URry49x
=I1g2
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Nov_2012_17_14_42_+1100_yCfpNVkHjxsAW3KF--
