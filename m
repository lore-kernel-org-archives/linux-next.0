Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3B3E44FD
	for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646934; cv=none; b=TRYGD78bIEaJugwEintwXM6daxuAKFEpirSlIgMnC6hcRMCIx2iiAKniSjrSrKR6Zn0tNZ5uyA7XOkJRNdhzdXqXknaRKWMkfIq5Qgu17C+J+1UNiR9exuR8zOypzUGvkGcgPTB/g3AkLg1Wdp7ORx61rgrJnhFn32lByaSSQpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646934; c=relaxed/simple;
	bh=mB78j5ZOv6Ezj6SK0kxwq+8Uenu8mtUtvQnFzconLr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiarcF27CYZCuR8gefGhdrWl1811HmOw9w4kUQMtA1YNt+12BAJzI2CSU7GLtSqGW2PxSMPp843H3Eb3TrmUtEAUI9MAaj6nQsr2bbs2LJYrdtWvYrABJ7m6hpfYe6m6GQiRlk6Y3zsLDRKSAF3OIj+V8KeL1rvXCROj+A8KCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ck0F4znW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ck0F4znW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1c52d920b8so635654966b.2
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787646930; x=1788251730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=of5Uec3jjr7upxknpPY99XlCkVHmiPSn7WC84fmmgzk=;
        b=Ck0F4znWkuRXFTcXdE2b2wDhv5BunR7uypxznot3tWTV+oSdjxF3s/LIoDLHDDs2un
         0/5VfUb2K5aWWktLA7m5GJ/lm0lZdbUVYYwVoD2RRY5/WH6JljNrU4fJqfDi7pC+2D0c
         +uRlLS2dCVHob4IUWoqlzguhXLtjx4bnWyjjabNPRS06LaDZXm1JmWHRnpOVgmgi+AYf
         P6ufewkeykEcm6K3+tMdWDpK9cPKMU5ApydFbUn11TSEYeKl0mjLnyr/IxHqRG4fSzey
         eOrBfen9ZmXKR6MynKsSLc0Up6fzHvwejK8l884wD4G6tFgrunyhtCaoOk6wCMpnlRWv
         Sp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646930; x=1788251730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=of5Uec3jjr7upxknpPY99XlCkVHmiPSn7WC84fmmgzk=;
        b=eE/d/pIZSQmg+7CjRr/0kRPJNVDKwelOFUZ/fKfJRKwWRzSb7f/mnnJWoOK9+nLUx5
         CNLQGGt5zGHtNRAXMTh8f1JmZ19PGcqtLWgZLbpZ7JuQFOrhb7Il6IunFXng8rB9uqOJ
         seT/K+WmSFFgFcDq8rq13Uv4S6FSZr19ZOFV1HJ+f/CEfYuasjE4Ue6+kmqKkmf5VG7T
         p+fUaM1KFUsIvSnlZNAVfUNsweKXE9pNxOIEn/V+Sl3hz/v/8/n5zMEbNX9LDJhWc3jb
         WPaDZQ/eoxg2RzDEZOmqshl7IVtuMt8tr68faPs/dfFy562l8HjKcDzIPQ9XobutRiUA
         xCrw==
X-Forwarded-Encrypted: i=1; AHgh+RqYLoNd4MJMT4Md0X8eEvVcEUPyqz4/tmRP3hfZl79p+Z4fCSwSsvu64di95GQq+vOvBugdsTZ5wA2r@vger.kernel.org
X-Gm-Message-State: AFuF++lkn+uxacSgQCDkSmnNJEVD6O/HcBJUi/RrwAMu7EBeJjCS6YgF
	a20WNbiFY7WB8oOjjkr5fgp85Iul5D/ALL/+zeQ1tKo16uuukX1h6K96aQyGydGxAuM=
X-Gm-Gg: AR+sD13V6tHLaFwW+KWY94En+zjJQwQk9YYFG4uNGMxMTZNmNfXmGPyAHGqdQdQurqr
	ksafRcZ9g2GQ3XZ6fb1cyHzWfGrpldTClD7dKx7Er5J159xCu2epT9Ei4diEXnCl28stW+wfiEj
	NMwTP3YdmC8PIUNNrCFQAi6yljufJs5Ar94VfmXjN1jOzjrzEB9c7i59L7ZBp8I2W+sEJm2B1EU
	7hcVo282C1bkcMTUXS0K0Vgqnn88f+e/ejaBVGH6egUrAmka1Hc/4WnYqmroMBmHRchSBMwwZSF
	SHzgL3PJcw5fqN6rcMWkvXnRN96t8GXZfu4efu2A8f3PW/Qqsj8UOuYuy0G7DoD8IEN1Db9/W9O
	Sr8YhqcZLSn4AXa4veNONUr9TtMSKMby124maXaEqqwiBF8w3wgtn9JEWnBlPnGc3fAstn+1UHo
	4wgstjgDpx00/ZR4M0tYqzmNQq0VtikhZI4EhuOhFDss0VBT5GBj0FnGnknqZsk1MW7ck4CGzjD
	DYfCkvx6Ah0vKwT54rdCavoF1oOHJYMj62fp9sye9DwRxROQdwxW6jmeVTG
X-Received: by 2002:a17:907:948b:b0:c15:f4bb:e663 with SMTP id a640c23a62f3a-c24e5a50b56mr505005366b.10.1787646924418;
        Tue, 25 Aug 2026 01:35:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904037016a565660d5e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:370:16a5:6566:d5e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24e1adf5c2sm360475766b.28.2026.08.25.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:35:20 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:35:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rtc tree with the origin tree
Message-ID: <ao1TiE4KG4m9xXWr@monoceros>
References: <aow6wPvEaMCIWmY3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sg6tl4quizmpr2m7"
Content-Disposition: inline
In-Reply-To: <aow6wPvEaMCIWmY3@sirena.org.uk>


--sg6tl4quizmpr2m7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: linux-next: manual merge of the rtc tree with the origin tree
MIME-Version: 1.0

On Mon, Aug 24, 2026 at 01:36:16PM +0100, Mark Brown wrote:
> diff --cc drivers/rtc/rtc-rzn1.c
> index 305f10a8a85b6,1e1676a7f3cc9..0000000000000
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@@ -16,6 -18,8 +18,7 @@@
>   #include <linux/init.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
>  -#include <linux/mod_devicetable.h>
> + #include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/rtc.h>

Looks ok and is probably simple enough for Linus to sort out, but
mentioning it in the PR is a good idea.

Thanks for your notification.

Best regards
Uwe

--sg6tl4quizmpr2m7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqNU8UACgkQj4D7WH0S
/k6mCAgAg8ykU4rieI971UmoIvp2A/gwzDJ1me3qkLhjZYPhpWAcZiKDMlfd8A3Y
YsVfM7rLJSrJGzQzwn0geeHdn5pxD+30L1DZ7KyjU/zmv/qDN9JTIHXRDD858doT
OqnU+YL/0uNGPf0thxt3yifAdPjDVB4aT0CiNqCkhH4NwJWNNAAOMt64jlDSm/60
mlkG/7g2z6JmwaQW+ZipJuNoqxYcevjqdLKP5VH6Rl1LNKCMw5fVIFZtKw5JkaY5
ZFbDsjnG2uXbTu/htwMwxdWY2O5rRg5PkHv0BPs6u+7C3qmQzI6+Rcnay/koDYtV
lpRIUKSfoF1A0SSQ0cEpEUIDV6pSPw==
=KJiY
-----END PGP SIGNATURE-----

--sg6tl4quizmpr2m7--
