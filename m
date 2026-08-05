Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368F30E838
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 05:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785908005; cv=none; b=m60ls8lHXCFPRnR/QMvNHZKfJnlpPYZrnxH+qmvmqwiTIEEdEme9sMFwcYDonN+Yaot4whhMU9To/izjZrYUnQpvZXWpYO9Niy4pPRKwx9wznD9q5P7Ul46NIzj9r2w50fcNWWxSOe9Kyi36qeNyLSUJd2/WXUUiFJAeV7ItaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785908005; c=relaxed/simple;
	bh=tKWy2di21eitj6RpqSuJfccPk2t+roA1WmKtrBhIFN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyHEGIDaFZd4fg8Bp7TZi3+1TvTJLUo5BP53MLKu4mPHEGBVPGa0PjJ8slk2WqSozRwcO89bEJ/LyttoBw3Pfkqib68ClJv0dOUHlvHMPE6ARo1CAz/R4/MshxJiICsbAE7U2kK025xk6z+waLEuVDk1q3S+VPPIzKvbsMTgISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AGe0Bqo2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AGe0Bqo2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2022323c37so91431466b.0
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 22:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785908003; x=1786512803; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tKWy2di21eitj6RpqSuJfccPk2t+roA1WmKtrBhIFN0=;
        b=AGe0Bqo2BVZkvkvn+4r1etQ0zsChh1nEAaQttUUyrBhkGLoJwCW7BvtyllK9mFxonq
         poIO6i0poRU7PVBrQxNuMHcHXP2XJR3ihLhHoV9ttXWgdmN701ak01oUOQwBpccPdOYO
         2sWvnOkrv1S+Tl85YalPq7gTUaNoheL79RRIXw78H/X/zRwseyEQVrwkE4c7xipp2oLz
         vEFuB6ZN+o7+zmHucFohLd0jmuZ4dzkWbkn4ypzzt03MHbc24zPuKi/Bg45mSgv75BmE
         8oBmHJEU6KKy7YjST7hfRxAJ1jiUpFKsOc9Uu9+AyjAT4VecRQWGyL+NjfGKhKrwLyZT
         z+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785908003; x=1786512803;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKWy2di21eitj6RpqSuJfccPk2t+roA1WmKtrBhIFN0=;
        b=sEGH/Wn5tEfsmVRSywVAfurk2zj2x1rXUWrpoBOkh7+o1Y2rFFB13Z//6Y9svrwzYG
         UxWhM/nzKBMFmZDWz7RdAR/HLwdFBxfwlKzx8G1jdJ+Vid7X0ikRzgJwYYGwwg7czsHW
         RJ2bo/Qyyf1eEwQcNnrxtwJydaoB4OVeCYI/kKjSzo+YB30OFGSdKC8tvtS6Kp2WehPP
         j7wFhQBpVOIfyoCJ2EjNIw62UY9F2ICRkUI48TEQEauYEWcGiDs59lbMPLt9jspKciz/
         JYFMvQymzL/D5c5nPDwKaGVZLColUQbgISJyLTxqI1q4XyKAa9ZOuW6CLt36KECz8LA+
         j1IQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0LCNJMz7us70jFdTxc/QvnrWZCjSwBJlVCCcMxoM4nAmm55/ElP09Eq33TCMIcTd+vcK4flUGDipS@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOUgR5R7Gf43YJ17vmWtH+TDg7uurZz6wgLCpqcW/1pz8mNee
	av5cID2EicUE6852v9chanA9j5OYGTb5nQXnDotuSB0f/9yFWX4aW+D4Hiys8P6bTSo=
X-Gm-Gg: AR+sD10bHrSdTY3RXf+Dc5D5b+6P0h2+q0e0tGlSshXb4mMINMyTls6antCRpK+ifKp
	fv/wZ7eMh14rKmXi3vls+6P0l9gcKn/DavfT42+u58Cl1zwXRpnp8egMLlM65F/M/TtvcZIDNEl
	VyBlF8V/zpVT0pF10u/kH7VQuBkbLgpiydoaYmhO/3xeGj5Sm0X2glxyvzFAMwJ0t6gjNzBydxz
	QzYgey2URFT8SRx1O7LSMMMso7I/uCoHNRXAkVS84oy2TTkVuW2L1s4hP+x59CtRl6RysELGLvb
	4NzMwwNCbs9SzbWAuQ/UyFbcMsk3s302Z/FjhM9H27i12DFo+TeRZKRc5DowrjmjvQ7GtcSoTm8
	EwH1X8LEn2bVSU846J+vFc3Breu7cn3ujP2zoKpazrn2yJdJSHAp95RtcMKF9NK7cd4ngVPU35O
	Jisr9m+cLrAzZmm5nGrDHw+5AXGZfygnPPyaJAfZf+QG/p+prx91zT3cOc1Jq5dIBd1xO5PXjpp
	9WLZ2EmqeJwEIVTv+uoPv2+wBEewFvLqZAp37EDToA9TIUE0VEe8mFi+WGeQWMoXgZw5ldnHyJb
	UjLxeiehe6R2PhmPJ5M1bNWQyA==
X-Received: by 2002:a17:906:9c89:b0:c19:6d4a:425b with SMTP id a640c23a62f3a-c2039ef0f6fmr172073066b.18.1785908002664;
        Tue, 04 Aug 2026 22:33:22 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203612f1d8sm82503166b.3.2026.08.04.22.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 22:33:22 -0700 (PDT)
Message-ID: <fe27f316-2330-4f7b-bcba-c49677eae70b@suse.com>
Date: Wed, 5 Aug 2026 07:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the xen-tip tree
To: Val Packett <val@invisiblethingslab.com>, Mark Brown
 <broonie@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <anITNOG1qicdE-TI@sirena.org.uk>
 <E5B27F21-9507-4801-8765-0A83FD8A316E@invisiblethingslab.com>
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
In-Reply-To: <E5B27F21-9507-4801-8765-0A83FD8A316E@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JLqJ0jN6d4byD0AanPRr2D3h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JLqJ0jN6d4byD0AanPRr2D3h
Content-Type: multipart/mixed; boundary="------------5DURXzF5G0iaAwCQsTZ541UC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Val Packett <val@invisiblethingslab.com>, Mark Brown
 <broonie@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <fe27f316-2330-4f7b-bcba-c49677eae70b@suse.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
References: <anITNOG1qicdE-TI@sirena.org.uk>
 <E5B27F21-9507-4801-8765-0A83FD8A316E@invisiblethingslab.com>
In-Reply-To: <E5B27F21-9507-4801-8765-0A83FD8A316E@invisiblethingslab.com>

--------------5DURXzF5G0iaAwCQsTZ541UC
Content-Type: multipart/mixed; boundary="------------Kk1bta0bi6MpK8PUQLmt4F5J"

--------------Kk1bta0bi6MpK8PUQLmt4F5J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjYgMjA6MDAsIFZhbCBQYWNrZXR0IHdyb3RlOg0KPiANCj4gDQo+IEVsIDQg
ZGUgYWdvc3RvIGRlIDIwMjYgMToyODozNuKAr3AuwqBtLiBBUlQsIE1hcmsgQnJvd24gPGJy
b29uaWVAa2VybmVsLm9yZz4gZXNjcmliacOzOg0KPj4gSGkgYWxsLA0KPj4NCj4+IEFmdGVy
IG1lcmdpbmcgdGhlIHhlbi10aXAgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkICh4
ODZfNjQNCj4+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoNCj4+DQo+PiBFUlJP
UjogbW9kcG9zdDogImluaXRfbW0iIFtkcml2ZXJzL3hlbi94ZW4tcHJpdmNtZC5rb10gdW5k
ZWZpbmVkIQ0KPj4NCj4+IENhdXNlZCBieSBjb21taXQNCj4+DQo+PiAgIDY0ZDI2ZmIyYWQx
ZjIgKHhlbjogcHJpdmNtZDogZml4IGlvZXZlbnRmZCBjcmFzaCB1bmRlciBQViBkb21haW4p
DQo+Pg0KPj4gSSBoYXZlIHVzZWQgdGhlIHRyZWUgZnJvbSBuZXh0LTIwMjYwODAzIGluc3Rl
YWQuDQo+IA0KPiBTb3JyeSBmb3IgdGhlIHRyb3VibGUhIERpZCBub3QgZXhwZWN0IHRoYXQg
dG8gZ2V0IGFwcGxpZWQgc28gcXVpY2tseS4uIEkgaGFkIG5vdGljZWQgcmVjZW50bHkgaW4g
bXkgb3duIHRlc3RpbmcgdGhhdCB0aGF0IHBhdGNoIHdhc24ndCBhY3R1YWxseSByZWFkeSB0
byBnbyBpbiBkdWUgdG8gdGhlIHN5bWJvbCB2aXNpYmlsaXR5IGlzc3VlLCByaWdodC4gSSds
bCB3b3JrIG9uIHJlc29sdmluZyBpdC4NCj4gfnZhbA0KDQpJJ20gcHJldHR5IHN1cmUgbW0g
bWFpbnRhaW5lcnMgd291bGRuJ3QgbGlrZSBpbml0X21tIHRvIGJlIGV4cG9ydGVkIHRvDQpt
b2R1bGVzLg0KDQpJJ2QgZ28gZm9yIGEgc3BlY2lhbCB2YXJpYW50IG9mIHhlbl9yZW1hcF9k
b21haW5fbWZuX2FycmF5KCkgbWFwcGluZyBqdXN0DQphIHNpbmdsZSBwZm4gaW50byBpbml0
X21tLiBUaGlzIGNvdWxkIGJlIGltcGxlbWVudGVkIGluIG1tdV9wdi5jIGF2b2lkaW5nDQp0
aGUgbmVlZCB0byBleHBvcnQgaW5pdF9tbS4NCg0KDQpKdWVyZ2VuDQo=
--------------Kk1bta0bi6MpK8PUQLmt4F5J
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Kk1bta0bi6MpK8PUQLmt4F5J--

--------------5DURXzF5G0iaAwCQsTZ541UC--

--------------JLqJ0jN6d4byD0AanPRr2D3h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpyyyEFAwAAAAAACgkQsN6d1ii/Ey+7
xAf8DyuH/0FYNoBKX08hI0Fj1oCG+R2Wf2mrXSZvz90ygWXQNqMMvQslTAozg4xiNsZ48m+IHLY2
h5ivCHq9s9JsywfRcmADL6GDRkDeePa05Uns5qxeKIiid6XSd8oJG38ykJA/2zGcC8WzfBK86Ug8
VY52lrfzs/qiYs6FnwsoGWyY72wKrpA5gPgIypBGByr7AYhkJgi97gDwWTSF+q1tws7i3LK1TYgG
BBLdfpIvez3xLCTrICIZeJIaNZRAAQnIONISyXi4QfQ/usHkmDSxHGMdpyBli0A6glxH47xZsH5A
gK7ZrcHVogzqSK3E/wfCvlVACTQvzXnH/bJiWzz5wg==
=XVKV
-----END PGP SIGNATURE-----

--------------JLqJ0jN6d4byD0AanPRr2D3h--
