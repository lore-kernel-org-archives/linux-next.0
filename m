Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBF33120A
	for <linux-next@vger.kernel.org>; Wed,  1 Jul 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917904; cv=none; b=UGZ5tUTb5oQu0KjJVayWtKFvgTSM1+jmQB4OVziXUp0zcyEkuTNXvIAM7Q01V9zx22KDEqZDwbGmz/yqGYoL6PLVU/BisqtanQLTtTXGk4BBxKZobENFTOoc1mN04PQkUiU1UCnKtA2tyUdRUgqI6lYIOFRI1l6tnsB+4qB4Nvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917904; c=relaxed/simple;
	bh=ZtUWCL8lfIV2ljqvjNUMKcFL8sk6Y7RwgRMnNLX95aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUy8Fs2B8sDj3hIjhrn/NefSRhNzX7/bqxNAOO+XT5EK3/39brYdVwmo7Bb6dBGtfKh5Unjj1yHtM5xHPlEiH2DXAibVhr65K6PXKaBID6g2hoqbgimwtEfu4q7ShCuFcRIpmGkh/lUPvG8x+57bStGIYUXJOoeTOrW9QFsHI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NF1M3koo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NF1M3koo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b7612475so6383215e9.3
        for <linux-next@vger.kernel.org>; Wed, 01 Jul 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782917899; x=1783522699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C/xwbuOxqJ/fXzCZ2Re77mlIFz/wcbLe+ceA9Bo0lKQ=;
        b=NF1M3koojPCntW5NgjO6PFNfZkNS7h3fGenWhqEG9e0Kzkg7Hq4Oxqy3u8qbTXH1gA
         yyYj16DoneUIbnJPrcQrgg/+S87aKsUFz658xrHgLl9hmfIlBxT2ySl2wX+lKbvUB8tm
         mcikEIagQ0/GJ6S9bd0XrJBxpZ17WZD7N5fO5wSYQT7MkiZBH072g5oRS6bcNhRqX1zf
         poIjjeW0LW4YTIeOEZOG6Lzwb5HknpTAm093wuNOAIa35yJ7iJO2q3COUy8zhb91TyLI
         sP083mTgwGPu5LAfBbEQ/3TBKk9+8DDjOtOZ7L3mEn5YVqy9AqDfO/cngx3CvXxLpF/t
         vPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917899; x=1783522699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/xwbuOxqJ/fXzCZ2Re77mlIFz/wcbLe+ceA9Bo0lKQ=;
        b=s3KC+uZZIBbIsplBG67qBJqkcuCljirQoP8+PgD/QJtkWpn2eqZKLbJDPLwQpC++eq
         Ee54bkZiSYuY5II5P4Som54yA1OR1YzP5v5uKyZ3tR0MapD8Cgy8uzqA/1J816ZE4eRV
         05rzxC1BWOraTl6wVXQv91r8eZ2GmN10eOhX2jxPskN18phDHKGcAr0nvV7jDfUV/t/N
         ysXLpQce27gVJ/ZYm2DPmhyarOmqowsUWE5Ftl//NS0WMRQDFoFrbIuWn31IXfCEPk1g
         +l9pOIbjuMSCKIPiI8OYE4OBHN35zkZqeG/f0ANtVgx6mCQE8e20zd74dnvCiWxep3l3
         3FeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6w5KgN6USyV5Y2bxNuSnmIa0NqITdBHr6JDuBR3N8ULysgjwhTTixIO2dkUBBXNMO0KwhXNJVvM33@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4cYiAvZG0KJoWiF+iN3YRLrz27+kkdS//nr3sg+snd5KyOvM
	SSB2aW9hXre13MLDavjcduSvCraGbYKuiZYNqOjzqgTPB+sphKKdydR17fSaczf0LRg=
X-Gm-Gg: AfdE7ckOChvulKhx56IPY5avH4sFsYmpTFqQ7joU+OwCKF+19HxTy6UShH1wGYoCuHG
	sv+iky8F6SIVVSYwv5C27pffFt6GcigZ/UdSjnWpngePw+xTOBlCtjo3E0WLwiepD8fAdVNXwzh
	j9EcN+GP/74sj1yHfeZwGDDRzUjSc6jUBM0WKm6BYlU3e8aSrPfJH3uGAEvnNm+DZ5pbBEneNhL
	82j+MwMaEycFxeu7Zg472pTUwULe8KxxbW0Ct8Kj2PjkiOTgarYZ/5F0h5vQFekFcY08FHZ3PwW
	r8E8aulXb9eiXn/pojRnzq1p+O5a18EJUe9qnJ4qu6pj7cArI9336t26QSwF891YRO8OcztllqK
	CxrGy8mNp0QbnAnnqjUFKhIBcKibeokt2UAZtWxHPOlXU3hROwq8Wf77LCGLoAaLpnX4gUDmLVc
	14OAHBJfJOWX7qB5Yknl8moHXp3n8Rp2M7/oRqEM8q9dWEa/LCvJzImJvtbDEyJqfVFtP6FO5RS
	xw=
X-Received: by 2002:a05:600c:3489:b0:492:40df:d49c with SMTP id 5b1f17b1804b1-493c2b9063dmr32380215e9.23.1782917899164;
        Wed, 01 Jul 2026 07:58:19 -0700 (PDT)
Received: from localhost (p200300f65f47db04834e9548038bf713.dip0.t-ipconnect.de. [2003:f6:5f47:db04:834e:9548:38b:f713])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c0e92687sm46459755e9.0.2026.07.01.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:58:18 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:58:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Viacheslav Bocharov <v@baodeep.com>
Subject: Re: linux-next: manual merge of the device-id tree with the gpio tree
Message-ID: <akUqc1sq7BBoazki@monoceros>
References: <akUlscmgGk8TLzgN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ephwtmfzdbnaov6j"
Content-Disposition: inline
In-Reply-To: <akUlscmgGk8TLzgN@sirena.org.uk>


--ephwtmfzdbnaov6j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the device-id tree with the gpio tree
MIME-Version: 1.0

Hello Mark, hello Bartosz,

On Wed, Jul 01, 2026 at 03:35:29PM +0100, Mark Brown wrote:
> Today's linux-next merge of the device-id tree got a conflict in:
>=20
>   drivers/gpio/gpio-shared-proxy.c
>=20
> between commit:
>=20
>   163ba8782d521 ("Replace <linux/mod_devicetable.h> by more specific <lin=
ux/device-id/*.h> (c files)")
>=20
> from the device-id tree and commit:
>=20
>   efecde8a254d1 ("gpio: shared-proxy: always serialize with a sleeping mu=
tex")
>=20
> from the device-id tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpio/gpio-shared-proxy.c
> index 10ca2ef77ef34,d3625b8d0ced2..0000000000000
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@@ -9,10 -9,7 +9,9 @@@
>   #include <linux/err.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
>  +#include <linux/lockdep.h>
> - #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>  +#include <linux/mutex.h>
>   #include <linux/string_choices.h>
>   #include <linux/types.h>

thanks to Mark for the notification, the merge resolution looks right.

Bartosz, I intend to send the changes that are currently in the
device-id branch to Linus for 7.2-rc2. So it's probably on you to notify
Linus about the merge conflict. (Or you rebase on 7.2-rc2 until then.)

Best regards
Uwe

--ephwtmfzdbnaov6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpFKwYACgkQj4D7WH0S
/k6LOQf9FVs1QWiWN8ORrfiz7jIU3F6NfsFrCaI+Hf0wGPpBj0rRqHoonxwysEe4
IrtNlqqYUGX9G7WZ376vO34jWj23Vuw3/rQWeNG97jtnOdDxyZB09dkgMJ/Ni0tE
0geKuZ89u5/+RmGmi+7ciXmc7IWBOQM++AHR0B26xyi86cn7hJcsM8B7FqoLyIoi
iOqlg1+XQOUPU4R7s/moyn7X2PlsonkWJ3I2QKU3u4XPe3AkknZEWdRW9R640r5U
VtTibIUSCenCFlZTC6ZZTSE9nWcgWFulXLhYBWmmv3aaD52lOz4fODGvXuu4RCLw
n5fvnTdJxEIVDdT7GEhMRIuvJqPdKA==
=nu4n
-----END PGP SIGNATURE-----

--ephwtmfzdbnaov6j--
