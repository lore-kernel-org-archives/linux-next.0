Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211EC2C3251;
	Tue, 31 Mar 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960033; cv=none; b=iE1Zc6OyKpeOza7MUzPPv2b57jFhuTjgM0vKJ9vAMgHuk8MCyWGlNGLPuRmpltmsT4h7Q9nsCzr8TvDIiUqxLv5t/DXyvHUbCk3hxs1Av09je+rSJv/j923DRXbPbSwGLOj7WvER/gNn36GlJkJQgCGo1lZ3myhUc8BUhH3aQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960033; c=relaxed/simple;
	bh=fYlxRnn0vKPrKrM9JJo0NOEGohEkvKmNS4bYFl6a1PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RR5OXUdhfn5OBGec1ynAkvvi8q6Kj+Z+i85+DlEBP2CV38uAnmyWFBwydWHL/AtAsCMzeSX/bGbKCkLwKNrIAF11VFgu0KD66sofDt94/YoglkBdLNB6NlrIepqyjC8lt4oj21fPp1C6MRV2jjw8fTzYrzrGdT6J4t4vpaaLgNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt3FPVP+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt3FPVP+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314DAC2BC9E;
	Tue, 31 Mar 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774960032;
	bh=fYlxRnn0vKPrKrM9JJo0NOEGohEkvKmNS4bYFl6a1PQ=;
	h=Date:From:To:Cc:Subject:From;
	b=mt3FPVP+6axMdxQ61J0yst0edIb9jFSwsc2fH6+rrX1gTAJVj62oqiKvoB5KRffJg
	 bDCx47HtHy84L7ll6ytU56nr7vKYFLiprq3HncoOEpxrQl46FKTiiNEgzALxxFX5jk
	 B/aLp6metWthS6EEtv89D8ZruL1x8xyNmM0TgNLIm5UeHtzxl13EEh+CT52AwPT8+m
	 cTjXCLludLQDAqYVc0g6EvlVLbjDXfL7440V3EuZOAHlbC/2BndmrWeJwQCzSB9yJQ
	 LF6u7riGi5YFF6LnBcTKg9b+opCdgjAMkIuZm7h/mmxMe7I2w3K6hi+z5dD4MDD5MQ
	 2FOdIKdX0mLaQ==
Date: Tue, 31 Mar 2026 13:27:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Hung <alex.hung@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the mm-nomm-stable
 tree
Message-ID: <acu9nEoNNDLSiu6i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PFu71HeJFFyigtjW"
Content-Disposition: inline


--PFu71HeJFFyigtjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  scripts/checkpatch.pl

between commit:

  d1db4118489ff ("checkpatch: add support for Assisted-by tag")

=66rom the mm-nomm-stable tree and commit:

  8545d9bc4bd08 ("scripts/checkpatch: add Assisted-by: tag validation")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(The mm version does seem to misidentify as a signoff)

diff --cc scripts/checkpatch.pl
index 60fd2ee2d0e58,b8d961d77ff4e..0000000000000
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@@ -3106,11 -3106,11 +3106,11 @@@ sub process=20
  				}
  			}
 =20
 -# Assisted-by: uses format AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2] inste=
ad of email
 +			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
- 			if ($sign_off =3D~ /^Assisted-by:/i) {
- 				if ($email !~ /^\S+:\S+/) {
- 					WARN("BAD_SIGN_OFF",
- 					     "Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]'=
 format\n" . $herecurr);
+ 			if ($sign_off =3D~ /^assisted-by:$/i) {
+ 				if ($email !~ /^[^:]+:\S+(\s+\S+)*$/) {
+ 					WARN("BAD_ASSISTED_BY",
+ 					     "Assisted-by: should use format: 'Assisted-by: AGENT_NAME:MODEL=
_VERSION [TOOL1] [TOOL2]'\n" . $herecurr);
  				}
  				next;
  			}

--PFu71HeJFFyigtjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnLvZsACgkQJNaLcl1U
h9CQDgf/dpvNpIVK2kWxQEVkJPoo2tG5Nkf/ljAzp0Q4nHWFV+eNmzT5+VItAfis
pMumhVDamXELdrbD/V/BswTVZWX84MwJgsEcSwBwa0j4oaHrwLnrPUSV5dddHv90
9McuowUl7jP1Ldz50rUEpAYpOJ+AZ2l3OiG5aKogebdVylcN54MbsfWPuE8y3Hkl
mjtH10se4CLeLOSapvBOBBzxNMjsg2VzGyaZgXSxSYJZ2c2hWCSPZh0ywqfbPtpH
pilF6zPa539pHX4fHrCBlMhiwbwegz0BcyJL6cBa6x+pXmKVut+T/IULmGQGHxep
IkvvGd0NO4Lh/hNWF0T8wTvUbh1PiA==
=6VYS
-----END PGP SIGNATURE-----

--PFu71HeJFFyigtjW--
