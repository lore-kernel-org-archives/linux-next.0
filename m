Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124943C05B
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533552; cv=none; b=pztgR257b50gT8zl72CXHs+BxveBYfznZA8YPyBIxPPHY1UlZcY0yzv7IB6DJXU909nXct5U6UaFDHSvJjisONSVW/gYMeF7ka2nhgSqdOzG5OfDhndA2/+yux9g3gYEN7A3rt7Dcihg/6HpesMem3rOIGZg6kXMRpzjB8rRcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533552; c=relaxed/simple;
	bh=Zu06VORGd60eC5cvXuXkiAljsTtoYdTtZHZBSaSEP/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkM09TLHXx1snEReqA0uIiW6NgQ3xy6jfOJpKqZky5y1VvhiHeRJQOF7PP74s5HupuvkTmKgEWw7Pr2MPbI/MQR4teiA0qEcyzCjNN3ZPH7RoBjFtGPU9/7id0NlruT+RP43wFRuFA6Rb1Fh4y+ho7DnKief08ECBQA4Zxm7Yi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Zs1opX3K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Zs1opX3K"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7027ca11so509179f8f.3
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786533548; x=1787138348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zs2Hm8JVtmV7cUaMS0qqZCPK78yy/iCq/DyzoPGqmjY=;
        b=Zs1opX3KDIwS3ZJX2QHeVVFl6N0vFbK8WVlfq+ipmjboWrVIWcS9Sb28lc86b6BL10
         v1mNpLVpcQR59wvaEgSCedOt0ZNqs45dAfpMyrkSNpWNp44Mv71g2P4Vy/n2eU1LwSR6
         o+uJs/cDLA+xX4d8dHK6Esah51E8IiLidEheVlkQHWj0pCet829j/LpjmcbtMjDTCVId
         y2taVZIfBAM08Qci1M35PnO5sRynwSWnIRfTP0RuNE72mdUGuSUvjm/2te9kd29xe48q
         e804SU5r/0DVc8dHxFqTXTfnNAYKKUNbKXYkeWJQ5nP7quLn8iFVYyfJb166BEKbAa9F
         Awog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533548; x=1787138348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zs2Hm8JVtmV7cUaMS0qqZCPK78yy/iCq/DyzoPGqmjY=;
        b=k8sKJrkB+b5cUkytJur2CAKx2Bi0pqL7axtlCK3nL4NO9u/dzYSAtG7hqsZQcK3vVL
         gkjpQ1PeWMbQmi1BaYVBT6mVVbhUI7Gr1mfZ8eipf24Ottxn20iSIk82rN2t0RrWWOaN
         gbEYhjrAxB7lxAAvDRVTSCGCP3LcVj4Pf8K8OOoSGndn+e6HY6ALXDbG+Sy41n4vtBDA
         mZZQm5m1TwE0b8nA+sUZnWfaq1lmVz1uLp7jTPb5vxhIXexiIWY9YCeUxYoryqPajHZ3
         ffOWD4SWd/2UxOwn/x6tePji9DbxpM7eCks2DA7wDzIgRIGItGWczLcmpKUD9NLaFvCx
         Hqkw==
X-Forwarded-Encrypted: i=1; AHgh+RqLYO+hhGiGRrW15TkkYDT/gHeiCCkn7wBriucAE0i+IiIIFAyOWlx+oCItGfnPVwfOr3v0VG2y+nYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CyYV7dQYRbP/FIfjlSwX8F73c5gCgm1u4VDwW4y/19Dz8BBd
	GbcH1BtvEBEsC5WRZtik2J4xj7bWpwJ0KK4O84BdzYISBpHOOqpA/UVBgQm2dvWZx6A=
X-Gm-Gg: AR+sD10CmNv2pOiCR9yQdat76paWqC2GtyWOWBX/z+VPH/ZJweKbHBbo9Wb887OKPmM
	DYfuk8INurxbJzlsurEh48cKTFfnugjX1om7Ba8euRiGUhjhspiHWtONQ4xxoMgBMlFu+juegFI
	HzkABCw5LJOEP1JxJAYufJ94NbS1Q1/KPwDUFPoVd45h3wIbkCB6h1/jIuYvAyJmBNrBKypkhGO
	3yknQ5NLADgldx9RWqWWLyIPN1BgI/+glWcJcCAbCYkcI4JBucXn+qg3fP3HE8Uz1mK2JzMKloI
	/ik/UmnFOrc1XQ0koEkhRHpgWqEPWLWr885r8Jdt7OvyUvr+CVQc8CN4mTn+75eKXXMkY7+K9GM
	ywGKBeOOTCl+9WJBXnkJG4tfY4A2URs/WRh5QQ3rCCM0zpW8PCc4cMNju75CGzTbf/FExxZ4XGT
	3YvdsPtRGyM09uVtDYUX0nGF4ScsCeEPjkF7p469Z8SDEXxLJ8lSAwOzu1N8HFDceooq/5hLsZv
	qs7C2U6HRTtPzcgW8nJtYKP4uCf0MzbRzoRvDHnmb8l39aKSK6sXSe9RqSKWA==
X-Received: by 2002:a05:6000:4a0b:b0:47f:9759:7f0e with SMTP id ffacd0b85a97d-48152c55ed3mr5806022f8f.7.1786533548090;
        Wed, 12 Aug 2026 04:19:08 -0700 (PDT)
Received: from localhost (p200300f65f017104d1b8d865063c5703.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d1b8:d865:63c:5703])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48150bf5f0esm6308468f8f.4.2026.08.12.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:19:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:19:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <anxTFWS4KAMqGNGT@monoceros>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26nzh2zlm5zbxdqi"
Content-Disposition: inline
In-Reply-To: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>


--26nzh2zlm5zbxdqi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
MIME-Version: 1.0

Hello Mark,

On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> Any other ideas?

One thing I recently wondered is if it would make sense to not merge one
tree after another into the same tree, but first create pairs, then
merge two pairs, ...

So the resulting history doesn't look like:

*   4c0d3bb911f5 Merge branch 'E' into HEAD
|\
| * 43c281fce114 E
* |   13879e35a4ac Merge branch 'D' into HEAD
|\ \
| * | fc44516d50b1 D
| |/
* |   7264b63a7026 Merge branch 'C' into HEAD
|\ \
| * | 16f2802060cb C
| |/
* |   5928d0287cf0 Merge branch 'B' into HEAD
|\ \
| * | 793fdef4e4e3 B
| |/
|/
* 1e7199adfd77 base

but:

*   53dad0ca9b44 (HEAD) Merge branch 'B+C' into 'D+E'
|\
| *   54d327c589e7 Merge branch 'E' into 'D'
| |\
| | * 43c281fce114 E
| * | fc44516d50b1 D
| |/
* |   e75826f69561 Merge branch 'C' into 'B'
|\ \
| * | 16f2802060cb C
| |/
* / 793fdef4e4e3 B
|/
* 1e7199adfd77 base

.

The advantage is that if commit B breaks something there are less
intermediate trees that don't contain B and you can still test on e.g.
D+E.

I'm not convinced the advantages outweight the additional effort, but
IMHO this is a bit similar to the request by the filesystem guys to have
a tree with only filesystem changes.

So this is just an idea that might be worth to be thought about by more
than just me.

Best regards
Uwe


--26nzh2zlm5zbxdqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8VqYACgkQj4D7WH0S
/k74rQf/XATSq0OIpLM9cJzDG+3OZ012nb5lNjJ/DnvWKWXHIaoS/pZGOvtoFWtE
h1SgImA5a334T0E0xoWIkHP1hDDoCRPrWm2R9ZBA4AV4uGg0TDJEPIL6wybfs+kg
ShLAHKdg3ul2CwJ09vF/qiRwR/UnQh3tWdfz+C60a/HU9fAtRy2oObu3J8O8aXIK
yKFsbi6JvAImAa1xfWFVR8Io1OlFr5o3YHrkVfERNHZIsGnOGOKptwWgUa+gCD1+
AOzlHNdTx+Jk7y9GIqDcD3sZyOQ/JK9DVWcv/qPd5uy0PmxnEBTTyywOyNpxeKHZ
YoxohZNYZb6dk1ky4ax1NUlVZAsCJQ==
=FZxn
-----END PGP SIGNATURE-----

--26nzh2zlm5zbxdqi--
