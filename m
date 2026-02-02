Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791236166F;
	Mon,  2 Feb 2026 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032929; cv=none; b=A5p1LdX3MtWH8U2mZjP+TSSxu/4tQ/0wqo5U3lj1fIBVqGOPOTmiFJ8rePMy9VqLS+cyhvD0CX64OmtAX99gtunFvT7zqQGzqhuzONADkn7eGTsa8W1o16n5J7G7HIQwUL7lHOLDSPxT7gSwlaMZFp4iiFLNA6NX8BMunx4DuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032929; c=relaxed/simple;
	bh=aF10hVwpMF7kCFOCVoE58w1+kWNP3uRHSEwKQn4iB9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HISbpJLss+AIO07xHx0LiZ55L5bG+YomaiqVLmxLA/TRX4++wmMx7VgJrF0Q43hW6G0KKq9zWcQYmRca5FQiQcbjbB64rJeXBzq0ippzk0gMTY04xRbiVtaZxhvIRME0SM4Te68VyiZnyb0Syc6a3Ys+tMWqhzqjiTMfvDPi8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmcJ1C0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmcJ1C0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4527C116C6;
	Mon,  2 Feb 2026 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770032929;
	bh=aF10hVwpMF7kCFOCVoE58w1+kWNP3uRHSEwKQn4iB9g=;
	h=Date:From:To:Cc:Subject:From;
	b=SmcJ1C0GMBzzuZP8wfJnB3a1tnwLLYJToJ2jdmdgAZbqBlci4ZLgK/MPYgaW9CX24
	 TEhYNDt8j7AgySoC5YfoU4swdQtBHWCFc9IiWX/+QydAaG7S972lj02G3Vz70/ujOO
	 IXpa3kVO0SB9aiL9FOKSeGBSBThSWptzAZIHKhbRkXgrZt03c2TXhTxIELtmO/zww7
	 L7Qv5r+NyMTJEQqBG3qG3NLNcwIjdJ6YUCGBKVptaSv6h0qlMVSM42VbDT/Kket3qb
	 pumS8j0NU8QS6a+SItSMfWfeMZZu8XIBtBRrz+Vxv6G8Xyvc3hnvVtraBEgKWQfBaE
	 DP77dQz5phy7A==
Date: Mon, 2 Feb 2026 11:48:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tags could use some work in the pci tree
Message-ID: <484d687e-4ce1-442e-b8c1-9299631a7fe1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CHipa+R1Z14vgXqW"
Content-Disposition: inline
X-Cookie: Bedfellows make strange politicians.


--CHipa+R1Z14vgXqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  b386d03d6aad2 ("PCI: dwc: ep: Add per-PF BAR and inbound ATU mapping support")

Fixes tag

  Fixes: cfbc98dbf44d ("PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU")

has these problem(s):

  - Target SHA1 does not exist

--CHipa+R1Z14vgXqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAjxwACgkQJNaLcl1U
h9BhDAf+NlPM12cfHLJH6N8YGP5ul7Uo7wi8ib15onoYbJ52+Mic5HaGnerbcHS+
f4BghTS4UG9V+p6WFhkavcASPWLw+7jQjbX+rlVUl+HXUq+6a+NFkZZqBsXcleEe
Vk/4JlKGsdL/7AvwZYx5hH6aS717LLm8+M6LFj8kqZTx1yNNII8K3wgTEVtyCcOu
Yz1we757l8+B/sRIcijJMwp92nrsuyIwSaQl0BbU6M9vhHlmn9xPbbeZyHWQvaIb
e3ibeF1GeErDSooaTtRt5Xb/zBoSxw/eskvwLUQxX9y/rfpeNJkf3uk65J64JEeZ
bXAnMYtdEfoQUvC9qg1k3N1fdC2JWQ==
=41ew
-----END PGP SIGNATURE-----

--CHipa+R1Z14vgXqW--
