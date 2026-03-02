Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E53FB04A;
	Mon,  2 Mar 2026 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459801; cv=none; b=WW6HnkEI8iLm7O2SzUg7ecsWjzsicIWLfyaHWm6RSRScPYFqKX9RuSC6Ygydm96VDcH8cPddZkExk2dE67wH7xJKeYynDZok7dx66cS+MR/nbmm4Nh8fGsex3tGTyxOSZ1rToFBa4DqsNJ6XQ55Cpc8msUkxrsYxV43ndD8uW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459801; c=relaxed/simple;
	bh=K/LfMhKwld2nMtGfQzxwkhSiv4tTLmGCq+XWGsTZb5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFyKWEUZt5O5M+U9IoAPDNTUp291IWPFJLSOYUq+C5FhwU2k2c8V1iopnfpPd3iTwggp5kGBWsiXLy8Silidmdrd2xE4fpVPPgOZrEcNoyPsUsNcV+yKsKCBspfL9Ov0bbsfDxghZN0pWcG3t5SjxRsS5dVztF3ct1YqJrdvU74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBtoMyuD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBtoMyuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1D9C19423;
	Mon,  2 Mar 2026 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772459801;
	bh=K/LfMhKwld2nMtGfQzxwkhSiv4tTLmGCq+XWGsTZb5I=;
	h=Date:From:To:Cc:Subject:From;
	b=cBtoMyuDmTlIG9P0fhZxAIDm+0qnEWdsstz5N1/gPC50+FZeIfttn+56zopk9SZ/V
	 MWeVLLp148B2BVJLbdof0De6L/vssHcwYmI2hb8gdpi8qZM6dfkNItYOLRRIq6cosQ
	 Z4MBiZv7op7a80aS7HV7ZUN3icWlysz5qdqLLe7WuYtu2wlqnyWTzLKttfauJ0C8lY
	 EoF8U6RR/8UF02ok7Y03/vSHZaBW+BAy6XBuJApVwzndJGkGxRjI0vu6hK+dDFbvhA
	 nO6fj6Ce467iZhMTgd8Kx4V3TxvdgFRHX77OGZq3wXyRs/3/CAQQ9to9zwK3Tjm8OD
	 j8q7/UVitmGIw==
Date: Mon, 2 Mar 2026 13:56:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Denis Benato <denis.benato@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <aaWXFVxygHFpKNxv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0b6HJuZAUosO7Fhd"
Content-Disposition: inline


--0b6HJuZAUosO7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/hid/hid-asus.c: In function 'asus_has_report_id':
/tmp/next/build/drivers/hid/hid-asus.c:732:22: error: unused variable 'err' [-Werror=unused-variable]
  732 |         int t, f, u, err = 0;
      |                      ^~~
/tmp/next/build/drivers/hid/hid-asus.c:732:19: error: unused variable 'u' [-Werror=unused-variable]
  732 |         int t, f, u, err = 0;
      |                   ^
/tmp/next/build/drivers/hid/hid-asus.c:732:16: error: unused variable 'f' [-Werror=unused-variable]
  732 |         int t, f, u, err = 0;
      |                ^
cc1: all warnings being treated as errors


Caused by commit

  Fixes: 0919db9f35832 (HID: asus: always fully initialize devices)

I have used the tree from next-20260226 instead.

--0b6HJuZAUosO7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmllxQACgkQJNaLcl1U
h9BrOQf/aeXi4JsxWg/oIiOKiz7wFJc0bM92yahp7XxKrvvkyFDLdCRKLDRiJYmV
3YDNmez92Pr+kiB3KN//eLxfH0m3Wo2y6fsAKCQG7cRFzwM0EiP3F38lUSFng5Xb
+cj8HUchavAZMBKkUvy2VgJKXVTLOMMsKCLOugF/lFbLlev6VJ7S/3bkPaBEidvK
RfPncAqdmhMLEpyhmoUy3GeFnKyecGr7JcpSWrhQiWo5+vml1jt26DA9lbFQGItM
IBQ1a+dDbfejxHRRFeTMwZQrjXqVFJVVZ/6ui7eWYhCPwfXLQyjpsAcHZHuAd3U+
wigo1OakWycGzbo07/w87hmwGmfWBw==
=G+o5
-----END PGP SIGNATURE-----

--0b6HJuZAUosO7Fhd--
