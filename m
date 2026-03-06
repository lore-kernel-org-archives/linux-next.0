Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FEB322B9F;
	Fri,  6 Mar 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804833; cv=none; b=kEOZdKkYVRUUAOb19I+MJKGTBaSJuQsANHmpQ6vzNOkuVYlhzZ6bSIVL43hl5vUXZAah3hBO7gQR2m1ECOcoIHqHCXPbClPq1lpLmk+8c4nw2VcrILhlYFM4yU5y/CvP0vzhtct5vEuE4FcmI78Vrf01P1GHp8u/DHeQ7IQf+Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804833; c=relaxed/simple;
	bh=14L9YD01FHv0WUOOW7RIytyRqpEHvac672Sa8/TsMzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atcaWVvSNxTiL2Pq0EhMXIns2xiiHAebbmz3oNlrQtJfrX8K+esCOiBmaXCLumft3h6ExG6PFo1RCSiU8GMuOgsY+gUR+EplSSpAJA59+YYYfCNBVK/fwldPWiDBJHSG9O8GoqX3PNblFGaC/WHuFtlS9udoQRLGBsT2X785ntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiXZSSU3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiXZSSU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE43C4CEF7;
	Fri,  6 Mar 2026 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804832;
	bh=14L9YD01FHv0WUOOW7RIytyRqpEHvac672Sa8/TsMzs=;
	h=Date:From:To:Cc:Subject:From;
	b=GiXZSSU326fS0jnP6HMOX/TQEetyyi6EzyN6kv0l9eW+6IZ4OQ/5+FiLKRxMcPyXk
	 l7Ll8xmVbSmzhMKTqAN/ivuePSAnnbEhWmMP0t1ugOP56w7V22GnaCpYs6y6SEY4ZA
	 JTMURBTNN/IvsPd7Gem55M9lRiFcqQOldemguONYUk7peMsTiNM+B/9ZOcE4QeLbPs
	 pWL362WLfKhP93RtR90y6Use26mVEBW4CtCjGu/z+Vl1Xg61kC6NfP5rYu4/Qcgxft
	 ffA+T42oq7twaKjxtGKk9af5B9FRnudPLYxiEQPq/JTLfvUlv+bn/uPpARA9Nfb06p
	 R43QuexpADK7A==
Date: Fri, 6 Mar 2026 13:47:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomasz Lis <tomasz.lis@intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aara3Be4tsc1OMZl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OH/UXzDbech4EnvK"
Content-Disposition: inline


--OH/UXzDbech4EnvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_exec_queue.c

between commit:

  99f9b5343cae8 ("drm/xe/queue: Call fini on exec queue creation fail")

=66rom the drm-fixes tree and commits:

  393e5fea6f7d7 ("drm/xe/queue: Call fini on exec queue creation fail")
  ec172c7befc4a ("drm/xe: Wrappers for setting and getting LRC references")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_exec_queue.c
index 8ecdf949f9e4c,2d0e73a6a6eee..0000000000000
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c

--OH/UXzDbech4EnvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq2twACgkQJNaLcl1U
h9BrTQf9GOQd2IaBknY1FBRa8zC5lXb9JHQg8ejT4wdCOW28hZyyUhFCxVyTtgfl
lqfq+NcOgCc/9i/hgN2sZ/LtpPiYEosojV2WzjU1jx6uulI88ka+nTn/MWCLd+zz
Ph9UeWkW09w2oz1vLrlM9TylBULhBs4QE9i7PKNGXnKMnv6S7eYff/eCDUpZuPee
GO/jFO3PPMk63vQacNiM4nl1DQkZzErW7y4ffil8bwuAuIJCUOxF102eVmSW+Zfy
ljjXNmzwqGO29fkwkvWntj5nweAEDnOexdvQXAyKZSNzF0UhysK1jGuxRaCdH+BY
TjWCzAZenewuqlkwqethX+5bLb+y8A==
=vYUp
-----END PGP SIGNATURE-----

--OH/UXzDbech4EnvK--
