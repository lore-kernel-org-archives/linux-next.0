Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532786;
	b=SVssnSCW/gdi1P3FIHFiJVhcmCbLU3+qsxNURnNxzXcGyoN4HRmK45xlTNDDt9sYYhkx
	 h2qU+DAdIeHt2VPePwGDmkhUkh8llrfeE9zK6U2vIUawnUJP03nBp9Zp/KFoPqsOmrM7s
	 +DGebZsQdB7kOCJlDB1L+nr5nYGjto8dvh15VBIb2J2wNX/F1Mi4fef0V6Ap1bgS0cLgx
	 l48KLpGw7uD7dNDxfUMTGZX6+Y4DNXUOmwQsU+6AD7AcFlcec28uJDNMWuGQ6F0hU0rq9
	 TIFnvG8KI5JthrdO5nf93SO/dd7OYuuHK1hSvmCzFLUAkKDKU39qQq9exxN2ir87mIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=BCT9v/+X8K3n8rYhkC3Q/IsroOinySoDgPGD4FD7N7M=;
	b=vLB4MSW/HGnb9dJfWXaa8HwK3KpO3NbnEf1HtLlpRIBmMApRlKpoX+/yy2KpNxr+mPAe
	 b0OA0UNSnUSanr4dIjHWffxTcg63Clq40A8tjDndHusuTGx0UdztESxwuy7cae0ma6z/Y
	 QNopT0itquI2o7KUvhmJA6EOyJw2y4WMSqJUArFOMy39q5sIlYsGqgcS+SgAoZrEdbTzb
	 8CUH3cQCfdspeSawg/3gOrAof4X8pf4OHhpJldiVRW6REtp1Uxv41cglOS3ekzGCwwDOu
	 rvYsoSjLMJR3vAnoKb/CtXXRK+oh3zgDkpmr0Wvh7bg39P6nqUuVtW2NqkYXE4Bs8ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IaU5Ctrr;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E32606A323
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 15:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IaU5Ctrr
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so613726766b.1
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 07:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795532784; x=1796137584; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BCT9v/+X8K3n8rYhkC3Q/IsroOinySoDgPGD4FD7N7M=;
        b=IaU5CtrrM4NAZlYYp02z3qD+qSxgDrvFV0ECH6ghhX0rtpmCXmQl/LgGGS+n4OsQ5S
         RxZO7VRHW5y3BC28sBHs0wOx5lecjBPGL8v7xvB30bRUTYbf5CAmrp465Zej7NIu8vwf
         1/B2lJ2y6xFAFC+c91XhUYWUAFDMMsfw4gzEMUqGbjYJcfcq+ZVyrVg28ov+FtW8EMsg
         sxrlaDX77lmqe1AQhogYUUDioaCyKPNPiOjqBOZs3W7sgxMS+MKenPMTiZGZHX4gD7tO
         pW8wj9DFU8FLZMUIM9I1fXHyxkLf2etUkvVq3942+K7bWtoap2nQ9Qs+SbS0qo/RWtl3
         EnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532784; x=1796137584;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCT9v/+X8K3n8rYhkC3Q/IsroOinySoDgPGD4FD7N7M=;
        b=wo0xafHLyCIDBa+Qv0yH62mPsiKNNuuqANKZIBjxoFABPlzI6cbL2d1/CimLxALaN0
         1WS/LK/0gK+HB82V/S3IB+H6b6Juv0bmgvpr93Ak48Q+GmP/e44ykfMdwj/UCq//sif5
         R7fTZYmUY7igziV84lLJ4lhC7IsZazN/8qXVtNAQVTCtjVvokiTxwHLtZyUL7Pm2eOYy
         HQ4QZnXjBkw3AJ0MZCsLmhm3ZPI43c8BPY/koAOFX+Ldukr1kz/i9gtjqMsobcdJB3Kx
         qEJpMEckDUMibQapyqWMU6BMT6beWYwZNE8FuoshJKbSK9OGLJIiejLD+wtJ2o7Dzwi/
         6nYA==
X-Forwarded-Encrypted: i=1; AL+hErH3fSbazpEHEfkZLPA5DzCy/tpopjEi/mvARmJA6aqcvQ8bi4gg3Lmvm4mjWz1nU3vTuw1txLXArrvA@vger.kernel.org
X-Gm-Message-State: APuU4Z9zmPHrft77fsUskxwH//QGHxQb6N1FpHutNSfKTpBpB0XwCVzE
	8xIWaWEBq/KMv+VcyMS446R0wSF1n7JMLKNowkRYWTot5tKp7VYEC98GioT7eGPzgd0=
X-Gm-Gg: AZFdTZd3OopfXWwfksJqbrmbAHLVvr9ma6q8tJoHl7AFmWAhI/m9UzKDKCc0rf78GKm
	uY0veF+mrusBDWwXa3P5doT/E8m4qxcr72AzpLBgApGirN3exxmqCuBjChFkW8g9HbIng8a1gir
	b9q+YUSUguyypR2lPozctPFYGqqcdyBnVwL6qCPztajedcY4GtS8vhV9R4Xt4K6Ofj37i7TbRtS
	NjNYUWTfKbOf01vpmfFfE74mjLZo8jva3PLPdRJCadbL3VfExsZ95QsBFEtxDOthC3k8IQWkwHl
	Nm/XWjo7ub36b/1das0eXHX+jCvSdlInv5702SzXIayn+KajtnRHG6WMj6wfb21uiwOOHisjKHk
	7gYc3ONAOhX6fQO/0d/U2CRiG2dQv+0QJXglQNMqioZXT42vwSgmIWqnSxekOlj8o+FX78Tfn2z
	uFCacM99eB64gBcBX3ic2QZ1bS743YxbhUMkHf35Nj7cQXG9kbrw6a3HbKKjuvuLEgSygXZKkyj
	SJNQLdhjJFlrS158p2S7cQNQ1q/BfrK0Euz3+R7JAp8o1jTqKuiiLRpPcU6gst1D0DSNihXUj9N
	prBSTmirHM9h3xcMdDeSQ8INCgc+aIoveqwotvqEuMz1G/CAOyFBBcR4HiNdWmuN+mkNxIMsCjd
	PC2blEzHIlp6biMILokDsN/uY6XPYej4i9X4+lXEOnL53ujOOetU=
X-Received: by 2002:a17:906:3588:b0:c41:6de7:7dee with SMTP id a640c23a62f3a-c513a3ab1a7mr894304466b.7.1795532784130;
        Tue, 24 Nov 2026 07:06:24 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm551972066b.3.2026.11.24.07.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:06:23 -0800 (PST)
Message-ID: <e7199286-e2f4-417d-b670-af0322145ec4@suse.com>
Date: Tue, 24 Nov 2026 16:06:23 +0100
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: semantic conflict between the pm and tip trees
To: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jez Ng <jez@sfcompute.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 x86@kernel.org, linux-pm@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20261124145646.3655959-1-sashal@kernel.org>
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
In-Reply-To: <20261124145646.3655959-1-sashal@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zc0ZTRnkyQAlZfFdNQ0bqr6h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zc0ZTRnkyQAlZfFdNQ0bqr6h
Content-Type: multipart/mixed; boundary="------------0aJD9wwo1MQmruFePpj0TVCj";
 protected-headers="v1"; hp="clear"
Message-ID: <e7199286-e2f4-417d-b670-af0322145ec4@suse.com>
Date: Tue, 24 Nov 2026 16:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: semantic conflict between the pm and tip trees
To: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jez Ng <jez@sfcompute.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 x86@kernel.org, linux-pm@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20261124145646.3655959-1-sashal@kernel.org>
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
In-Reply-To: <20261124145646.3655959-1-sashal@kernel.org>

--------------0aJD9wwo1MQmruFePpj0TVCj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTU6NTYsIFNhc2hhIExldmluIHdyb3RlOg0KPiBIaSBNYXJrLA0KPiAN
Cj4gVGhlIGN1cnJlbnQgcG0gdHJlZSBoYXMgYSBzZW1hbnRpYyBjb25mbGljdCB3aXRoIHRo
ZSB0aXAgdHJlZSB0aGF0DQo+IGJyZWFrcyB0aGUgeDg2IGJ1aWxkOg0KPiANCj4gICAgZHJp
dmVycy90aGVybWFsL2ludGVsL2ludGVsX2hmaS5jOjQwNzozODogZXJyb3I6IHRvbyBtYW55
IGFyZ3VtZW50cyB0byBmdW5jdGlvbiBjYWxsLCBleHBlY3RlZCBzaW5nbGUgYXJndW1lbnQg
J21zcicsIGhhdmUgMiBhcmd1bWVudHMNCj4gDQo+IDQzN2NlMzAxNWU1MSAoInRoZXJtYWw6
IGludGVsOiBoZmk6IERpc2FibGUgSEZJIG9uIHNodXRkb3duIGFuZCBrZXhlYyIpDQo+IGlu
IHRoZSBwbSB0cmVlIHVzZXMgcmRtc3JxKE1TUl9JQTMyX0hXX0ZFRURCQUNLX0NPTkZJRywg
bXNyX3ZhbCksIGFuZA0KPiBlN2Y5ZjE3ZTAwMTMgKCJ0cmVld2lkZTogQ29udmVydCByZG1z
cnEoKSBmcm9tIGEgbWFjcm8gdG8gYW4gaW5saW5lDQo+IGZ1bmN0aW9uIikgaW4gdGhlIHRp
cCB0cmVlIG1ha2VzIHJkbXNycSgpIHRha2Ugb25seSB0aGUgTVNSIGFuZCByZXR1cm4NCj4g
dGhlIHZhbHVlLg0KPiANCj4gVGhlIGZpeCBmb3IgdGhlIG1lcmdlOg0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnRlbF9oZmkuYyBiL2RyaXZlcnMvdGhl
cm1hbC9pbnRlbC9pbnRlbF9oZmkuYw0KPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvaW50ZWwv
aW50ZWxfaGZpLmMNCj4gKysrIGIvZHJpdmVycy90aGVybWFsL2ludGVsL2ludGVsX2hmaS5j
DQo+IEBAIC00MDQsNyArNDA0LDcgQEAgc3RhdGljIGJvb2wgaGZpX2Rpc2FibGVfaWZfZW5h
YmxlZCh2b2lkKQ0KPiAgIHsNCj4gICAJdTY0IG1zcl92YWw7DQo+IA0KPiAtCXJkbXNycShN
U1JfSUEzMl9IV19GRUVEQkFDS19DT05GSUcsIG1zcl92YWwpOw0KPiArCW1zcl92YWwgPSBy
ZG1zcnEoTVNSX0lBMzJfSFdfRkVFREJBQ0tfQ09ORklHKTsNCj4gICAJaWYgKCEobXNyX3Zh
bCAmIEhXX0ZFRURCQUNLX0NPTkZJR19IRklfRU5BQkxFX0JJVCkpDQo+ICAgCQlyZXR1cm4g
ZmFsc2U7DQo+IA0KPiANCg0KVGhlIGZpeCBzZWVtcyB0byBiZSBjb3JyZWN0Lg0KDQoNCkp1
ZXJnZW4NCg==

--------------0aJD9wwo1MQmruFePpj0TVCj--

--------------zc0ZTRnkyQAlZfFdNQ0bqr6h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsFp+8FAwAAAAAACgkQsN6d1ii/Ey8l
tAf/YodGNDixbsceWfyO6GkKTyu/15JL5HVG3FnaG8S5EIXprkLt07/RaM/8Exss2woyKstpJXjW
NBDtvS9OUuuHuwHZuRwvuyXRI5PDMRIK5BcTAB5itmnEzX+gU7OurShbMWMxkz1Qgot6kBE0AD8Q
EATbWa1k0pnRwGhpGxPL7O6WDp3MvrT7TtCuYGfJ4qEKf+MYDpht1kYInPhh8a0n4IOqt7RFif9k
tz7+BQ6fcA3tlhhlUXPg3qImKgaCOU0pj8vFwsIi2Jhm5w5m4BBEbt/qCMjEbTLVUy7fiArIiMdL
hgmvZZ03yAstPW5+WSYIOHihdsow/RGLwot1vMhRDQ==
=rRmg
-----END PGP SIGNATURE-----

--------------zc0ZTRnkyQAlZfFdNQ0bqr6h--
