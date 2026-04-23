Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D71A3029;
	Thu, 23 Apr 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945157; cv=none; b=EJmGzBmbrDX6VginiCsphdoz29sWJmvEvZFFHvLLyabSbGSZn2zvr4daHMeZ3BqaTW3By3Tdg4GCVpvx8ltFqxDQS0VY3oUxSpRbNuyEbRKrAB4f0mf312gEushc2jEtJa3vuy+TbY9vwY9VpDLLbYEt++c/vBnGCCwgKBFN7Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945157; c=relaxed/simple;
	bh=prD59CCWBtGY8jlWFKg1ncmGsWR9DYqXgzz0eJJGVVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+2R5DwgTQmJfwuNRALbI3E31TuH/njk/vgDXWQNVR/34z80MBgIdEvlojhOqebxyM3KuEHXWO1SFdZMV0jsrQJbkuBPAKfG7s9dVTRN7X5tupKREUVAgC/9TNvkzV1eZH6rRo9aDKYEY4cpSxJvWL4a7SOH9Nf/BwwDx3rOsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6BZ1pz1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6BZ1pz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792FCC2BCAF;
	Thu, 23 Apr 2026 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776945157;
	bh=prD59CCWBtGY8jlWFKg1ncmGsWR9DYqXgzz0eJJGVVU=;
	h=Date:From:To:Cc:Subject:From;
	b=L6BZ1pz1mdHrExgKVGxqK6UFtLQ4Gpv/fPjUBILhOFRzmrF8G5Yee44zrH7DWFw+V
	 Q8bWZlLpOAKn/HJfMp2rwMRizqJBgeNE/Px74xn0drbt1C+AszSfnD4g53Jt08OV5o
	 cMkYo32Uhv1NXwnlyBqLRkg/zdXzP3Rk6M/fl2kxq0qOkXP3expCoE5CVql6NZFxzO
	 QuvTouiLlL/7en6y6NlfsNxlkCrKjRd+REINKiXgn/z541cqpdB1SiCaowtvxiMKCK
	 Q4L+RUp6ajtObzn0H6uPn9HqLxJYEY1DHRo2lIltlfEw7MBY+1/fbRdZk7IjPslfrj
	 zziEfd4aJ6FrQ==
Date: Thu, 23 Apr 2026 12:52:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner-fixes tree
Message-ID: <aeoIAXzqh0n54mxl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7x7X9Ka/G+Kp+HPM"
Content-Disposition: inline


--7x7X9Ka/G+Kp+HPM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner-fixes tree, today's linux-next build
(arm_multi_v7 defconfig) failed like this:

In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/include/linux/fscache-cache.h:17,
                 from /tmp/next/build/lib/debug_info.c:13:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
In file included from
/tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/client.c:48:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
In file included
=66rom /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/super.c:70:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/super.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/file.c:41:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/file.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/read.c:28:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/read.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/direct.c:63:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/direct.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/pagelist.c:29:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289:
fs/nfs/pagelist.o] Error 1 In file included from
/tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/nfs4file.c:17:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289:
fs/nfs/nfs4file.o] Error 1 In file included from
/tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/write.c:37:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/write.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/inode.c:50:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/inode.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/dir.c:46:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/nfs/dir.o]
Error 1 In file included from /tmp/next/build/include/linux/fscache.h:18,
                 from /tmp/next/build/fs/nfs/fscache.h:15,
                 from /tmp/next/build/fs/nfs/nfs4proc.c:69:
/tmp/next/build/include/linux/netfs.h: In function 'netfs_read_sizes':
/tmp/next/build/include/linux/netfs.h:672:16: error: 'return' with a
value, in function returning void [-Wreturn-mismatch]
  672 |         return zero_point;
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/netfs.h:659:20: note: declared here
  659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
      |                    ^~~~~~~~~~~~~~~~

Caused by commit

  756f72b6d8db9 ("netfs: Fix potential for tearing in ->remote_i_size and -=
>zero_point")

I have used the tree from next-20260422 instead.

--7x7X9Ka/G+Kp+HPM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqCAEACgkQJNaLcl1U
h9A9xwf+OXrrVls2/QLS8VrbB0fagPeoPyoEW/v4pi2j7HPWeMzqa+NQuxVG2hw+
wE0q9Ub6XoMkXqaKPlV+quhr2vxJF39tQPBnevI4CWRDzuG1XdMbkuBVpDXZtAhq
8zg8OzNh/5Hn1irGbJGjI7eqzEWfKCDfqAnDk+6G+Iwv02Xa1gMbbgLr6dDs7k9R
8OvnUpEliJaX42LimGR2u4BCjPNL/hDgH4dEtG5/NPko+5JxJjME9zWqFbr+bQwd
xT1AZvCiLE7jSNedtLQpV6sjtcCw/b58OuWKIxXwtQgW+STJQ4xCWojWZY3nquUa
0aS0Av1i+jyNRxqVYVBZGcPk4zH8Zw==
=MsPi
-----END PGP SIGNATURE-----

--7x7X9Ka/G+Kp+HPM--
