Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C53B665;
	Sun,  8 Feb 2026 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590826; cv=none; b=OU2a3Vy7ShJqPh5W1wIq8j5SFP+URUN8YB8+NsfeYz5eDRcMwXEWi+L9Kb4PpityhsHc5GUC0KzuEwgoW92PPMVQmKUwaMGkdiDkQF5ogz1fc2ShMWfwr2w7I9v8Rq3qzYMwl2hfn1fMhJ8pCU7XUv0I4mSh4+fd8OFVpueAh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590826; c=relaxed/simple;
	bh=LQ4s2e8Lj7w21FEOqYhdWpp7zK/QswGp8/y51DxHH1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ub88W3qpvCnjPjoyIFragzV+3jvO5F9a9MK93mcMz1H45BsE6EeWn6it/sTAjaZfcVNmEu9RrB9P7bpC1oVy2obr0mkIMplH2vJ2tmCMKv6cDVY7Zce1yikEMJ8aLo4a7ga7o22dguM+hFopOThTXxUC6+9XS0ezZyaSYggcumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKA8gGtX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKA8gGtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D863C4CEF7;
	Sun,  8 Feb 2026 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770590825;
	bh=LQ4s2e8Lj7w21FEOqYhdWpp7zK/QswGp8/y51DxHH1g=;
	h=Date:From:To:Cc:Subject:From;
	b=VKA8gGtXiMn7/AEZ76qtATkcCdfMhC8l4N8MJtEvLUNOw4IEl+/3vUyQ1c+RakH/E
	 3XYBGG7D2mk2JaUhgXAHSCbSB+9sHAv2duMV/o0z8YfdqT6DE11Jmflonkhbbc1esM
	 UUVneykSDtRy2bHMNeRu/0pNC06+i3D2pmZ1JHxOnkftSKfcboMOWj60RKS0hmxW4V
	 JXPV+DCMcf1nESnfXktVZq9z8klgvPwnAudYP8WGnQnDJPxRIUybCJ47aw0HU/CRix
	 DyNrJOBMaVndSTueBEGaBDgpw2ceEVaJRMBh2THkmV5v30ThyibSxZUeligjL08P7v
	 oAYNUJQuRr5HQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E6DEF1AC57F1; Sun, 08 Feb 2026 22:47:02 +0000 (GMT)
Date: Sun, 8 Feb 2026 22:47:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aYkSZpjepGCh6ZGI@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9UUSVj4PRQBDK18F"
Content-Disposition: inline


--9UUSVj4PRQBDK18F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc.c

between commit:

  4cb1b327135ddd ("drm/xe/guc: Fix CFI violation in debugfs access.")

=66rom the origin tree and commits:

  43fb9e113bf11d ("drm/xe/gt: Introduce runtime suspend/resume")
  6e035abf98b05f ("drm/xe/guc: Fix CFI violation in debugfs access.")
  3947e482b5ebb9 ("drm/xe/guc: Use scope-based cleanup")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_guc.c
index edb939f2626851,6df7c3f260e5bd..00000000000000
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c

--9UUSVj4PRQBDK18F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJEmYACgkQJNaLcl1U
h9Bmswf+PHJQScW6m6tWHwj5lGFXMZq35rX5mR1zBpuhozezd71BbCpnGv7vXFSU
BxfdB27gB4JzphXY7ZXu9vhpUfJioU4mNyV30XKTC9BowNa7pncg4E+2uEkK7+lI
Ran6ByjlyGHi2R7TMIdJNDEUUTd09WKQ/+FLoj4Wyr3OgHv21+gySiAfgsMhkDXA
/j/m9mT2WrFMM2vttLHVCOzNkb6N8E2u+dkKpe/JqO1FpaehblzXxoUQtvdOzB2I
J+NiZejfNensiPU4wPmGr/QeGty6a4/FxbSMDUxK8LJEjVcmZPUFc/DgsbuA46ds
XVpUSDRzMuGBalAE3yiPkwgHD5r13g==
=edQg
-----END PGP SIGNATURE-----

--9UUSVj4PRQBDK18F--
