Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13660388E50;
	Thu, 28 May 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969791; cv=none; b=P2XuFTvUsBGrLkQWQ/DLZMp2MOwpBVQjO9JOrC+YJz2EcOLoOrRUg17o/FCvxuDIuPh0wAYUG7e4hDvQOlyxiGCOSGNytFL0b1KvssAKKiTIzphhdY4mc4H1fjAYm3daTqxmYMx23fTUwYXjF2JBGjbE2WLU0zU/xNa5XdEvo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969791; c=relaxed/simple;
	bh=rypZ/036NlIQyd7dDs827no89HyZfGFCMbubbDh4+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjzbzNcRl4RmayFEFfhmT8ac78sZXZ/TW4WWhO6Y2QZ3L3QpMlEdZJ3lxV4u8uSZF+fKUYXd4Yz496l+g4/5UuYyQpXNkVLIzU3a+kHY5pEroSCQHyKWifwdz7t8KLxCyuHermgP/BGeFdL6yZwAbmpA7HXeht/veGgm8+AtWe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+If+fXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+If+fXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C7C1F000E9;
	Thu, 28 May 2026 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779969789;
	bh=rdL69rQoKKgCBnJQlZU/abJccCNpA4jfGFYXRMQ0nPc=;
	h=Date:From:To:Cc:Subject;
	b=a+If+fXYh2bmD8L7oKpR8wQbX/2PwgL3HeNpDDsaDfg7maqMfRCHHB4bEVamiSc5T
	 8Nknkfr/hhoPtSdFmN9qSL2JzISqDKLLmfPGJnNy0Q8/Y4+DzdzcAbA7aiai+oIcUY
	 QBz0p+0GrcyCk7eWtV/vqe1l3ElEavccyN9Ofy9XVHE7r2W0WRGMOMRiHwSldMog8z
	 iqPqagmd+Bq3d16wyReETlxHFPN0QpW1rTSeZ4z0YqVvtN/2PRMbz4fSru3O2dPKEa
	 Rx/lAne6S8Z8JuO2QgD6FBNccdJeVI1rX0kBHNiUDX1GDrtTXgnQHpNW8UNygNXbnj
	 FcV5hMhXyTmLw==
Date: Thu, 28 May 2026 13:03:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth tree
Message-ID: <ahgu-mbRz65nDwb3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mOxl58Z/cTa0cch"
Content-Disposition: inline


--4mOxl58Z/cTa0cch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  4fe5ea11ac728 ("Bluetooth: l2cap: clear chan->ident on ECRED reconfiguration success")

is missing a Signed-off-by from its committer

--4mOxl58Z/cTa0cch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYLvkACgkQJNaLcl1U
h9DLaQf9G2eJ1qpxgnkW0orjk/kZBhDbq7VycLq8e0LUjz2nbmB0wAV1p9TABzA/
y2yT0a22BtQ2OvRZfhxN3bSKIZX/HzYbkKq8qlRoCuSGpgvTpCixpcyRsUHTpHMt
A8cBUmwG7mtzvEN0obPtjDFdt1xXx9G08MlCfzs5ZWdsxagOlxZrXy6LNbXHnkWq
vA+9qjKCR82Yd9AJsQeyKNa47jTDrDMPh8x/urxYlNegEnvqmUJKoUT1SurRWY77
syqFabQ/bxdAvcOVEsXrLf09DSsmJnOYlkW6OCbvKwWF00CBkjeXuPqBuHT4Qiho
RCnh3Ev7AwJdDUSmZoRyh0Kep69hHA==
=P938
-----END PGP SIGNATURE-----

--4mOxl58Z/cTa0cch--
