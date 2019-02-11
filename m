From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the block tree
Date: Mon, 11 Feb 2019 15:23:35 +1100
Message-ID: <20190211152335.61592b65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=aBZdlW0BRKNqwDjqEDaUDD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, James Bottomley <James.Bottomley@HansenPartnership.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=aBZdlW0BRKNqwDjqEDaUDD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  include/linux/blkdev.h

between commit:

  eca7abf31abb ("block: queue flag cleanup")

from the block tree and commit:

  8b3238cabd50 ("scsi: block: remove bidi support")

from the scsi-mkp tree.

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
index 3603270cb82d,21beb456b97a..000000000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -572,33 -567,37 +567,32 @@@ struct request_queue=20
  	u64			write_hints[BLK_MAX_WRITE_HINTS];
  };
 =20
 -#define QUEUE_FLAG_STOPPED	1	/* queue is stopped */
 -#define QUEUE_FLAG_DYING	2	/* queue being torn down */
 -#define QUEUE_FLAG_NOMERGES     5	/* disable merge attempts */
 -#define QUEUE_FLAG_SAME_COMP	6	/* complete on same CPU-group */
 -#define QUEUE_FLAG_FAIL_IO	7	/* fake timeout */
 -#define QUEUE_FLAG_NONROT	9	/* non-rotational device (SSD) */
 -#define QUEUE_FLAG_VIRT        QUEUE_FLAG_NONROT /* paravirt device */
 -#define QUEUE_FLAG_IO_STAT     10	/* do disk/partitions IO accounting */
 -#define QUEUE_FLAG_DISCARD     11	/* supports DISCARD */
 -#define QUEUE_FLAG_NOXMERGES   12	/* No extended merges */
 -#define QUEUE_FLAG_ADD_RANDOM  13	/* Contributes to random pool */
 -#define QUEUE_FLAG_SECERASE    14	/* supports secure erase */
 -#define QUEUE_FLAG_SAME_FORCE  15	/* force complete on same CPU */
 -#define QUEUE_FLAG_DEAD        16	/* queue tear-down finished */
 -#define QUEUE_FLAG_INIT_DONE   17	/* queue is initialized */
 -#define QUEUE_FLAG_NO_SG_MERGE 18	/* don't attempt to merge SG segments*/
 -#define QUEUE_FLAG_POLL	       19	/* IO polling enabled if set */
 -#define QUEUE_FLAG_WC	       20	/* Write back caching */
 -#define QUEUE_FLAG_FUA	       21	/* device supports FUA writes */
 -#define QUEUE_FLAG_FLUSH_NQ    22	/* flush not queueuable */
 -#define QUEUE_FLAG_DAX         23	/* device supports DAX */
 -#define QUEUE_FLAG_STATS       24	/* track IO start and completion times =
*/
 -#define QUEUE_FLAG_POLL_STATS  25	/* collecting stats for hybrid polling =
*/
 -#define QUEUE_FLAG_REGISTERED  26	/* queue has been registered to a disk =
*/
 -#define QUEUE_FLAG_SCSI_PASSTHROUGH 27	/* queue supports SCSI commands */
 -#define QUEUE_FLAG_QUIESCED    28	/* queue has been quiesced */
 -#define QUEUE_FLAG_PCI_P2PDMA  29	/* device supports PCI p2p requests */
 -
 -#define QUEUE_FLAG_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
 -				 (1 << QUEUE_FLAG_SAME_COMP)	|	\
 -				 (1 << QUEUE_FLAG_ADD_RANDOM))
 +#define QUEUE_FLAG_STOPPED	0	/* queue is stopped */
 +#define QUEUE_FLAG_DYING	1	/* queue being torn down */
- #define QUEUE_FLAG_BIDI		2	/* queue supports bidi requests */
 +#define QUEUE_FLAG_NOMERGES     3	/* disable merge attempts */
 +#define QUEUE_FLAG_SAME_COMP	4	/* complete on same CPU-group */
 +#define QUEUE_FLAG_FAIL_IO	5	/* fake timeout */
 +#define QUEUE_FLAG_NONROT	6	/* non-rotational device (SSD) */
 +#define QUEUE_FLAG_VIRT		QUEUE_FLAG_NONROT /* paravirt device */
 +#define QUEUE_FLAG_IO_STAT	7	/* do disk/partitions IO accounting */
 +#define QUEUE_FLAG_DISCARD	8	/* supports DISCARD */
 +#define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
 +#define QUEUE_FLAG_ADD_RANDOM	10	/* Contributes to random pool */
 +#define QUEUE_FLAG_SECERASE	11	/* supports secure erase */
 +#define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
 +#define QUEUE_FLAG_DEAD		13	/* queue tear-down finished */
 +#define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
 +#define QUEUE_FLAG_NO_SG_MERGE	15	/* don't attempt to merge SG segments*/
 +#define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
 +#define QUEUE_FLAG_WC		17	/* Write back caching */
 +#define QUEUE_FLAG_FUA		18	/* device supports FUA writes */
 +#define QUEUE_FLAG_DAX		19	/* device supports DAX */
 +#define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
 +#define QUEUE_FLAG_POLL_STATS	21	/* collecting stats for hybrid polling */
 +#define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
 +#define QUEUE_FLAG_SCSI_PASSTHROUGH 23	/* queue supports SCSI commands */
 +#define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
 +#define QUEUE_FLAG_PCI_P2PDMA	25	/* device supports PCI p2p requests */
 =20
  #define QUEUE_FLAG_MQ_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
  				 (1 << QUEUE_FLAG_SAME_COMP))

--Sig_/=aBZdlW0BRKNqwDjqEDaUDD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxg+McACgkQAVBC80lX
0Gz5Cwf9EgtzLWrOcUaNyFGTXNyk/g947QOBj0XhtEVUiSeyuUJoojJl4Te2QKQV
OLC2DQ+yIYy5u6XZHsj0JH6mhgKPwP/jkiBlEaFaaCCo3yaJbECgMn56Xutzz1wH
JoV3aJECsZpAnNX8Q2HMVDFtGxbRHPacIJDBS5R+nevWQp0YouLRRoWEhFxo+mtE
ucsU/rL/BQ6QMHj9VMHo0s56QYj76tn4AgcsI/IbCINMCfShv6478gbtM8LZvj2v
BHRA6/laUKYpn8C4/wbEEMzhQKGHICuyTVuhRN6K/e9FF7zNiU7+NB8m2TT5tFwo
yHlJ0TsHsrW0UWMdCr3POFhG3pa0Qg==
=Hcgn
-----END PGP SIGNATURE-----

--Sig_/=aBZdlW0BRKNqwDjqEDaUDD--
