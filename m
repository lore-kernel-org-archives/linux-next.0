Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3352877F7
	for <linux-next@vger.kernel.org>; Sat, 28 Mar 2026 23:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774742373; cv=none; b=pyqdDxGX5H2IGpJEIT4x9kBEbqfLAbGbAgXldS6df6NC5enhqUvlstUmLgCJv5xRNpBeUFyeKdDrmJEifAhqHJrkueT4BCFmLNskYNXuitrOAg/D7SlIot9Rv8zFjrg8YpC1ZP4Dtoo3NsCrYam+yIiuSI7ehnCaFiXA0BHTw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774742373; c=relaxed/simple;
	bh=sg91IYdWOCo9FPHe/OYkGCBpsWQqLbDqigi1WZfHAlw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I37dgwCKg/W+KcOE1uCYbevf0UKJQYYQ3TnG34PVhc87TKdsV4wvEljFudvkLOZZhYR6fBnxqULd+yo/AGVyjMAUqHGorSz8OIRTIxv4jpPXiWBawFx37Spyt0WcRCZklxY0gak9cb3MYnmFTkiF+15Upz0nG+t43lzvzw31drQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GbCCyZu6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GbCCyZu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1774742362;
	bh=sg91IYdWOCo9FPHe/OYkGCBpsWQqLbDqigi1WZfHAlw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GbCCyZu6Upp58M+G0DdwL1Gsb2JNUJumhcIMxMMMekUigTU5k4ZQpeKzJA/5vHTUs
	 pxT+3qmyoXjPp8BKGdtPpspUP1IBOPX0upR0hs1TmpvISsSZ9H8or3dSniXBPj7Tc0
	 moX+BQHpfxn0mDEBkAESA234BGjPmLViU0oUQ1C9J667rvIg44Zu1iVyU4q5VCCPdn
	 SV7J+ROUTQyqGBtCq/UyAnfdzF6O1LSNUbnBTJKAjuWsvXmu68rRCvcYGbhhEVopdF
	 O7Z13pFzPgX62GlK8CqO3HYNY73oo2CgdvJ4atai9lb6iqbg35R3gmo3zQY0YtfYzi
	 RgDJLGaqC7ZaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4fjvcp26xYz4xdw;
	Sun, 29 Mar 2026 10:59:21 +1100 (AEDT)
Date: Sun, 29 Mar 2026 10:59:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: Please add rust-i2c-next and rust-i2c-fixes to linux-next
Message-ID: <20260329105919.73dea963@canb.auug.org.au>
In-Reply-To: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
References: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ui5Mmv_rgMiDlYYhqcH7l/C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ui5Mmv_rgMiDlYYhqcH7l/C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Sat, 28 Mar 2026 21:17:32 +0000 Igor Korotin <igor.korotin@linux.dev> wr=
ote:
>
> Hi Stephen,
>=20
> Please add the following tree to linux-next:
> Tree: https://github.com/ikrtn/rust-for-linux
> - Branch: rust-i2c-next
> - Branch: rust-i2c-fixes
>=20
> This is the maintainer tree for the Rust I2C subsystem.
>=20
> Thanks,
> Igor

Mark Brown (cc'd) now maintains the linux-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ui5Mmv_rgMiDlYYhqcH7l/C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmnIa1cACgkQAVBC80lX
0GyzgQgApBwskvTmjq2jNLZ3E+Vm0JFEJlVqDlbuurRWREYyc7fP3F3DXxnYT/V7
NPCA5JNGxSdLbcFPDz20fJS5R3UrafcQK1edjnSMxQIXtgxgX5SxSZLq4pSHtMqW
huI4l7/iLCBgNrFac8YyPE6qji0BfS+sAhB/Jf4bD4aqeD0mYg0hVubgXuDeeHd+
RP/Q5SKB4z7h9QTDpW06iqGwZCIbRwpAXG1XNhHjeVrU6GJNYkc/ksoVPnte6yMv
48hi+QdtxKSJ4sI9c3fN49jSkjVKMo3uDdthAlJFrTh/YoInuQUzVLxf8NfR8Li5
R3l3NBy9G1cbAzKy3VvbOkeuC6kRzA==
=BzXZ
-----END PGP SIGNATURE-----

--Sig_/Ui5Mmv_rgMiDlYYhqcH7l/C--
