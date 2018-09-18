From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the device-mapper tree
Date: Tue, 18 Sep 2018 11:53:29 +1000
Message-ID: <20180918115329.61fe2b2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0F8rWZGdeNDm_jTVnFBIBuh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/0F8rWZGdeNDm_jTVnFBIBuh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/md/dm-mpath.c: In function 'parse_path':
drivers/md/dm-mpath.c:891:24: warning: assignment discards 'const' qualifie=
r from pointer target type [-Wdiscarded-qualifiers]
  attached_handler_name =3D scsi_dh_attached_handler_name(q, GFP_KERNEL);
                        ^

Introduced by commit

  b8505ba97e0a ("dm mpath: fix attached_handler_name leak and dangling hw_h=
andler_name pointer")

--=20
Cheers,
Stephen Rothwell

--Sig_/0F8rWZGdeNDm_jTVnFBIBuh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlugWpkACgkQAVBC80lX
0Gw4JQgAm1Fh/wfZzO8aZTg0NfCsAr6WBjAbJoERqzRHSsICXKTlSWswaymlgFn/
NnxnR1f7QMsL3tRPuCa6ag+viBIrHmDyTeCxYo0/9yfnw56JLTrlar3Vg0aprzAT
TXK0Qp3kwf6HM6C3DiNZST3V/COupvPs/z9wzUpfFfRIk/OWI5m3vECts4A6WUSn
wDSoiBYls2r7a9N8xp85YhEzTTd6/Xg2cNddEnCRUqSUXy1Aa/Na9Aae2XLCYdAx
QWyRmR8PcH2lMAJXS/dxxyHwCrhqGUKzTkNy9gnwbJ9uU09K2aQLtxnGFFV4kzV1
X+6FCdBus3cdU/HVs1Dmi4sda0DmEg==
=SyQF
-----END PGP SIGNATURE-----

--Sig_/0F8rWZGdeNDm_jTVnFBIBuh--
