From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with Linus' tree
Date: Thu, 24 Jan 2019 14:58:21 +1100
Message-ID: <20190124145821.6e747c25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9xTUu=j4.7vSBu4zXQ5pQaW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Christoph Hellwig <hch@lst.de>, Ching Huang <ching2048@areca.com.tw>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9xTUu=j4.7vSBu4zXQ5pQaW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/arcmsr/arcmsr_hba.c

between commit:

  750afb08ca71 ("cross-tree: phase out dma_zalloc_coherent()")

from Linus' tree and commit:

  3e3153b050fc ("scsi: arcmsr: Use dma_alloc_coherent to replace dma_zalloc=
_coherent")

from the scsi tree.

I fixed it up (I just used the scsi tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9xTUu=j4.7vSBu4zXQ5pQaW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJN90ACgkQAVBC80lX
0Gz6Wgf/bUH1MQwBmuH/QWKNRufPIvs9+ePhTZF68QTJP1xbOTGWS2ozN6G5v2Go
Bx7CCSkaLy1LcUpqprKAWtWkIRh9g5Y94YABEMdakd0V5Jto7g6UlaSW5eWNBWsp
TnwW67Wbti5xwoDb3EL/7mDGNxKiVRjxwmDNsA+J5lSNnTRon7m83NvbgFWu9sYI
+bwpxlu1fyFzXT3HSHZ2qD0G0H4OVKEc9QTU5E/LrXa4rydJT59Jq/aF5NduYInU
P3Y9AuxScQllJxYSANVI3TMrIY8Bv82v2DgVp/f0/FxtJ1PKNRdo/ZVBVzK3OSVY
wBEkaDXl8OCZ6u1R18nHwa2nvKUQxw==
=4YxI
-----END PGP SIGNATURE-----

--Sig_/9xTUu=j4.7vSBu4zXQ5pQaW--
