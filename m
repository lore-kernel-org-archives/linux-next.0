Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616015;
	b=e17dnQGorvOP2FVy2Wpzk8IuDUyuqqt+yeZbEE3GNpjryTrPefCZoxtLV1R2u+KzeF7n
	 ktRNZqwLJuqn91TlqlrXhKLssZFE6bni7Az7DXvMcZi6g4nPJ9gfptFcOYt5N2PCRdmHr
	 mU+N2uJfiHYmPhaJlZ6scWaHOhc+H7Emo6ZyfoAXA1zKUvIrEgvpXY/N4tlbshl/vxBCI
	 oi6xc11c94rDPnC6fHHPxxOJU+k9MmkcijaLrpAsFnV6lWYrjMAejIPs9WLYMUZxk7rBz
	 9CCbW5bxXc9B933kHBee/j690RC3sw7BjXRutvoqykwvzjIkCytLWhCz8BqPHEsl1Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616015;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=dnNczf5l/FIRJaiIev4syPdwNAeFCpWg+n5HCTGM45w=;
	b=xIBLYBQBInao2hUaZ3o/45vqyyg0hAyTx5HIWBP40lHmGbfQf8feOHfcvgMQwSAQ6roS
	 g7vuvM7cCXv4P1KbNQIAtB6FxD8EjJrerm2DcsVblGtNau0QpPxJOrSrts9dz49n15TJh
	 1qGxFBEUDkYObBVZLtAN/T0dxMRtfTRFXj7GD+jXOKXgBM/F5d1ziKkXdX8FxTyqjQqJZ
	 HKQvINKwytQpkI5ZpxknCRGD3Zkr0B9dj5mc5KCFeVyzS1ZizsyUBD8n5CaT/PyhamYnw
	 e7RQ0flRZrWqhJXKyhHshmDYwD5r3IANvqKUy2QN3E5k49qiwXgqrAZUPyQiuCsb+Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBhmVpkt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4D606A31E;
	Wed, 25 Nov 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBhmVpkt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238C91F000C6;
	Wed, 25 Nov 2026 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795616014;
	bh=dnNczf5l/FIRJaiIev4syPdwNAeFCpWg+n5HCTGM45w=;
	h=Date:From:To:Cc:Subject;
	b=fBhmVpktZz96hTbUkk3eIKlmkrE+Uk8XgiRU54MYhBc0IrxJOcewbqj6Rt5hkj4WJ
	 mE8L58QPNfZWeTnAdN1Lz6yD+07YT7BdgfW0GyWEDzPstB+mEdr+rFQ3nZ8JFcK0h3
	 wjy6+aIXizpuMB19hJfR1ZmcaKSkPmzaOe7Q3twFLA5liNzfzpDboEaXCLZ81YRzh7
	 1XXYg8nzZLyoMl4fBOB9AR2H7XVsePGGtDY+KxwTIIZYDsNQrma2UPh9ZVenDVJQVp
	 M5tm1hUOfy6oIMd4iFidllw+h0h+i/s255HaRewslPGMJFA9RAomVlHxl2KkeyG6GS
	 d+EKsVLc5hp7A==
Date: Wed, 25 Nov 2026 14:13:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbtCwc0rphwNs2n@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="aiqbn8PCpcH0r5Ec"
Content-Disposition: inline


--aiqbn8PCpcH0r5Ec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  7f3b1606ec23b ("arm64: dts: imx95-aquila: fix i3c2 pinctrl group node name")

Fixes tag

  Fixes: d5c082ba23db ("arm64: dts: add Aquila iMX95 support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--aiqbn8PCpcH0r5Ec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7QoACgkQJNaLcl1U
h9DKMwf9EuhLejwjdQqWRS0YdrU1U0yMaQl0N1nKlc+LE7FHU5wbtSixKSTffdg8
3Wa9fSlvoaqIJaXRBcbi8PwigvU3QQmexfMYbkmc7DQREUoniD9Vhnj1YDMYcpg3
UquVoFblmrgr0An+RJmxDTPvvO8/QmL30WLwcUtfQg1Y4Z2peIriaYkRBrAnubPH
Bvez1/akoU8OjBv9/z7grjThHqSY3kbD3qvbuFlcbq41dp+7+IdWVMlSwKp7HaZ6
vtnAm7bZzZ+PdXhu3xZGjJ7sIkW2tRNw5P0/3fOADphkOo7UCP87BMH45VS/wFH5
DZdphvF8wf5X9RdU5nhVsUHlSZvCXw==
=fIza
-----END PGP SIGNATURE-----

--aiqbn8PCpcH0r5Ec--
