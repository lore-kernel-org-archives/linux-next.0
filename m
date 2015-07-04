From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20150703 build: 1 failures 73 warnings (next-20150703)
Date: Sat, 4 Jul 2015 16:52:49 +1000
Message-ID: <20150704165249.231cdacd@canb.auug.org.au>
References: <E1ZB04o-0001MQ-6U@optimist>
	<CAP=VYLqpwQ4OqYMBW4m9oo2ZjiZEda7vn1zSXxLEYtH7ucbOqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45778 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754358AbbGEIkc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 5 Jul 2015 04:40:32 -0400
In-Reply-To: <CAP=VYLqpwQ4OqYMBW4m9oo2ZjiZEda7vn1zSXxLEYtH7ucbOqQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, jack@suse.cz, Andrew Morton <akpm@linux-foundation.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Hi Paul,

On Sat, 4 Jul 2015 00:01:33 -0400 Paul Gortmaker <paul.gortmaker@windri=
ver.com> wrote:
>
> Bisect:
>=20
> 6e9d331aec60a3dd1bbc035fbdd84a90364b8565 is the first bad commit
> commit 6e9d331aec60a3dd1bbc035fbdd84a90364b8565
> Author: Jan Kara <jack@suse.cz>
> Date:   Fri Jun 19 09:05:45 2015 +1000
>=20
>     drm/exynos: convert g2d_userptr_get_dma_addr() to use get_vaddr_f=
rames()

Amazing!  Four SOB lines and lots of CCs and noone bothered to build te=
st it :-(

> Fix seems posted here...
>=20
> http://permalink.gmane.org/gmane.comp.video.dri.devel/131898
>=20
> Original problematic commit comes in via the akpm tree....
> paul@yow:~/git/linux-head$ git describe --contains 6e9d331aec60a3dd
> next-20150703~1^2~4
>=20
> paul@yow:~/git/linux-head$ git rev-parse next-20150703~1
> 43fd9052f8cba2ae8e11c0a763ef5a5c512d187d
>=20
> ...which is:
>=20
> 43fd9052f8cb Merge branch 'akpm/master'

Thanks for that.  I have applied that fix patch to my copy of the akpm
tree in case Andrew does not get around to it by Monday.  For
completeness here is the patch (as applied to my tree) again:

=46rom: Joonyoung Shim <jy0922.shim@samsung.com>
Date: Thu, 2 Jul 2015 21:47:05 +0900
Subject: [PATCH] drm/exynos: fix compile error and warning of g2d
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Should be !g2d_userptr->vec, not !vec. This will fix below compile
error.

drivers/gpu/drm/exynos/exynos_drm_g2d.c: In function =E2=80=98g2d_userp=
tr_get_dma_addr=E2=80=99:
drivers/gpu/drm/exynos/exynos_drm_g2d.c:465:7: error: =E2=80=98vec=E2=80=
=99 undeclared (first use in this function)
  if (!vec)

Also, if g2d_userptr->vec is NULL it should assign -ENOMEM in ret. It
will fix below compile warning.

drivers/gpu/drm/exynos/exynos_drm_g2d.c: In function =E2=80=98exynos_g2=
d_set_cmdlist_ioctl=E2=80=99:
drivers/gpu/drm/exynos/exynos_drm_g2d.c:415:6: warning: =E2=80=98ret=E2=
=80=99 may be used uninitialized in this function [-Wmaybe-uninitialize=
d]
  int ret;
      ^
Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/=
exynos/exynos_drm_g2d.c
index 810e1ee7c07d..7584834a53c9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -462,8 +462,10 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct=
 drm_device *drm_dev,
 	end =3D PAGE_ALIGN(userptr + size);
 	npages =3D (end - start) >> PAGE_SHIFT;
 	g2d_userptr->vec =3D frame_vector_create(npages);
-	if (!vec)
+	if (!g2d_userptr->vec) {
+		ret =3D -ENOMEM;
 		goto err_free;
+	}
=20
 	ret =3D get_vaddr_frames(start, npages, true, true, g2d_userptr->vec)=
;
 	if (ret !=3D npages) {
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
