Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603985;
	b=D33r+Kgb2d147oMUi+oshK5TFJP7nk3n75TesT6sSobM31Hqv/1A4KP7Lu/FI7gO7p7n
	 jQvgQ0xrwFBgjXqrln8SLQykIRcnxNQ37qTaEc+ZyRwpqIHBvMLykkzwYeZd5dsrhCLJ1
	 VnNHvBFygNjP5eeJFDOIDJo8UP7k/Di0uUGnP4oNiEG5AaRjIQBqIY+YaD0Yxujj3t1hJ
	 RgG5uv3JTVhgIyngA0mKBu1KXo8MB4FoZDN6wnxwvUagRL5hPAy8sQAOno12TvDPLx9Xx
	 NarKRiBLyuEkMBqPz2mhb/RmlmcRaGgk6WoIhaaA12uY6Q6KWNnUWoRnY9sHIS62E5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
	b=dXTlvdQKBy5IRK/lsrydZh+7CkEqbrQlBv8iwaUYXYgPFhnrKct0sLzR5GvaJDnlm4PM
	 VPluok6jOrR7KOESvWNlKLGkVJmdqr/oES3PJayXviiyEXIHUvMNXC/CHk3yRNJFf2QvY
	 PNMF4UusSRZpJl6zHlsniMPTPDYHuMaAmYn6MGDO858lXEIZlzWMNCO0OUPNKE78ZakSy
	 IxSMFnN6VlDBtRKkjpm6RVI8fwy3AH3nrzKAIIqML3/j4LlnR/YGBVXmCJSr1JRBvjKrJ
	 B30GphU1zUwDtfH1onClEC54R6AESpWRTZwGZ2GxVNfAFXIv7NP5bBiyQ1Wi6Xjjx0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZQLLNSep;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851C606A326
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 10:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7851C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZQLLNSep
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so4304105e9.2
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795603983; x=1796208783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
        b=ZQLLNSepQaoHarrnqWeyG4f8VwH9MS+htiIaGhKRruFOrQbKn+J9w/l08zzFlA5J5c
         umSjq/J9LJyNcElsTl0fwemLQy5VpuESexyNF7A+r8IyufkqFyWYa8R/6aOM5wQ8nQEd
         qyi6yBtbjHxdkT3++ADg85sE3dTkBryDS7/uruqwp7VlLMuMk/PhLksXBqm88a3484XP
         Z02GhcPzwGG5XoLCIxR2rjn7pdeoq45tX+Fb78WOZpyT9iOjH9a0cNp+jcDDdqNvfKq/
         MHPaESzBn79lc/KQpTvzeq7MAF4+5FydeFO15G5Ei7yYiOhiMI+MEneGwF8ANdHRPoN7
         FZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603983; x=1796208783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtyqZEMexnqUKbDqv2TlW/7VEDcPuxK4TtntSukqHfg=;
        b=J5ptgD+bMNOtalGnrtkjFDk2gi4UILUaWVaRcjIODVfuX6LAdvm/78G8U55ZzUWE0/
         O4RZWz/xBI44o4aUSVY6S02/VrCvbZ3764/PclvpdzRADgu8lJLIZePP7NghNjLSguNj
         +TgZplSc/GDyZAjgkoZj/wEWuoMs8ePddJ4QNqGgtTz5G3IpuI3twcy050PpKNgVwy0f
         qvK+JzftlL4Oclm2RcTM2YxXThESGYVgzI3Az8BHRIvy3wdsO7J2SZdMf7BeLe6f+mc8
         9O4VaRvnEh2kZS1S36i5WbToWDe3W/tBQgTdxMIaqLsnzHgGqvfInMyQnDCM3BxJ3q6u
         ZkDg==
X-Forwarded-Encrypted: i=1; AL+hErHNLGcOGo7bmbESLrY7fYlyzO/LU3jqCPnGvn0JNbg4Bq/XInpqgEVeJWj+dHHyDNu633CWlDNze3jx@vger.kernel.org
X-Gm-Message-State: APuU4Z9oTJxcO3QLG4pY5yxVJZRlx5wx/9DYtm+GcDmj63lhizAsynYL
	BiPTwk2cXA4X3rmSXo4jlW14txEQM9iE7LOuIyzEF8T6o+bKn+hAv/jf/ib17FBj6B0=
X-Gm-Gg: AZFdTZfuIxSX9LBnwnbIpqF8OKqQZqf1qhM2/ehWugIRINS8hG5ykWoywDwDuJ3DR60
	6rDdABu6IKSaaGaYg7YGVrvl6IXQwp0fhD4uw346vECiUyD931d0TV9y9mibmmPma1p3jp8xuYW
	MWf2g2cfDjKN7ezW4Rm+yZD5miKMXFnI1/0BMCwzSjW4+RDlZuDZ/doxOHKMZtku+L27/XucYJN
	68pnR1xLPZ8UhDrOngyuEr4vnjkjZvpSvk2eROSjbUUfy6qiWBnCAUTms6rgHzTurdTTrIGZcye
	aK5yibggnonaTosk+LypCYi6FVx1q7YY5QL0lJINJ42kc2vwTayhUIashq6ND+cEHeXMGiZ8Mdj
	5nhwFqcTvKeFAtLtcBiPKO5VW11TbhIzA/XQ3XyDAt2tcox6FcZUrciC39J/Fjjdnc3J3UOqX02
	LEYqgb2yyZNkQ2O2ARnsVT+yWudOnv+I2QbiZz3yvlcLIGNVFMPzlXG8tEBUHzgJH2ZXa1cZk+s
	ACNGF087YlZ/7Nds8Vb6OX+JU/XOghVM0VP6cetzHgz/y5uf7kJ8L6NFn47taMH6swbCXA/SE9P
	0RjqzE/ZK7m1Rd9P7Tt/Py13fSOcOa0x4pONOfVoFNva0At23sd2N04jF2ONGyPd6jb1Jm5b0Z3
	H4WME2pOYCgdzqOdk
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr329616615e9.13.1795603982845;
        Wed, 25 Nov 2026 02:53:02 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853a12acsm539176075e9.8.2026.11.25.02.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:53:02 -0800 (PST)
Date: Wed, 25 Nov 2026 11:53:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Magnus Lindholm <linmag7@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-next@vger.kernel.org, 
	netdev@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
Message-ID: <awa6Owm3eDW3EitJ@monoceros>
References: <20261115103809.1288167-1-linmag7@gmail.com>
 <20261115103809.1288167-3-linmag7@gmail.com>
 <awVzJMLVw4wUSqky@monoceros>
 <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com>
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
	protocol="application/pgp-signature"; boundary="6sn276mtbb7rvtiq"
Content-Disposition: inline
In-Reply-To: <3467269e-9929-4c9f-bc19-847976f49527@samsung.com>


--6sn276mtbb7rvtiq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
MIME-Version: 1.0

Hello,

On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> Hi Magnus,
>=20
> On 25.11.2026 00:22, Magnus Lindholm wrote:
> > Thanks for catching this and identifying the interacting commits.
> >
> > I reproduced the error on next-20261123. In
> > arch/alpha/kernel/pci_iommu.c, I changed:
> >
> > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp);
> >
> > to:
> >
> > page =3D (gfp & GFP_DMA) ? NULL :
> > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> >
> > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > with CMA enabled also passed, as did an object build with CMA disabled.
> > The full allmodconfig build hit an unrelated cgroup sample error
> > involving PATH_MAX and LINE_MAX.
> >
> > I'd prefer to keep the Alpha tree independent of the DMA series.

That's up to you, but in my eyes merging in the immutable branch
provided by Jakub into your tree (or rebasing on top of it as suggested
by Marek) is really the easiest option. That way you don't have to wait
for the change to hit Linus' tree and there is no further need for
coordination or others paying attention to not create non-bisectable
commit graphs.

However looking at the immutable branch I see it contains both the dma
API change and then separately various adaptions to ethernet drivers.
IMHO the immutable branch should only contain the API changes (that is
the commits up to 31f7e12d621b) to reduce the amount of possible
conflict.

Best regards
Uwe

--6sn276mtbb7rvtiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGvgoACgkQj4D7WH0S
/k7oNAgAknak/QZHg7BqHZFzHCe4qtzYco0MHY20TLpuveFkHfRuLa9UVG2bG0Ww
LQZfbq0hnFip66k6fjmWJ+mGt0QyF7sJj/DpkCtXlI6aQtnnm3D3slJhpH/bWjue
fk1SdxjYh64pzlg1UF9rEJri73sW9fln2Gz2EK1iHllG2Z1XRGwb4bBzh6WpzAxc
AuLAWN7R4PJvFLQ+kNkR4YocW5+EV0RnYb7/i7Fb9ABP1MxCxi+4OM8+uD8MGuGZ
OFggCxgES6vXm2Ostds9EY3vRvG+zs6/ZpyofM5BxVfPInkgG1teIzoXDpivIgkA
C+dJzsR+ixI93VaJu1B++KrDBjHhlw==
=UmCO
-----END PGP SIGNATURE-----

--6sn276mtbb7rvtiq--
