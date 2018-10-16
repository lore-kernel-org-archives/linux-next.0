From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the pci tree
Date: Tue, 16 Oct 2018 11:33:27 +1100
Message-ID: <20181016113327.02ea2317@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F4bvzE/Gpdg7RSm4r2g.Yk2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Bart Van Assche <bvanassche@acm.org>
List-Id: linux-next.vger.kernel.org

--Sig_/F4bvzE/Gpdg7RSm4r2g.Yk2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  include/linux/blkdev.h

between commit:

  113ff970ccda ("block: Add PCI P2P flag for request queue")

from the pci tree and commit:

  cd84a62e0078 ("block, scsi: Change the preempt-only flag into a counter")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/blkdev.h
index c32f7171899b,61207560e826..000000000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -698,8 -704,6 +704,7 @@@ struct request_queue=20
  #define QUEUE_FLAG_REGISTERED  26	/* queue has been registered to a disk =
*/
  #define QUEUE_FLAG_SCSI_PASSTHROUGH 27	/* queue supports SCSI commands */
  #define QUEUE_FLAG_QUIESCED    28	/* queue has been quiesced */
- #define QUEUE_FLAG_PREEMPT_ONLY	29	/* only process REQ_PREEMPT requests */
 +#define QUEUE_FLAG_PCI_P2PDMA  30	/* device supports PCI p2p requests */
 =20
  #define QUEUE_FLAG_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
  				 (1 << QUEUE_FLAG_SAME_COMP)	|	\

--Sig_/F4bvzE/Gpdg7RSm4r2g.Yk2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvFMdcACgkQAVBC80lX
0GwX2wf+Kg7aFS1kLmO+eHIz+PR8MNT+eVwcUjn3pFzcGqFYbCKUVUlzz5h/4u5Y
LKWQjCLv6hOeRbB4RMGs7i6Lo6n8t4yf0NXl6s0lXYA4RBJzusJf2i99QuhgCc/6
EhPABu6zq28Eg3eABXu3GerE+3pCiLmhBtHjx/m1RLsHjpMkSgnn4dRSBPQVbhBZ
LRFt1uC3FXmbUlcQC06iSK6G7svyu4Ny09StJRmgv+Cu5XXEamhk8U5SrnLg0VvD
MII3BHUsm3tV+/cL+sVm8CYSHOjpu8sPvHZBhBvvSiGyyMHzgD8eLRBh/7Fj9ww8
m+YJ1YoM5F69+ub4uB9XmriziBnssA==
=5WY/
-----END PGP SIGNATURE-----

--Sig_/F4bvzE/Gpdg7RSm4r2g.Yk2--
