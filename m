Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82A0219E8;
	Wed, 12 Aug 2026 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555923; cv=none; b=UNKjDosnxOf/eSb1s4wPD426AtCSwl2QbcCb6mgPyqoOrnrxuwpAIwqKeFFbVJt4NLiYlBH9B5VojJ+EnLEuX42mkx3RIDgmdgdAUOXtsf/a69h7chPpUMviDsS2tZvN3umrR8IPkI6flZeqS3t2tnAq/MmiWrqk+0+iEwvLKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555923; c=relaxed/simple;
	bh=G6hiB7Nt4aPqkXvXbM1n7mvlEQpV7TMs74612S5Buuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PwAZQWy7fA8lP7K7vLvGXDnVVeSZnx/hZDf9T0iFaaS7vzg3GYzed9UWS1pZsBswTt76SFQyU3M7MgrLDpeMhsPv3bF6yIUlwsRa8d6QEhpCb+c0Bd5j6oo4OcNUq9G8+2xvB0oB+j07aUsSslJLLxinHVgYRyCIB7OroGCH32o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTA5mXPB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTA5mXPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D591F000E9;
	Wed, 12 Aug 2026 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786555922;
	bh=M0i9IbyT4gEMeYYG1igodjcygwjMxJuqsQUhc4qVCv0=;
	h=Date:From:To:Cc:Subject;
	b=ZTA5mXPB9UrfYmHIvpiGlcKwr/U7HCn8ivZkG/EWiRIWXzHleNLaSlncxEWkCL82k
	 /2P0hWb/5Kwl4jPVIcXQpah/4cd/Y0eyb8P0zGr7ggqbmyKGKy+Xy6RiHO+4ouCB9R
	 uCMZDbyHb4cQpDGv08dEtqxkGqddorFgeHT+uar1nykhTHjM/R9N6d0wb0Y6cWB0aN
	 5JVtDw0nox/+aMDkS8wMErlqcDGFvGCPws3YUwixD+gj0UXvSztFMixr7d/d+x/9L3
	 fUAc4upLNEObvJUl9xQqsQW+LX0M9wp/9ytqyR4QU8NsEQoiNEh943ScUIO4AYIhwX
	 P+JiZ4qAKsLnA==
Date: Wed, 12 Aug 2026 18:31:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 12
Message-ID: <anyuDvKtbXHeiYhp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xndMs4nS9VnhbNQQ"
Content-Disposition: inline


--xndMs4nS9VnhbNQQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260811:

The f2fs tree lost it's build failure.

The drm tree acquired multiple conflicts with the drm-misc-fixes tree.

The gpio-brgl tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 13465
 11815 files changed, 654107 insertions(+), 210101 deletions(-)

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

--xndMs4nS9VnhbNQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8rg0ACgkQJNaLcl1U
h9B9Tgf/eZkB26MIl04KFOzYdQYQ8z/pyTRnGPzrw0rmUbuqshfdGx44p+KtTB8/
zK/X75e1uCJo8VT0zpg39IHP57Y9Y8t2y8y0yK4eXB05j8octrBVTc8NZ9Gp9MP1
SbIKHzdLOkUPIEF2QXRWgUgVUkkJxI8QV0Q9cRllSY6AfzU+t+uMctlK2MKyeM7K
y+0rBWtOnLs6vSMZ2XATcdsptVtsSPsulEllMgvAqDW47OusGF88dr+eAFxTPEII
PQvD6p+r/Qg0C+X7hP+/T/R9BA9RZbtBT0i4ExYaLjCjDpcjDtTKN91UJ4c4ZjV+
yITD0J3gqWSoB5F8BCdngsIsAow9BQ==
=/+xs
-----END PGP SIGNATURE-----

--xndMs4nS9VnhbNQQ--
