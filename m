Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5B40A921;
	Mon, 17 Aug 2026 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969360; cv=none; b=VGov2POkD7fwbCt0S6l8sPf0YnYMe5O/v7W9LAAjNKUm4GWiXdEz31nmgEKXoSanRLYJBn+sR4q/2tBW9fNTRFGWDQL1mNSxaqKRjr8hYQOrNgHqb6B8REJWGvL+8TKl98cx3gvkKpSnfFZ9CN3VYX0WQFaDyzu6I02omheIhNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969360; c=relaxed/simple;
	bh=UiH1tJFOjJCoKtZuYCpIT9QPi8pAJHU/9ZDEGITnRCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJYK3VJaajKOs0IZVSkXbaFw4Nd6Jw24tn+JmCEAPsVw8eMEhK8IWVHB8Z4iMq00A7Qogfnd0Kb07itx+ngHLo+bMvBHNxHdxIM14Oy6WP5vGdTlAn/Ha9TszIYwuWx5A2enVIITs2EG5Yq7sQ9n9OkSUbfqpCbZ5yh568D7P9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BosPbCJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BosPbCJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF22F1F000E9;
	Mon, 17 Aug 2026 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969359;
	bh=BgIb5j1O+kwI0/CJl2x7ikGeG/Dkd0/bX68IFZqwrJ0=;
	h=Date:From:To:Cc:Subject;
	b=BosPbCJ9PZbEkghvJgN8mD+YORxGKauElsn3LtrzeNFD3A6vRA7FZSXX3qaOr6bB3
	 7v0HWniLxkoZUuNaAkyEYx4p4+82W4oytVmpnKLC5pFoM0CE1tG+eCCaY9G4ZyzW4W
	 1GHBxCiV+q9pbapzFjCyQ39wzl/FELTzIY5P+i+cx7uOk6g5Zm9zAfLBnN5Pr+tl37
	 +l9vfV6gpvq29TptxhBWFImrelZKYCyqvWOu46RnTl9Q6/FB9p6gKbtRbSnwbnsIjE
	 OanncXNs1YDAk++coprfbzVRO2nW7ZZRAmMusru4ptVwaRG1/6KU5NoIaGHQXdwCkW
	 luFwWLpW7nYRg==
Date: Mon, 17 Aug 2026 13:22:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the input-current tree
Message-ID: <aoL9Chia7eJRNqQB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wHkSY9wUAKK9UfBG"
Content-Disposition: inline


--wHkSY9wUAKK9UfBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ad255410cbfbb ("Input: elan_i2c - optimize update speed for IC Type 0x19.")

is missing a Signed-off-by from its author

--wHkSY9wUAKK9UfBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqC/QoACgkQJNaLcl1U
h9AfPwf+JC7Y1JrpdjyEsVd6qtiRs1ge7SwkbOeoRmWz0/J8oR2RcWWjlO0x7EwY
PWd+LghiH3rGL1g+S4xoisgwcbCL4EnAr1TEIHh81Ppn5zCHvGwg3pvqXFOR+/kC
g+BU85tC9Uh4ceR46p6jVGO4FkSdqOhGPzXbj48agWr9D+Idf1vkejSCcLLCJSPQ
bXuulq0nmaOd6frYdsLk2ZjtPLqROGXBVgBQ/kdy+JQ4vx+UCPDrNHJOUdsaK6am
Vq4MT+MvXSIkjmZuBhC7cxvYudqqBVm+Ox/npsNauGi9W/95VZM6LcJHjL6JTtfc
FUW5bANkwlpQjlSNhhDL4Py27wHHMg==
=P2bp
-----END PGP SIGNATURE-----

--wHkSY9wUAKK9UfBG--
