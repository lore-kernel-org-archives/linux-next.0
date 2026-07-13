Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AAB3016F7
	for <linux-next@vger.kernel.org>; Mon, 13 Jul 2026 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955739; cv=none; b=QAge+ZdFw5Jlj+bmscHU25Zh6Zas1TfvjgDkjK6beZrukc1V3gbmyhBWo/VsXEz338EYwltmfBMHOLi+Vp1lTPYZ+5l7a4fe5Z2zOCuSskJtBQ4dJ/RD9U6Vq6zSKoOy6aJC8AfzKWOAXa2cuxvR/R61eHtJgvitZRxp6Ko4N/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955739; c=relaxed/simple;
	bh=/hCY3H52sp5ZVSf78lSjVRCJcgGTxcgfHBCYbMbUX6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emM46Ph/TJ2c0ikP1P1WzUvYh88uIOw7ln4lg0pT8vGeBVAoVfVjMyploGDYy/CjoZOdwIR8LkLFV0p8iF2obNgvnRe40iT4rVe0rOPFAn5XGm2KhtFiT/kVjBhPdBuJkB/GgLjIKlXnJfzBu/HlyLNIBModOO+u/b00oGAKjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AF5Tob2D; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AF5Tob2D"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475881b9a4bso3279515f8f.3
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2026 08:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783955736; x=1784560536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtL/f8t6NPvAS6gQ8uhvbIDoCCzs9e/+wWkWy4PvZWY=;
        b=AF5Tob2D42nJO/3AvYFJLPTGMkbl7qpZMy78nTjQqr9kIF9a70jTNabi/fFJ5e0VaF
         DqcKL95ghZtLIm4NifBk5n5382fD/+r/K9wuwDG5Lv9+xK57yHmizHHUtTZX5RQMQLQ2
         hlOv06TKbfnePhbY1622Jz/OBhnoIDyBsMyU82nTac2NFQbGFtuxjyc+mNlvYfmd8Z6m
         /NcR6iS93VeDHihSkD6EJB1LfoiipDe5O5cjFUM+5wGUzn/QwxrHQGPPgOc3D+in7Jzy
         OxP1pkjojJ18/EkRtnhve4DHN3EsJRwlUPVwgZDC6GvE6yoxS0hk0BCWm6DwwpulS5hr
         /3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955736; x=1784560536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtL/f8t6NPvAS6gQ8uhvbIDoCCzs9e/+wWkWy4PvZWY=;
        b=HExdj82wWRCSkSPhaeyphiea8+Vf9NnaFPlE4254eveaFHZvnGfCt76aXkcD7qu4Y7
         qcjexI03PZ+ry17qX2iE1k9tumBgnzpik3czg6viPr50ku3TGOY5RFRHEcw1C0m7tKcO
         wv4Poe5w696EfUqbYKfc/rL7h1HD3ChswYdIK4UUJDIewDxztuu3t7iwY+a+JLtW+xr+
         U3rViOPphy4YO3Th2imeoCazyOBlxSIvW/M767H/BNSJ/TAMweNlO2oeviEJNxopTG6C
         yu/qtA3RjdTXhIllOKuh10BqjsQOOMBrjga7SI3vJYs9aMFbQ/Muan1Tq2i1aZYughpT
         j1eg==
X-Forwarded-Encrypted: i=1; AHgh+RpWiL1XFLkPOkmp9LPm+mV0Wje1Tu2VITgQio++BENQ8PFGFxk39Cpcybz/J9SW1yAwuUKtQLq60QEM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjj6J9hUN+bePu/w/Zh440cp3+G/F+wtiTIeVMIdlovyO5lyEY
	A9NZ0gzenp1BZpUyeWElFebmvegQWLTXoMOw0VdfgWUuvWqqeqyXLZHN8TMsguiN01Q=
X-Gm-Gg: AfdE7cliDHhDjaJ75C70MGp03A8ln1XCoe0osEjMPdabOt7LPSnQhUEyI2xLjO4k3f5
	b8n2ElD3xGH9N3h/BekizdCfR+qyjVVMkXoBZv8+RhaQoOukJzkPRnzTTrF1HpS6xNcJXE5YZkM
	IAtQ3slHGt/IcRYDz2ATJ9uNxymG3KLxvj6UjSmWOrbHHT/d+JNbDG1CWguyImcNTzcZuegnnCD
	JPXYUknjcPp7IP9qCWAvNEhfzv6XiwdFmfvilumOAcqnsYz/TOlq9l24bWmrSvkK54ZA9UbbstK
	ZDZtBouBDge53nCSEwOGNbWwPQOk9GO+PDkqjO6fiuW9JvhuqVgp+GMCFxoDb25gt0EbUBowp/e
	Phu49KKxv2pEeIkxIYHvzikLgBTXx58EyM4VLbQXpH8JvnT/2mYVAkGOPkWtqvv/iIGtc34bYj3
	WRwekH4g3ql/kpehzZiHphtVNlBrQ0ZJORb8So2uicrH/6d/9Le5sIX7DY4lGDQT7F8U1pFvnDe
	W5NEx0yDCmTpdk=
X-Received: by 2002:a5d:5d12:0:b0:47d:e0da:fe71 with SMTP id ffacd0b85a97d-47f2dcd1a01mr10475362f8f.7.1783955735985;
        Mon, 13 Jul 2026 08:15:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04916e789240f263e3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:916e:7892:40f2:63e3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635a940sm68849f8f.12.2026.07.13.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:15:35 -0700 (PDT)
Date: Mon, 13 Jul 2026 17:15:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the origin
 tree
Message-ID: <alUA3L41eEuKNI2o@monoceros>
References: <alTxJTV0crJ8DNar@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3updf2tp6sxrutv"
Content-Disposition: inline
In-Reply-To: <alTxJTV0crJ8DNar@sirena.org.uk>


--l3updf2tp6sxrutv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the driver-core tree with the origin
 tree
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 03:07:33PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   include/linux/platform_device.h
>=20
> between commit:
>=20
>   00cd8fc630e06 ("driver core: platform: Include header for struct platfo=
rm_device_id")
>=20
> from the origin tree and commits:
>=20
>   714cfe9e143fe ("driver core: platform: provide platform_device_set_of_n=
ode()")
>   8877c06885ce4 ("driver core: platform: provide platform_device_set_fwno=
de()")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/platform_device.h
> index 8c566f09d04ef,94b8d2b46e913..0000000000000
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@@ -19,6 -18,9 +19,8 @@@
>   struct irq_affinity;
>   struct mfd_cell;
>   struct property_entry;
>  -struct platform_device_id;
> + struct device_node;
> + struct fwnode_handle;
>  =20
>   struct platform_device {
>   	const char	*name;

That looks right, thank you

Best regards
Uwe


--l3updf2tp6sxrutv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpVARQACgkQj4D7WH0S
/k5vwAf/dCiTIPt+Usb8AJ4+7VyjJVLZz5nRjENoxXaBV/j5kgteeRhLTffUp9tp
Byfl+64YU4CtqSE1ssmbrg9DMomO87KqXU9Vq523j1Vau6pK4q9AVTvDlYZlj7/t
ICn/B2F2CbCrTaOwRdTp/1VlNhR8tvRua8XdPgA2HNBsMCYiS8uD3W3PABCOByWo
DfzC9z0FrSAO8d8auz657kX2JpnBOXeTgbickjFDm1TouyRMIwu5IdGGJdQLqEZ0
8S9fItyS20r8d36XaedyRlOvdqSMqSj41c82ScsnLZnQJP9/2/67IJfC/hfBexRF
t1IS1CLdQ9izW9okEyhMB507kSfHSQ==
=TyGK
-----END PGP SIGNATURE-----

--l3updf2tp6sxrutv--
