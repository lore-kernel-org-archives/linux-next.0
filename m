Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BAC3A6EFB
	for <linux-next@vger.kernel.org>; Wed,  4 Mar 2026 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635082; cv=none; b=Pq1UEoHduOujt13Wv6p+OeSKSZPzAhX8aaIJMnv+zzUrkFhcRHO8ZgG+0PQK3tdMZVqqK+Rm4uzavwrEJBpFttLi1pHjuQsmpFR3+fztsAcVPsvrhY9U6nh0IYbILzfOvpZIkwrU9pjsGpAmejbdWuVfLMiTKYjplAkmBTSHu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635082; c=relaxed/simple;
	bh=SPBavIlOJuGgmLzdF/KYwcRkviDTPiwIMqjlJYlICSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvjaGMFFfr1YnQufr1SZsdxg2UaAW6d/zfhIqEUJ6oLzWraYp1JX0a9ArcMCUOK+UF26n443nyunnM/UFppaqugVwxtrsuUaKQhcdS0qYnrwqkNa9hElX9ZTrZ8wNWzZE+50nOn5itUzujcHrXUm+bzNa4Ty6OJBLReDobKEt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NdjKdpoh; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NdjKdpoh"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-389ff6e5885so55320531fa.0
        for <linux-next@vger.kernel.org>; Wed, 04 Mar 2026 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772635079; x=1773239879; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SPBavIlOJuGgmLzdF/KYwcRkviDTPiwIMqjlJYlICSI=;
        b=NdjKdpohTAs3LS2BIVjriOlbiu6Fh/9IMA0FI5FJQArsc++LTyCd2LzFGKYwALECnY
         hJsGjImEtvp0W9FkXXzMtwe+/cu1ExPWlt9ceNYOFrqoH7P/QStIqfylhTCHcbo26p79
         jqS/y/3mNGwhzxYfqxC9L6JcsDWoLx8XLZ030wVqcnetXIN+Cu3fBasQEqLXdSafnxoM
         WFkZ6lbPnaTkdLLDCc7qMAEm0sH94Lnnc2GQeLIlEQH36Do111QRw0wV45cib+/70BEx
         mr1D76ku4QymOVRlmGEosbqPleYUNCxW2rnbCwhj0KKqZ/mVpzXp5Cm2nRIib3RHYswK
         rh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635079; x=1773239879;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPBavIlOJuGgmLzdF/KYwcRkviDTPiwIMqjlJYlICSI=;
        b=pxh4EPwM0sNE4EOiomspcuMNLhSjSRsWqGep7lwyYaEJ1dkF8GpnraeYy3VNK5iZis
         RJiMXN4/JYSuyCb3vBn+ZB7qXdu0k+XYTkKU0zbxD8GJMWkGH8WS2YtNRgepqMsrbLLu
         y4jbN9WeSrnmVFvkFl66Euq/jTVpqEdjDECRE+4OdLb9BH5nb5KVBpl/zZQOrQg+NiXs
         Ik6q3c4Og0PICO/u7OQ1JvahoKKhYplqs4YmnxF5riGzmJSI2GRLwMnRVLsMeinrGyYe
         Lm8uNTWw9wXKhHqG1GqmGDQxpcs4bTp6RckxqZwyl3LqJvM8j7gVpdFH439ESPEsylnP
         UfZA==
X-Forwarded-Encrypted: i=1; AJvYcCVzWF28Q09zm0tII2jaNtHWQspXmjB/m7vN+b7j97zxnac6+wO1N/ochYpOOMU9G+d0Fz7PMsGhyTbm@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHOQ40nQNMyuaARrHyphNFfpphHDnsfFTQz6DsyW4SiAfJgBV
	aa7TY5Ovx60kc9ql7fegDTlUOrrDv7lEYYCA9SWE5XvOul1qEB6wy1aWSrx5+P60UPPQfu3h3O+
	B29Lm
X-Gm-Gg: ATEYQzy3PrJBzMODF9Sn9SHEfxJ/OsNh4KgOEhPHH1zMyrwdU2wsdhqzP/Jf7eY7bqs
	xCY3bSUk/3eBo0JA0n8FiWLtihaQ0AhzVK6Fj9xb3yJTSM5U8q2IzR/AOzQlh3qBwZOLnTZb9AP
	mcQYIkjVGQurWi4q/C5y7CWTMjwl9s47PahWfm7NXT3EJ3weqJP7vCiBOv1Ux7vAy7nCUB3oG5l
	eYDOXW34nB7mvI1bw5FIjl3M3GBjvmvG0krfOa2nLZjn/WkF0eSoMFBFwSHdmdNpA5T1rTJbfUP
	FOFOG0/NnDOi0rknA8icS5Bme5+PY3vuOy6/ABjRLZml43jyH3mGFruhf4pcKqFD8osKZE+LeIw
	tjn1d2dTy9a4IAjETZJfMB5rtl2Gp98HPq6qw4NzDL5DxBHGukkxbOGreV7z0A0FtFUmgeSq6wO
	rANfbwXm/pGs8gjOQe71wl3NjGeQMOfLj8yHoO3sJtuF2YatG/Dc8VPnMw3m05DgtVX16dCxjC4
	9UEM2QslNmxX4z5dRHOVabR9Dne1IXIY7xDTh7P5zdUR1TiAhmhZw==
X-Received: by 2002:a05:651c:1a0e:b0:385:bb35:8e45 with SMTP id 38308e7fff4ca-38a1c396502mr54586441fa.6.1772635078965;
        Wed, 04 Mar 2026 06:37:58 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12356fe34sm1311356e87.90.2026.03.04.06.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 06:37:58 -0800 (PST)
Message-ID: <ad2888d8-bfe5-4023-8345-ddd14f2b7fc8@suse.com>
Date: Wed, 4 Mar 2026 15:37:57 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the xen-tip tree
To: Mark Brown <broonie@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aahBPzflrEJ2FPx0@sirena.org.uk>
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
In-Reply-To: <aahBPzflrEJ2FPx0@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MR3f0SlHc2G7IOdpGbtDawDC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MR3f0SlHc2G7IOdpGbtDawDC
Content-Type: multipart/mixed; boundary="------------spju9nddGZXaQtmFSclTQWb0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mark Brown <broonie@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <ad2888d8-bfe5-4023-8345-ddd14f2b7fc8@suse.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
References: <aahBPzflrEJ2FPx0@sirena.org.uk>
In-Reply-To: <aahBPzflrEJ2FPx0@sirena.org.uk>

--------------spju9nddGZXaQtmFSclTQWb0
Content-Type: multipart/mixed; boundary="------------uhsS8v2VuZHBS4FiEW6X2uyo"

--------------uhsS8v2VuZHBS4FiEW6X2uyo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDMuMjYgMTU6MjcsIE1hcmsgQnJvd24gd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+
IEFmdGVyIG1lcmdpbmcgdGhlIHhlbi10aXAgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1
aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjX3R5cGVzLmg6MzgsDQo+ICAgICAgICAgICAg
ICAgICAgIGZyb20gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZG1fc2VydmljZXNfdHlwZXMuaDozMCwNCj4gICAgICAgICAgICAg
ICAgICAgZnJvbSAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vaW5jbHVkZS9kbV9wcF9pbnRlcmZhY2UuaDoyNiwNCj4gICAgICAgICAgICAgICAgICAg
ZnJvbSAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
Lmg6NTYsDQo+ICAgICAgICAgICAgICAgICAgIGZyb20gL3RtcC9uZXh0L2J1aWxkL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2NydGMuYzoyOToNCj4gL3RtcC9uZXh0
L2J1aWxkL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaHdf
dHlwZXMuaDoyMjE6NjogZXJyb3I6ICdwaXhlbF9mb3JtYXQnIGRlZmluZWQgYXMgd3Jvbmcg
a2luZCBvZiB0YWcNCj4gICAgMjIxIHwgZW51bSBwaXhlbF9mb3JtYXQgew0KPiAgICAgICAg
fCAgICAgIF5+fn5+fn5+fn5+fg0KPiANCj4gQ2F1c2VkIChJIHRoaW5rKSBieSBjb21taXQN
Cj4gDQo+ICAgIDRlMDVhMDhjNmYzZjMgKEFDUEksIHg4Ni9ib290OiBSZW1vdmUge3NldHxn
ZXR9X3Jvb3RfcG9pbnRlcigpIEFDUEkgY2FsbGJhY2tzKQ0KPiANCj4gd2hpY2ggY2hhbmdl
cyB0aGUgaW5jbHVzaW9ucyBhbmQgSSB0aGluayB0cmlnZ2VycyBuYW1lc3BhY2UgY2xhc2hl
cyB3aXRoDQo+IHRoZSB1bm5hbWVzcGFjZWQgcGl4ZWxfZm9ybWF0LiAgSSd2ZSB1c2VkIHRo
ZSB0cmVlIGZyb20gbmV4dC0yMDI2MDMwMw0KPiBpbnN0ZWFkIGJ1dCByZWFsbHkgdGhlIGZp
eCBoZXJlIGlzIHRoYXQgYW1kZ3B1IGFuZCBvdGhlciB0aGluZ3MgZGVmaW5pbmcNCj4gYSBw
aXhlbF9mb3JtYXQgc2hvdWxkIG5hbWVzcGFjZSB0aGluZ3MsIEknbGwgY29uc2lkZXIgaWYg
YSByZXZlcnQgaXMNCj4gbW9yZSBzZW5zaWJsZS4NCg0KRm9yIG5vdyBJIGhhdmUgcmVtb3Zl
ZCA0ZTA1YTA4YzZmM2YzIGZyb20gdGhlIFhlbiB0cmVlLg0KDQoNCkp1ZXJnZW4NCg==
--------------uhsS8v2VuZHBS4FiEW6X2uyo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------uhsS8v2VuZHBS4FiEW6X2uyo--

--------------spju9nddGZXaQtmFSclTQWb0--

--------------MR3f0SlHc2G7IOdpGbtDawDC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmoQ8UFAwAAAAAACgkQsN6d1ii/Ey8j
iwf9EhHkYnpCpah7/uRgLGp3oAC4dlcgZZesNEP3m5ECqYFxJnenRr1suZlRqubQ+2Mz2v1GoIxc
kUwiAVyXVfY7TrGVYMKyxQ+fCRgE/3Rew+dRA4HCsntCjhvhs5tfAGnX79PgW8+MNOFu5PA3ybrX
lycczmMT1aQ4zztc5S23Oo+lTxrzkCzNxNN2mbrUfOxcWkjUdGlX3arhr6b/n/LXFH1+vIYXRPdl
oMQgcnPKTPVsYveeMNXgwpGw8cPvnnlH74L2of/Iqrnzn3pkl+iVVDrIbs/Tuyu3U/H40A7vTAzw
OHb7e+Q3608DDzV7QujMddqPT5k6xrFTp0uIMFxsZw==
=rAvw
-----END PGP SIGNATURE-----

--------------MR3f0SlHc2G7IOdpGbtDawDC--
