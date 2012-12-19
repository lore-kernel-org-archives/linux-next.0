From: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Subject: Re: [PATCH -next] f2fs: add missing #include <linux/prefetch.h>
Date: Thu, 20 Dec 2012 08:55:45 +0900
Message-ID: <1355961345.16178.120.camel@kjgkr>
References: <1355951970-19720-1-git-send-email-geert@linux-m68k.org>
Reply-To: jaegeuk.kim@samsung.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="=-EE+T3YcemShKFLCeiL6K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60026 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab2LSXzz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Dec 2012 18:55:55 -0500
In-reply-to: <1355951970-19720-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--=-EE+T3YcemShKFLCeiL6K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged.
Thank you very much.

--=20
Jaegeuk Kim
Samsung

2012-12-19 (=EC=88=98), 22:19 +0100, Geert Uytterhoeven:
> m68k allmodconfig:
>=20
> fs/f2fs/data.c: In function =E2=80=98read_end_io=E2=80=99:
> fs/f2fs/data.c:311: error: implicit declaration of function =E2=80=98pref=
etchw=E2=80=99
>=20
> fs/f2fs/segment.c: In function =E2=80=98f2fs_end_io_write=E2=80=99:
> fs/f2fs/segment.c:628: error: implicit declaration of function =E2=80=98p=
refetchw=E2=80=99
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> http://kisskb.ellerman.id.au/kisskb/buildresult/7787109/
>=20
>  fs/f2fs/data.c    |    1 +
>  fs/f2fs/segment.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 655aeab..3aa5ce7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -16,6 +16,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/blkdev.h>
>  #include <linux/bio.h>
> +#include <linux/prefetch.h>
> =20
>  #include "f2fs.h"
>  #include "node.h"
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8bc1b6f..ca7b5ff 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -12,6 +12,7 @@
>  #include <linux/f2fs_fs.h>
>  #include <linux/bio.h>
>  #include <linux/blkdev.h>
> +#include <linux/prefetch.h>
>  #include <linux/vmalloc.h>
> =20
>  #include "f2fs.h"



--=-EE+T3YcemShKFLCeiL6K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJQ0lQBAAoJEEAUqH6CSFDSth4P/2Rvhp/bAk81JedEAAsqplxa
YSSyjY5gjgZ2Du4aqU8vxtBxEr8z9e/pLqzyHbtg+PgJrSroFtcnATi5iryLhlOk
XLKE599zd38heawUo2+xxvxQE9gjxgcdYyuTYX15M/TicG6DuxFpIW2Yfvjm6McV
GDsaiDrnQCdQLSrJy2FbJlgBZz33Rv8zfE6yb5V81ByThel1diqYWR5QQoynIna9
V2aPVlY4NOQWkXZqr27mCdZiHz+WahJYWYKCJU6tNTU1u687h6t+4tCjzigidv8J
IOCLgeNsto0LUCf0oF33jnEtyK2xvmoQnsC17yDoO3ro3/T5IyEQUL95oYk8M7l+
iirUaDuKSm4okEKF5Nj8qXqRgbYhS66e3xHJgiKdojlEAiv6EK70VdZR9Eh/kLIi
LUtPmrX4PNU/XyyyDkktP4kTLfqz5IMG/W36XIHXx/rzfzH4qAFfB85Og240r3NU
br+b0s6os2IBg7DtsIiPArpVGq+8bGLd1hH1kSKlbe1P7VvfwqQx8jpqtcY06K9O
+L+ZBA2Be+vxCwiXhb9w65V+6uvlBpER6gXYJY809bctvYIPymzA5U9OkH0uzkvZ
eJfTisxuGjSriayw8KfpS6QejjjvNol9mOwm2aKuDowkA0xDfxl/j/2e9Dou4Q8o
NxU93Z9cRq+OqQ2KagGy
=GSI0
-----END PGP SIGNATURE-----

--=-EE+T3YcemShKFLCeiL6K--
