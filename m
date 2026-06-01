Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE8237BE9F;
	Mon,  1 Jun 2026 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317829; cv=none; b=Pfjr2ahAJSeoJg+z/qCJyYi3V+b/DMFipDaq5GRKq0F04sFR1ZRbTM/BftOhTQknNMDVOIwvzes3qc1KT79K71YJ7L6WbRxgGHKEoetuRub9wBO2NYZNLkHqQOq1KQIQbR3fSW2aaDzC620cr1JpfLMW8aRjqDXKXCPpkJcSjmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317829; c=relaxed/simple;
	bh=kn31Y+2ebQsH9nJA7FEVH0pjmaJXZ85GmJSxjOC/FlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5LeGwVN+JzKHpaqN9TFw4Ud2r5g0+WNKX4QbppuWa4JwwY41dyx2XrvDU+PqPs48BNoUenmtKw/YhSxq8i19/4TQW3KrgO1XH1vSxey7oNZCAUzqrGZ0rNdXGTAUxV39q0ufxDWy50ncM/HahI2ejh8/L2wVJLVxzVi/smpuk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpzEYcp9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpzEYcp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806BA1F00893;
	Mon,  1 Jun 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780317828;
	bh=/hD8CuGQIksllXfbBCj++hVz5RjM/gRq2RmyvMj62Lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EpzEYcp9G1rry+xHnWXrDB7pGoRhKUUGDrsx8E9lB5BjhjqkvsyA+SM50f3XzrCNY
	 Z/uo5f1YdmfH+pLXUuugNfv12NAJU5GKz3nWCF+I3EBwz6WBKQ7wseS89OCBA2aXWI
	 LyttpATFmbL5NpF9P36+vyege/JhOy9eY+m3ftAl7GOXB41oeYHqBPus6ZPd7EDZks
	 2+rOMhrkSJie99/uc8r8YxOYg/uCxKEBpKL/Z52u15kiOAVehsKKHJmevps+N3/1qr
	 h7RDqTOF1vtnW9uWdNeOfntLTnFbNwOZO5QSqqkRYq9VsfP/uj2OuwRnH45bOAEJbf
	 Z1sV+VR9B09yg==
Date: Mon, 1 Jun 2026 13:43:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Chen Hao Yu <edward062254@gmail.com>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Message-ID: <704d573d-267f-41b7-8204-5135848ec9c1@sirena.org.uk>
References: <ahl_qMDm5pI8S9xs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xA9bGVsXh/5nO3At"
Content-Disposition: inline
In-Reply-To: <ahl_qMDm5pI8S9xs@sirena.org.uk>
X-Cookie: Have a nice day!


--xA9bGVsXh/5nO3At
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:59:36PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the ext4 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: "ext4fs_dirhash" [fs/ext4/ext4-test.ko] undefined!
>=20
> Caused by commit
>=20
>    a4841d91a7f57 (ext4: add Kunit coverage for directory hash computation)
>=20
> I have used the tree from next-20260528 instead.

This issue is still present today.

--xA9bGVsXh/5nO3At
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodfoAACgkQJNaLcl1U
h9A8DQgAgh6j+hGpQTgiAKH7RczC6Q4vJIWxUn7wYISU9u8zRPtaMe939GZvn6xw
sFb3K46RCxUiF1eNheU5N4H66qNwNiDThdpXGuQI4MhFSRkBXxUzCGMnsUq0tTlR
lPwKVV5JAAJTf+Xl8llD68zmIMAkTQ3Tg5SiW4fhKcWA50niqSz0R0OJxWAD9uVE
iMoJwDvDpu/yIwjpAK6zql9nPMbyletDW/lv73Swjcwlk/xEYsXWNXqD8Ex8vjjW
74sTdgArkuYlYtT5hJOMG8O3NWE9Ne7OsMh0kxghjLN6n/qmLMz8emGbG7BbIq1w
WZSoG8M0q3JkU5xp6EsZOlBfcaWABw==
=WCK5
-----END PGP SIGNATURE-----

--xA9bGVsXh/5nO3At--
