Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1CB305E28;
	Fri, 27 Feb 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203816; cv=none; b=rq+/rdlKVjFRhd1XclFnuzdzxxNVQwXa0+6AtT6crcPbAEIK0aQJH/FMDlOq0l/WUYCxqXs8aa9RuANONrksj/gs9emA1szuILW+TjowLAYj2qaG7/5nn/1wCHvuRFNL1nsDgjw8aJAa4gpcOyrPHi853fd5y4MYUeuAypoGAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203816; c=relaxed/simple;
	bh=9nBEhEnqSA1zIRN2AUoPJv8bKacW1Bp7ifhAJjhM4YM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHwGG2DassqVnEGPmiL3UJ5EPkqIGwfkABHWoDTMZD9gOzisfqUNtwppOyh1F2KGfQ4nkK++95tclX3AIcOsnHVG0aeNDgeEtQAsKK0U6u0xKQ2tDv4x7g/8l95tK9dk8rzs941YAvWVLgPrPk7NXahx9MDP9LBdcqiOqDZ4S50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB5wO3rD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB5wO3rD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710BCC116C6;
	Fri, 27 Feb 2026 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203816;
	bh=9nBEhEnqSA1zIRN2AUoPJv8bKacW1Bp7ifhAJjhM4YM=;
	h=Date:From:To:Cc:Subject:From;
	b=hB5wO3rDjR70ntASlK0qbvMQGr171V09QAw0UqyrpOkn3XB8Zr1pwxNgOs0ePX3hn
	 UdZdQM43SdRNekk9ZIEjiV89MhgQEVXIrkaFgwY7z/XlCyvLoSN997YVkhxZISjliT
	 tRnozDtIi1qYB9YYFJx4IqWbgvRKuDUALBBi8lJoC2uX2xmU9DKOdOiK7Ukhbbjpiw
	 sIPsjtEhV3SA2UNyHnzHipiDDZdEeKZ+SFWaf6M/sIMkZxMr+sFmMlhqhdHX6FmySt
	 RHN+g6Rtzr5bnpLirCl/jlcXFKQ+eLWEYWFn4vWJ0RH0opQdlfKnQaEl+8cEhU/b2C
	 qNnkcWYXlVe2A==
Date: Fri, 27 Feb 2026 14:50:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 27
Message-ID: <aaGvJPrwc9oSHr6F@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PMYFF1cZPyLEuXWl"
Content-Disposition: inline


--PMYFF1cZPyLEuXWl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260226:

The net-next tree acquired a conflict with the mm-unstable tree.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The hid tree acquired a build failure in the final merge which wasn't
resolved properly today.

Non-merge commits (relative to Linus' tree): 2376
 2756 files changed, 214430 insertions(+), 40096 deletions(-)

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

--PMYFF1cZPyLEuXWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmhryQACgkQJNaLcl1U
h9Br7Af/Qk+o7LU6SjXcFHtiKpLeho0CetkLV3VasFJaUq3P43lLvTdfa7+KvbDb
hmRNxTpyQ+XhrzLh0/kW1pF2xJ5q+yequ7k8aPXGbD1mxDxe8NR97QZ89fySev9Z
SCgtjSm0xIHn/dnd0yZtugpumcmXLg8yFx86zl4TgDL4XiE7I05TvdMV5+xH0k4I
pHHFw4gScr9Lk9Ot/b937yemn8ruf4NsPooq6fxs95xeVT/1xvhvMDkK9ySR5g8S
738P/3nIkF6ONlMLE5o32zlNxLOeVslb5QqJA30MUFhUf0FFHV2//csh3lzXHpgD
wcXE586ilQ7b9P1WVSavpVM+ps/cGA==
=ihXu
-----END PGP SIGNATURE-----

--PMYFF1cZPyLEuXWl--
