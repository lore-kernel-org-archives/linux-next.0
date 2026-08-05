Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912A374A1B
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914312; cv=none; b=O5vRpbG/Ks+Ag2JquBtRnf+mZco3fc/ityM3MZAwQWZ722EGsUBqAOMOGB9dTf0Ci4uITWA2Mp78rZbulA7R7slTYTmw1aBT5Xy7f63e97a/QYBss5AFuoWfIsXv3nyw4zkhNuHm6BLdEhRdkZFE9jCAzPhSafyulBLVeLgYbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914312; c=relaxed/simple;
	bh=esFyuAFubsfqFMhJEZXWNUGl8u3Au7VYmA42/rCClR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnTKkLY38xBmJOWk2tE//3YPaCaCVh6xStWRkNLef27RdCiPBfgWa7VAvsr7YvXzJeWHrFAlqNCA6RnK7GPWeIfGCWL8am1jjTVUZYwPWZ/Mf5qNbDj2hvMC/vWL5H9zCHVcdeP+F/7IUKyErG84j4C+D277TtQYML2HtNp9GqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ov8LT8YS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ov8LT8YS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15e2dab83eso118334566b.1
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 00:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785914309; x=1786519109; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=esFyuAFubsfqFMhJEZXWNUGl8u3Au7VYmA42/rCClR8=;
        b=Ov8LT8YSL9IhuvRT9Tr/rBFWo8BdJ/vrhAFfMDG9EYLtq1YCQaUNd0p3cOkHvNOKZd
         7iVVbpoLT/62wlIb7onGcpgKypQnucWA4/pxwOgy2zQT3WMfAygqTu9OaS7LCUOoOLPh
         r2MMXuwEWGV9ezOVMqhWvNfriOmNcMMG+ZiiT018KJO8pJJfObpMX4epegi1H3Uoo6OB
         yYNqbCZPTpYQz4Q1KLrsYc8eS+RtTz5FGT5ATN6+KBD3P3UkQasEE7oSOql5gVbqGaQe
         ju4+/QvAB6DI65yqHUIfkWxAkMfZ9evDy9+XtOk9bleAbXtRzTYT4b6skWNc2q/BjHGs
         VKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914309; x=1786519109;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esFyuAFubsfqFMhJEZXWNUGl8u3Au7VYmA42/rCClR8=;
        b=VG305CMS9E9nnL7GI8DPtqw2ZM2U9SLI9L8rGE6FPWsURnlap+4JVLSBihTz8Ju/yw
         evNm7ivCL+yGIp3ZITVA5DKU3lu0p47ViK8kaGBK+BD7eWhIckIN/AUhaTbNfohnEj+H
         +Nzf3a9AsMsDd8rB76CWeNzAOCSg+r19gMc/rbq0Ki8V0PqUDWa2BKDKIRMg7zubWLsV
         Q5PP0MmZuiV4mE7jRLou/hbC5/dIpQxouVzziHLFq3Zh4WMG3grIvlfqI1xM/FOQkTeW
         oBzk1Ka5cdlKhszsZnIqMuAUsgACmALrF6AGje9vS65P1DpPQQ+ej6JcwD4bNUxM1aZD
         Dd2g==
X-Forwarded-Encrypted: i=1; AHgh+RqGUNjsAtKkB+Iag9uHOwWJMgme+5QLJdxwayJzPPqDn2Js6HuOL4LA//j422sd7ry0wkQBBn9r3eoA@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXQWvLGdYqWWZ1ny555lCbvM6IfKxrWto+wOBVt56JN1T7Lvu
	4+PMfeTKoTNYsZ6YlF9bXKWyJkyhrPl38vBrkD7KCe0tk9c+0jhqDg6Mxw+7K3cGJqM=
X-Gm-Gg: AR+sD12v5+iS1iRLR+07xGARDDklRNuIgqP4jbSo+yVMw0KOUmfr5Vx0jJO+v1a9HWU
	jJ+ErfBGJ7WHKPASlL1Gp7UVU1JZU7ZYy5DDgaiJ7mexIO1AkTOKhvqxrqSqe1xctIBy00CT/Lw
	ypgiN8LjJiDgg11EQR88ASgjJfcCY/01LkUr4Eml8V0StrSpx6KCv43Y9q4HE8utnYCekcCCiRs
	KY2jKSg9AzGBsPovCpIe1N803WYzlxZyQn4bZxpy70EqMPb2zno2Df1pp1GEpHkZgeDKoG7tupe
	M7nMRbTHBfzCXLk1P0EffIFDVMFCmTKq6FoXQjB02IpKjzQNjC5y0BqCP0OeypeIS0Fgvbz5Dai
	UHnzoPKH66VkEMK86KnPAyV2qwERt/H6ovDX4Hydw5mtnhbYuuNEgV1qlb6keRWZKp+DwS0zJJl
	QBPfvGtCyqV5JOsCvdH2j4L5hzkkpZdmytqVVGBATRAvYBjFQOlyMm6jcAlsRjbZECwq5jYDAzQ
	KaWvs3TjreyAIJ1ab/mSOPVUu+nziEmOR5O+LVaXxEIxbSAINOk+96GLBNFQ8VQSiaSULy43r0h
	7oV/9LQUklVXZR5hGj5Lxrk3Jg==
X-Received: by 2002:a17:906:eec4:b0:c1c:2ee9:5e6d with SMTP id a640c23a62f3a-c2039c39717mr221970566b.17.1785914308967;
        Wed, 05 Aug 2026 00:18:28 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm83701266b.28.2026.08.05.00.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:18:28 -0700 (PDT)
Message-ID: <affa78c9-4c19-460d-89a1-0e84cada1c52@suse.com>
Date: Wed, 5 Aug 2026 09:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the xen-tip tree
To: Mark Brown <broonie@kernel.org>, Val Packett
 <val@invisiblethingslab.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <anITNOG1qicdE-TI@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <anITNOG1qicdE-TI@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L7qBEoEZ6lPklBnqZkcGdVog"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L7qBEoEZ6lPklBnqZkcGdVog
Content-Type: multipart/mixed; boundary="------------ZcgnOy51QMT7gJN76OXrlRf3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mark Brown <broonie@kernel.org>, Val Packett
 <val@invisiblethingslab.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <affa78c9-4c19-460d-89a1-0e84cada1c52@suse.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
References: <anITNOG1qicdE-TI@sirena.org.uk>
In-Reply-To: <anITNOG1qicdE-TI@sirena.org.uk>

--------------ZcgnOy51QMT7gJN76OXrlRf3
Content-Type: multipart/mixed; boundary="------------qchc6mwxCU6mnmvcmLbmokzs"

--------------qchc6mwxCU6mnmvcmLbmokzs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjYgMTg6MjgsIE1hcmsgQnJvd24gd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+
IEFmdGVyIG1lcmdpbmcgdGhlIHhlbi10aXAgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1
aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4g
RVJST1I6IG1vZHBvc3Q6ICJpbml0X21tIiBbZHJpdmVycy94ZW4veGVuLXByaXZjbWQua29d
IHVuZGVmaW5lZCENCj4gDQo+IENhdXNlZCBieSBjb21taXQNCj4gDQo+ICAgIDY0ZDI2ZmIy
YWQxZjIgKHhlbjogcHJpdmNtZDogZml4IGlvZXZlbnRmZCBjcmFzaCB1bmRlciBQViBkb21h
aW4pDQo+IA0KPiBJIGhhdmUgdXNlZCB0aGUgdHJlZSBmcm9tIG5leHQtMjAyNjA4MDMgaW5z
dGVhZC4NCg0KSSBoYXZlIGRyb3BwZWQgdGhlIG9mZmVuZGluZyBwYXRjaCBmcm9tIHRoZSB4
ZW4tdGlwIHRyZWUuDQoNCg0KSnVlcmdlbg0K
--------------qchc6mwxCU6mnmvcmLbmokzs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qchc6mwxCU6mnmvcmLbmokzs--

--------------ZcgnOy51QMT7gJN76OXrlRf3--

--------------L7qBEoEZ6lPklBnqZkcGdVog
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpy48MFAwAAAAAACgkQsN6d1ii/Ey9R
7wf9EnPpdhTlTSVTBo1XfcO3WLaKMCfAgydfl0DD0cEZZj9aFaRzq+tF8ImI6z0Fv6wjjacd/uX/
46sX/I8Pe7iLweHDhkW1F5/0TFutOTy8Mi2zQMQ0geK7F8gVHV8Hl/jBpZ2boYlqlMiU0nUzqOYb
YKS9aoqJ3HtholZxj4BoOcigsqojd7912AZ+pEiiEF5OVTyk/QfyunOvXmk3qQ/KjqAdwezEKU3Y
sy9iQABE8SZSwXcQQSn/0Vw4DjlzUk1KwpgMou/VhGKY0Q8Dd3OZdnswMMlggZtjrP6uxnzjaR+w
01iC1kheI/gztx4Hhf6wHFB4dS0888S66aR0QSjw2Q==
=NrhC
-----END PGP SIGNATURE-----

--------------L7qBEoEZ6lPklBnqZkcGdVog--
