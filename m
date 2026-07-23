Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27C35C6BF;
	Thu, 23 Jul 2026 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830512; cv=none; b=fS5hI/DEAsbX7agyDM04+i75hNOY2ZClEAq8TT21KYYqP5IeP434W4uoyhPBXCaoWBors9LyzVJcCMjiUfj8wzJSyvTV5+zWTndL0bOidVhQ/uaJIiX8h4+JXBTbN3hGuhDPTDhdz93PjiButgnmRSFa0wrUx8+JjkxRBkcTXYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830512; c=relaxed/simple;
	bh=aZpMZDAhDTEDAUMFajY3kHSQCI9c1pbGHSGgcSHFcTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqH64uZydLrEVL/+tb3nJBf59xE3rqYt7+0Mk78mswWP90jFzzxwG/BEW+8UjsWDeS011cycWKxGghuTUpOLih8jM3HSMU/UZXq1fSBuwe+MCNpOOC0AyzOx2JTw7zcbjR8JDVRJhJ8y1J2J5YLlhQjtPWmL9Yd9AGnFFD35SvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7Y09Pg9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7Y09Pg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED291F000E9;
	Thu, 23 Jul 2026 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784830508;
	bh=vmh/qfo92VZjlLeA4XT8mrehFOnxDGdDc2Lu5htk7Y8=;
	h=Date:From:To:Cc:Subject;
	b=C7Y09Pg9jHpdMKRR3TRspPekczfUMYrMgD3D4NKzNDSgZhvT4+WEUktHRWsBfvycW
	 bcKKT5me0Mr6IY8a57zFyt1GdjTW2nsXe0DuB2tDJImsnIRa/J/iefVtMrigECo1Cu
	 mSt8vCxvk5dIrYjRV/DbjHq8t7tiYNAZkAEayNQmOeQ2B9e0pMHk/yHyrpUdgmeksc
	 egaMtoNwOi/5vgh+VL5T4NBahPx6iB5qpy3Wd6LWMomaTvHSeHAJin5bU4TC+zQJVs
	 Cnyqt8A2zIbPHuPIFAECs16VtNl21W3zFlMwv6qw2qq484WgFJV5xmUoXbBLCXE4rS
	 HhZG70lYdUNJw==
Date: Thu, 23 Jul 2026 19:15:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 23
Message-ID: <amJaKZnm5W2-Aw2J@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PNsZSHJXaq8eJEFh"
Content-Disposition: inline


--PNsZSHJXaq8eJEFh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260722:

The pci tree acquired a conflict with the arm64 tree.

The net-next tree acquired a conflict with the net tree.

The bluetooth tree acquired a conflict with the net tree.

The paulmck tree acquired a conflict with the tip-fixes and tip trees.

The kvm-arm tree acquired a conflict with the arm64 tree.

Non-merge commits (relative to Linus' tree): 8135
 7669 files changed, 371211 insertions(+), 118647 deletions(-)

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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--PNsZSHJXaq8eJEFh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiWigACgkQJNaLcl1U
h9A3mAf5AUpZZlBb2+fdbb881I5TfPdZnvyARVWS4uZDTWIdl2TJhqntGAs8/xSH
nOossA3X8FoTBOAcTaZylylhTaqgZC163aKsBNp4ggJq/9JnpmfhQmJdhGH1Aapf
pZvjyHgxmO16E0nkZV0XRB+l3v9DVRENgFctIvzLEZd8a5GpN72D0Jj/S4YknjX7
cP+3NCLelk6vk7SIqIEGCnuCl1ZjwE8LI4ob4meXLBxDsO3YS/vfqT+HvhLJbJTQ
X0IYzxx0sQmPGkoICSFgftyp/M3+waMeUE3Vke+AKMtkWv2hdJKeJKoRFQYFazB+
3sFEBYoNBsUw7k/R4E6keIN84i1TmA==
=zyNF
-----END PGP SIGNATURE-----

--PNsZSHJXaq8eJEFh--
