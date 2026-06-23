Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA73C3797;
	Tue, 23 Jun 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782218640; cv=none; b=D0zewByjwCJagWDXpbYjkrBVHs4E0njjMWm3W6hPgJIEMizPXWvmv25GaBL2Zz52XvSztcY6OcRjY84hhn7m9KkAzh9z5WIxlC1QmROk8AmGji9bjREyWvDS/DuT05JsFDxVh+QVvoB2aYNJs8UrE/FNbZm6tP/LOlMN+sv5IeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782218640; c=relaxed/simple;
	bh=MM+KkDpugZcLwkWNIGRDyJ3g1EdnNeFDen3WlHU9WIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVD31/3YxRJk+X5oqbxXHmABb6ImjPGCE/MTEOwMWTRhKEq5Ow4a3d1V2kX2XpGED1ls4aLZeEvhHrmQ//NRdaQ9EYN/VeSXgbWpb0MX3fJKLZM1C021UIxGEtZCSlrAdHmHCiyGHUkto7VEW627A2whN9EnXOW4gM1Jj9Mgdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJsYAN+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJsYAN+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0956B1F000E9;
	Tue, 23 Jun 2026 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782218638;
	bh=AouT13oWRlTqFLJqnxcY/RCFXc96MtSZLO9kAUUSxnA=;
	h=Date:From:To:Cc:Subject;
	b=ZJsYAN+D8RNCmnPe6/4e6BUU/ZV6UkWqFLrBYz0IHRijRO+YKOLqKB129paw2dfQ9
	 1Z+7HhT9R3kTE1PI8MFXdE4G/3AJiRHGZsFaO8HW8KxR8JB92bxy/us9xDCoJ7Q/VM
	 3Rc/R4+ADRJ4cqsiBhIrQfaAptIat8g+tlzt0mCewbvPuNgXG4o65xMXkRHq4xYgeZ
	 JUs7gVr3Lb7nI/lvhodxaCdZyzECT0dta8gYJlxLHa7tx8HviICH+8s0DF3O6PVFuf
	 3MvlHDxYPrrczF4M5BnvJQQpFAZbKHP8XhmSSO90wc22J6/664DkXWoM5x62jKvj5b
	 4TG0BuhZzt/3g==
Date: Tue, 23 Jun 2026 13:43:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 22
Message-ID: <ajp_i0nlA4mlUeno@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B3WctYvw+SMDAmtk"
Content-Disposition: inline


--B3WctYvw+SMDAmtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260619:

The amdgpu tree acquired multiple conflicts with the drm tree.

Non-merge commits (relative to Linus' tree): 3121
 2993 files changed, 147532 insertions(+), 59819 deletions(-)

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

--B3WctYvw+SMDAmtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo6f4oACgkQJNaLcl1U
h9BAxwf+MW1dDyEJVNJlvLDR3dNi7MKLBv4R+2uIe5JmfH2bcRCgzSqmC31Gkp20
yYNvkwRtO8uy4bYZ8hsb53IulxVlAslqIBf4qk8gQr4Dkxl0X3EkHlZGgLTI6sJk
qwbdVw+PDuIZ2KWG4JMGdy+1+eFbzk87tCNrXlUuzYkqbp+srlXl+U9lf6eQ1LS/
jNxicMeQg2mOW7ceD3JmFXqp8CmklyjZ0QX9X+qpLl1M7PYWBUpx2DfiTODopRVq
sdHBwsM6q34vY5sPICCNkazF+Kx1+47bpFcfjuU/4JEWBR0WFD6dSfP/7eiWp7GZ
sYOq6ynNTRCGatABjvq30a6IFKPe6g==
=WgsT
-----END PGP SIGNATURE-----

--B3WctYvw+SMDAmtk--
