Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B843F23A4;
	Mon, 15 Jun 2026 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528485; cv=none; b=CV23Z2RcOo+J48UURrD0LV8YN590IteNXs1yMNMGSfjZfDLNy4fTy9azU0dMm5JpWGMkps9gJafvxc44IzMu8aQM3pMQH/rWABDHidiYTyUr2NIg1PYniET0mWErdp51v+5VdOLVbFTN5n+K6FPqJfGGrkEp8XnsehLul69ndBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528485; c=relaxed/simple;
	bh=PsjgkhEbwH8s8x+dxlAg290hV5eSfuei5Zg2HWDKKnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thadkqN4NWK6+B9YbX1SCFBawtKqkaqLGkgDjGZedp8HrO4opVV97OeXXRilFpfI9lkjwiw4QoHYbnE66k3r5tB1A4QeJyXRuPVCtbeMAjtLjBWhhXtl1LHCOX/S3x5c0czjXImyhCHVq0+NS2rM7xcxqxKt8E6RKk14ejPgtV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYauqTvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYauqTvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F3C1F000E9;
	Mon, 15 Jun 2026 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528484;
	bh=qRK7lr/z2XuH3O9go6suItwuVed2uUQT7vhtzURFva8=;
	h=Date:From:To:Cc:Subject;
	b=MYauqTvtyRNaUxwhe0i1InTIvcODRGvCG7z3AHxHCI/iK7TGHhl2PYHS1NLa9ZqBF
	 9vjqtgECggbs4yo0UIcyYteLllpje1BimeAj1+3+yUk1c0/T4DXI1BaUBLCYrTuhPL
	 VEkzE4kOTBKBQtf4xO0JvJwf5UnHoA0xJ+BEcw2U28gXIVBJIXaeCdbvVL3dNERfEG
	 t20GtAsSABKax/wPQXKWE/ThroXb+UgS6ddDUE4yyNhvlcmV+hR6nLqbgRziHKRlmd
	 3nJQtEZQL+yaDWtOQ9rz2J/3D4W8US7vziHbsG2JnJO4lziVQ4jAh4bX40GjL5Icte
	 DCNI+23UxpksA==
Date: Mon, 15 Jun 2026 14:01:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 12
Message-ID: <ai_3ofnX09hrMV5F@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Xx7O1rFcOarY+DQ"
Content-Disposition: inline


--7Xx7O1rFcOarY+DQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260611:

The vfs-brauner tree acquired a build failure due to semantic conflict
with the ksmbd tree which I fixed up.

Non-merge commits (relative to Linus' tree): 12373
 13276 files changed, 815598 insertions(+), 248546 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--7Xx7O1rFcOarY+DQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmov96AACgkQJNaLcl1U
h9B4TggAhQdNaGmqVEAmIIhu28AWKvlG8LLTEa1kpDR6dKLgDZ9j23LiNbBFuZKZ
lXz5MlZ59KOr6sQpe90kkNc+XQJ8I3TKyAnKlFcElyeOskB6Kof5MUtJTSsZq4ES
Pw8hEi/oKDlGyEvZCLA5vlM0sUey8bBXa6kR2Mt9Lz508erdpgY2hS+ETdvJF0aP
LuzeBNtkdNWcD1fB5a3T23AFmMzBRc97ZIuGbwbcCMH9PkXK6BRD8ITu41t8jm5/
PdyHw8GtN+lgjzO5Tzis3tfBJbgl8bhru1HQ2FsgpfvJoFWxEB15ANjyZt63CL5n
HncJDTLH7hqC/1xbDHqZqFA65V5O/A==
=4YkO
-----END PGP SIGNATURE-----

--7Xx7O1rFcOarY+DQ--
