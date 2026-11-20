Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193137;
	b=DC706uGmLDkt/OSa1QGP6zWuAXntr62uFGY6urnZmKfeu6IcnapVT6XO0foPuvyWgjrW
	 fyHoQwUhzYjAADHNGTFc4UiUM9YsOYx3i/kFsPP+i6CedBI7V1JmBuWWSp2s4v0zAF+0z
	 LceNImSC2JL3q5gY5vhqhUIyzW6eOu1G3GyRl17V85Kpl4YEAxHDlaWCjF5QBgUXY0A/a
	 wI4MhEmpk2dPCFOS2Fyrm5pxgiutnQkzVtg9L3g4IkZBvhOSmm6SU+4l2MHBREWn+zgik
	 yoH86qbZQRccKZxtX4mDH+K/adl2hPkzxdqmkce9C87dvpqRHwLPkoheOP2tkFjRyRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193137;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=MkG5SYBGk10IwyJzc9Rui0EULxFfXUWH9ljdNHcxL/U=;
	b=CIQGPOQi6EWnctLX/7Trf4TzY6L8aY5aZJdvgk1eHUVPrcLQLTZaWyGlwzorqdIEuA3h
	 ZQVfJPiCr0coypisyJi4wkoQWtv8eg8XmKeU6F8FNZpVAJwHje95QKC6dnP1MSy6WHfWp
	 gNDGjsLLQ5AJNB93XjZrZNR8OgLtPgpIG+A1wohNOfGHcdjFVIjJmn9kCg7ZIfjULJoGN
	 Eb/sKQmGwVWNRa04GKxJCVQZVONlV+KZTNzZL8ik9jA1xijMDVo1kqbGwHAtfzZjEsDbA
	 T6aWr3kJixclKBTEzCKKfqFCCS/oNqOLOn1nwwH1eUa/+odzSC3AZb1sd99AIoMWoHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCuV9sDz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACF606A62C;
	Fri, 20 Nov 2026 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCuV9sDz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4A31F000C4;
	Fri, 20 Nov 2026 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193137;
	bh=MkG5SYBGk10IwyJzc9Rui0EULxFfXUWH9ljdNHcxL/U=;
	h=Date:From:To:Cc:Subject;
	b=DCuV9sDz+/rxaWpWXbIdToBy8B+2+BeepTUKgO1p8Z3SztVR1mpV4aImWIKHIfHS+
	 IjyEVe/crLnpfGckF7FfkQLbou1gcr1JiYSBYnFGVu41rn3ww3g/lz/d3XZDMlX2qJ
	 DpUB1F659jNhUqxa/zDuJZ7YZ5N0gexd/MQobpaHU9HgCX+FFx53nelrxN9wWOvOBn
	 /szYXLPk9hKn5Nfi9xnv7XOEsFw7e1iICjHNlkj3NAYhiltkO8MHVMBi993xbAATgZ
	 /Xip01Higm/qxXZ9LrdflOEwlrU9GE9c8vPKSScr46zE/5CBdLFB7Ezczx+anKphEW
	 W1IYQjjOgd/nw==
Date: Fri, 20 Nov 2026 16:45:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 20
Message-ID: <awB5LfezLBAfSkrX@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="REyDMUGa5N3hA1lq"
Content-Disposition: inline


--REyDMUGa5N3hA1lq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261119:

The vfs-brauner tree acquired a conflict with the vfs-brauner-fixes tree.

The hid tree acquired a conflict with the origin tree.

The hid tree acquired a build failure, I used the version from
next-20261119.

The drm tree acquired a conflict with the drm-xe-fixes tree.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The leds-lj tree acquired a conflict with the origin tree.

The kapi tree acquired a conflict with the modules tree.

Non-merge commits (relative to Linus' tree): 9049


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

--REyDMUGa5N3hA1lq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAeSwACgkQJNaLcl1U
h9DgCAf/SYgFe0lvyLBTuXK0/IyHkn/Lw5tuN2t10fQASG436ud+kNYLHd/2KK5l
eFA8R6Yh6UHE8hT/QHgz3h6aPFD30rgHYvPnNbVD0a4oJphbPxmgYSsVnHHd9PWJ
cSMiIMf47NCAk3iwFTxn2y3P1T7jposgC9WeRCkKHGwNvLG8niax4MhBYuWF8fh8
XVwPiKe2X/yX9CuDG7/BvTLpbu/uktiSD/u6rDwNJpBU7uDYG9gir02K+rk/O0qE
u3D+uwMnh4HOUkvjM0jl2W6wC0rmkMDnmil/5eiIstSFj76jEgnZvxnx+jOXtgHE
39NUSCQ166gPO5FMSHRrzOb010uX4Q==
=8dMV
-----END PGP SIGNATURE-----

--REyDMUGa5N3hA1lq--
