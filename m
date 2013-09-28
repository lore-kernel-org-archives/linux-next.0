From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH linux-next] skd: fix some VPRINTK() specifiers for size_t
Date: Sat, 28 Sep 2013 19:37:58 +0200
Message-ID: <1380389878-15497-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:58554 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754613Ab3I1RrH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 28 Sep 2013 13:47:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Andrew Morton <akpm@linux-foundation.org>

Use %zu for VPRINTK() as size_t specifier in replacement of %u.

This fixes 7 compilation warnings on x86_64 like the following:

  drivers/block/skd_main.c:4628:42: warning: format =E2=80=98%u=E2=80=99=
 expects argument of type =E2=80=98unsigned int=E2=80=99, but argument =
6 has type =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

While at it, remove one cast to unsigned long for a size_t VPRINTK() ar=
gument
and specify it as %zu, too.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
---

Hi,

This can be seen on e.g. linux next-20130927.

Best regards,

V.

 drivers/block/skd_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 3110f68..ee7f7a8 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -4556,11 +4556,10 @@ static int skd_cons_skmsg(struct skd_device *sk=
dev)
 	int rc =3D 0;
 	u32 i;
=20
-	VPRINTK(skdev, "skmsg_table kzalloc, struct %u, count %u total %lu\n"=
,
+	VPRINTK(skdev, "skmsg_table kzalloc, struct %zu, count %u total %zu\n=
",
 		sizeof(struct skd_fitmsg_context),
 		skdev->num_fitmsg_context,
-		(unsigned long) sizeof(struct skd_fitmsg_context) *
-					skdev->num_fitmsg_context);
+		sizeof(struct skd_fitmsg_context) * skdev->num_fitmsg_context);
=20
 	skdev->skmsg_table =3D kzalloc(sizeof(struct skd_fitmsg_context)
 				     *skdev->num_fitmsg_context, GFP_KERNEL);
@@ -4611,7 +4610,7 @@ static int skd_cons_skreq(struct skd_device *skde=
v)
 	int rc =3D 0;
 	u32 i;
=20
-	VPRINTK(skdev, "skreq_table kzalloc, struct %u, count %u total %u\n",
+	VPRINTK(skdev, "skreq_table kzalloc, struct %zu, count %u total %zu\n=
",
 		sizeof(struct skd_request_context),
 		skdev->num_req_context,
 		sizeof(struct skd_request_context) * skdev->num_req_context);
@@ -4623,7 +4622,7 @@ static int skd_cons_skreq(struct skd_device *skde=
v)
 		goto err_out;
 	}
=20
-	VPRINTK(skdev, "alloc sg_table sg_per_req %u scatlist %u total %u\n",
+	VPRINTK(skdev, "alloc sg_table sg_per_req %u scatlist %zu total %zu\n=
",
 		skdev->sgs_per_request, sizeof(struct scatterlist),
 		skdev->sgs_per_request * sizeof(struct scatterlist));
=20
@@ -4668,7 +4667,7 @@ static int skd_cons_skspcl(struct skd_device *skd=
ev)
 	int rc =3D 0;
 	u32 i, nbytes;
=20
-	VPRINTK(skdev, "skspcl_table kzalloc, struct %u, count %u total %u\n"=
,
+	VPRINTK(skdev, "skspcl_table kzalloc, struct %zu, count %u total %zu\=
n",
 		sizeof(struct skd_special_context),
 		skdev->n_special,
 		sizeof(struct skd_special_context) * skdev->n_special);
--=20
1.8.4.rc3
