Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2030BB95;
	Tue, 27 Jan 2026 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535419; cv=none; b=EH5gUedF3uOufD03TOA3CmgIpDRGxCslFChHZRqIeEp5hltcFah2v2FIs7FphQZdJxYhGomUntQf6g5vhX3fDyHxuC7Hk3JQ2psEe74npyjTG7igssp2Gx5flJtwPNMg01pD7EE9LDdgqwPwUBZ27JtZ7xAkRA5IU6A2PchsmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535419; c=relaxed/simple;
	bh=3eSyfQZTiZJdgKqFcTErDh3DEIZJ2C6zLwirNCOg/nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYcikEugbsH18R7RQxZuagkflC/OyGPVqkxtKuZB6zWxhNgrV38QTizy1ra8pdlwpnrAv63JN8gwuMeuK2z1x6EUk8Qf3ic7RVrSDDp143CDQJUDo+gb46srvO07lDXdnUdnmPHY+cv9/ZaGGXMjcKzPF5A0Lpqx5PS54tPJjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEBPclgV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEBPclgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7C6C116C6;
	Tue, 27 Jan 2026 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769535419;
	bh=3eSyfQZTiZJdgKqFcTErDh3DEIZJ2C6zLwirNCOg/nY=;
	h=Date:From:To:Cc:Subject:From;
	b=sEBPclgVognEMKH024+QX2flZ9RP0qUwRISEodEnSrq0DWbSwgDsTIfOq13OwrD1j
	 Ih1EdpcZ24kTXui9lBQjvGW5WL8kQTNeM4rphO9k6NSPZOQgrN3CyQqCO1FXrb1bDg
	 uHSyIRVOndMWNQ24EPZ10C9ckRvliS/31gR3eyV2Tnkd9lp1e7X7dRhdloUWA9z7Ik
	 05iLNoZk+S5UxRtQYiUzO7LmtawwrFK0c3R6/+q/EPy2O92jeuWvXdIlglm21+jEBY
	 7LskXENCpw2J3k98g3zVEsRxwFENSnDkf+sMgDPA9OBPS9dnSyEp0MIGtcpc6oPtp6
	 zANkC58kdD5Ng==
Date: Tue, 27 Jan 2026 17:36:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 27
Message-ID: <aXj3t3jaeG58h0sZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ivq0ClawB1QPp1Rh"
Content-Disposition: inline


--Ivq0ClawB1QPp1Rh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260126:

The vfs-brauner tree gained a build failure, I used the version from
20260126 instead.

The net-next tree gained a conflict with the net tree.

The net-next lost it's build failure.

The ipsec-next lost it's build failure.

The drm tree acquired a conflict with the mm-unstable tree

The drivers-x86 tree acquired a conflict with the hid tree

Non-merge commits (relative to Linus' tree): 9047
 8923 files changed, 520772 insertions(+), 183609 deletions(-)

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
an arm64 build of various kselftests and a native build of tools/perf.
After the final fixups (if any), I do an x86_64 modules_install followed
by builds for x86_64 allnoconfig, arm64 allyesconfig, powerpc
allnoconfig (32 and 64 bit), ppc44x_defconfig and pseries_le_defconfig
and i386, s390, sparc and sparc64 defconfig and htmldocs. And finally, a
simple boot test of the powerpc pseries_le_defconfig kernel in qemu
(with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 404 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--Ivq0ClawB1QPp1Rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml497cACgkQJNaLcl1U
h9BxKAgAhHsmGLQqFKh1jjcsTf12LPC/Koq6fQdLUWuaMLw+Dc47TU7zm99sOOxH
7lLu7vUJa0ampQYtNTsZIFSKk97/ubBwd5eJAPiNr7OhBvuVeUUPeeNSQvv4NDaf
S478QqvTbfzmW6/UdhOftth1LDTuPFLEoBWIikAODqiw47zwFaB+/Ly4Zc1LFgGq
pS6XCldrN0eKYwqOgIH97OjM/LSwJcjVfR4oi4oAGpSOtcjmsoXz+rAIkxovUI4R
f8gmoQFPyDtXGzKGjx1HjOWPpYm8ShcqOszuTrMbAbbhqpUcq/F9xA/KFKtWMvrt
HsdrFyycIoSVU5Wb93HNER3MU9gAnQ==
=nE+M
-----END PGP SIGNATURE-----

--Ivq0ClawB1QPp1Rh--
