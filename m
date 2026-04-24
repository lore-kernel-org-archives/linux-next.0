Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63E3D88E1;
	Fri, 24 Apr 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040625; cv=none; b=V0esJuolYK1a8kkddgveEPzm2VWJA0XVO3I7v41e//AzYpmC7aVIi/dR113dZg8/d0jQeS6EEMNVmC7Kj9DDGxvSAZzkzBxHT5Zg5AUaQYElnPH65kengywhx5wdJc6JbgyvOF4w7n0chSjtSt5dRrGFclMOd9qWS84JnGBJZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040625; c=relaxed/simple;
	bh=xK8BFdFQD7hTLBAXydwqk81aAW6j4HEFoPrmOo23III=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huaVqboH7TbioXpCjEtz2Jj5TnYI13VnD31OYl6Xwue1xRQATODZPkmH9O0jLwAMXCMSnTcTRawVDdvvyJsfGqef60gsnzsj9kJ4O/eyKrI7luALWSecWgomW1A5kTghC+ZxOZSEbAZT1V1tR8WXPhGViDhUqRU8hM0M/Y1l+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9lUgx9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9lUgx9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0E2C19425;
	Fri, 24 Apr 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777040624;
	bh=xK8BFdFQD7hTLBAXydwqk81aAW6j4HEFoPrmOo23III=;
	h=Date:From:To:Cc:Subject:From;
	b=E9lUgx9I8lVDy81lcPJe9aXqcqgNAxAoLyCwSAKEggD4zQC9qc2RdNrl+QMhU79yX
	 H93KnTculexIaVsQzp7jGxw5VqIztOGPKc8NpV1gFEn+aILgcKHJ2jGX2/qQhlpPR2
	 Fg8Higmzsmp2X0OdW9Ri2mxIQGaJyNUqFoc+cPdEWUyRcz4k7MyEM6WtWkzuXfuruJ
	 kxlRWmW6zWe0kkbCfJOAgaTbe3QTX5CiNrFiFQeXekZLmQu6owjeQNFicMa2PsaoHh
	 FDuLSqpSKta+BWCHoJmiNJpVPhvubuxg3UmuFnGVQOFEtY0DlDNyrJm2uh/JR7U6n/
	 nfbAGjONlFAMg==
Date: Fri, 24 Apr 2026 15:23:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 24
Message-ID: <aet87SLq-7KZzkqw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JgQ6aHkn0+YsirwR"
Content-Disposition: inline


--JgQ6aHkn0+YsirwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1 material
to your linux-next included branches until after the merge window closes.

I will be on holiday from 25th April to 15th May, Thierry Reding has
generously volunteered to provide some cover from 25th April to 8th May.

Changes since 20260423:

The vfs-brauner-fixes tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 1389
 1617 files changed, 44629 insertions(+), 15876 deletions(-)

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

I am currently merging 420 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--JgQ6aHkn0+YsirwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnrfOwACgkQJNaLcl1U
h9AK8gf/XQ4FkS3xVDdZKzMKXO3zazKjZJrS78ShQQ/D9q0mohXZu9tsFqrZu8cJ
tLwfIDObp48BOpFU2+mm9F17zJi+8Fuu3MdOZD/WfxsOz11SeFvy7RdIzIZ3NLhd
7atrgXg6U/Bs9Mt6S7lieRQ85yxLCjU4Q30lCs43i5SpZIktfYtKJUsNhJcpbOos
+cM245pVakdYSHmiL0pxNESXnjxNXy1kIfmgYRJ5cFD3p1lcytBkMkO0OVh3fMd0
8a5IJ8wF+buhT6gGdHNF9oSnAFyFC4/Uzu834QNhPBTE06a8QyrcpFEFI5FOwqCI
xcuI4wKC/jAIVjsXOMlYaJdX0uM6SA==
=PEr/
-----END PGP SIGNATURE-----

--JgQ6aHkn0+YsirwR--
