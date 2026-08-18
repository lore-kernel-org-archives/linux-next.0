Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E238AC9A;
	Tue, 18 Aug 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067778; cv=none; b=hhrVfxpOxjVtFMqe8+zm1EqEgigAUmXs+0yYd74j5ZUz4CPW9uKwyEkGPsf5Z7XqOBiVRLjyZpNUBh8TolcONxt8M+W18QAMwI2cTDdw2uI6nRYiU+wu/3ZeTV26yBSgSnR4dyY4S7eRaio1scIbxQPzNt3UDGNxyXGkJAJa9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067778; c=relaxed/simple;
	bh=zsxrHXkxYPSxWpKAoYSi0d7pv1PIHR1PGca8GhI3NQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5+iMhZfXJNrgpxq9zU2SttzGs7dfCWyTHcmXnlbeEyjpLRnVWOhcAamUociXYB3wMCwgJjTtpB6i76wALLZoZthplt9C+e2lxbBrbsX5s6WVFI9baPNuzdemSvcykA6UV+Ilqh7JPw4hNBTmK0verFuKsLWF2sNuA4xq/mBOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja6mfc4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja6mfc4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378E71F000E9;
	Tue, 18 Aug 2026 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787067777;
	bh=fA0R5j0Us6MV/0tS8iE/q5eXCYL7MfVEZguiEhpCiAQ=;
	h=Date:From:To:Cc:Subject;
	b=Ja6mfc4e69jVjWE0YdBjlnWh5f5CHbqXDIxaGySOJvrCJnfqIro73FMBlIGWtcdp1
	 X3GiKsbmBiiEv5k1UStpABa/NUTdWMF7ippP088Tg7oxvSHUssQGK2l7Qv4CaKvJPk
	 ll9npF8Znd1Ivz3//3ExaJSXW49rG9Y6J7TwJR44UbQx/lJaiTdoKPVGb1kcxoijCL
	 +ZWCHYfdz4IJ3+xbfpZSDQsaczfHFuMnDnTQqBdqHy/+xm01DM7EkfJJNqt8GCC5PH
	 nkesI4TAOEruTUfnvs84oaEzx5UNzhBg/hjh0Bf3UWcsHQoD8YqsOsuXyXl7UYNV2A
	 E/73m68z7BGpA==
Date: Tue, 18 Aug 2026 16:42:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the drm-intel tree
Message-ID: <aoR9fNYRhmWDNJtz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="274Teg7tbCdQCE+R"
Content-Disposition: inline


--274Teg7tbCdQCE+R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--274Teg7tbCdQCE+R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEfXsACgkQJNaLcl1U
h9C1Qgf/fEu8OtJG7s3ubqqM42ynvN5XqaAkk2ymjz4J3c+ufhuvlLSYwr0hN+mo
T8Atl5H9c5cUmsnlwq8eEFLM1XPAHbpcwt4HpvN6IkOc+Kh17+IVxYnwzmQR58yu
7/FSu40bQ/JxaI+j5vWYFv28IGomfxOV/myrg24HhOVoQXVOnPktX74fx2DrD3Rq
bs8C0gMflG3poHG0DXLC/HHaw2PDWPEoCnqHm4k75cBw/LCAhC7BI3QWI0yDK7t5
5vKAoUiQw6Obb87XNwaZ0G5nYWwr22RMyqqkZNZnA3EveI7GxjmMdm+BNTy7uuNF
Wvm56nFwLTGVzh5dQXqO8VkxqtfAvw==
=MYZJ
-----END PGP SIGNATURE-----

--274Teg7tbCdQCE+R--
