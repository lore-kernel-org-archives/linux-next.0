Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975791;
	b=J87xEmmTxOJIm8JIrouJVybYoU5sBnisGHkLB7+8h9Jl+S3pV07PtEDmOl9l39mpZC+I
	 kvKU+jSI7drfBxrOngtgs04jONwMT44R8fUOnGy7KcYqembKJIKIKh/eFjrh83Ttg7TWt
	 bpukbyviv1kGsWGI3Rmks4y5p5BDFhbqEykAixHgxVDMKrlK0Lvh/u6lvfjVP4xLP2DKx
	 AmN+RfchhEaiBKmp8CAxendkj+5FWGCAxwPKo5ud10ncfvfMbAFdSq+skjWRVWZBp8+A+
	 M1BWTppxSsow3Yp7nLg8Zwe5jBoJz1eMiNnJ3Uuqcu0XSk2iUaa9FnNQKSA5vKn9jpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oZ6usXvu2NxoOwryNvv1QPz3Xqz6iwE3vpf3E2sWJzE=;
	b=yqxZnLEDLh451Qj0xXn57EaANoZBXsosC+hUv2ESHdUmlkg+EKcWA99aBUB+MDI36Z5b
	 C/oxyilCv/nkQq2pl7VaQ9aOHvTAOppO3hiFyP35w/DlHicEh/7sRRBt57do7MdzRpOJ2
	 ropYwhF2FF3DAuqba0umqhr72GPEvW1fkE3jw2sHinYHZvI5RgkSk6/KjtkPGd3/eK/Ks
	 A+PhGJJzpdGOvvyyAWB14KcIkL9kCSY49hs9D7uasQSzoWBqkPTxyMTySL9iwVR7qyKdh
	 2ZTPIiejfWm/10YjLvllZ1UBIU2YIz1i59VLuFPGAsnbrNgvj/Oy3lDqMIKAmkI9kDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRXUpVdj;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0E4606A31A
	for <linux-next@vger.kernel.org>; Mon, 26 Oct 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRXUpVdj
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9909e82513fso2121496241.0
        for <linux-next@vger.kernel.org>; Sun, 25 Oct 2026 17:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975790; x=1793580590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oZ6usXvu2NxoOwryNvv1QPz3Xqz6iwE3vpf3E2sWJzE=;
        b=gRXUpVdjSIeudKeM9HRhY70oOH1av3hxCxzkANIYW2haLy54FBlZi0ZP2Vl1xK3zny
         NaZVmhKCrgG1ioQO1RiVtTMpYYPNlwTFvdFFSMv8r8QiRAvP1n6poX0D4G4sNNUoY+up
         +V6hVocmXBgVTBtTcbFrq0rEqPh0d177bGA2U9OPlLcFMLi8r2053cofoaKT1HzX10/E
         KCa4/YR971Lg8k8i9ek+UtRqdCbQ4cdm67g9X1VMae6Cp8xuBCdroMPKAfqagWkppvZj
         R4BRReKh7b2roXrp5sxG3Bx1aZYBb5FKi3vsQvg3G2hOJWa6f/PqfRfHeIZ5onZOmWSj
         NE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975790; x=1793580590;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZ6usXvu2NxoOwryNvv1QPz3Xqz6iwE3vpf3E2sWJzE=;
        b=f9K9fKlo+PwHWhywbxBd1wTJjAjZTKPjdIsjDhWxMTlCjR2fCrKfOg+1HDBxCQOXfQ
         JfQYIjZE4eoj4SfVObsmBAPWRF6CpmghXam3IUEr/sz/6MkST6L3FHWoQq+nF82rfzsU
         2QTl/cWwsSTk9Vs7NhwEGo+HFcZN0fEkb85uJndPji+7nmgW0pFXbBwCt0Tb3EDFrI6i
         87dssklB7CY83qO5/9N6sfZ2BHAiuSktfSF3RWeokk3sh7GSy2T7UgA4DWJbMyhXyVyl
         ulvlLQeT3Clsto+9+J3rzaaxRtyyaea8HuuNQTB9i1Y2tgfavWV9PY1BW4d/tjEe3FWo
         G4+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxO+KvM/da2eb+b1xvanbtwkafbKXbq+HnKGl6R3neCpDFMZEBe3iakm9lJjqoJB/LI7phRqdebtVLe@vger.kernel.org
X-Gm-Message-State: AFq9FYIkU8+ZAr9RSRYP1+3SYu+cP4b0zQKl/AP/XXm7SrvfdWAqArur
	gKtCO1NsvYhTkWwbjZCsaACZbAdzzv3nrsM8aobhmpJoXyOc1mho6JAN
X-Gm-Gg: AYBFou2IWbYb2/f6NUcOMLItUTb3BhydDgCVx6aI1Js0cTfIafoiOJdAWEK2hve+L+V
	OfCZiCu1ju87O2Ai6LQE9OMbvhuQdgD3JD4q1UH8VoJ5r2BiFPCDOzEFbB3uH5yHUIuDwGSyYQ3
	NgWorNzZc4kJkVibbVxilAQqX8nq4CxlhCItE0EdQBWIVRocqmDU7Vi3PrbzDJH5fQpPigkaXv4
	U69cxIMEErZCzyjZO+0UB5P6zJaubIqzVNDHayJabltAc8Rh55lXNhXpkSUqaULTcXdSGJSIJip
	JwtwS333AIEVAXJhf2XgBBe4skUaMtR3fr25HxzOqpmVhkM2XsfiOuztAmoCNm5P18AjHJ+X9xa
	irtF+ja1SgdwpiI5olAVS07K7uMs4VXKvWMze6pA+4NPOIgopVlgUBYaioX5maHFesRN0Q5D2TF
	ACriIieY6KxruMvrXwTkvmedaEJwHB9moAXbLgcjpsgToFLWegYtYWam0hQZbM9wOg/I57dFBtW
	VbpqSc81XzkpAV6FEdpAxoZxUwLWJsYU+mCP6HlmkDcYu/KaR07zKFnji9lAwo+qjg9C/Lk
X-Received: by 2002:a05:6102:3ec1:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7ce5cd9e2f4mr1363777137.25.1792975790094;
        Sun, 25 Oct 2026 17:49:50 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:38b3:4b98:51e6:d9c5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e80701bsm6710300241.11.2026.10.25.17.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 17:49:49 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:49:44 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Mark Brown <broonie@kernel.org>, Namhyung Kim <namhyung@kernel.org>
CC: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
User-Agent: Thunderbird for Android
In-Reply-To: <at6Sfv6lR0OivudT@sirena.co.uk>
References: <at6Sfv6lR0OivudT@sirena.co.uk>
Message-ID: <6F4054C6-80D4-4AF2-A1CC-61CE720B707F@gmail.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 25, 2026 8:36:30 PM GMT-03:00, Mark Brown <broonie@kernel=2Eorg=
> wrote:
>Commits
>
>  dc953bd97bb34 ("perf annotate-arm64: Support 'mrs' instruction to track=
 'current' pointer")
>  1def3501db416 ("perf annotate-arm64: Support per-cpu variable access tr=
acking")
>  57758d7a45a91 ("perf annotate-arm64: Support 'adrp' instruction to trac=
k global variables")
>  3de720ecddd77 ("perf annotate-arm64: Support 'add' instruction tracking=
")
>  2a4d31c97bc48 ("perf annotate-arm64: Support 'mov' instruction tracking=
")
>  5e5337b32bedb ("perf annotate-arm64: Support stack variable tracking")
>  afd3a56ecd8f5 ("perf annotate-x86: Delete stale stack state on store of=
 untracked register")
>  7987f78199231 ("perf annotate-data: Track imm_value for stack variables=
")
>  c5aec1fbc2e04 ("perf annotate-data: Expand type_state_reg imm_value to =
u64")
>  2e1cc4301709a ("perf annotate-arm64: Support store instruction tracking=
")
>  5494c4435efc3 ("perf annotate-arm64: Support load instruction tracking"=
)
>  0bceda338113b ("perf annotate-arm64: Track return type after call instr=
uctions")
>  de5c01e94fca8 ("perf annotate-data: Add arch_get_reg_offset helper")
>  84c86dc5b867b ("perf annotate-arm64: Enable instruction tracking suppor=
t")
>  a21442643267d ("perf annotate-data: Extract invalidate_reg_state() as a=
 common helper")
>  9b435ebe2ddd6 ("perf cs-etm: Respect --no-itrace option")
>  6cbb0a8996ef7 ("perf cs-etm: Synthesize missing HW_ID mappings for raw =
trace")
>  934d015b78e04 ("perf cs-etm: Free partially created queues")
>  a965f5ed75bfb ("perf cs-etm: Don't add global v0 HW_IDs to unformatted =
queues")
>  895ec1c47eac8 ("perf c2c: Fix memory leaks on output fields")
>
>are missing a Signed-off-by from their committers


Thanks, I'll fix it and tighten checks,

 - Arnaldo
- Arnaldo 
