Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113384;
	b=xEX43qPU8bLtO4ZKyrOs9LtnP41GkN8q4vIWrsi+9P6nFWdvbH47NIib6k2hifdFr0ef
	 qrMgdP5c9Gemr76wn11CUppTo+qJaPUVV52Y8/wmP8HFbmHbM36rMbYWZu2x8ZSP59RY+
	 shCgVe3+0EBEWCg35d3RnzCZOho8i9oEbZUeiGLrbYlsNYRb7Tt6jJmIw/LOHwdmItcx3
	 kJNlcf3++cK6Xsc73Dft6Ou9pVeidpzlM7FlvlPnq3BAM+p+YmfHWHqBz2jIYncuDHHr9
	 GLaxbD/uudj7hTvF6velgfJoyeK3J8inIv1Q5ZGU12n4dvoS+8RbMifnZmLfu1JGJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113384;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=BHlSCOMCrr1jVkyfGghKlD5GkVt68d3E9cGLbCL9mqk=;
	b=xy/A9imPiP6kOzTc8TBu+nMY5AXw6xobk7BlE3RGmiZxw6pVWtFc0yEFdTlTwhsei3X9
	 1AMGuLSx4Cg5DhuOkfzCxa9FfLqzo3K65HdtMF2nBZjN77HmGeAcOJWLKPW2U7VjuKfDH
	 YMRfg5EQTNJMsEzwR8SgUIsoSrz9DFA1IcHWfgeIVBZhrgFR6fQC160DezLfGVcBhidUB
	 VxVwUyGi31T8C0Ul73Ji7xBqobhGzNaHWQp7dmnYXFGZIZxVz+s5Ntb5L9mWxc/6L2Bpz
	 dSjIKC3DlZgdYNJgtMYRcn0gCuHsaqmQfOIRL4IwvGzhyWhPfTwrQ14PElHAXD1HmXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VVanE/wF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704D606A320;
	Thu, 19 Nov 2026 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVanE/wF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAADB1F000C5;
	Thu, 19 Nov 2026 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113384;
	bh=BHlSCOMCrr1jVkyfGghKlD5GkVt68d3E9cGLbCL9mqk=;
	h=Date:From:To:Cc:Subject;
	b=VVanE/wFZ8/Ht+eYGyqsz/0lOpL5HMplPTTlpbFbiA/edVt3LoO3BsX+ratBunqaG
	 OuWt08rJiSZkdaVR5GCsVwunih7wvVjZZkxtrt6cd37sHVRaSc+WHgzyRaLjk4GcmY
	 7qnwla8tf60yebhlhr6allfggvQhF/dP0X430Sjs+83bcpCmswo8FcLhdCiTPnkf+N
	 mmIP5G9xe2DAshnM9ei7UUg7xCeW2/WUF8jz5oQAi1pToWTCGdHHS6W/S3YMAgVM9r
	 ncCYFiOUlhag9UcBp170Q5Y1hIGzR31JKxZ0Fk3igFRyQKDKmSNDSQdirV8rufi3RK
	 2gRNEr8JXGWLw==
Date: Thu, 19 Nov 2026 18:36:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 19
Message-ID: <av9BpDfR2CV2Pz4j@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="SC585TJhjXrTigAp"
Content-Disposition: inline


--SC585TJhjXrTigAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261118:

The rdma tree acquired multiple conflicts with the rdma-fixes tree.

The iio tree acquired a conflict with the origin tree.

The scsi-mkp tree acquired a conflict with the rdma tree.

The pinctrl-intel tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 8572


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

--SC585TJhjXrTigAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/QaQACgkQJNaLcl1U
h9C4qgf/b4xMPeF2J8JeW6rW6HFUHXzpqxchY22Gm0Di4/FzQPAh4ZJmFcnZRiD3
f+u8m5k8P35TdWxuxgtle1Vuy6dWhtXdk0ArpH7SVSCCh3RlbPqmtfBJzRvwhZWu
ovyJ26Fhkx8V/qemK9tNAGVhFrn2jySkgGWjyLfh94rQfJ3joOKgGW94yU5KagkQ
BV21EgzYGqJgqBqY2whBqg3qtFpef8CMBbw9JvhP88WE5ZGV3buPEUYtOJXlvcjH
rJIMMbHGs+Fegv1HhqdCIY1c6/MvP2zI+O5GQVdrGZuq+wO17Yc8JRrqT7QYm9uR
ASJZqjcyD9mK/ixFxXJe8jjjYpi4AA==
=IJmN
-----END PGP SIGNATURE-----

--SC585TJhjXrTigAp--
