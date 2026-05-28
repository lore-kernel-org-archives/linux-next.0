Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B233E7BAB;
	Thu, 28 May 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969771; cv=none; b=JxWUeUKJLpc0X6V5EDIatotetvMYJXt13VlWWy9Hz1p+rePHQKeQeGD7FBfOxvuQFn1muQrLisrxJwbpYiGa/46b+E+pqyS+Dvj1ARWtzepkjvlx7okQjW7Q1jn4ZTreiuXLUFxo3/viFnuKwaod0j04XJmV42Qw2rY6jWHikss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969771; c=relaxed/simple;
	bh=P9aLVPFAKuEWhMLn7ZDiYI+ZcNo6874p36/5eQyWka0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ri5n9OVdJNy0lYsWLOZlTCsugBiamZOcDX7PASe9XalGgXgKjLdL/JZ93pRyj4ztQjXpRcr+RKKLCU1Sfh5fxmw+q3fRYmq4CzJBcmE8gQrgN8ajd4SNBTKXTLmic05UJfOYG4wcKZXNKRVeENPQCrDgfwOBH9GjkSlIQNqZMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2PCFTtA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2PCFTtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3F21F000E9;
	Thu, 28 May 2026 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779969770;
	bh=WB45gUCuEb9lTmOw1GoFl3gabaAjXqjtCa/yCKHwik0=;
	h=Date:From:To:Cc:Subject;
	b=Q2PCFTtAcaN5GECutLVAj7QfesOeTiBGV0dLmgZXtcCiWUNSbQp0ooCBNUmoM9XZS
	 R9/4EayPzhvuUbLhfnNVcQM80uStS5hJ3cVa7FVrDXOhoT+Jp7Jxkt6ujCtmQPNvSp
	 MXBgig9Oz2QzNgSoDgrbGb6dJadhVjTkxXX9wrG9ujThFPIXyLYpqgYZGw8888F2jh
	 /5slCR27wuS/BCIUqle0jZtgRtjeNkfBA95WHDvocmPFhMu9VwHpT8mwuindiw2vXQ
	 /crx+v+Srln81zq8ygYvPWxGPmlo+9CmXkFf77GRy7ZsMWrPDM/UVAfNXlSt8OhdpT
	 4WEbPHOGL1ANA==
Date: Thu, 28 May 2026 13:02:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 27
Message-ID: <ahgu5qgMKcGqPM0x@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nZkloZyiukMsgOes"
Content-Disposition: inline


--nZkloZyiukMsgOes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260526:

The block tree acquired a build failure, I used the version from
next-20260526 instead.

The kvm-x86 tree acquired a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 7933
 8990 files changed, 463528 insertions(+), 177987 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--nZkloZyiukMsgOes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYLuYACgkQJNaLcl1U
h9AOLAf/Xq/S2wDh+Clzawj2sCqDTyh9myvKMAcKnfwOzphy+eAubq57N4Q/9fry
tSa5Zlh60ojrTEu6WRfGV19fEWqeu15HZOM5JUNx9i2z+d2YLNRMFOuGYVIC5DZI
MDS4fI1rty0+o0DKHxOcufB0npafwjYTcPNGs8d3XxN9yKN8vxNJ3WjSKf1Gqzj5
bYRjeY4J3KTNerS2uWGUMre5oVLI7rYIsu8fqP2/4qG2ZLIh7mwtiwi/NMCiiAW3
4IHF6IBothxMcUKx1Y5PpMPNnTHq8OvyWBlLN7xRszeU9vRxd7VwXwdZw89aQyiT
DLuv4bKOE+AOhlOZGZkKU4pBMwo0QQ==
=7Sh4
-----END PGP SIGNATURE-----

--nZkloZyiukMsgOes--
