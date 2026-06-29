Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62036C9DF;
	Mon, 29 Jun 2026 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732093; cv=none; b=BnLnE4LUOlw+A83mKEoTZzGQ7I3NhUXfBtgZKOeq47/sUBchLAujn7KSelm73SiBsXGptBngOHMEbhl3AOPE7OdxX7BxWYQLScG4FSOUqEfaz9ek1z9Oa5G9sFFfzzs9MtxFL7PHnwp/RrPvJpiJJwwK17m9F0TlMr5vK/mBsEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732093; c=relaxed/simple;
	bh=bO/zhVldgXPQneRJtCCAdmaofRIh4up6lApburZSMCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQak1C+Ip5fFuSfsyrEjoiSpYWnmuSqfgKMG9U92qL2LnmPVAxI1/w61jd/w7I5WlcV+DgdTtQyWnc9nlFG6tlv/KSxRftZ3vQojLfMbV+r+VGd9whdjddne7Ebu/wefyY+k1C/NfT6/91dY/wQjnbzbxtylOPDmZTBT+HsJPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnvfZ1MD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnvfZ1MD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061A71F000E9;
	Mon, 29 Jun 2026 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732091;
	bh=gL/EvGJMC4zeYqM38EycPvjYAutWSIzY/SqIGNosyME=;
	h=Date:From:To:Cc:Subject;
	b=UnvfZ1MDQ6CEYm9BSu0QkoEXiXyizdcWGkOEpVQOJiYROJWUpMyjSB5QYXo7YOj8m
	 gv4Za3qjbos70EugfedDXHs9pq/IySs+OkUvU9lKvcnbAWaZ5QL+B4mcmfP3LHerCp
	 rlx6ek9ObcqWanEIg+7VN+MQE4slSudsDrAnzuh1bRzSYTSb9Ei3WeFUhXo0LCqH5S
	 RcsN8H2WODL3fselUauBa1Hd2EqTMRspUtr1IMvmqiYj7WG5BQVE1I6Ej+xd1dKr+h
	 d3Hkn/id2qM9wAlZ3b/8ivK+S1fYmZKxJ3kqD+genc3VZTjJ+P65gYr5OOK3VzEs88
	 qGuU4q5SZMOoQ==
Date: Mon, 29 Jun 2026 12:21:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 26
Message-ID: <akJVOHG3iO7xfQY_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FQ8ftN7fUiVpjHDU"
Content-Disposition: inline


--FQ8ftN7fUiVpjHDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260625:

None.

Non-merge commits (relative to Linus' tree): 1105
 1119 files changed, 52070 insertions(+), 22217 deletions(-)

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

--FQ8ftN7fUiVpjHDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCVTcACgkQJNaLcl1U
h9Ct+Af6Ao/rxfLxBCFPjivZPTErYNPckpCTIbV21TxCzDtFSRBUPDVBysVxAePg
TvftuIItv5INZrcQFVoaXlQHOp61lWd28kJ79ysoP1JULPDf+zhGTzinHFfpqni+
uMI3DlAmbFgHHM0iK/I3+p+/dPw9pMr2htn6DLDsCRBDilR19ocqVHysUTNmVr5t
x9JJhDibdp7crNpX1OhVHg4+w/EjeY2VkQupICaas1aQYghpq1PDY0tUFyZiNdRA
vZUi0nSlXD7DXu+B5gjHZxPRQZVuGQ5n2dFGe21ynyHuBZxgbGDvpX3nviDUtBZ4
ryotbJptfOu0J1AF9oKOXtHI0vR9bQ==
=5LLy
-----END PGP SIGNATURE-----

--FQ8ftN7fUiVpjHDU--
