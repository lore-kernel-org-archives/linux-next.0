From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 13 Feb 2019 17:25:18 +1100
Message-ID: <20190213172518.50d4fec7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YHOchZ/0xpMrBCruzfM58WQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YHOchZ/0xpMrBCruzfM58WQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/io_uring.c: In function 'io_async_list_note':
fs/io_uring.c:931:16: error: 'VM_MAX_READAHEAD' undeclared (first use in th=
is function); did you mean 'VM_MAYREAD'?
    max_pages =3D VM_MAX_READAHEAD >> (PAGE_SHIFT - 10);
                ^~~~~~~~~~~~~~~~
                VM_MAYREAD

Caused by commit

  4c416502dae2 ("mm: Refactor readahead defines in mm.h")

interacting with commit

  6eff5fa16a2e ("io_uring: allow workqueue item to handle multiple buffered=
 requests")

from the block tree.

I have applied this merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 13 Feb 2019 17:21:44 +1100
Subject: [PATCH] io_uring: fix up for readahead defines refactor

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 1ff4acc9654d..c8272bc96d84 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -928,7 +928,7 @@ static void io_async_list_note(int rw, struct io_kiocb =
*req, size_t len)
 		/* Use 8x RA size as a decent limiter for both reads/writes */
 		max_pages =3D filp->f_ra.ra_pages;
 		if (!max_pages)
-			max_pages =3D VM_MAX_READAHEAD >> (PAGE_SHIFT - 10);
+			max_pages =3D VM_READAHEAD_PAGES;
 		max_pages *=3D 8;
=20
 		/* If max pages are exceeded, reset the state */
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/YHOchZ/0xpMrBCruzfM58WQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjuE4ACgkQAVBC80lX
0GxwaAf/bYpw9p+xNQbhPOLksKtY6LePxfnwcuBePysjuh9uWNt92N38var6cTXk
rXCfhfZmEvU54aNTWrMtKtDUpGoR2sEOdRJEK+qC1jq2XCudxl0gRO6FA2Do+lrh
oRqwR9umXK4mGeeLLDEP+i6MZDL9hZNFeztKcqx6fM6VhL6Gp1QnnOwSWgY8gIQL
ZWZMl2xMbsemx6V5TFN8ODSeQhTXvmMJZPDsJ5asPu+8dV01L7onpar9e8AX1G7K
6d7hf3/VzJMuQiENEpdpICPcwoUl85vajf/lWechpXf63ZP3hPWXh60fzaJIP6TB
tIsreEmvniFT/WegiNguVeSCobEDfA==
=tyJJ
-----END PGP SIGNATURE-----

--Sig_/YHOchZ/0xpMrBCruzfM58WQ--
