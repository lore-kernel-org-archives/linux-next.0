Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC3381AE1;
	Mon, 20 Jul 2026 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558793; cv=none; b=uXZgYy1hQX4D8NAm6+XMuYunYZYfWUGglDI9Zp85/LAm7SOaoZRA6A42HtSof6SZKUg1jYn+X/S7bMQefvPuzRW0O0cLO3jE0UtZQVdL8brxYy29n4YH3Arl9ucDAGpMqhS7KwaPwRXVS3iAxbOmyyk/rrDSJdhcg/s2zK2wBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558793; c=relaxed/simple;
	bh=BSOdPFF3nX3MlgCA+rJrncausTq+eiMbAA80wTI82D0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MfR3Wd549roOGglYcaOkwoJYG9570HnUNFdXYW4bhYmOUoYOCLQc0HhapUSvisBcI7hylumVQZ9UU0IADJLshyFZXm5ajCf1Vj7cPFsRNLZHHQkspEcBLg6iox7lKKeT0G200SnxL8688UY8hfuAOsn7AfUyV4GSJ6jM7xh+yeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBuHXJh/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBuHXJh/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61391F000E9;
	Mon, 20 Jul 2026 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558792;
	bh=qMAfpjZDUOtY2bM2iAzJDSfR38kWRfzhnXZq3s6GdPQ=;
	h=Date:From:To:Cc:Subject;
	b=OBuHXJh/1Hk1F2+7IdEw3zffPT53VezT9QgZ3xKgcER6jzQHQCt0KibVimQcFJSJI
	 eozXVAo/i3vq4o/oVt/mKzG6KwiMtixqlDsk/rRaVHXv8uEW9wktoiIvylf9Frp+y6
	 RxbEFMcrnQo2ADmqF+0n4utvOcHpJokHw5y1qazIquBrd7LWQ7rsdWEWj+MTEzeS+G
	 pnxnbOv5GzYoobiKgSki/+kd2ioPuK7EbwlHOESLXR0OP8eUSW31ZVby2Ggb2NGU1t
	 YlkubTS0okVYokZptzeiZwDkaeQ0T4sG30yVNddWQoAsel5bI3MK/iOtX+uuHwoxve
	 diD+Zav6j25aw==
Date: Mon, 20 Jul 2026 15:46:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <al40xMdxeEHvedyh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v1+Iy6d2Uj9A9sbL"
Content-Disposition: inline


--v1+Iy6d2Uj9A9sbL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/nsm.c

between commit:

  ce1fed11d18e1 ("misc: nsm: only unlock nsm_dev on post-lock error paths")

=66rom the char-misc.current tree and commit:

  937cd823bb2c9 ("misc: nsm: do not unlock mutex before locking it")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/misc/nsm.c
index 3960506eb7ab3,bb254ee65b840..0000000000000
--- a/drivers/misc/nsm.c
+++ b/drivers/misc/nsm.c
@@@ -243,7 -243,7 +243,7 @@@ static int nsm_sendrecv_msg_locked(stru
  		goto cleanup;
  	}
 =20
- 	msg->resp.len =3D len;
+ 	msg->resp.len =3D min_t(unsigned int, len, sizeof(msg->resp.data));
 =20
  	rc =3D 0;
 =20
@@@ -365,9 -365,8 +365,8 @@@ static long nsm_dev_ioctl(struct file *
  		return -EINVAL;
 =20
  	/* Copy user argument struct to kernel argument struct */
- 	r =3D -EFAULT;
  	if (copy_from_user(&raw, argp, _IOC_SIZE(cmd)))
- 		return r;
+ 		return -EFAULT;
 =20
  	mutex_lock(&nsm->lock);
 =20
@@@ -413,7 -412,6 +412,7 @@@ static int nsm_device_init_vq(struct vi
  }
 =20
  static const struct file_operations nsm_dev_fops =3D {
 +	.owner =3D THIS_MODULE,
  	.unlocked_ioctl =3D nsm_dev_ioctl,
  	.compat_ioctl =3D compat_ptr_ioctl,
  };

--v1+Iy6d2Uj9A9sbL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeNMMACgkQJNaLcl1U
h9D7IQf/ZZjZk6DQV0GM1eLCZGrW6IarVqgkF6JFiLt0LAzSL5HK4GFrjQEPHhgL
WhXnWBmk6Bx1soEbaGhYVnsclFOAXG4jo5hgn9fwaAoT9yBbqtLppkQqXTN83ZCK
Q7Ffb5HaFa955M7TovqMxOAHNjIuQPLtcQqRo6Vz9JNLEBUvPZoCxP2fdUCW2BxT
Ksb48Hpc2j2unGC9koXlAnQiXvm7XQx+96oykplagNL6BL77CYJBaCGxR8GWpkDD
8u1bz7kGKxmZ/c/nG7TZHDmeYpQKHhtw7Jts0VpbrDK/hRFcsPOrHn1QQU/0GGJg
tOjOSpWwBDs1dNpo5dNGhLJEzW6mmQ==
=OlU9
-----END PGP SIGNATURE-----

--v1+Iy6d2Uj9A9sbL--
