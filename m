Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC517A30A;
	Mon, 16 Feb 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256677; cv=none; b=WkbpTeQjAToOjQChC+lSp5tsq7woSfAnkOnkNUE5a8sV09k2OHph90mEvWfVsoGrwbIq97FfQsoXpezW0psDFZ7p3Z1jmnd3xHRfH/yKojEb7FFhzGIifWaXLLP8CnqufgoAMSigtct7xKtfjG9xtRRW+G0jPqDUPvNvleQAD9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256677; c=relaxed/simple;
	bh=nyZbeOsye8nwV/pNZswtKE4H8vjh/fKtUWm/4a6nctY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmdEcJvOpOSXMUeQU4cRxVZZPVlPdNoa5EXUAolSFS3oz8q9ZxHtAPwZ0IvBCiwSaAf8cQzkOkDFWMzYoESauN1ITD8+CEFTkM9Ppn1Jy2vdns8Ja0esSw9YsG3paMoi01si1AzHXC5UlNas0XWqHjzUuGciEMc7Ap98vZAZIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTM4x3iQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTM4x3iQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55296C116C6;
	Mon, 16 Feb 2026 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771256677;
	bh=nyZbeOsye8nwV/pNZswtKE4H8vjh/fKtUWm/4a6nctY=;
	h=Date:From:To:Cc:Subject:From;
	b=JTM4x3iQNsRJC6mFi7neF5IskOWnnUapWO3wUPGxfliPJkgiOpE4VCnyAgq246Aqf
	 jgPQLYRtobkxtoJ20yM1dgTy0NngKlwLdP4+0a6j1n+V4tW7CgLj3XD19tqTSp1b26
	 /U/ZMnq/BfTcJoKzf+7wSXAz1GboPol2tYp6w6GST+m4cgIq9484UafPwYPxWMU06I
	 /NYQZoUTA8s2sVCSuKlsIq381ZMebk2z3h/jpL+VT6A3TAERDYHXNxZ7PhUiDaqz48
	 tyqLZWgPkvl6NpxGs1i8JGBORCZxEw++GnbJqQBZNXVj6KdMR2Odrh4pyj1BKBewkN
	 NOatuyyPXRU3A==
Date: Mon, 16 Feb 2026 15:44:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 16
Message-ID: <aZM7YYMveDPqPngO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3XoCnGVs61M/A+94"
Content-Disposition: inline


--3XoCnGVs61M/A+94
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20260213:

The mm-nonmm-unstable tree acquired a build failure, I used the tree
=66rom 20260213 instead.

The i2c-host tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 2227
 2029 files changed, 83194 insertions(+), 35136 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--3XoCnGVs61M/A+94
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTO2AACgkQJNaLcl1U
h9DmFAf+ISUKbJYXDPv8dPsyp+ZgS8FU13OtU/eQbxa4HuIQF0bOkYisbgbeJVet
6c/gTyri1aslvl0lV0ZbTDmvGkgSvJRdDVCRwTelsSoVysOi+y972REBzo7YV+x/
t+KicdJjWs0qmE1Y7Fg9gesm1jB3Z+duA+TvtiKxlWuIhQyL51Vac5fr2CQ2Sg/P
nIaHZ/jG6KBmmlaogCSGlNByNKyZj0RhQJP/nGle10NQODQ1lKTBF8nBSFpUvJ8q
CILrI29GAW+ZOvwoNhnNOmDqx53Cc1a8l/vgN3Xl13WYR+fi+SN6v8er3fj7Uhn2
bfnIU14nsOxE9cBT7C4QupqMwECc1w==
=HqDA
-----END PGP SIGNATURE-----

--3XoCnGVs61M/A+94--
