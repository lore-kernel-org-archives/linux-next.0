Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59A13382C9;
	Fri, 29 May 2026 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091884; cv=none; b=VNtjUASFb5juz59VHU80aRTQODFyz+rY26ffG+qOSvjYikfJ+oZ3R1y9UnlVNwVD7TL4yewmeTuxYe0zYN3PjQS7bJViY0rJTVQqsSgU65+Bt8IbQCJVn2s0AhGWCxza4rHs/MeyfKiHiqa+1p6jPo8Bhl9JcfQx0D/58H6ELag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091884; c=relaxed/simple;
	bh=npOFAvzidXkau6rxPf8BWyWm4pkh++zMRqzi05Ac4DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0KP5Z/5S/UjC/qGqkAF7dfrr8Kz9fqa98N4W/ODTuhlLNBZGEJjiNwNkBPGi+UYn5BgnBe3eX47sV1ZzXceTAEZawFuzI865ZFw1CeAjbBsQQIkj8ZqXyRldXfL9DwxXkeIIyTkFXzNJCaLryoAzRjV0mZMjuT2Ty2eEBVQMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVi6Fvrq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVi6Fvrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8B51F0089F;
	Fri, 29 May 2026 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780091883;
	bh=Cz/yCKCew5277yZqtM0j9nC28PN6kLf4VQwE1I64V6M=;
	h=Date:From:To:Cc:Subject;
	b=GVi6Fvrq5UbRPDwg+9yXo3vkTK1uwjHRbPbyMvBs+j5XqjeiZhzLklj6r0x0v6qSI
	 B06b7kIvVfIm0li62qaxshtZlYI2N/qrcY/cHitZmzITUDl6oTNzliP5rTXov5C5yU
	 yMHkvt62oNDljuKGi7oSyF5As/EbHljBGb/E0SrpgpTkbSuTZ9GbWds6h3DXEh6Tol
	 w6D+0vry+EzMc7rCczhW4OZDt7lMtGaVawDQXFskLWfUbF4sw/C5PCYwjsT7uBdMId
	 KZzE0ma22o5cXU22fjD619k6exLce54nyzABKSk16p1R6AU8jSnaPczesA0HKnQjgq
	 Az6Y73gtz/2Kw==
Date: Fri, 29 May 2026 22:58:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pinctrl tree
Message-ID: <ahoL6DMtYRDavBLo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="txUWsi7P8n/F2Mfu"
Content-Disposition: inline


--txUWsi7P8n/F2Mfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  cacd56cd5f14b ("Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11"")

Fixes tag

  Fixes: 3812a9e84265a ("pinctrl-amd: enable IRQ for WACF2200 touchscreen  on Lenovo Yoga 7 14AGP11")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--txUWsi7P8n/F2Mfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoaC+cACgkQJNaLcl1U
h9DD1gf9H6KSfe6hTBrtowYicoWJSyXvomltzFnxFk5PdBdIzDNjHXGxB37JSx8U
OO6Nc9RE9LWquDqfsokqr93Sy3DJqoSUKvbGc8xoXGrw5w4cg/njGJ+RFfpcqYAv
1LlrXqVjvGt9azncVnAHoVdZKvb1a6YH35HqgWapxv+aOh6sRvPjRsqAZ9gL9ve7
IoPTOGrrlqn13nMdXxOKIb9dUGaUNONiZUgemgGpBNaXPLvneRY3Y3qHnNaWt44N
KoWEdJmjedJBwMH3TJlWTrZyOZUqYEoQwZGhKb6OPXQRDctQa4NaVC44R/mQMyAu
eUPiZCyuLHpEujcI4iD4+EB2fERvNQ==
=FBr/
-----END PGP SIGNATURE-----

--txUWsi7P8n/F2Mfu--
