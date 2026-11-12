Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497384;
	b=z/+gspdlWYpEr9jNq9zAbW4XXmFgijnMQFM/G1sOuZ5yvLhpRarPs7ju7u3WqD/IfVe0
	 0OdAWMONS7J1vIGaYbASJ8DWLKDg0cQj87Wke9BUIuwF2b5yAIZgrJ0CHamEqsUpkcU76
	 rA+Y7E3hGByRLJnIMFimlK5PvfS1HUlvHWVgiUysGCb0zV9OEKNmaj8VgiT31BSVusqo6
	 VBKAMHhD8k0uVpDUf80cEGfFrQs3rsBWUFK8PEOzxLjuaX/8F7AEck6EeyncRKEFlG/Sf
	 jpslzB+sgaDdGD+YK7Lf2dixxGqWotMGHiAw5vRWDEmrxem6nl3EGofg1iRAm5FBnJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=oSZaE9Jkg31B2OjfxIU50Lt37gIuMNU6vFeXv49uKjs=;
	b=DLkqi+ZxCfxUNSFKr1BanzDpAFglZeSNqoqHZI28/mToydZr7qLwTuuftkao7aY9V08g
	 tkaIJpS/GoQ0z0ONMdijEeCOUMojfhYwM844tlQdj2AX84FWYgnuRWq4w07gBbqNt6zO4
	 d/sT5nYJX8CtB4GbnsQvXTZWQKrd46+cht0GZjtryNp01RBAr2srgYkivMFM/7HXyiW65
	 UfHfFv5/WFuSTLDihKH5OKA42JNg087Gvq4AUGMdkojdHkzW9CEDrwCRS0KY7aRNLH/J/
	 hO64WJfaH4vEDP1EDai6uFrM5Ze0SHaYjo3eF40ffb1mqHIGa1iJ4dSTd7HjOvV4WFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtMlgnpc;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3909606A339
	for <linux-next@vger.kernel.org>; Thu, 12 Nov 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3909606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtMlgnpc
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b244fb7fffso5511214c88.1
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2026 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497383; x=1795102183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oSZaE9Jkg31B2OjfxIU50Lt37gIuMNU6vFeXv49uKjs=;
        b=jtMlgnpco4UwKxbq+hTJuGkYqUS6+/veHha0WAaU9XXa2kFStd7XS2On4fXy3hmxSj
         x6FAOjEmuFrh/l6t0p/PJGW5oROum2TzcUzL2MKm0jnE4MkNXiOAgMb3zVO4WkvuhSlA
         atNfJMDBizEMX+jTWl1hCvDKytA6s7lxSLPofs1M0yoNLM+ar0uHXAPsHKWxg8GEmJbR
         iUMzG2j498hETIReLsACRKC9ujRiBk0s8XJec6huxMFlw2ugh9uKRrWmOF6ep3AXh5D1
         qt/GdN4NOvDvvBg+GmbwbGCFOOaReO0/BvxFcC/u0f5YIBZ4v+uaJ8yFc56KRYW58r6t
         hWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497383; x=1795102183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSZaE9Jkg31B2OjfxIU50Lt37gIuMNU6vFeXv49uKjs=;
        b=LYqSyR+wl9MUXDXTUENicilLCmfgjH1nfdIPvZOaLV0/Ee1SoL85LrLe9ArDKFH4Hu
         VScYg0Jkema3rOA/zLjOTHfQwwwedXtaRn9hQo6pjmeC2lWwDjejcqrendgWxiyfvGsD
         68cgsa9Wi7Q5yMOcw8O0aOt/zzGRs+csURhsWP6inmfVYrdx4Jkni+5HhQOcDxBicoVg
         ewXWOnMMG/R2aK0hQEtE+drdtj3xaDsdklU/LGmsNuKmxKBVSDf81GfNXI/4LBGvM23e
         2RgK1Ye1DwL52/0dcAKeX4Un0nvDbET5BuvJWYy5iqzsRgP4u/x4orzEUUnlusK6NUnr
         LDQA==
X-Forwarded-Encrypted: i=1; AL+hErG42Lbk3LS5mTWgMzNnUJPDPdInq2s1EgFC9ByXzAiTXEN1DC5EA52i1yUsaFEENf90I9Ka0GFCtyBL@vger.kernel.org
X-Gm-Message-State: APuU4Z9DLCSaSDU4g9esgorrvQ9RpzEGfB2VDsEPneZwHQNvarVzPGYQ
	zrRSkC1YU3+gGskRP1KPP08LJ7WHvs2JQFxLjJxq1hleWKM7l2R76JcV
X-Gm-Gg: AYBFou3VrocrKrS8fNMpQFCj8QPZNjojFeuyxcBye78Ew4HaHJY/WrtmajgDeuyiAHB
	OhOzor3SmYWB0VwZresbqbJJV2T+xB+iR90ogXGY/x7O0G4ASBtRZb1xNiCC5w5dXPLONIDnbjF
	VHzyjDhesbjOtnjstZ5zNPYwxzHKYY7gm4YerECdW9Oftw6DCtii5dNUM8rX6P3B74oWZf3GiNQ
	upHLIUmCQsDNP6QFlj0uSlZyEHDZ4iMSKvVCa7sqwvIgsq/k7cxHatmFvsEmLocYQKWWPzXb2TH
	ITxb6y8ZObr+9ZYQx5UqhuQLEIgXiaUxTKuFhReWRkYurcaTvKIpYPNKHYtMJ1KSx4ZoV2lYGbJ
	ONR/0iUltefZHBhWk0HY9yoAOliuoyQTWv9ZB3lwUOKPwJJo8ndT+amncKkpOxgd4+QclVGFTcP
	+3KDaD61547hg0nqpar+diDIs6aPFtwlSSGH3xe1vnZmas7hggaTN9/K8IODURqPI/d9kUoIw8y
	NbmP96JTFwocyjKCs6sc2geYKy+d9JLz7bcfA4LZNfXzUGsc+yVCFmPSUWIAs76ql/pSR8mfyv4
	wsWB1PKrxxxuOX/wOoG0dGhujQ==
X-Received: by 2002:a05:7022:c91:b0:191:444:425 with SMTP id a92af1059eb24-1b3c023cb0bmr4915582c88.2.1794497382427;
        Thu, 12 Nov 2026 07:29:42 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5029ecb1bsm564469c88.1.2026.11.12.07.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:29:41 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: linux-next: manual merge of the perf tree with the perf-current tree
Date: Thu, 12 Nov 2026 15:29:39 +0000
Message-ID: <179449737932.73597.12778815944082557280@gmail.com>
In-Reply-To: <avW648YFgbci03ra@sirena.org.uk>
References: <avW648YFgbci03ra@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Mark,

Thanks for the notice. One thing worth knowing: the full stop is
intentional, so keeping it in the resolution is the right outcome.

It came out of review. James asked for it on v2:

  https://lore.kernel.org/all/a188c604-46c0-48fb-9cbd-9eacad88b5c9@linaro.org/

and v3 added it:

  https://lore.kernel.org/all/20261107022145.1713159-1-takano32@gmail.com/

The copy in the perf tree is that v3. The copy in perf-current is the v2
that predates the review, so perf-current is the stale one - nothing more
than the period is missing from it.

Thanks,
TAKANO

