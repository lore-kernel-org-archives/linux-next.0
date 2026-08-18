Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37F33EC68E;
	Tue, 18 Aug 2026 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078535; cv=none; b=iZHidW0bzbQQBYYNIFn67m0KdRfdwaMd27Rw62EM64oqU8cpI9ewpOngbfjucJOKho7LR7WqaC85JJs1cSiFbQ/IhhGXfxfQg71KrWInIyEgQbEUx42DpF9hO4frn+2/ePfaFNulUJVI/KmbENbCxLUE5TWluR2V1hOUqpL9Cs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078535; c=relaxed/simple;
	bh=kkF5o7Ie52xk4fWM9sKJnQ11TfOhff2isLsbeGzlMVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DjSYy6Ucs93xtvqNZqfwcpravhz5K1zsup1OMQS6l5NgEdE5F1Irjen5ysiTeMvAJi2g/oeJSHgFM3C4Fh1uXSPjuR09V7l7x9lJUBsOXq/lLNmfiv1cuaX4rSUFhdWh+8Y7GL/fzUKLHcJvielUYndsIGy5qTNnspaKD5GQMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlsRCzK5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlsRCzK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632381F00A3A;
	Tue, 18 Aug 2026 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078533;
	bh=3WbmOGhDqsiW3vR2WjQ+YcOADP9EMF0h+h8mOpv5vgo=;
	h=Date:From:To:Cc:Subject;
	b=BlsRCzK5yJiQuN655aPVaJFWHuRTzh5LtrPKP8byu4QMi+jC6X4+pQ5+bYVHfoiEs
	 AmzwhzNU1Y2kUYX8k9rpYx0Q4HropU58T8ZgaF/ZwfIKwR+jmWPxVrLi+nyroNPiI9
	 e0XKhQiPonRbkUJQI0+3KAWOOpSmJMxhjrJYERvZMo/ANljwgTc/VfoTDKiKJfip4L
	 ctDzipVjGsu5OQwCt40xbPY656OFEHFd3edH+cvuknZtVIAeDX6YDumgEnuY0vHZrX
	 Y+1DQUGyd4ekeI4YqK2LC5QjvPSs3ozi458eEAR6+rFCSwepNW/QhwsJzcdXLqj5Bl
	 3zyZO3ExnbVUA==
Date: Tue, 18 Aug 2026 19:42:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <mszeredi@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <aoSngX0ijRMsmD27@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UEOGe0jvX9K4HKwS"
Content-Disposition: inline


--UEOGe0jvX9K4HKwS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build
(arm64 allnoconfig) failed like this:

In file included from /tmp/next/build/io_uring/filetable.h:5,
                 from /tmp/next/build/io_uring/openclose.c:17:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/openclose.o] Error 1 make[4]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/io_uring/cmd.h:6,
                 from /tmp/next/build/io_uring/uring_cmd.c:5:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/uring_cmd.o] Error 1 In file included from
/tmp/next/build/include/linux/io_uring/cmd.h:6,
                 from /tmp/next/build/io_uring/opdef.c:10:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/opdef.o] Error 1 In file included
=66rom /tmp/next/build/io_uring/eventfd.c:9:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/eventfd.o] Error 1 In file included from
/tmp/next/build/io_uring/filetable.h:5,
                 from /tmp/next/build/io_uring/splice.c:14:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/splice.o] Error 1 In file included from
/tmp/next/build/include/trace/events/io_uring.h:10,
                 from /tmp/next/build/io_uring/timeout.c:8:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/timeout.o] Error 1 In file included from
/tmp/next/build/io_uring/filetable.h:5,
                 from /tmp/next/build/io_uring/cancel.c:12:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/cancel.o] Error 1 In file included from
/tmp/next/build/include/trace/events/io_uring.h:10,
                 from /tmp/next/build/io_uring/wait.c:10:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:290:
io_uring/wait.o] Error 1 In file included from
/tmp/next/build/include/trace/events/io_uring.h:10,
                 from /tmp/next/build/io_uring/poll.c:12:
/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~

Caused by commit

   95961b72c57b2 (io_uring/rsrc: rename and export IO_IMU_DEST / IO_IMU_SOU=
RCE)

=66rom the fuse tree interacting with something in the block tree.  I have
applied the fixup below for today and can carry as needed:

=46rom 227fd8e91f19230683755e9a191e23c7dbfacaab Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Aug 2026 19:36:17 +0100
Subject: [PATCH] io_uring: Add missing include for ITER_SOURCE and ITER_DEST

Fix IWYU issues:

/tmp/next/build/include/linux/io_uring_types.h:56:32: error: 'ITER_DEST'
undeclared here (not in a function)
   56 |         IO_BUF_DEST     =3D 1 << ITER_DEST,
      |                                ^~~~~~~~~
/tmp/next/build/include/linux/io_uring_types.h:57:32: error: 'ITER_SOURCE'
undeclared here (not in a function)
   57 |         IO_BUF_SOURCE   =3D 1 << ITER_SOURCE,
      |                                ^~~~~~~~~~~

Fixes: 95961b72c57b2 ("io_uring/rsrc: rename and export IO_IMU_DEST / IO_IM=
U_SOURCE")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/io_uring_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index b516d9feb0f14..39629ee77b911 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -6,6 +6,7 @@
 #include <linux/task_work.h>
 #include <linux/bitmap.h>
 #include <linux/llist.h>
+#include <linux/uio.h>
 #include <uapi/linux/io_uring.h>
=20
 struct iou_loop_params;
--=20
2.47.3


--UEOGe0jvX9K4HKwS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEp4AACgkQJNaLcl1U
h9CIJwf/dx2nmJgcCD5aFi1rQhSOyxAOfpzqTa7V8JBf8j0SyVm+OUxgYokawYrp
n1cy3duPOMRFwsTW884PEYq2LwBkXBXPZOHVVbovLzlobD3InrUNdvXhBZg545Lz
R8VLy0t9DowFOMPbyBZVDzw9B0DfdxLJxnQZipJ5I7+vvnBvbU0b1pnLYLaeQME8
ZiAFT70BWpUXaXn7LT8Yq6ljAZKU+Hg/2Nzn82Tj+8XMlqLGJF/jWDfiISwh9H/s
zL8yoYp/m0Bb2fTtMlV9C8z7EHT1I4ooQlaqFZI8wqi0psKvEo3TvnWk2hRUymtY
xvsohDVFCDuHeNnIoFdlZ8BQ6ABzKQ==
=VK0O
-----END PGP SIGNATURE-----

--UEOGe0jvX9K4HKwS--
