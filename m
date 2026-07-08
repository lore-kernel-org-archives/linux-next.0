Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B113B7765;
	Wed,  8 Jul 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522762; cv=none; b=nnpTXZyc03U1CcQVeBIMVjp8Y5t6Pz3hhIxhmF50WWG7k98xwoxMFncZH7e7luUS+41p/IB9wA+thw0e8zZi4k9Sl5Wv/BawTdw717SmkNVS9hi/N7MxxQf0mB7iT5QCPJE8dVFS8itkeYXYfYK7n2VXUJCjfFw96EB0vVNIkrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522762; c=relaxed/simple;
	bh=myOChuVWMPZTOOucOXikwThUqmfV1I0CUi0mkyMBjNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kn1b0+0G6OVLqLtFN8IUGGZLTB2qd5nT6B8HcArW+e0K6TiR53WhPidIjvXgfj2BdGXKGAjWEz/Mz0sfWP+BxtT4xgjykO+F3KgYyUM/Q9jvcoLLTe6E7pqLopyU3rM4YDxxkxYC2VFMmWkHcfFx7Ma/j//jmmM75Ab5axe/y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUfyUiS9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUfyUiS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96AC1F00A3E;
	Wed,  8 Jul 2026 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522760;
	bh=wMDqr0oq4oQkgrFpbqQ7WcQLhxgxvkOvx9UzmzuHqVw=;
	h=Date:From:To:Cc:Subject;
	b=lUfyUiS9OaTk6b0Mwl1MzxYcaNtkNnJgLNjrapUVhbefYmFmXzklhBynopZSChhN5
	 MCI1T/8bZfHHfnHXDd8+8XBL9ri1RWZ6zSpFQToiHK+CryOMo/f/m5l1d4buWf70S4
	 2+HN0pYZBLU3MANb/qdnPE/9Cf6UBJxeiDdNQQdZdZkAaw0R8Ns0hb3FqcWwY7qpnP
	 cOjTbnqVTPe/nMFE327cWYwvqORxFh/uanicX6ke+hLmzkSe9utfwNHR/tXpIo4uNv
	 xacssq38NNHpWoRlemD/aI8TMA7Jb3kwWXeVjJvu6hN0o9SwrszhhSi96UFBAIWQEx
	 hPyZcncynqckw==
Date: Wed, 8 Jul 2026 15:59:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 8
Message-ID: <ak5lxQnAUcWvBqz5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3r8NFgrTbwQeRXzH"
Content-Disposition: inline


--3r8NFgrTbwQeRXzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260707:

The vfs-brauner tree acquired multiple conflicts with the origin tree.

The kvm tree acquired a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 4101
 4181 files changed, 144964 insertions(+), 74828 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--3r8NFgrTbwQeRXzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOZcQACgkQJNaLcl1U
h9Dxpwf/SaLJPESZ+g0oETGuXTJpAxpuZWJkpnWxZ2hDO/hFq1YXh9Neuudhv02U
AVT1H1pcwM+rk9ddgH3xf0uwkoYWWHW1tNQ6C2dpa3L62Ty4KDayr0bpexrj/Z2u
lEAaXxLgU3HIAjN6nQ44RMgeYrjynAPavvqAraRvA/d5V0hz42+Nr9pQbr/ENJbo
x6ucMjutcnxSUCw80TMHahUf32UGONBqyqK4Jz9Khbggc8OZ/AHvkgS929Rvg7aZ
kxX5amohqLyyp52G3eoGBTn40chFnAMiYxjHXumHHW0Xv9t8kM8QKxvZrsBWpnSx
dYWdPrThdoUF2cKOJrQbHtO1nefcmQ==
=gDrg
-----END PGP SIGNATURE-----

--3r8NFgrTbwQeRXzH--
