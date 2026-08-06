Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A4CCA6B;
	Thu,  6 Aug 2026 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024454; cv=none; b=EMv8dBIDe26Ms8HXlYb8bu3NqNAAM2Bn5CjaTFcqKs5VDBJKVhYZpfcBOz490hBYLjIzfyCRv3LBOtEvRiPJIrgsyXKkw1AoM5xfPsf2dHs8WSFumbhbmRwxJlUG6vHIYzmkEnkTvz8enmfBEI3fXXHs58EdYzzZu5Nc6bDXkFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024454; c=relaxed/simple;
	bh=o+zed6oGZulLTO1Uvk3oDowIFmNTaMcfDHOAsvCsCBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4wLuJHlNhvntEk8Mi9t/BHypGgHhFwOzOPVbgY6Tab85nH3qvNTzGPWyscd9SppA/S11M1lnwFyZ+XqoDgLGVzzaOaX9DM+A7GaG6ENy8cuTqmC8paUAWyAo8ZA/ld9ARZGCoMkmpXQ0bknWeNmkl3oApmsSGHkgmhmw2x7Oy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oT+CCWhE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oT+CCWhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F691F000E9;
	Thu,  6 Aug 2026 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024453;
	bh=Z1yO4NWsxo+0g/9dqAB32CEo/+qwCRqXkyJFDOz4zfA=;
	h=Date:From:To:Cc:Subject;
	b=oT+CCWhEofh79wwfgz6PDx/B2vm0Se5P9bskAx2UVWmN+gHFRdL748ssXHmST0/Ml
	 mwuTEqosskUd3khxlK+mdi1u8ZkFibBcIRoHBfD4i3jIjqeu0uvfWr8s5lWNtfeaFY
	 9yW5Mu7N7WSJWBbLNMRylx/iMHeLxKRiL37u34zaAQgS31jxshfxeN79AYOZixHqhB
	 4sUv3GWB9Gal8kcSRFh2WNpOEcG754OBlITiXbedBZrbWhqG2JdL7PeyUtZ6jF5o4q
	 QD0kGYb3LDEwbttczMjKprzwFQBiBiSyaTC7nsQh9nl8V/UjYQn/5JwZa+zDdV/EVK
	 v5n+D43ZGstGg==
Date: Thu, 6 Aug 2026 14:54:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Brendan Jackman <jackmanb@google.com>,
	Dimitri Sivanich <sivanich@hpe.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the mm-stable
 tree
Message-ID: <anSSANY5zZu4kytE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Od14Yyn491Dv+9Jz"
Content-Disposition: inline


--Od14Yyn491Dv+9Jz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/sgi-xp/xpc_uv.c

between commit:

  579c6de3def20 ("sgi-xp: use higher-level allocator API")

=66rom the mm-stable tree and commit:

  dbf69afe320eb ("misc: sgi-xp: Remove SGI XP drivers")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[The file is deleted.]

--Od14Yyn491Dv+9Jz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0kf8ACgkQJNaLcl1U
h9AbBAf/VqlCkwzfPRXVa7uhsP3IVYTA8uLb4DeUDaZiyv3AX2Abv53OEUgmDY+m
tpF0paBMd8yRp+3dcvchwfdPcys9KfB55v9HjmYF6p4lcs8g2byLkYqnUYfnXIky
IGIWz9AKHYtX9OT8Ryfh5eMKAdq8+7Pd4w4UOYI3CCnIR9eWG4dhP873cnomaOC8
JRF2q3lDA8Jj022eoguhaSNVL1TQBa5Pr5t4r+JMB3HT/T+STPuMmim4gPCwXYGZ
UqdPwnUoX0lRI2kXqMrphGwpb9TXxyoGrmiJnEQlI6Qe5iD3kCbrgzTm77gAO7f4
1E6ewOJTGweST+OODVe0S+bxC65/kg==
=gqKX
-----END PGP SIGNATURE-----

--Od14Yyn491Dv+9Jz--
