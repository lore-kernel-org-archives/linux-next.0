Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1F389115;
	Wed,  3 Jun 2026 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471003; cv=none; b=nxlOCfGLclNRX3MY/YLHWYvEJ43l5B74w/1yKkelLdy69fjNWqbJhFc2nc5kzOepRkBt9iIJbBBZxJnJeIoDv4wXftSGc2LmnlpHOQQkUvu4iUKbTnfbpWAXFcZsl8Ew+WBdJSeMYCcARcDlMTecvgUyU/52NXjZY65bSn8coMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471003; c=relaxed/simple;
	bh=Ew8pXqxPRA2qQSc9uabO8GI6lnZCkOk+j2in2uWo3KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsOTdh+1mO90GxT4fIgZbAutW/klCmoz23qBdPMBKU7NYizX3V6tCXB9x1FeTJ3U/lVsrNOLPWPZ/seltbe9m1gmQU2NwSbm8wcj/wtzghM6AsrSirWa8SLAKse9mXRtx4lYTKiPGsNx/1iGidxdg8yl7J7//6TyuOJbmWMfPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9f2QKm7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9f2QKm7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DE31F00893;
	Wed,  3 Jun 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471002;
	bh=NAJJzV/f9t0AYPrkxS9jC9UHbEqXg/IFLx9cjTQ/aB4=;
	h=Date:From:To:Cc:Subject;
	b=G9f2QKm7w9P8zSo03NihDDncUTevQd1ppuZhMSwJgac2U5WS8YQ3NAouUBK9GooDy
	 lN0VB2NJ33n4silXt7hddrnftBWh+/DP2ATd3dfQ1UwnkVQYT58aaBTgVUBRuW+HS8
	 AdxqPdGEiS73gRi59+jjN32iSNLFdf8qGOd+1KYGKoGxvghLZijlZlFwHTg9X38FxI
	 hAPEypRwqdLWqfqFXWczHPH4VEBjMBXCeiuCktNJfqA2KjJw+YGxiqBz3N/cLc8TEf
	 2DDDKZcs3uPyV1gDFf4n3Ih3Hje8+IZaQABD+jDKDkyhk7juqKklburJXRAowITay/
	 PQ1P6XijMEM9g==
Date: Wed, 3 Jun 2026 08:16:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 2
Message-ID: <ah_U18GJNrYGZ8HS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+C9no72yr1TfWnYQ"
Content-Disposition: inline


--+C9no72yr1TfWnYQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260601:

The btrfs tree acquired a conflict with the btrfs-fixes tree.

The vfs-brauner tree lost it's build failure.

The kbuild tree acquired a conflict with the clang-fixes tree.

The jc_docs tree acquired a conflict with the kbuild tree.

The imx-mxs tree acquired a build failure, I used the version from
next-20260601.

The v4l-dvb tree acquired a conflict with the origin tree.

The security tree gained a build failure due to an interaction with the
bpf-next tree for which I applied a revert.

The cxl tree acquired a conflict with the nvdimm tree.

Non-merge commits (relative to Linus' tree): 9287
 10254 files changed, 545708 insertions(+), 202987 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--+C9no72yr1TfWnYQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof1NYACgkQJNaLcl1U
h9B1Ugf/XDscoaMBxWMMloi5sPmVsr94kSTAGujd/2tiV9uOSdK1YC6R8Lfemzz7
m/aYH0eE+frgxmSco1A+FmMvJlPeo8l19/RZPXpQjHboP5AeKlLWl0/OOOcKqxzS
xOIXi25B28W0BAP16sCn0VnZ02pInUgiXj9FcBuHnBhn6z3wEHAC+aCGznLJWfha
xjqww/xMiMUZH4iXx+BfWt968YB88ku2DM3W4GQ9GzzU+1yfWymwNt5R94mEsdqh
y4A9hbA2DuTyBeOspS+T6oJc5c8kNK2LX8J9Jdf/un+N/CA6ylqW1TTKv0yQEOmV
4KhQpBuVHnpI2zE9GR/a8i6tUr7zOg==
=CKL4
-----END PGP SIGNATURE-----

--+C9no72yr1TfWnYQ--
