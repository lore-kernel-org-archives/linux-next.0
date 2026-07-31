Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CC13ADBA4;
	Fri, 31 Jul 2026 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501433; cv=none; b=sKnpDBWTsEno66CMLKUSdCm1UKb57GfyvdkTEY1N3/y47rYBpw0rvfccWAP2LM/jRtVnXRZuVPDDVJ6sVEAOkDYs1OAjaj0SwFj8T/bDrr/19ODtGjNQhLQFX16aXg7b5RzTh2tlM0VPEBiBtYvxmaHv5VlJTLo2SyJiqRiYmBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501433; c=relaxed/simple;
	bh=ZHWDSPf5ZiWymSJkDTqw36Ccz31ncax+GUznbxvJ30E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZiG9o5jmcLwPX6j8hCcbARzAJs5d7qw1Dn4ED2yJ9tMA7U8ll3E5f2G2JPbW0+lk/pG4laV/9zQ06a4J/tqpsav3e9XGRKSbgwVpjZxmW64XEIapyjcfRbCnathhV07obvIGfP2Bk2w2QBRyRDZGBsSZpB67unVdEi/TvErnT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLOjU/MH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLOjU/MH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C53F1F000E9;
	Fri, 31 Jul 2026 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501432;
	bh=CrD/vZ+1kRrBebDwIBN+prZwLxQIINQnukuYdwOsqu8=;
	h=Date:From:To:Cc:Subject;
	b=RLOjU/MHnq6D8M2evKQ3iQ3/PbMX/TQsbahH8qW6eXam15nzu5XwfBC4ybDuBmWBN
	 3QNGnIP8NBmJMzUPQe63Xx8lzAN/6zIygsHdzmJK45yAEpQECuAW9J795lPB3LO8iB
	 6ue4txEb0dLgtOm/N1T1MGe1/98Z2zgiH9tZUd2JwE5LkLNx4AuD9OKhg3f3ePNu3C
	 71UXj20Urd9hyCq3CoAQ1eflFa+KH5aGxESgfbvqlnbdoqhR1hKaiHOXOW84wAfD+q
	 1JwFeyKdjey5OBcUSRmr5SP1HjJ1rdYH6YmWgK1Nfs5nSWxX7l1XzZepURlL675wKK
	 z0NiXEmfJjaww==
Date: Fri, 31 Jul 2026 13:37:08 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the vhost tree
Message-ID: <amyW9JXu8pcR52uh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRom3s7840PdF4Mz"
Content-Disposition: inline


--rRom3s7840PdF4Mz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  b59e970bc7aaa ("vhost/vdpa: reject overflowing PA map page counts on 32-bit")

Fixes tag

  Fixes: 22af48cf91aa ("vdpa: factor out vhost_vdpa_pa_map() and

has these problem(s):

  - Subject has leading but no trailing quotes

--rRom3s7840PdF4Mz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpslvQACgkQJNaLcl1U
h9BS/wf/eKasHncqnzC9IcTSB9Cv0x/3cnJ5oPq1Hwf1JO8OblE1x9Q6PV8AmtLg
7S5QyHsVMn1MPf3pKPN3gr0aDPh9/+I2LjpPVKawqMSgCW+BUI8xiAvrqCknwUJ5
CT3EdRWzpPmLypzHwv06jbRruCPV2gI2CDDPhMYJZzntMfEL/sWLYYEndFnAvAQw
BDhB9SStlIfEiyNo3RiIIUlKwH9EsvdraMGxqnhy1piBpyyLgfoo2A6RrFFIRG/r
D+Zwsoa1ZZVxVj/sEINGNJJy2cEjiIsiTy2Tmx7lVNhC+FHqxnOY0l4uBCoMVfUR
bER75TLUqCYfoxuRBLqC8wwzt2zQ8Q==
=8Z/s
-----END PGP SIGNATURE-----

--rRom3s7840PdF4Mz--
