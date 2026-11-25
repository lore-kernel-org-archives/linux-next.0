Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615976;
	b=xyW7IZm+XnRjf6egfVt5ls9iyoW9WiXAaoIi9HHYL6g4kDYSLrXKnFIZZ6VB81WaknTy
	 Ih9iIrQosM46qUE+wYrWCLszWKhGiHkcREpX9JlyvZZfQlNK5onc8CO46/7Jf8r/XWEfC
	 vhgRsX0LWD63UmULB1vnMPmWGMNeRdsq11O4kUH2ThmRQrWHeLaSVEs/I5/6GdG0TSzJM
	 rEnwOfWdzmn3RFfaq9DxPpNNa3SxhWPF7uf3jw5ix8gWqUsFwHT54hluz0qgJFmyFiILy
	 l9b8INAQZE4yWnmIGfOPR5xrmzhRXM71lEDH9M/VysFXN5on8uqj5+5bHarlL4r4SaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615976;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=kXhwZbAipf6Kpf4NXqgDeKyvQuC9nBzuMZjC5SC/HQs=;
	b=xecXrY7bBiqB89eUSSShQeyTfkDjIRMGCqjr5HNLE9CZuKSPScY96V1jbtpVaotruf1/
	 Q+xBit4E+010MQkNNZrmhdSKM9kffTwm1By0pjeUxg/4uE1fN/RFmplz5aLsbc431TqqP
	 qhKOAIC0c96s4aEFJn2Z0QsKyUtRCEShmvWgMhOkeloRVVHclAGQNg/gLgKyU4uzKRC67
	 P6//vCu9QXA4aVkkDDli/jdLs/n3lwWk4aqmbUGswONbBc3cokZxnC7XjRttovKdQKtCL
	 8b8aEGwgFDF4kJTBzAZ4a8ua7wu0HkxBr+TdUOdD7ZMcdQ+sRCSJMv5jtTJZbBDxEEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIh3xwIu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C53F606A321;
	Wed, 25 Nov 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIh3xwIu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBB21F000C0;
	Wed, 25 Nov 2026 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615976;
	bh=kXhwZbAipf6Kpf4NXqgDeKyvQuC9nBzuMZjC5SC/HQs=;
	h=Date:From:To:Cc:Subject;
	b=TIh3xwIu4V1Jh8POzws0btOZWNmv+N+SJqbfTRTmVPE0EY9WJJdUqoen8jKYFPeFK
	 QVZSPNBCvBn71i3dB2acuxLG8yfbUgkzonVTM3SuLH2i5nN5buRotSxoKb2vHeSTMI
	 li2NW8oDLv3CHN3K9nEO4KPSZJg9ZSMl4tChHaqbfK1U57qd8NLeVbewyIDv0IeAUR
	 mVCoqlv+f+YBZR0SpuMEIF+DsxIB6l0rpJrRqRuHklSsBUPQ+9c5zWw1vzwPTnOTFX
	 vyKs4cAH4Zu36R9CDNgiWnE2TW7kee2tRFrOX9mMcLcM4eLLyphBF67G9KplrJ/8z3
	 bfm31ZDL/zdZw==
Date: Wed, 25 Nov 2026 14:12:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbs5Z8gKBQTPame@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="9aaELiojZG30oNDy"
Content-Disposition: inline


--9aaELiojZG30oNDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0cabeaeea0a4a ("arm64: dts: imx9(1|3)-tqma*-mba9(1|3)xxca: remove pullup from CAN pins")

Fixes tag

  Fixes: e71db39f0c7c ("arm64: dts: add initial device tree for TQMa91xx/MBa91xxCA")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--9aaELiojZG30oNDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7OQACgkQJNaLcl1U
h9A5xwf/fAayQViyjyvemC4Z5zfGOZhzQ0N8Ru9UF2ymbKGRTcNnORDB381f7WTf
h9Tqk0BdanmIjI+Us9hWICTHD8XYtBJ51HZXj5ffWulx9+FYqhmx8Ikd9Mb6mYVZ
19TULAhPvA5C+fpl9RN9lh20oEBKXhDs9URDFUbC2lOecXRkXTzpMA4NALitJCcw
egjmXJ1aVDb4qTOiQqZJmsUhuKIc2y6/UQU9tDKW4Fas8FRymEDR6PubZ7gcHgzy
7VelZXER1ADYONQzEJ4SdjJscEjci0B8LZRi3Vz1mPMEatKvg4y+KiGfqkW2Dt8E
GSWzKFGGaiWx+zG8JuEuFglfOvXhcw==
=qyuy
-----END PGP SIGNATURE-----

--9aaELiojZG30oNDy--
