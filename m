Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709885;
	b=oPq7V+tOqmBFkoV5606BzVhU45NrUQiC53AB+G+WM9X4rVmjT5kutt8l3btUVjkJGViZ
	 3I5/+XTvtVMAkvxBBiaMwGxvd6U3/iavP0y+yTsK+t6DE1+huWI4yi3Bf9MGnURUm0i6/
	 onpi+CDrrvarJZozzkhaT8nIVGiNeEa0en6YdwJvvhTS2MfZIszs+YcmMnnR+DKUEW/ZK
	 nOD4ua9SIp0gyfntGZnEvZgw/hlREx7zJQZFaGai1Lanmt+PiSDzpldvEx02AIVHDAMfq
	 n2sD3m45uYWlrUjjG9V0FLWIHhWgWnLcCJ7w6PDnkLZ9AS4xg+ZzkocbRhoThGrJ8ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709885;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=3Fz46sF8rJbaa+ohX2ocAdr3doog4m36GooTad8ZLyY=;
	b=x7HhCPeMJCDZm6CJHq8Mj73OCzfhO9xSW5B6+1kQRSzQeheHpkrqH0mZ5OZ8oJCJcOfK
	 oZ7RN3kGJZ1ATpYUwzEEPAOym1f6aRwFM/ckUI58iWydsqcKZNRWSQIkb7ZKHanMElAYF
	 u9qDWm7pWfvzzuWITRB1J/F6m464m7TJdvV64o6Aty+SA2EwybdyAyfVMnislY63yn4/N
	 xe4s3cgn3UKRAU6Y6WgVJsh8xXHjbeKFz4+GaEUrc9H8OejB8Y8mCpHlzxyNfALKM4Qf/
	 5HbvGdahBQCx4lg4VV2znj9lYFIqCwz0AfBQkjUI/m/4zwY21PTJHRmZjNOI7VesXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n4G/8S/W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B7606A31C;
	Thu, 26 Nov 2026 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4G/8S/W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62211F000C0;
	Thu, 26 Nov 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709884;
	bh=3Fz46sF8rJbaa+ohX2ocAdr3doog4m36GooTad8ZLyY=;
	h=Date:From:To:Cc:Subject;
	b=n4G/8S/W48G3ARPkME7d8WAj1mUIUoKcoLYNOTiBjem8atRu7+x6++DQ9jSWIwfpq
	 9PUDSsAxHxd5CCNWpocZemlrzRC0lrjnVgRvUfElNleOTEmd6uIs+kgc0We9LChyxW
	 vhj5hn7f+opfUCQlroK2KuKBhXz/JojSFMgAkLUE+l1/+lrN5A1aFvlse+HwTnOC6P
	 6Ier8fpXidy86UiPyJnzODubGZLOXldpygzgHNh5M1EhaMxbUshimKRjfQmOcIOP11
	 Hsw522RQ3N1gHAuBmyrB0MrpHeOyoFGLCiy9oVL9JwljVQ6nLIN2IRNl+y8xj9NUeH
	 zYmX1rMFH2lYw==
Date: Thu, 26 Nov 2026 16:18:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 26
Message-ID: <awhbub5ZRYLWJSBx@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqLtQDFNWtlRXCK1"
Content-Disposition: inline


--mqLtQDFNWtlRXCK1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20261125:
=20
The rust-xarray tree acquired a conflict with the rust-timekeeping tree.

The arm-soc tree acquired a conflict with the asm-generic tree.

The scmi tree acquired a conflict with the arm-soc tree.

The jc_docs tree acquired a conflict with the bpf-next tree.

The bpf-next tree acquired a conflict with the bpf tree.

The crypto tree acquired a conflict with the arm-soc tree.

The amdgpu tree acquired a conflict with the origin tree.

The drm-xe tree acquired a conflict with the origin tree.

The input tree acquired a conflict with the arm-soc tree.

The kexec tree acquired a conflict with the integrity tree.

The liveupdate tree acquired a conflict with the kexec tree.

The gpio-brgl tree acquired a conflict with the arm-soc tree.

Non-merge commits (relative to Linus' tree): 11005


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

I am currently merging 438 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--mqLtQDFNWtlRXCK1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIW7gACgkQJNaLcl1U
h9AREQf/Wbj0m29Op6ogIE0e+mcfZXmWEccF3NRzSzUd1LnGvrQAKJZ3bkue+u5k
kn6U6IvB+diLBjQ4J3vCmoRIJnRKyy36QD5F4O476SeQPL+9NQuX4nnuXYd+txNC
vI2aXsCVfnJDkTzXiw94W8oRX4y9//Q5/eg0D65r40/9ARubmsMPhOnKeL2cTwxZ
UIvdR7WUA0oXhOja7ibTwI1r0XoJrTpcolknyT09z1BPv/7TBTgIpwA7ztRJqKbK
bL4eLUfZoj29Z0MMl3s8ZAVgn4Qb283ace7sU95/z8vcO9VediQ7BvtQYIpzk9k+
PTMEzwVxYb/tli3fuO7WFH98XgwtNg==
=lDQK
-----END PGP SIGNATURE-----

--mqLtQDFNWtlRXCK1--
