Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059103D6CBF;
	Tue, 31 Mar 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967170; cv=none; b=B8p+TqnF/+GchEamcvgzNqIP3pQ+Lqi1ctAggFExGLIZp/RFVbQAa2f8SkkDNxylbiZDbehm7FQIviYISiRuic5FcLqikqk9h97M7eYnLhbZst9Zgplpnw8dIN9mmfOi7FZL61P3TRx2oyJEC+8BD828L5wbkDr4YkHFk4zk9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967170; c=relaxed/simple;
	bh=wQ/eGFxwuISBV8dmdaNAPas79z5Pzu5ehBnjWKHeEvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CohXZG6TFCB+oPLVr9CjxLTUQ1R3mO2nd6MV3GUtqT5vuvhQd8KFGCrfjHRkJujd5lEe0IAT7/HBHEVMn8Hngl2DwDftfD/AuZSzoFmHBhomk2YhzRGfDCsH7I6qdKULXNEBYdlWo5WAbUnhpLtvQmC4bTCcnshsHCBIXb1gjic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkXRVHSx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkXRVHSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B6DC19423;
	Tue, 31 Mar 2026 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774967169;
	bh=wQ/eGFxwuISBV8dmdaNAPas79z5Pzu5ehBnjWKHeEvY=;
	h=Date:From:To:Cc:Subject:From;
	b=KkXRVHSxbquZIxmubbWbcZZw8N/Rni3inb2ACnfJdncPLFPi5I89u+kgwlpWDk9Ul
	 P7PHoRqif7NeJ4jhoX8axWVhZ7uSCgkHdJXkrXPUM2mCAgX3iKxdt4/FLnpyg1grLw
	 mNCsF/XXNfNOyaG9G+t7fP5HqQ779KDmAqtAKMF5wwddrg/NYXWyZJHIJjJfdvTBVz
	 SacoyL438I+pOP+eE63xLo6DlrGypFdV0UC6ZU3mSrX1wecTuHuA9Vsbu2BKHxSEgv
	 wC9k6sUDNlOkCxv8c6kb0Q8UCzCTV8zkplRCvVAxfhSFYErR/BXms/U0m5szBNLxZg
	 1jkwMFmpazrWA==
Date: Tue, 31 Mar 2026 15:26:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 31
Message-ID: <acvZfuQDdG-99lLT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D8xOYWNnvuF2YSUx"
Content-Disposition: inline


--D8xOYWNnvuF2YSUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260330:

The pci lost it's build failure.

The jc_docs tree acquired a conflict with the mm-nomm-stable tree.

The pm lost it's build failure.

The pwrseq tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 9797
 9437 files changed, 575082 insertions(+), 184669 deletions(-)

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

I am currently merging 413 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--D8xOYWNnvuF2YSUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnL2X0ACgkQJNaLcl1U
h9AefggAhs9oUh/yiZPYa7cITnNwUBD4L1aoi4SSTWkZO5HJH9ZlqcyLOU6ZcHyt
3/aGF1MDKHE6GtQ8tlW4Z/KXzp2uaOs69DT0QhRKmaRfCS0JexzlcEUJMIorpeiJ
HT7VIA/7yRrLxdK69Ie1GQF+xuQVJJsQeifjzJ+JXPmJ6ZF+JplBCiR8//MOlWFy
YJh+WhWOd69Uv7oV/uXnk+LvPNuZ/rDDiqd9wVjmbakeMPQZZe5XmpJjrBBUUNfo
azDOoYry8zK+rd2sernv6fluQGRO2IGpXf1+ddxlP5cRFcJb8353R+DA34VLgWnw
Sur0QuywQuFxYMzxTIhrfa4pNC1lpw==
=d0sH
-----END PGP SIGNATURE-----

--D8xOYWNnvuF2YSUx--
