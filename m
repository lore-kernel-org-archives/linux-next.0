Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DE22A4EE;
	Fri,  3 Apr 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227398; cv=none; b=dgfb3y5yFcW9plj1/U6RdiZEymtCUXZrgVsxx8zhB0Dsy8K/GTfnp3U+wbOzQtzZdBtft3gQVg+ZM1UCzRCVO+r8kd3LFWs/M+s3mYacCE4FeEBH2QfKx7dEJKm99sU0HIrJ+tP2Nk8O5zki+Z6hc2URlDmy+nyP2uhIBJ6IJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227398; c=relaxed/simple;
	bh=TP30K2tFnrIoi7NLfbMjiuL+6HBwjUmNHDvyD5fVagE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XnETWxDi+IgouvGYYVOy8KL2ucLD559s7hDLsOwtuuNZOvUoXlnHq/EDefWeYrxwE34jCgLkc/e2RqoVyhfkyNQA1wdSJeqeYExCyq5q2Zqnd0geeLvoFQatWHr+YTy1wJKkBML6ow2VtkfSF6j4zmGtZvfVLOrNHqxqHk0hzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9sigdRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9sigdRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78DEC4CEF7;
	Fri,  3 Apr 2026 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775227398;
	bh=TP30K2tFnrIoi7NLfbMjiuL+6HBwjUmNHDvyD5fVagE=;
	h=Date:From:To:Cc:Subject:From;
	b=B9sigdRaxEC3v4qVdm2xVUEvMsrO3KsnFgDiUDzg4E8eVBPnb7ht36fDntaD7aaWA
	 QH6pwGgqGuDaewXv+MTBO0ZD9SRkO0b1OZoF/D1AdzMkHxOQwm+WISJMsFavw7XRCw
	 F8wul0N9jLNbDmsWgqUubaaZZRGcAjUtM7d0iQ8xQg8EDBLWrd1uFwEZPr0mwZcdz8
	 et+JQC6fzItgR9nRG5c3AtWXbCUHEi3Lf4mD7RbIHpUYQNlyhTtzXbR9fEleq4n7oO
	 fBgU0VHYA72NBInvXMGf7Zlc179iUK8038IPiMmoI3JfLJaBGXaPeAJvmj38xyavcn
	 5QO0/v82CLCcw==
Date: Fri, 3 Apr 2026 15:43:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 3
Message-ID: <ac_SA_LdNS0Y6tTM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJHCZW/5dYcYTaYV"
Content-Disposition: inline


--DJHCZW/5dYcYTaYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260402:

The rust tree acquired a conflict with the origin tree.

The drm tree acquired a conflict with the drm-fixes tree.

The drm tree acquired a conflict with the rust tree.

The drm-misc tree acquired a conflict with the drm tree.

The tip tree acquired a conflict with the powerpc tree.

The ipmi tree acquired a build failure, I used the version from
next-20260402 instead.

Non-merge commits (relative to Linus' tree): 10937
 10229 files changed, 604250 insertions(+), 201199 deletions(-)

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

I am currently merging 414 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--DJHCZW/5dYcYTaYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnP0gIACgkQJNaLcl1U
h9Czowf+PgbPkg2EwEKEmjqzAUS0wwtAmkjwWnPtiTBSnLeaxRXoyCSsW1zI8TJO
XYmoxoEBFI+2oY3REzToMlqfyLTLtLAqEnrUfZlQdt6Ct1T3C8axgDj5hhBx9A+B
2dHp+B7GiNv0X+PKTilA3K8I3tkjUorlVA66p5jXzbnWg7WDjHsHWsYv75OACsmy
d8Jrhkkt5w3UHpVuY1071fHwUNE8EjNytxcyxm62/p1EBH8d5RJPltWgVPgG4+tj
07XNLf5+kb2EeXfNC47iMs456MM824iw8EX20EhocqyD4MIO6HR+4NA89bJLkDg/
G2ELiM2HZzOEOTAdwn+AzwzoV95kyQ==
=01gS
-----END PGP SIGNATURE-----

--DJHCZW/5dYcYTaYV--
