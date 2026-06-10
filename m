Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B63FE671;
	Wed, 10 Jun 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091913; cv=none; b=pvMy1VfmXLH+9pyHWEro7wDTiLSj/XVIrc8JBs/GWx91lVH0aZYoWxX9vIn9q5Gqi4rYEqQLAhkilwaxK798KGgRmpvCvj0jBsCs1J/XNDjM3Zo/rZ5gVpHyjXn/RIEE4nkTTp201rfj2h3IA/tvFsGIMC6D/tVkSm0OyRx+bHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091913; c=relaxed/simple;
	bh=VXoDuaXwvU1/oAgvIftIX0rItukVuo6SEtd1audJt98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+CSb6bVjI+qlakk6IBfTWLe0LoAFLnzMngCvEwUGfisvVY4UP0yUINLE63C6FMAK6W59zvgh0zHUGKd+QYIj5QADgq5HsRXAvqhW6cb5ZIZYZw+SWMa88Lbp0gnhk6pzx7eH3azk4ptlAInqPYpCAhPG1uI85Bx5bm93Ff+t0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4bELK0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4bELK0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576EA1F00893;
	Wed, 10 Jun 2026 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091908;
	bh=aXhUdGt8lY3nvrUks4d6bqcK2JgSJ0q72dhtWp22fB4=;
	h=Date:From:To:Cc:Subject;
	b=E4bELK0ArAp5sSnM1nMc0CbO2AO2//dkDQ654tKpl9OydVPBX1CysIAwRr041c+lp
	 41ei6K0PfNjtOg3xgy96ZxgvYMad3ooFR0C32NFqp9WFcRpfh9Nl/dZ8PvgJRUCB5q
	 Yv48UAot4VYQ8g+N+TGiDLLSYxSeGfOpuh2Q5RM3tYzaMI/eD4sMvovEs+nZ83QYuj
	 BXTIHOpXHExgcraRer3YbzkK1XDi7NiE/KG09Gz8Eb9sYphkF24ZDg1ZKfI89mAj8m
	 xEK4zPeEAIHZrjsn+u3kznfJSf7xLT8kvQ8TtF4UjB2OeQECEmqYV6rjzD8mPm+KG9
	 LpBPEo82+wY4w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0B71D1AC56C5; Wed, 10 Jun 2026 12:45:05 +0100 (BST)
Date: Wed, 10 Jun 2026 12:45:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <ailOQWxDxXkd1dKK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SKpdQEfg7AXoVKZB"
Content-Disposition: inline


--SKpdQEfg7AXoVKZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/hwmon/cros_ec_hwmon.c:173:13: error: unused function 'cros_ec_hwmon_millicelsius_to_kelvin' [-Werror,-Wunused-function]
  173 | static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

   4a1140942f92a3 (hwmon: (cros_ec) Implement custom kelvin to celsius conversions)

I have used the tree from next-2060609 instead.

--SKpdQEfg7AXoVKZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopTkAACgkQJNaLcl1U
h9CQOwf/Ts3/nH/bkmh+3Rli4H3LLf7e8tcWkDohZLeUn9SN5caPPq5mhYPceWAD
RYAlq1v6oCM9SMivPLqyXOKyQ9eWOg+tbOuuZZP38ZKUWVhQu/6xebKW9V/jSRDJ
ZYi76h/INxfuEQ0ygIcVD/ashIVmt4905nGhw/BclDbjseZ2IAIXpAbv6SGwi0gS
yfDD3im+ogCMVVcAumKJhbfLxJpRjym7HMZJkAj3BUb5TQX6QsEcoOVvhbXZcB+U
piRXDSajBY7WV8qmi97YQQtBiDALHBPDQmFB7QXdrjcu2I+Dt0bttUl8qS1oOtoc
IunaUqAE24BTZlLJeByHGvPeJiIj6Q==
=9Jxa
-----END PGP SIGNATURE-----

--SKpdQEfg7AXoVKZB--
