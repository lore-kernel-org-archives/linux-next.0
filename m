Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ADB3DA7D9;
	Wed, 25 Feb 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038494; cv=none; b=fNIsEGgkbbPwQJDVhPbj+ZQ+1YJV/dRHYwk7237ic4KrRm0PwuWxbiI8qO+d3GVMka4szYk7d3RhtHeZg6J4xuHDxnvB3RWRKYWeA2IpJo61QF3bNlA8ETdH80tpXRS8DIQf+kkAsuqVJeFJQypk761T+vH2K6uQ/NV3AefCd40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038494; c=relaxed/simple;
	bh=vsWUVYL9gEyrLEacQe6LmCniXZLDLpwUoz8wjnG69y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBcQyti3CikirSHafi7HAnf1pCAtmvhQyAN8mwsdULDGVexibSml+0Pji/fU3SPOYNH4ruOQka23+SuJFqBdkLhgnmXwHazSqn3u9AD2Nrxem+mVmd/gXKsM6taUgNetzbRNKoi4RUXscH30laIg+ER/Mr7cWQu5lYBWpLgXnWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJAA6TDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJAA6TDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C0CC19422;
	Wed, 25 Feb 2026 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772038494;
	bh=vsWUVYL9gEyrLEacQe6LmCniXZLDLpwUoz8wjnG69y8=;
	h=Date:From:To:Cc:Subject:From;
	b=IJAA6TDd0DQ8xMJEHljPHW9tmFogxuNRnZMOTvzVKhdPjSohMU47q5plk2p7RCOxL
	 tKdTFyCqxIDNuf7uNWgYMjJytZdjfGyMubIZr4MIu1xVYFFu6eh3zhn4BZbNwADG4c
	 IulhRTXsQ/gk6o0CEHHKKyPVdgGMfXDVgfZdS1JxPYy53/9dVQ7Ky7BLrhkfuisQad
	 xMyl6Q4d68zB9Mf4vUo243LiJoj9DBqj/YmNVfPGxzJ8X15ynA+2tZr9RbXkHDRR6u
	 HORWmceR5VqSB4eoMqhPMriX8TikInHaxd0/KBIoSgpUgnq4lxYsRT1Ei8EJpYp3MV
	 nPl2pFp6oEFnA==
Date: Wed, 25 Feb 2026 16:54:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 25
Message-ID: <aZ8pWvKqd9DhNYRD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7cZC+xk/om54hp4"
Content-Disposition: inline


--r7cZC+xk/om54hp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260224:

The URL for the imx-mxs tree was updated.

The socfpga tree was added.

The ntfs tree was added.

The drm-msm-fixes tree acquired a conflict with the origin tree.

The net-next tree acquired a conflict with the net tree.

The bluetooth tree acquired a conflict with the net tree.

The drm-misc lost it's build failure.

The staging tree acquired a conflict with the staging.current tree.

Non-merge commits (relative to Linus' tree): 1890
 2114 files changed, 196952 insertions(+), 29041 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
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

I am currently merging 408 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--r7cZC+xk/om54hp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmfKVoACgkQJNaLcl1U
h9B9ZAf9Gmt2udaBZcu0jpUHTJbjpvViueY/pS3wCLDecPmAeirjQ86+TIo7YRwd
OkQs3gGLziuzmlnyWslt6U01xbo4+bMYx8a9AP/A49DHA04C5u0wt3NgNNrloPPN
mfB6EvudjkSezxkuXwSZ3Ce9v7xhnxtrz7If07BMtkr/0FG29gdl47GVXRqT6qGq
loNv4/3L4yWGE6kzavbpkRtR7p59YYLfQe7Sg6zdMsf8SYMdGaFOU6i50evwapSV
RVSHgJE1FPM5CNzU+wDDzZ5UlcZW55HH1Zm9fydoeamvlogORrx+r8La7/w2m2lJ
Y1BjV/CUkHhnZuzqfPdvf+fS6aXycg==
=P5aL
-----END PGP SIGNATURE-----

--r7cZC+xk/om54hp4--
