From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Wed, 16 Jan 2019 13:48:24 +1100
Message-ID: <20190116134824.74c2d7da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2Jb9UHR.9gaR=CVdBX_Jlm4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2Jb9UHR.9gaR=CVdBX_Jlm4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/gfs2/lops.c: In function 'gfs2_end_log_read':
fs/gfs2/lops.c:394:39: error: macro "bio_for_each_segment_all" requires 4 a=
rguments, but only 3 given
  bio_for_each_segment_all(bvec, bio, i) {
                                       ^
fs/gfs2/lops.c:394:2: error: 'bio_for_each_segment_all' undeclared (first u=
se in this function); did you mean 'bio_first_page_all'?
  bio_for_each_segment_all(bvec, bio, i) {
  ^~~~~~~~~~~~~~~~~~~~~~~~
  bio_first_page_all
fs/gfs2/lops.c:394:2: note: each undeclared identifier is reported only onc=
e for each function it appears in
fs/gfs2/lops.c:394:26: error: expected ';' before '{' token
  bio_for_each_segment_all(bvec, bio, i) {
                          ^              ~
                          ;

Caused by commit

  eb754eb2a953 ("block: allow bio_for_each_segment_all() to iterate over mu=
lti-page bvec")

One instance of bio_for_each_segment_all() was missed.

I have applied the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Jan 2019 13:44:02 +1100
Subject: [PATCH] block: fix up for bio_for_each_segment_all() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/gfs2/lops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ef68bf6232e7..15deefeaafd0 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -390,8 +390,9 @@ static void gfs2_end_log_read(struct bio *bio)
 	struct page *page;
 	struct bio_vec *bvec;
 	int i;
+	struct bvec_iter_all iter_all;
=20
-	bio_for_each_segment_all(bvec, bio, i) {
+	bio_for_each_segment_all(bvec, bio, i, iter_all) {
 		page =3D bvec->bv_page;
 		if (bio->bi_status) {
 			int err =3D blk_status_to_errno(bio->bi_status);
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/2Jb9UHR.9gaR=CVdBX_Jlm4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+m3gACgkQAVBC80lX
0GwoHQf+P6tzwemxAKhgg71igIacjJmsdrVXibDJl934znQDD/Pp5u+7pOYTgREk
4JEJXNX4/1E26k9dNBGE3CV0wUF2sLAsyvQ2PQ8BGO4deIUBUuieBAwtzOMISfsh
cn+MZPvmwBVCehVoWNyooNHsZ2OHMOzjyjx1UMs1FNtYTXKzbRuoH7JzeN9JCpjz
AsRoYsmBFjNxYTOFQFKgQs/rCcNOPNR8nNgNNIrDQbT82Mx2qHcJkX1+WZhgrzri
QAnCpnr2N9fwfSQmq7RORKkgLUTF35l4bdnF/ARhY8Z6CtONhaN6W7daGsejGzXu
JDgdvLChYR4btxvpVfm+6to4W+2Cbg==
=8hO2
-----END PGP SIGNATURE-----

--Sig_/2Jb9UHR.9gaR=CVdBX_Jlm4--
