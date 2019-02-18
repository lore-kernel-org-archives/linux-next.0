From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the block tree
Date: Mon, 18 Feb 2019 16:10:36 +1100
Message-ID: <20190218161036.3ffad994@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DXxYkEiD7GxEtC1sgPOogGx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/DXxYkEiD7GxEtC1sgPOogGx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got conflicts in:

  fs/exofs/ore.c
  fs/exofs/ore_raid.c

between commit:

  6dc4f100c175 ("block: allow bio_for_each_segment_all() to iterate over mu=
lti-page bvec")

from the block tree and commit:

  80f2121380ca ("scsi: fs: remove exofs")

from the scsi tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/DXxYkEiD7GxEtC1sgPOogGx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxqPkwACgkQAVBC80lX
0GyESAf/Qy86EkO5htP6HwTYFDxCPoWEZRpsjj1i9IoKFohlnkDWBcOZ84zuhYn5
iqlexm8ey7RSpMW7/f6EWCUrUbs39XB41QeR001cy+eQi5YKPogSvttp+H1KHi1c
qbyLBVmUG98A0lqJeE+4/v/ZbY5znd1vV5VmWUJvLvZPBMwlHoHfuTIc4myzxEp+
grkEgG+E0j79J7dSsk58OhKs7Fn0GKFtTpWnFQ/+XMcgFMUV6qItqewPtaQjWQBb
kJvT+ZxAZkqBmq0QoOc2wsB8R0mv7r+5LPIrSKiG/1g/ykObO592+W7yws0hub7E
WWSROradj9tfI9Kk/9ZY1OwYnMBVdg==
=7RLM
-----END PGP SIGNATURE-----

--Sig_/DXxYkEiD7GxEtC1sgPOogGx--
