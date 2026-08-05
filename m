Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D4F47FB0C;
	Wed,  5 Aug 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944794; cv=none; b=dSvgXWDggyt4CdPpp3S+gvuetmEETMwl237Ddk/t2g7Ese2JMgLcGVLWa7eGkkIWgYbe3EAXD1/L/UaxEyd01/QPTPHWBpJcBgwanQIU1qFUwcUMX5Pbl38gYkj/F4e9jpcEnr3ohDEJJ8s2nOM4flLrJPpoJLHCdfsD3p0y3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944794; c=relaxed/simple;
	bh=EzReZJ7ZNPugALxjYOkWgZ07eNb50EWhNiDEwVb2Ixw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbbr/4oZJl6pzOw71QsDfnHwbNstP4Vl6i9507F6pHV00xAK5NoWl1jqdPMqA708USU8CwPV6vy9CxrjHXX7Jfei3A4u6PW7xjYQAcsWREFge7keGBUvmJlfAC+crsojCOM/zcV0v0KtjX566G2Ti7mgPRtllcnADCvO7bT3Pi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fljQlfAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fljQlfAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9404D1F000E9;
	Wed,  5 Aug 2026 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785944792;
	bh=Aw+Td1hKgg/ZR9D3qvYAhLdAbYcl9g4mIFeoNX+GxdQ=;
	h=Date:From:To:Cc:Subject;
	b=fljQlfAg4+Av7pqJhiyjdeLB2TEdSz7fZYz2+jaSZfiZqU46fkRRnywQckoHvLN0z
	 pmfoYYMSVoJHzbRx46OjFJ0VCNez5Ysu23kfr8IauoPlO3l78kUPcMjMBYZm0mDS5k
	 uXvXp1ZwQjv3M/r/z/jm3UslhdJz/NYVgthybEAblENRUZMwBXrx5Oe1ub2zSyHiw/
	 8U6kXlcSV/h2DhCULkP2ggtG6MHM7UZICfWqRBKL3ni4LdP1NEyA/4UvkjLvjHRtyp
	 pxBaFOUDnNybUEghQBHDtsC1dnZTp36Cpdut5RvCmM4l3wLqIaHIBDcgAsqxc9lgCJ
	 cXDh66i7T8KUg==
Date: Wed, 5 Aug 2026 16:46:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 5
Message-ID: <anNa1Xdl5SQDDtF8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HJilXhCOeZWblKcm"
Content-Disposition: inline


--HJilXhCOeZWblKcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260804:

The vfs-brauner tree acquired a conflict with the ntfs tree.

The jc_docs tree acquired a conflict with the char-misc.current tree.

The bluetooth tree acquired multiple conflicts with the origin tree.

The xen-tip tree lost it's build failure.

The sysctl tree acquired a conflict with the mm-nonmm-stable tree.

Non-merge commits (relative to Linus' tree): 11943
 10617 files changed, 560126 insertions(+), 172509 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--HJilXhCOeZWblKcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzWtQACgkQJNaLcl1U
h9A/owf8CD1nF7waabZ+/uIc06wKtu3eVhUhmhSX9OFRjFjPAII2Y6o6QODwcK3Z
F/kUKmdIxG7IjBgW1/6+IEXdKCyaBsn4XakbxWjzfCeurpsB5vdKXHZWfyu4yb3R
Ny9ZbgIZ71KxVnGSolFA8zX9Io1l41+uJcE4fuoZGWee0B/K+RicyUxFjHbkIh6g
JwRnUU4LkDX6KF/ko5zaAWiuoFy1f7ZHhIKQRgdvFC8h/RHCFEaGPhJaPmOHGCnQ
/Nn84coIvtDIPdENxM7axOuvNwZd0WaifUR9ekoSWkpWbvpRWSH0W+JlO4qeEGGV
VMLLakQqYue/6z87Gd+Xfd+286Sg+Q==
=IOJG
-----END PGP SIGNATURE-----

--HJilXhCOeZWblKcm--
