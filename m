Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7BE13B293;
	Thu,  4 Jun 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578005; cv=none; b=YgXFwDrlfdhx124D/fiEfCJkBEZvUGHM3oxYNcXZHVCh118Ncd9CEVHdbYPlgZKWurxrjbuW4yFvgyNeNvjo24vGz1GcfFNrrMcNoQ0yjYewNie2qA/nm5CrcUphKD5gvyAfOol2UXLB2iTI8UxeccRmgF2owfUu4H3xVEnjgh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578005; c=relaxed/simple;
	bh=RZKMABFRCRr6jZ9/CdmTAk1Mj0OFKfKjhoXiMWzzdj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZVKjZA6SM9GSDy2xxmiX09YAkqL4NJahb1prOeZGDON6bVJ95Y+gsBrN1r318xDFFxGqsV9iSt0/LhBv9NG6noix9gDiZLSvgF79yFMRtTXMKKeOT512ExhaVuPJbhSCoadZzdURaM7Sa20jSLXdRHU8Cv/jYDeRXlqZFjxZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGf4eZyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGf4eZyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C481F00893;
	Thu,  4 Jun 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780578004;
	bh=e9CFSRfQdHrVoGWKWxU/9ZG4CdEPcb+uLJPmth2uXD4=;
	h=Date:From:To:Cc:Subject;
	b=bGf4eZyK7jwDAadd61qTCVFWYYeVrpVA4nU+ZosB0bHQIcOpa0wO1YmC+QVzjoSXP
	 DgiKcaT7W0cdoL/0ACEpkOGKmqqyDIUHdL3ITiF8LU8wQuLzWRSyMk6FtAyiB/LU8l
	 +JlqQ7x8v2LghRBZ/u/v/oO7OD3GdWp4+q4BBETb62rtzAK8lfj9Q1HpcmPKE+wPU1
	 bihV+QNqUHoWenQPPjwn7tpWcSdp+muyH1cQPeApFzSWIQ7l8Cg3NkPQ5FxyqJoFqH
	 EgYFPXldiDl0XsGjlWwbeoa3DLyntnQ1LiicYHeg0y9U1w1AgVh1f2yqjzmpZqZpJL
	 U1dl+HKi9scng==
Date: Thu, 4 Jun 2026 14:00:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <aiF20H8juCPZSvYl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RQk9g2U8AYOF3u7t"
Content-Disposition: inline


--RQk9g2U8AYOF3u7t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  8f5b6b4b198ed (Bluetooth: MGMT: validate Add Extended Advertising Data length)

and this one is in the net tree:

  899a200a76486 (Bluetooth: MGMT: validate advertising TLV before type checks)

--RQk9g2U8AYOF3u7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohds8ACgkQJNaLcl1U
h9BkAAf/dof6ZsSUD16yf4DGSZJdVYu3snSZM8TYmgXlt9mTnufSE1rwlbFEWdNv
sjqljEHc7aNdvKHbJesV1CAkBsgK9z7ma+Z0zU9Fn6j9aZiqLcslUFbL3bmHM6l4
g3Z2Mjs51fRwBzNPSjdY8LlDO2EDVjv16ed4v5twzbN4XGzh816m0peS0YJa8fah
B4n0dbkJPxoIR9YKyAaYmgalCLi23gHnRwCHPFyXCEPu8wsqh58n7iKPErdgvYvt
0o31aDOa1PVNbO1skUEpY2BquuMZsnavuV6X7sU3miQBKOKjmxXOEEKIkivG+ew8
Nl3BCLPhJPN/kJtqB5+yofV0cTAxAg==
=Bp2T
-----END PGP SIGNATURE-----

--RQk9g2U8AYOF3u7t--
