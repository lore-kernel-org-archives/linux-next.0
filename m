From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Wed, 3 Jun 2015 13:28:46 +1000
Message-ID: <20150603132846.3bc65487@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/miONKIELggyq8PC.QqPLEBI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43227 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752652AbbFCD2z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2015 23:28:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>, Tejun Heo <tj@kernel.org>

--Sig_/miONKIELggyq8PC.QqPLEBI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
include/linux/blkdev.h between commit 336b7e1f2309 ("block: remove
export for blk_queue_bio") from Linus' tree and commit d40f75a06dd6
("writeback, blkcg: restructure blk_{set|clear}_queue_congested()")
from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/blkdev.h
index 5d93a6645e88,31cd832cebb7..000000000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -821,25 -787,8 +787,6 @@@ extern int scsi_cmd_ioctl(struct reques
  extern int sg_scsi_ioctl(struct request_queue *, struct gendisk *, fmode_=
t,
  			 struct scsi_ioctl_command __user *);
 =20
- /*
-  * A queue has just exitted congestion.  Note this in the global counter =
of
-  * congested queues, and wake up anyone who was waiting for requests to be
-  * put back.
-  */
- static inline void blk_clear_queue_congested(struct request_queue *q, int=
 sync)
- {
- 	clear_bdi_congested(&q->backing_dev_info, sync);
- }
-=20
- /*
-  * A queue has just entered congestion.  Flag that in the queue's VM-visi=
ble
-  * state flags and increment the global gounter of congested queues.
-  */
- static inline void blk_set_queue_congested(struct request_queue *q, int s=
ync)
- {
- 	set_bdi_congested(&q->backing_dev_info, sync);
- }
 -extern void blk_queue_bio(struct request_queue *q, struct bio *bio);
--
  extern void blk_start_queue(struct request_queue *q);
  extern void blk_stop_queue(struct request_queue *q);
  extern void blk_sync_queue(struct request_queue *q);

--Sig_/miONKIELggyq8PC.QqPLEBI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbnRzAAoJEMDTa8Ir7ZwVG9kP/0GMyCYI7nz6B8meRyydNV5S
P5b+CmSvfYlnY1XijSc6faelpX1iV1jpX/zlaKUa6hRiwQPVIYvrUbqka+3qPVAR
EVzqWGug7YvhrddKsl9uPP4DkcHZAxIPpa8fAZCGtSe59d6kioS10pbmWDvn7tzl
ElEI0p5r7Ku2Yta/wVze3qz5ByEMu1irAlPhbQiJK5z5eAMJxxeAk3SLiFXsH7MQ
a2WZSA/cfxFMnY7JHg8c4eBwwfl9kmHmoft9C3IxfnxY4qjqDRJg96c+RLKiW5sk
gj9p8ikWbgaMEMeh3yVUTHMcO8xBOvSZanjBZo9WTZDQM+FQNxKOmWQPX5YZNnor
G9ym7VnVAS7fM6Q0qMg/+VvWOqCLjC+9WCIEg+t3+Ckr3CR5H3pvpvobU/XlOC4O
HAHFoRO8O5ZnIux1NvLeNSHlMEFC8au8Elw+sLwzVzPFwxYAJuLnPduNSYbTwyUA
m0GEk5L0IH2WpD4Endt9Ef5AWKYep990DszqDgKShwzStH9INZEPg1A7HJ0MMn5h
M+KGihE0rT0cf8rJGXJZa0CpiSnHQ2lCa2CswVU7VWaZoXOGv7D03A5BDhfhlk/L
7ROguddRbOXmPgAL3BC8XqCIGaTIWvZ9SrEJsVkB1ixu2h5jf+lHZooXA+o/mG4N
Sk5Sy4x26li7BOFGsvXw
=1DFW
-----END PGP SIGNATURE-----

--Sig_/miONKIELggyq8PC.QqPLEBI--
