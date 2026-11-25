Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611036;
	b=KC8Hbk4jDi7ih9Ercyrv6CZi0wqdWO8pEYAnleUNSOtV8HI5G2hp5JjUGjDmq6/pX+T/
	 VHrgaBCB+aeyFXuZSjxgqG3VEjyG86ohNo+MCwCzZlNKK7ITFy2mRUSqqcnX8hcqgY6y6
	 ZQidqSNqMQOspTiUhERhFFeFfX9ZjbeeFr484ALOEbVN5yFlpyqqLbL7v4/6pxik6gK9h
	 BfN/+XFLnpDwrlho6NIPN72zW8+WGVHP/fWV3BwxfWM7XU0ahsocJ1EfncxryRPNWbNBT
	 2hgG+k6rD+5KLKT/al1w2DHbNJAndSfIIdhkuyGP5nB+ZBwdzgFWbXxodJ3xuY2Cv8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611036;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=j4QNF7I9GkBiqJ+HawLd6pykCBwizD0nlS5K7K2BIFY=;
	b=X0wTPZa5cc142Y5tkFr6zx1bhdT53p8mxHyuDIZKNa2gq1izWKxDwZ15uqsAxjIsmv2b
	 /K429rx7s20PLTgzXpdc4LzSa5+cYR3WYQUrSkWw4I2oQU5lGoGjG0l7PvCy/B6lSwi6f
	 phSQTo/nrJchf8EjUYDrLYhwTgUVpaCWK2U/dqVW237g8UPRXApwB8rDsQ8Beegkm8bzJ
	 7vC+AOZIADJiMNT3rv4+j8nD+CbhJ5Ct2VVc091k/GVYLQsdLgaCfVVfMDJiI4MfiZQIN
	 kvr0Pn/UiQrxH6Xk8oZryV9JBlJuJ2Euigi+cNRgl8B3H5oShpzfgF7SHArS5v7iHHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYTq6zN3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C00606A31E;
	Wed, 25 Nov 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYTq6zN3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D221F000F0;
	Wed, 25 Nov 2026 12:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611036;
	bh=j4QNF7I9GkBiqJ+HawLd6pykCBwizD0nlS5K7K2BIFY=;
	h=Date:From:To:Cc:Subject;
	b=bYTq6zN3Ao4tP7hjsFdeEjxgC3toof/00o4z1ZfMRoLux1f+CqBjPPPbQnWeVf7l7
	 Nkr3go4x/alAsGZHiRlLJJpsMBYJvwxqYzhtNw1g6wKsWCSsS0rYO8K5IoWuwVGIIY
	 5X92BW1uf9XNVZcHes3fx5s2ZSJhcb+NA4LUwKc4JEZHl+Hqy9sRYVkiU8G4uurDvs
	 3N2gnghiAlUVsydwLKIpa5oDWVWAFPlRBoOpifBFAqZBriFPyxGPuFjnqbHzUlkeYK
	 khKafowzfhh5YPxQcROCsfxbzooeHA6ctBCyOUdRq64kg1GAD88ep+xFk6tnaYXoR6
	 m79Fed/hOAxxA==
Date: Wed, 25 Nov 2026 12:50:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbZmdQ0RvZvPhUM@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nuhlPfLgPChaEzpo"
Content-Disposition: inline


--nuhlPfLgPChaEzpo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  dde030b9850a9 ("arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to replace dummy codec for micfil")

Fixes tag

  Fixes: 815fe2e0e65b ("arm64: dts: add i.MX95 19x19 FRDM PRO board dts")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--nuhlPfLgPChaEzpo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG2ZgACgkQJNaLcl1U
h9CNPAf+Lx3M+3gMIjN21oXI0PIM0BOH3/amTqDUrRFR36rakcf8H/XDIUhoqp3z
jZJcOrCVbIwjnKix02RE31lzf9XXH29NzjcmD+Iu0OBcVOMdUV9Vlyzn/jVnL/gl
tJlkxKTkbUyBXJd7vgX8prKxECPJglqCEk3qt5nusevzTlBXMVQ7Rfx2K3K8dPpP
27IW/Wor1ggrMiVzNA3Id/qYkhn/F4lQgZlwOujGSfKKqohA78ZXggB3e6O3LTvM
9LP4ls0hcX5ytcmDDkf00xyvQ5kGYYjn1LbvD5JLMfENcYcqkgq0gfk+RHI1YAJd
qNGVS6LqU92AYqdTQ7CybGTpBZx0Lw==
=LRcJ
-----END PGP SIGNATURE-----

--nuhlPfLgPChaEzpo--
