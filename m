Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945041BA7A;
	Mon,  3 Aug 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765785; cv=none; b=uKxmkoCadNvPS4JOBtGUuEJdRFPZlqaxOAWJ8Ciq2jur8ONw9Y0wvv3ijNlHvTmsjq6ctpqyTdcah6vGHOkxOsoZbqZpPI+9hKjYOUn4PhI4r4DmOg22Cqu6nOUzlhc4dUnJ4q31lQW3m4ChTtauOEoV9dzTCkrs98cSIJPSxJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765785; c=relaxed/simple;
	bh=rSF9TUtsuUOeGjA0MBVC0gxgLBykUBkp86wKASf5h3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFLQKuJ/hcTht2Y0o4Mu5aioxcQoN1/NeVoFnus7Pwu+h01nj22y/+azVJ0Gy96xVGwk/8A4pq4Hsex12gvA7AnprFnODnwNy+Wiw9ckn6zc99ZAa2fgOq6wm42z8ZWggiGwfBl/MyhHUWyHIg9p028vvYVY6sc/5P4TIFgSj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq93y00h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq93y00h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3E01F000E9;
	Mon,  3 Aug 2026 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765784;
	bh=DUrCgu+JUKB5P57xJv+lKAFoA9aY6EWOKxAtkT4K4NM=;
	h=Date:From:To:Cc:Subject;
	b=Xq93y00h2vE2beZvChQBZ2CJ3zNBEvDSUzxd+6mdQVPls5eb3OWfCy3qnjqFew3Fx
	 uOcXHPZH4lEjLvfZfB4mGQ9j4pMYSxPqO11U1dz2+3JFUhx6XV0T45/05a6/h5jPWw
	 7i/mYgJx88JdJCzGpcsQazPUuK0503lyVXwu76MPKLfmtQzBbgbNrscC5mn7uH1rm8
	 2HiNcv+HpDYd+WYFhlQ24xpepRgLbeyG7AqzmEgxh6bkSJ9X3qBOQji7x6q3B3EK2r
	 Hpka5l193Rnray02iIEp6dNpQBXI1SZ7bo9/f2jkkLwvKdZqQpEE8krbt3HP/JphTH
	 fN3vjFHQ+P45g==
Date: Mon, 3 Aug 2026 15:03:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm-lumag tree
Message-ID: <anCflPUrBco5_lF4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tu3leBy5t3YOa9Iv"
Content-Disposition: inline


--Tu3leBy5t3YOa9Iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6cd33b6f4155e ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")

Fixes tag

  Fixes: 6b16f05aa39f ("drm/msm/dsi: Split clk rate setting and enable")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Tu3leBy5t3YOa9Iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwn5QACgkQJNaLcl1U
h9CQQwf/bOEub+f6OrLZASVK/d+WP+CeTUBynmna2ozTBON9q4x1uqO9u6qIZFRN
qS7+1OE8bbu7xHMr5iXDxajwr7u5PG30I6L4p6e6sJNPAU4lAWxZmFNgPJR/20D+
4tviKcwcSIQKE7iiPMPZemJUH0fkoABVIIR6f1eEsDdjCEsaM7eFI98gakRtdSSm
Kb49CO1yjsmBriHwXuiZ2kjiOLNaGfWqFd1Jq1hezTXDCVjZ8YD2vvDzQeRmOtcC
UFrMFDjgU/kIzAr6vwcDGE8spF/CtZkpk0Y+Y3pYGZuXNrjcQd2W1xIKVMHw/NN+
wFI1uegzehv678AetyFaX8Lp56CzVA==
=wO/l
-----END PGP SIGNATURE-----

--Tu3leBy5t3YOa9Iv--
