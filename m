From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the scsi-fixes tree
Date: Wed, 23 Jan 2019 16:34:32 +1100
Message-ID: <20190123163432.2f02124f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_Dq84qRTbUxqZWewXeQy8pp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/_Dq84qRTbUxqZWewXeQy8pp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

In commit

  a8cf59a6692c ("scsi: communicate max segment size to the DMA mapping code=
")

Fixes tag

  Fixes: 50c2e9107f ("scsi: introduce a max_segment_size host_template para=
meters")

has these problem(s):

  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_/_Dq84qRTbUxqZWewXeQy8pp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxH/OgACgkQAVBC80lX
0GzOrggAhkjgBJvTiIMeACDKBBiYZO1wuMloGtOIH1niULzg+uCJEasS8qkpEZY2
gGUWr9ty5j70F4f1h5p6lBtKJdgyyGrCSDQbN6YIupl8pGtPhk0aRTBlBQpr74bl
ire0J3ehOBrMpxLM4OG7bML4heA92+9Dhr/HdszLg+I/NC0mIt86uPZNrKyMbf8s
5ON8ibKMWnNaOoBUdN4bLhFbmttzbY4S9h/Kg+VNRlWaSQEWPy733CNJu05qtSNC
sIYW0xI4XuGWFpegT7yCjGeh8qIWDkmAxhNrPuQjCe9cDFTBe/dYKeG/ibND3Lvo
JZIpFJNV4Pqa6HcLO0/axcHTcxBKyQ==
=2fae
-----END PGP SIGNATURE-----

--Sig_/_Dq84qRTbUxqZWewXeQy8pp--
