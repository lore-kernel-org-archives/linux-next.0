Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6DB39B4A5;
	Tue,  9 Jun 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003404; cv=none; b=ihOl8kgyT6cJ4xECNaDuhIXREFnPAyaubPgUgztqyJ0vklK6+nRK9yyxWJMLq5UEGub732gumTRoWz2yGSXAP7//bWtGigUl1RmwJi/NqiOqSGZ18HXjeohrlaub8YFSRFWbB6CJA7TwaX7X9WBOQkOMaAO78h+i1dOZWsSOq1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003404; c=relaxed/simple;
	bh=CXiJ0rC6Y/c2P2I06hrY9+dpu1rQGYM6u9LuSP/RJG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pEwE3zX7N9AC1OpioqskMk3KqeYQWRlwvYbxmLJtURvrTi+n1yFQq5n6WYkyWLPONOdfyA0+J61MjhnqPHMGN7SC5J9KVOoPpdu6vnX54msOwFREj7wwEjFvktgQPPDu/9Z6YLRehsznbF8q1k9Xz/ExMrZw0SUE1632rAxxEEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZZBO5e0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZZBO5e0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B371F00893;
	Tue,  9 Jun 2026 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003403;
	bh=yoHweLsEMsoA0bJ6SSLbHhKWCh4ujSg0YsvsF/byyIs=;
	h=Date:From:To:Cc:Subject;
	b=aZZBO5e08jujkzGKK2qTGZJJN3mJ8FehFujttpZuQBNE9rz08ulpQO9jTO35W0X1c
	 1kJ1xnurx7HbE99cCjDmaQ/Fu2B2J/0iJnjlxRtAxazac4wAIBKSdzJtjT8m7AcXFf
	 VrLiXspZucols9NwvwWMIgtZEzXeaLA1lKFJNln8/RrAtzyJj1b8GsnkuJt8slV9V5
	 rEpnn8Z/vW1BHO4rCAt4jIZPNV09A/K1KUMfaH+SBhR9Pie1chUeYEZQy5mIOp7nZF
	 /RjPyqo1mKs/UuFrQttej7QsmqDHHZmdu7ES7PA1U9eIn07x3pUaW/QduWvt4AITo8
	 tSQs3IvVRuLyw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A3C021AC56AD; Tue, 09 Jun 2026 12:10:00 +0100 (BST)
Date: Tue, 9 Jun 2026 12:10:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the hwmon-staging tree
Message-ID: <aif0iKdxxNWxgoSK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jRa67y14eamgWUiG"
Content-Disposition: inline


--jRa67y14eamgWUiG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  beb0e2d1add1e2 ("hwmon: (gpd-fan): drop global driver data and use per-device allocation")

is missing a Signed-off-by from its author

--jRa67y14eamgWUiG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmon9IcACgkQJNaLcl1U
h9DHfQf+IrwNU1yORGPfEhukwrnJQ0ck1Ob0UnEWM+4Ziv4PePGY9IIEKYGdFf1T
jSE3OZwHyopHcGG2/wMqwcwnD7UuqxG4II8JxY5xG8hJ5Hi4bETbLTLiUWFywfFH
OQyFb4HdJQUGvYskWnfKCCBOQ9KgiZ3Al/ygCLJytcP2PMd4ux6H12mh3YhRWNHz
wqdEbXEPfTFZyld54SsCOErh/sG7KMOtY+JUzLx351QAyqIunOMy95hEgXzX6ahk
6nP9tTbUN/SkofZUhDNslYpV0RtKITBc92N4BuyOSFGjFScASZ3mrGbBawrKk4uI
ohLp25NplWe9XucSn0cqUdPBczEGOg==
=v6FT
-----END PGP SIGNATURE-----

--jRa67y14eamgWUiG--
