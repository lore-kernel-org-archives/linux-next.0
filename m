Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89C3FB072;
	Mon, 27 Jul 2026 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151737; cv=none; b=OqtZXFvEY2YS+0uH3JXSJJmO8huy3pSO/tbJ0bBcycVOLt869psfqzQCT17F3vQ3o3axLmo7TMDnfbEUq5VzIz5vARPam2cATnHNnShMXYFZutLPCI7kMss89IiQfpX/qPTSnWLYvqkMhNZnlI9D4SIYcuJ5V8y3s3u4KuvPej8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151737; c=relaxed/simple;
	bh=/+xUJtymUTig5ZJY9XmzYTqcvl2OsOKcdtplR5+4v2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZYcHhT0KYO5W7L7GT24ablemGFTg0RnaHiXU3tdsAPZo+FPlBebAKyhNa+tjUxffTUrJVSR6XmiqeakVwIUzsMiCSuNEof02G/dDPsg4m7jzZi5UllOmAY51kXwcCg6OlQpWb2zLUi/qqsnpc0q4+7QjzxQZBJ1+BFbTgI3bBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8nHfxk0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8nHfxk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBBC1F000E9;
	Mon, 27 Jul 2026 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785151735;
	bh=cPv0Njq/XTI+Cy1W5nOKeUW+JwxE360atWsW3vgoHqA=;
	h=Date:From:To:Cc:Subject;
	b=N8nHfxk0eV/1R/gKn36dzYbnXDJouYYzV2aKtAMBnYeNlZ+mWmQvlwHWfSOKxcYuB
	 X1OZwXVvgmFSkCywxWVkr0A/Q6qpYw8vLEc/SekUFeguZdhyZVH8KL0V0jRR59lkoe
	 NJVSLoPtMjwwDQXfmP5skTBiljx9fNZ630F8m52n2l/8MGlcoRzSclcoHYiE1FMmNQ
	 bMNrgvVhdM7rfX2URptIixYQ/y2PTlbfUQdx7S7LYGy7yj/rN1yUreWPPNljG/0DMz
	 9cr4V6mVYhO3Ld3wjwbVdUh4ZYp0PnFlxtZW8dzyOisFcQxunLtWeIE6JoSU+Y2LHx
	 F30yJBC5hSI6Q==
Date: Mon, 27 Jul 2026 12:28:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ceph tree
Message-ID: <amdA9Kuh6idkytKa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VOk6D+K+JEJ7BKPU"
Content-Disposition: inline


--VOk6D+K+JEJ7BKPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  591569339cb56 ("ceph: fix MDS random selection readiness predicate")

Fixes tag

  Fixes: b38c9eb4757d ("ceph: allow choose random mds")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--VOk6D+K+JEJ7BKPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnQPMACgkQJNaLcl1U
h9DWHwf+J6Gi+hpjrakPVB+BYTtAnIYoI1SlTzYYIb1Y4eRXGClMZLzT/SnHPWb0
ZabDGLe0DHsUPHdBg3xs58J9hCzQJe7OcfQyjr7Y2LmTbTTdlNJ6+H5xKDbwlS9q
j7pVNNurUCySYRoWtfi7QeoEjzxP9P6pa/nQThiViMbxV9pMqJk/OtPPCZKssmOB
aV0tYTXDNU+I3tYvD+e4D0GhMhK8d13xBpRyM3ClXEsdE4zTmwGU3i8jyLTDLQ0G
7Vq4PgxPue61YMLON9t0ZBt79FfhxwUaVpzORnuCASECy+eEldcLuFh9qrF5+pzv
mNxRn6W5OqyB6QdRJH7Uh0YvoCo79g==
=u52t
-----END PGP SIGNATURE-----

--VOk6D+K+JEJ7BKPU--
