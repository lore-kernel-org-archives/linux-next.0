Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9018423147;
	Thu,  9 Jul 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600518; cv=none; b=u+9VDQhMfSn2VakJrfcs7sne4cZiKXemShCXEMuMwR53VGWZX3/P/8Pf7M8996Ce7oSBnK5toyfNcLNXe457FVQMHUYLZcMdcOnL6ELLG4aPtc53vTZzM5Ki9pRjdIc6fXB80ZjJUErfiuiXI7V7ZaizVqfTHVDD1EA+Ze2ffCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600518; c=relaxed/simple;
	bh=zG1D9M3DWqG/7OKAFw2sKcBHv9C8rrGlL6dxlVF9DT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kI064cnK1hcL6fXjIW9vGTcRssgSw2692u+yuulWRwpMFfeM/H2UwRvtIn/vMbVCMpvyDGFdnF7qi0PI6QxT0xaB1Tof209j+H88h0vYCWfs8aFjaW5hrpI549h4dPZ3QeDrFHCOoZ3Tq+FTZDu90zdN0qlSu51olIhnqVPcX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHz420pM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHz420pM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730781F000E9;
	Thu,  9 Jul 2026 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600517;
	bh=6vkhZRyJnmecWOkqUinDqWKhpkBTVYUsyjyw5pXuYMs=;
	h=Date:From:To:Cc:Subject;
	b=GHz420pMVq9mvbvZns9DCqWxxOdU7NzwFUs8iQPUbXpKJ9sAD3vno8A/oWREGeqmD
	 5aVWxjdrWRrph3JrXdVdESR7KvdGH0rHPGOjPDYge2bZI0ukryWY5gYmh0oq3cana/
	 igozkopdveN2nw2a2l0mMzb4B5q9kmndRFcYLu66QYTABSlkH+zQZeWDPl0+5cXxZm
	 D+yc7GIXUKsPpT62T4Sv6qKa9YYJIzUK4T3jKSv6N4x9MQGnPl2uEiFYeZU8spTtlO
	 WUG6Lu2Q0fsLGOxO00Ocf4DrGlPcCyJU9Z+jQhuFjXEWjTZZz8DT6xLhfL+XBgSF0l
	 Gf01aysZtLjuQ==
Date: Thu, 9 Jul 2026 13:35:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the tip tree
Message-ID: <ak-Vgm_iasKzmDee@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hd56VdYor891GXjY"
Content-Disposition: inline


--Hd56VdYor891GXjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  b80ddec4ca74f ("irqchip/qcom-pdc: Fix kernel doc for qcom_pdc_gic_secondary_set_type()")

is missing a Signed-off-by from its committer

--Hd56VdYor891GXjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlYEACgkQJNaLcl1U
h9D4Awf7B+hmt0g5L9Djm6hNoWja89pO5D4ndGUp/crhm12+k5V4q4/9KNfOudKA
RaWlLsTCxu5jZv/VdnqpSaInezVmBNheodfl6znEhSWOzBMVAdvgRtGMR34v1zZI
BITErP/Ktc0cw6xYtqEAX0F9y0z+Shf5mI9I+Wp0fKMv52NSrfmADY+A1KUnXR39
Ei5SOw7wO+1pSkLayIGoY5+VFz7rx2NKKqjcdM6tC4aPOjMwxuHNfoLLyN+I7Tjq
+a3ByAoHvMEDaczMbB6LYQCbLT7cM67urml+yDx/z3uLMVeoDbCUSP0A8Oek+nZv
JzoKcqv8WQNqQ28DMvjey/CKbW0+Bg==
=dXlr
-----END PGP SIGNATURE-----

--Hd56VdYor891GXjY--
