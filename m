Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3417E3E928C
	for <linux-next@vger.kernel.org>; Thu,  7 May 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150484; cv=none; b=KeyFiU/S04msoA0iW+oY0WoWMDPlVQGSPpwGdOx7Odlyi1U8zwSd632D0u40cj1qGmhSnugfFMVGmjUCNtb38NRlExLWrcVyBKQBanAp/hN8X1tUc/tC8wpKfdmucNNhXCARFGmLDGWFqU/dSksSwKz67ZjbLFUdmmMiwTa8S50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150484; c=relaxed/simple;
	bh=YuJrFzdtf7AR1Zmt4X3yr1/w0FNojkETQaTo+ZtlD3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWM3+W2HVZRHKOrW21lVeC42uxkRJb+4ojmiSw3W34ARmXjvS2SoDJRZwSHkGd4tzU157H6fgBh5wRfZdBfsjmRY5QioeYFaQv3zLRkXyr7fe52R9wJq8E1yaaG0fTxBBStqgP4t6zTSnSmvwBkuEcjswTxfKtYBhyEzsAMZsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwfL4eYF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwfL4eYF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso4776475e9.0
        for <linux-next@vger.kernel.org>; Thu, 07 May 2026 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150480; x=1778755280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mOQND5LIBsFU7QewwrJ5aIqphJuwq/G8dVD1J3o1PE=;
        b=CwfL4eYFHgFV9kZYK7FxdkWOXd+Gsn8pXiWGiLkzut32w5KSkslB0G32cawwbhDCuM
         uIy7OlvbkFcYSaP/AmLsOI4x8OTeX+PaL9YNlA9nME1dIt4CWlEwnjN2WPuaVJt3COQK
         DdbFNquO03XUoHPeddcpTD/p/qBZRaDSkJwtcl0qd86h7fvx47ctp0uGQXZVex1Ju/Lg
         dW8UKcpNatwUxOdKKsZCQ193I27Azzzf9XkXSH2oQC8/b/AHa/LZVHVs/T+P6UkMIdZ5
         qO/MA9x822yDhGP+aPcUrtXvsZSHXtpncgy+Rh38YzptsMAi4IvtUxPeF+v3DSjsMMYs
         1k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150480; x=1778755280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mOQND5LIBsFU7QewwrJ5aIqphJuwq/G8dVD1J3o1PE=;
        b=M3qoappI4xCDzq3UIQ2UAu54zKK5FgEla8Xzw94eXMxHkrnuN8LB1ZYrTlbQwD4dwT
         oJV6HivQH76gV2Vsp2IfMefrokKN8scm+jEC/+Fk3e4VR5C3opS7VogLb0o+Ve1zyKlW
         8w0XagvIakhRIeLV7qsXFAEJvB3uTw4XQQHmQg9d5YpVkSVo82k3ij6fPVJTDS0HLlLX
         Ksbas4ApIAXR0t90n0jyRVglAo2QBDqRLRuNjhEhfPCkIEvQI78XUt4KmyWSeuO+yLc2
         5ZOZQp3G/WMMhrdn4aHnMkX40R7152So+YWYApl/BFZs1a3Hc4vbCWgmk+BZwnhSkjbG
         GKvg==
X-Forwarded-Encrypted: i=1; AFNElJ+OmILilEr4ibmyaSjYGnv1Q4dVRlpJ1HlNXoV/lCtxJcoyqbDSWeXuMf00zCNs9AQqj0PShiXED+2a@vger.kernel.org
X-Gm-Message-State: AOJu0YxPKwXbwtusx5ejtXRHZrUcmlG91AGmLWSn1eq6U2fkAnP7L7JL
	MOA7k8cqLgzw2z3zHob1J4zpbQM8jhYCLzSsWS6VO5FVesclsDKPLrx3
X-Gm-Gg: AeBDiesbekfixnkxeFruI13mMtitC5PmKAxIMOc3FgJGIwDJLPsLKnVDCP66E/FID1W
	3gITN6LRNYxzX/JKQBDViUdHGVjg0DPUMuJG6oaYWns7B8rYZNd1R3smK+/U8joZ1nUHxs34bdz
	oOSMauUlXVnrdOK9PCkW1NmbwVC8gYE3WIzVmNkqbtTku6bAyWapbFpBQoMIH/gRQBzLAS6BvMz
	dMQsWdI1WqIa8knlrd4e2X9w/N6ImxZ6K7gjeQj2G22aJytlmeTaAP3a4uHr08HBziVA2+Xkdus
	qhNSCIn2uz0vsAi15yZVf1iumma6d7RY7qwA/n1O9D52bSJLC67yduhdaJbgMotnGQ9NzTmzKfN
	iOpB640K1WQ26D3SubyKzkn2L5Opk43mz9sQJjLRF8+RFiGiKXHPqBMBSJclPDKJ4nfE+ONFb/4
	1TgZDp4bB0AsHaNNkVFhJ3wXALx+GVbtVrt6r0Z5bXzgWK8LuftEE1RmEHqzU/Lqn3Jwvmy+ay1
	Giuxe77lhQAzAa7DaHCTXwy
X-Received: by 2002:a05:600c:4f53:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48e51f44577mr117945475e9.22.1778150479956;
        Thu, 07 May 2026 03:41:19 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5389da63sm115701645e9.4.2026.05.07.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:41:18 -0700 (PDT)
Date: Thu, 7 May 2026 12:41:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Francesco Lavra <flavra@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-iio@vger.kernel.org
Subject: Re: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <afxrsImVuCp9d1gL@orome>
References: <a361f317e3aff614a00ddc8ef908d820@kernel.org>
 <20260507112938.369b6a1b@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3ywpc4lpncriwvm"
Content-Disposition: inline
In-Reply-To: <20260507112938.369b6a1b@jic23-huawei>


--w3ywpc4lpncriwvm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the iio tree with the iio-fixes tree
MIME-Version: 1.0

On Thu, May 07, 2026 at 11:29:38AM +0100, Jonathan Cameron wrote:
> On Thu, 07 May 2026 12:05:27 +0200
> Thierry Reding <thierry.reding@kernel.org> wrote:
>=20
> > Hi all,
> >=20
> > Today's linux-next merge of the iio tree got a conflict in:
> >=20
> >   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> >=20
> > between commit:
> >=20
> >   cba48e44357b ("iio: imu: st_lsm6dsx: fix stack leak in tagged FIFO bu=
ffer")
> >=20
> > from the iio-fixes tree and commit:
> >=20
> >   7216b9f7e9fe ("iio: imu: st_lsm6dsx: Fix check for invalid samples fr=
om FIFO")
> >=20
> > from the iio tree.
> >=20
> > I fixed it up by using the version from the iio tree. This is now fixed
> > as far as linux-next is concerned, but any non trivial conflicts should
> > be mentioned to your upstream maintainer when your tree is submitted
> > for merging.  You may also want to consider cooperating with the
> > maintainer of the conflicting tree to minimise any particularly complex
> > conflicts.
>=20
> Thanks. That's the correct conflict resolution.

Thanks for confirming. I was halfway tempted not to report this because
it's pretty obvious that the issue addressed in iio-fixes is also fixed
by the commit in iio. I don't know if Mark or Stephen would usually not
report these, so thought I'd better play it safe just in case.

Thierry

--w3ywpc4lpncriwvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8bEgACgkQ3SOs138+
s6FslA/+NnHO+tL6NZn+TsSWZqxrWoWFQTdE0isVpYXs96UunXv6ku/eXCHF3dxT
ovIwEhPi66X1fH+Mlx0bjKMbUcZ7yxfe48Z+l/78z08cHoqm8GTSF9HDxKnXwwhp
oX7jurq8iiGyWadhG4uF/B/FIL4QsUKFofJ/G8vOLI+h/bRWnwHuDEwx4NU7RxcB
pSoqpwNyqQ7tKyq1dT97RbqIO/LpLCS33ndqRbhZVVM23LVBbfR0E8PFU1KtvCmL
IA8hJAA8YvDKWIhWGug4H/ybkocTQlGap+xReT26zGBhpzPpmo28V0GTp8qImDKy
X2VSX20K/g/raBjBRGsFl4p1s2Pr9SJXvB021csXrIQvExzy3h5mt86j+YOolhOi
Uh4R1WAfwwsiVmF+wI2HXcXGBlXeiE6Z8izpBX/i+6NCDGYLLPQ4E46RqBvxZM9k
A4n7cd+SnZ/BWsH+2DxrKH9sn5SCMwg6Giwey/0FlFXEp/97ukwsmcC+UiMhQ+as
BWtxvKaOt7FAdUEQxqkc6LuC8JEnpqmjnWqW0DR1wuuu+NAOlYPKHCnGeGeZ12Ev
8muF/c1TRp6Srp0ESB5M4ICZq3wajuUMMf8qkdahU7HlNlB3X+VZGjyEbIyEJQSF
ZxOiNqlYHmqHB0LEzeIYdapBvZCPyRePOtWPID3CkcxTsxt0XMQ=
=R9FL
-----END PGP SIGNATURE-----

--w3ywpc4lpncriwvm--
