From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 6 May 2019 15:07:07 +1000
Message-ID: <20190506150707.618f013d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gcMpqtS=NShUJ79kEyb321h"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Abhi Das <adas@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gcMpqtS=NShUJ79kEyb321h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/gfs2/lops.c: In function 'gfs2_end_log_read':
fs/gfs2/lops.c:394:49: error: macro "bio_for_each_segment_all" passed 4 arg=
uments, but takes just 3
  bio_for_each_segment_all(bvec, bio, i, iter_all) {
                                                 ^
fs/gfs2/lops.c:394:2: error: 'bio_for_each_segment_all' undeclared (first u=
se in this function); did you mean 'bio_first_page_all'?
  bio_for_each_segment_all(bvec, bio, i, iter_all) {
  ^~~~~~~~~~~~~~~~~~~~~~~~
  bio_first_page_all
fs/gfs2/lops.c:394:2: note: each undeclared identifier is reported only onc=
e for each function it appears in
fs/gfs2/lops.c:394:26: error: expected ';' before '{' token
  bio_for_each_segment_all(bvec, bio, i, iter_all) {
                          ^                        ~
                          ;

Caused by commit

  2b070cfe582b ("block: remove the i argument to bio_for_each_segment_all")

interacting with commit

  e21e191994af ("gfs2: read journal in large chunks")

from the gfs2 tree.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 May 2019 14:57:42 +1000
Subject: [PATCH] gfs2: fix for "block: remove the i argument to bio_for_eac=
h_segment_all"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/gfs2/lops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3b3dd2ef53f7..33ab662c9aac 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -388,10 +388,9 @@ static void gfs2_end_log_read(struct bio *bio)
 {
 	struct page *page;
 	struct bio_vec *bvec;
-	int i;
 	struct bvec_iter_all iter_all;
=20
-	bio_for_each_segment_all(bvec, bio, i, iter_all) {
+	bio_for_each_segment_all(bvec, bio, iter_all) {
 		page =3D bvec->bv_page;
 		if (bio->bi_status) {
 			int err =3D blk_status_to_errno(bio->bi_status);
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/gcMpqtS=NShUJ79kEyb321h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPwPsACgkQAVBC80lX
0GwaqQf+Kb93aXAqHVmB3fNXzovRjENYa+yP4ysCuDIp+VjqvWM9OQicrMA4Ma44
DECEBder32fMiEMuj1m2SMt7+jYAxZbKvd7lg4EU+v2XLWPnFFrPLG4Vay7x3YM6
iqbzUi+AcDIIpuPKBta/o41KDWQLkI8MVMVAVbTNka0PKnMT9c20KeK77gi+rZMc
fg+imuEQgvztuYLS1+BpZAVxTpD4IQ+eJdTEIob9M9ZWMTibGWZ391C1YCSoOi4H
QmJXxx1XSnPOp7ivw0jESunwjBr/kwPglbqTxfiVg9E56zVI3Kw7HoWSQLlcxgvQ
jfTYQLR0MBJS6j1osKybBDFV7mefpA==
=CEyL
-----END PGP SIGNATURE-----

--Sig_/gcMpqtS=NShUJ79kEyb321h--
