Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A547CC8D;
	Tue,  3 Mar 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549311; cv=none; b=ZH2CQJFww8XlDQXuGDUd/6Q3fWZgN8HEpsf1PTbpgA1fhZ71ju26f553bvzHrw3ZnD+uRPX8ZmnFX0g5a2UA88SZYhTWB8Vj3CLbHCswoj3vXy1KkOBil49I3Hb4JUjUC+SnbfNbzpMpd8aZd5kFxhWm5+fURXwhJRCJfpYzArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549311; c=relaxed/simple;
	bh=J1tAObHXvRREmtdlu1AFe+EPJZ602gH1AYEEEWsaw+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uq9JCVr30C+k8h3x3MeiKq+UBTYTeJbubgI+KmG2butsx1eh+OxwBplE9q/UbQCoF9zbQxqXBOggZp88+3BFiXMnWNtfMonSGVvYUG8fzfisl9GplEw6H1Lgr+GKFT19p8Ew7FV97V62p1h7PHhw/9CQaZaCPC3Mc9EUAVC/W08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI4lG8wA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI4lG8wA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B95C116C6;
	Tue,  3 Mar 2026 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549311;
	bh=J1tAObHXvRREmtdlu1AFe+EPJZ602gH1AYEEEWsaw+M=;
	h=Date:From:To:Cc:Subject:From;
	b=BI4lG8wAGPW5r005+Ab50h9onzv6O5y2MUqNY97NxUlNgPvBa8o5J0dTezjmN7r/S
	 ugyfeVT7kmE4cOhQTawpM3eHAqc9oQxNI7HK3jIwNDlrcSQIWcuP/EBwk3SlJvAdbZ
	 j4jScsVHvmvXXSZs2jfQvc/fHc58X2537nPVE9lucurw/O7JKClfNrzysXZ/OMOZwR
	 3cmmlZPbn36aTtWk4ZYdb//suzWaOB54tW34fsfok314XqEiHUTelGfHTwzQkwEBXl
	 H9vxIlkEODnlJdkILUUBuC8dPfNM3tYiJwWmy/BYfCp/NGIOb28jLivbZHrb7xNkf1
	 Zw74WEriyTboA==
Date: Tue, 3 Mar 2026 14:48:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 3
Message-ID: <aab0u2AGJe8_FFXh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O9FrOIf1dkUJxoWp"
Content-Disposition: inline


--O9FrOIf1dkUJxoWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260302:

The hid lost it's build failure.

The amdgpu tree acquired a conflict with the origin tree.

The sched-ext tree acquired a conflict with the tip tree.

The battery tree acquired a build failure, I used the version from
next-20260302 instead.

The kunit-next tree acquired a conflict with the kunit-fixes tree.

Non-merge commits (relative to Linus' tree): 3030
 3479 files changed, 253845 insertions(+), 54402 deletions(-)

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

--O9FrOIf1dkUJxoWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmm9LoACgkQJNaLcl1U
h9BTZQf6A8JcsRZtRbFCFwUw6k4pr2LcB04hGr22y6ggzqY4m+ucBSsWFCXohoRo
mnYMEKGMIyL0DnU0hIWNunBDlR0RkRrh2ulHcwbPAAFBKpbtAXQJKu73TuaFcLOU
sUAYNJe8Zb0sSWwpyvFS02r3IkBgSWTvZ58XvWK0jVEDf8PBIXrcdb7sbvAZJ/Xx
9nLnSoZqc1aRTMeftRoPou+OSmgOCqmyTYw1fumTjffdr8QotdRKr8v8/JBa7K3b
0a3ZER3rObXlPl1wcuY4zJYT9nghabu8vHGHe/+xAEPtV0+41vYIlVsC6rXv2QK/
iIuv4goNtGZa0gQulKlKXspcZUF3Lw==
=N7AE
-----END PGP SIGNATURE-----

--O9FrOIf1dkUJxoWp--
