Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A738E3CB2E0;
	Wed,  8 Jul 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508661; cv=none; b=DAwiSGTOrxWSAIr+wEiL6LaksMVoyT/W+w8tLSxm3587JUQZjPBQ6uu+m7YDNdaiI8a0BTMSb0Cly97PYz0w7n/xm+ge2TXWyaJhCOlUmmUxPhMQrvXuCePM3cGxG+jHbjqGMkxCDxo1UKofeZQNbbUN2T8ZcNlu0yH2rmVJ+j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508661; c=relaxed/simple;
	bh=R9s9lmxAvN3mL4Y9//b2FNZYwukxgJKW4tTc1yvFeLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCp2fWEsUNhxpobMIA8do5eHyw/bjKnNSvSll8gV3D5KY3baqj4VE8ak7chd2mLMzWD7p8DNyex6AT9uLE/6xSmJJgMpmBcOxMlWSPCVbB+2maMBrXaQ8YAPQKZUrACTid7yuCYPIBme53KUQuc3nA3LRE2RUiSd2EZT7fUeJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2zL7yW5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2zL7yW5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC981F000E9;
	Wed,  8 Jul 2026 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783508657;
	bh=MiBrbsGw947bnrt5JDBtNZJG/af1py/D1YL/Lc0xFHw=;
	h=Date:From:To:Cc:Subject;
	b=P2zL7yW5tUK+bTGc6vxGCvp6xNjauPur/8oMTNjEaTPGWxGRMBrSNw1c0JLZ8eRXZ
	 5dT0JAoaX5lZxTPtZ8UbZRwca+/+Hx4LAu3shF1WDbk9hQR0ldx4TW5w9W19k5Ofb0
	 DlI8gMnFnC0wZSLdOBC8joDwrZ7GmZw9FzvRycYBoTCuec7QloietGvVWowLm9ARps
	 8NvoweGNZMCYMTajb4a9/QwvS5KYTjHAwY/5zEeuRmMoZhvr7Givy901L9mFRzuPlG
	 b4Myd2GOedbaoN2jWKXDViqDhGgKC/QIGZCxJ+4uKeCw2JrTM7XGNRZLFYabHE5ugZ
	 QLLzjQXFbETiQ==
Date: Wed, 8 Jul 2026 12:04:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <ak4urgJRb-83KEUI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZL/zK7eGLpfgxsL3"
Content-Disposition: inline


--ZL/zK7eGLpfgxsL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  tools/testing/selftests/filesystems/Makefile
  tools/testing/selftests/filesystems/.gitignore

between commit:

  d943e68edc5cb ("selftests/filesystems: test O_TMPFILE creation on idmappe=
d mounts")

=66rom the origin tree and commit:

  a21db4dcaf4ad ("selftests/filesystems: add ustat() coverage")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/filesystems/.gitignore
index a78f894157de3,1bd53d54553c1..0000000000000
--- a/tools/testing/selftests/filesystems/.gitignore
+++ b/tools/testing/selftests/filesystems/.gitignore
@@@ -5,4 -5,4 +5,5 @@@ fclo
  file_stressor
  anon_inode_test
  kernfs_test
 +idmapped_tmpfile
+ ustat_test
diff --cc tools/testing/selftests/filesystems/Makefile
index a7ec2ba2dd833,bbdd40b167fac..0000000000000
--- a/tools/testing/selftests/filesystems/Makefile
+++ b/tools/testing/selftests/filesystems/Makefile
@@@ -1,8 -1,7 +1,8 @@@
  # SPDX-License-Identifier: GPL-2.0
 =20
  CFLAGS +=3D $(KHDR_INCLUDES)
- TEST_GEN_PROGS :=3D devpts_pts file_stressor anon_inode_test kernfs_test =
fclog
+ TEST_GEN_PROGS :=3D devpts_pts file_stressor anon_inode_test kernfs_test =
fclog ustat_test
 +TEST_GEN_PROGS +=3D idmapped_tmpfile
  TEST_GEN_PROGS_EXTENDED :=3D dnotify_test
 =20
  include ../lib.mk

--ZL/zK7eGLpfgxsL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOLq0ACgkQJNaLcl1U
h9D6wwf+OjeWm4pyK0hCf//OZtDR6D18xc4IvIh34R6hWO5fseEzEpsTy2wijkVP
QOEYfEPuxtQFuhkm/z6WcPjWncvg6fY3I8hA/FVUX6vVz+SlMTAgPBRRPsw64KmH
PdURHdoq4TtM+Ru2aVvj5VhzyeF6urWI2+IBkhhKGCgcQQgRsE5LMRoiStnt/4pI
9/gvaIBEmx1zUkJr6g97aJ72y14DvXgadEF69fDdWTZHcSwida/lt4pbv5totk9+
dlnJ8mjftWQbJXeDn3cDPJ6RTWuP0GYYSoQVe+8gN60P9GBGmZOFE6SJV1/F7G/V
iftfqCtkRAcdnWmGzoXXguZqb/+pJg==
=D6Yg
-----END PGP SIGNATURE-----

--ZL/zK7eGLpfgxsL3--
