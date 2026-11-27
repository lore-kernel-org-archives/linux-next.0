Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789616;
	b=ggR+0LHQzKi0AEmtsDIgBssM40XLrWxCCIo5NYb21MuvlEt11V1I1XDtl5t0D6IAYyTs
	 GFsJAGlTet4VIf9OQ+TKW9npYalZv2h7zQ+m5+WsAZZK6UsXpbmgpUDPokKT4dRWIM7GK
	 lmsWveb5kG4+ezScWfJZDI88BnCdusVgKOhgbL0J7znSMSnpJ1yMWfcdlzPLcG8mM0qNJ
	 7oE6gXHa/DBpDNw0bg7ItIpyVURw4VqaFXjKz3eTpnGXACh8v8dmW3jUO9TnvLHcF0CAg
	 nCeNvVfKZOOhKCPX0w5bA+l74OyekiJ7Kq3Q3hhk+ZZF2qqwfo9pIlqmSEnrjoK0DQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789616;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/lq8ULz8zjfQnoeztcTZxgz4QJcRlHrCeg08ml2B5L0=;
	b=cPrRmrLmiZgF/toVRHbLjKT4iSFRggJhu5DCKtM7WSk+KlrwNIzj52xWSGD6VUHY959H
	 7nwD/EFhnp3/gXMKeI7Ev+9RM61za4WHVa1R6YjlDom+9cMtf4CB/Blk+B847VJ5Q/NCs
	 LEI0PNWuzRVxgDd5OJ6F1dAf1IfwC/vmYm0zXX0LCenMNksF6JBWtw/h+hWl01S/AvTxz
	 5CLvP9FqtxlHi8ST11s0wsQ4OynME1ki0zajfgYsfjhAMy8p2CB4OKKK75ShLqSLK+gru
	 vo+W2JuQ0+5nVz1veuFSWyjVWygrbXIR5c7z+NkJbdSqqWJuISUNEllXQO6qU2SuG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjqVj5W6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05E606A685;
	Fri, 27 Nov 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjqVj5W6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E01F0092C;
	Fri, 27 Nov 2026 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789616;
	bh=/lq8ULz8zjfQnoeztcTZxgz4QJcRlHrCeg08ml2B5L0=;
	h=Date:From:To:Cc:Subject;
	b=NjqVj5W6zzo0dLvv3rMdsUbokCD02sOfxNE+K6LY+SDFt8TEyDr5HStJ3uckCruvT
	 mhGity2/XLZMWyZFFKI5PdBWSdXLHqDFtnpwegIyP4WEBAyZ/uA1OJNrWaoKJ1Ldvb
	 FgCI6vCSQ838RynwHr3I3llfkHDO+CATNeZZ7CUh/gAxEMqGD9HycrB16WVn0ZysRD
	 Gdjfe5chrc5+jg7f4OE1txgFQVcfr2yIkY9S9skdffil0V2/3FTg+brskDMKPaA+3l
	 ZAg75zlPOu2MNj02aHIzYd5O7cuim8dFaJSPvV7nsORGjJllyR3H5MgA0ItwIgo/y8
	 pCMbI/HrR1edQ==
Date: Fri, 27 Nov 2026 14:26:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ntfs3 tree
Message-ID: <awmTLWPbE1LXJJJp@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="C79mTcCN4on9QcGr"
Content-Disposition: inline


--C79mTcCN4on9QcGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  bb27f0622d946 ("fs/ntfs3: refresh iomap before writeback submission")

is missing a Signed-off-by from its author

--C79mTcCN4on9QcGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJkywACgkQJNaLcl1U
h9CD4wf/QjEv98Ix8U2rMoaZAL3NkyHrQaJuUdaEVWQC+XDZcnr759YSaDYiZlLT
KUDXwN14juiTVeG231T8G7valxbLH4PKsZ6eokokQqWw+7WR5E26JmvB7pO6FII7
Wd+s/9XNW2ngIz+AwO3p35Sgjn4e8D7fhiNMQ/G3dY53x0tl095Tab8N6QlmnZ1M
D4NHBr3owzRMQcOsZpahMUup134to+y+G8FgMkqZ7uxYEZG18TYrWoa/6J009lZM
U5mi6KAf4lIez3VZG7Ka2aAIjq68aZo5HFABKS8AOlUPAMpfdykzLIJ/XjdurFLI
20+wr69ONB5/oeyWemo40Z/tmng/sw==
=JP0i
-----END PGP SIGNATURE-----

--C79mTcCN4on9QcGr--
