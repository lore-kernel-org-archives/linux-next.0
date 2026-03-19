Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D53A7828;
	Thu, 19 Mar 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931982; cv=none; b=JdwHWLPyjoocAQ9ayok77Rin7AHD28w276H00S5bk8qbDbqE6+jcFtOviSxt5ym6WaZsjbwyTNLIuyWl3IdbBbiBzu0jCIanNxJTDfebkWb7HdNXP8NADmntgSVVUeiAplqr/BL4y6GNj7KjZ78dcX8cQcwLZnTCni1Cqw1fMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931982; c=relaxed/simple;
	bh=kNkqjWvmJxvcuwBirwGx++liHtumjp/wRMbJs5zgJgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/2uFVEMRpAFYmE4+JFDALiPpDHSHlpgw1qDXMP0pLr5QI5fqhN6qAOC40c4w0+YUF4ZOtd4IWNAmowdCxR8apvIg9iAuKNhgPnloLvcvsygYmUnAbyFHAK1LdAU98DwYpZBhYzcqzPSoJSFjHY9WtJW7WUEbeYtaR7aK5X/+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Va6eW6gc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Va6eW6gc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06171C19424;
	Thu, 19 Mar 2026 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931981;
	bh=kNkqjWvmJxvcuwBirwGx++liHtumjp/wRMbJs5zgJgk=;
	h=Date:From:To:Cc:Subject:From;
	b=Va6eW6gc0Pf2w2EFskiW8RZFkv9JSriNsoogjInEGvGSwXXLjeA7ySusGWHwqbRcW
	 qZVFywKL4EgasB2qsYmbSjTvKsl+zJQ3N+38EhBrJ0x/3PvpPZpXnJdkwUDSWLJ7o0
	 KsC2C2CSWtD3zkKpQ4CBbcsjMTGq3Xc0z/7mddfzUs0RM8n6WWapxw5WYTcpOQtkIB
	 SrEkphAfGldtZXkVCUAQpgqQ4aJAiNPivLA10kRz+jlELPsvZYgI/rYT7IIRMOP8p2
	 3+GkFgkfeKuJws6t6dslGqMxe4+n3Ql/t3Kbobs6p3X52/10nWPtLNbrHZy7nnO61K
	 im7vG3+ZPhKCQ==
Date: Thu, 19 Mar 2026 14:52:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 19
Message-ID: <abwNyd1w2CRO1KFi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a5rjQBRxIrfuXeUR"
Content-Disposition: inline


--a5rjQBRxIrfuXeUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260318:

The devicetree tree acquired a conflict with the qcom tree.

Non-merge commits (relative to Linus' tree): 6889
 6915 files changed, 456483 insertions(+), 136849 deletions(-)

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

I am currently merging 412 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--a5rjQBRxIrfuXeUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8DckACgkQJNaLcl1U
h9B8nAf+Khlo15qyToJzq2EeX0daTL3BdYQg5MwT+5AQOD7uw/v0IT+v+oTG+nSY
Cf+OXKPR1rtSKKbFHSud1gGoBRuu/42TnfZTQbmq/Ja5gOLZjEfh/Ah4VPQrhB3o
Am6g92PrUWWgyvf6czhu+wtYxPGbnuWq1dY+t6T8qUjLb/9fnh4/r44jff6XE65K
H55OcmdgFOR79bgScVnHu59ALQ5wvGvgd+32kVZlg3iu/Sx+dVNUDMOahTGIG1K/
sIBabj7r0H8B+6PyZbcBgcpMzOStKXsupMRc1RPrGM79p9o9aG6BXEJNhy0Es6B/
zO0eMedZB6ad0n1b6nFsvDiez1Xlbw==
=M+VW
-----END PGP SIGNATURE-----

--a5rjQBRxIrfuXeUR--
