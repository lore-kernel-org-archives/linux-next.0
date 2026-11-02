Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793647376;
	b=39GmpwSRH7/dxOf7afRkE8jvMdYeyKFOzKVME+rotWO4+nYGtt/vAGtHCoOeOvMtzXBy
	 Jcf+/svYoW7kiinL0Dk/cwaAHgBG3aj2v7+iyhzxK50SYQNOPWSPEby0el7UBN19nRj+I
	 y90bNj8tf8usnwhqT85qV4prgUx0s0RpICKsvxCma7fHQba6LMGAcQhyFNElvJyG4uYyC
	 ln/Zq2fY9rm4nagAwx23cdLOHL8Wnevu09B9kjzE+VpcpeI2nmUNYibRkeaCfGTU4BuiI
	 BEysIuvCItUxZeKhVP6jhu8TSzEE1IYJ4QjnTjSTPc3qCcJge5ZVqEk4Zy9jzkJJeOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=sncJ3zcW9WoHyhIUtGXL5Sf+cLBdbbQUARyAkGRFC9M=;
	b=UWHOlKcYc5P7tTZXTn9YyELV1NdCmKLVjj0OZBZkXs3IChTy7i/YyNe4tKMdH5zoAOky
	 nLyoBnUdfGY3FJjHIRSDGwxKBQ4RL0aq/v6vTSINfElqqBk9BKVhEe/ACMDuo7hxYqBp9
	 WXGQPtq2BP8fcig+6EeuyklU2iORotQ0CMHJYmQwVuv9E279VpFpiFqJ7ajNdISFt7Wgf
	 p5pWICdt8ClI6PfnWEOHaaw1jvTfk7VGQN3rlbmfMtxjc+FooHpxBHcV3CsIFfB7o2iPS
	 pXkII7qe4Q4b9cb/4U/oVXxLeOTpekrvtUF/fkMnK5VRDW+dKdxp5s7G3CTD78HRIAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Is4jn9Nl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB2606A33A
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 19:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABB2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Is4jn9Nl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so4652363a12.3
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2026 11:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793647374; cv=none;
        d=google.com; s=arc-20260327;
        b=TwI4oMZkWMjNHYfEoK14GcqPzIbKmOn81mJDk9xR/ZiCW9OeuFM6CCVzTbOLDs+O7+
         m+N/ehPVoYTrWr2KhyzZlNaCCauMsWrKBOfgtT+KI2I0Zd9VYk+CHIGQY+j4J9/RN9ml
         jM8O2aDwuyUG/CgNhvO1iFOlDhO8amMxNuRKoDxT0qRaoe4qlXk0/VPq0fJ+yKrmPwtY
         fL7KIzYVrXt9fJL/u4h1DY+Iwdnmof/GIXZs/6QyjfTUlWAaDEUdJ7N1c4yrcUGcdEge
         /kg233zPc3swo3356gbODBWQgtNBgwIqdRitev9Lck2BFJWUnhZwYvKar4o3rfoxZmhK
         JclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sncJ3zcW9WoHyhIUtGXL5Sf+cLBdbbQUARyAkGRFC9M=;
        fh=rvhHlGwxLYwogYlKB0/m+24JTWIi8tBUL247UNsBCDU=;
        b=XG51Q97nBAf94flUas9OwBXQML4NLitTat1MBUyhmp+dQq4qCNLYlDxHi7iU5b1LCt
         unVX7QiEG6A56FDcdwRTIjZETgt1rG2JGJupHkHmzjgxazNbq4I2mY5aAIBy3/frPRKA
         pDUlOFPDIDAKMty5ZxP0BHMeivcUrtHVtz2JY+/21CbdguaSTGv+uFPklcynEXUfc2c/
         IIsAYRVs4nJY6LdfPTvCfLJ5do0/ZT31zvNNBrrzCwtUNC3NmrgClpf1i3E5B6dRyet1
         bH2+9AovV8fHPUNDz1zPjB5iZGR+kRse8oGo94PREDVtFhvyNDX3uCq5jihvR8p8pEQY
         gX6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647374; x=1794252174; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sncJ3zcW9WoHyhIUtGXL5Sf+cLBdbbQUARyAkGRFC9M=;
        b=Is4jn9NlzID5BwIbyqWK1BjsUjnRgJ+UwZrUGOqGYuQyzYrQO1TeTvMjaZyA8GFhqx
         MPRjpP+oyKPYLTAxdWOE2FrP+yqtcep5hPUpXYR2G8iHUQDQJkktYTcSAF2TgBsuRXwl
         UglAnuod/gxQYNvZKY9fALIBpFcKbeVS/bRN35DfDqaGbaE9G5dV/GbO8oolUwabn77f
         IrbTfNvyXOcuA0qJOkoymnHLHfkkZ/AtCCWD1QXiVJIX2ZaOTgCSOf74baJNiFEW8T/g
         1V8qhNSEBosTtXQjnXivy6XO1Fi2UeQyqr1T8qJ0wTzPFKP8+DAoR7lzBNI11deEfRKp
         Mvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647374; x=1794252174;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sncJ3zcW9WoHyhIUtGXL5Sf+cLBdbbQUARyAkGRFC9M=;
        b=UNNfMyoL3MmjxYACPb7Khq8tXaTqhMNzS9oeGGhUk4o7cTAAjmxYK02P48r/9WDonQ
         6OBZjf/bzlKI3X8A7HF5YSrfBPS4J7OH2qPJEbmeJjx+iqoSPXLk7srlUfUbDfEplspr
         3x/wc42AfeDN5/eIOZbxFluCDKgJXeV3gWGJfkRxxlMadOyzRPwW2vHxB313zzvl9rzm
         4hdWG/gHGPiqtPTZdEyClOVZM2g/lNjPoPxfbFp8h9VSJ1dKTqJc0B7NO7mop/ddbeal
         IV22xkF5tKgYk0IKa5T2c2LbkRDpy0xkXukVxASB6DkOyQ5XAbMdEJDV6MV2DQ70dhrd
         BmQQ==
X-Forwarded-Encrypted: i=1; AKwUvByhu2v451ygXZrSYrpEA7cZo5rwLFAYsUT62OdSqQ1fO0CGc2qDXtTw3AKBI67RyAcM+KYpHSyDgZ/h@vger.kernel.org
X-Gm-Message-State: APuU4Z9mFnUdJ7BeltG8DsNsaEG7qrh76lFukIstX6+6J9sXg0iBvX/9
	zQeTo88jGcflyJ2DSGUbTGY/oqs6VBCo1WGF77GjU06skmuzFR9LpsTZegq1JmyKcDFj3j47JXY
	NXuH1VbgMDeP0SKC321oKyIQDXfLfZn4=
X-Gm-Gg: AYBFou3AZCImVuiAaN+0AKLN9HrA9oBg/qdDxWEmkkyyrqPQLO7P4fh7xR3drk7Z7XE
	t17C1G7X2nfB5H407iuBk5IywZaw4wWR91h6v+VDkj0Om06H5GLhFV8RjmCfieSyHRdOWESP4VN
	yJSxu99nHbuag8ADNJsasZDnmH1zQRk41pri5K03KeeCgl5dA7jhDQs9Qqh6/ULtHwJAS18PUmW
	CB8cPszZW+vm05X8niH/ZeYDr0MhMBVrp8o9Vtg0d0GeCaQQvcKO9r2UCEvoDQamfKvpa5O7r/4
	fP4ZPWQBddDYQzZWkEdE2QG85De6Se3w33MebxlfzpSr2XY7wXLsGnS75fVZnZ0RDrQlWgvROXZ
	3akQ55a/Jv3uOIEDgtq7vFsBmKCnA9laV43xkoEael0Kj2hTSEahbVR3HLkv8J4Nyg8FnmDZIxa
	Bkxz0azPDKj1Wc3sOl3TALrQ==
X-Received: by 2002:a05:6402:1564:b0:6aa:9830:aa21 with SMTP id
 4fb4d7f45d1cf-6b4d4d7f9e1mr5718745a12.39.1793647373892; Mon, 02 Nov 2026
 11:22:53 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 2 Nov 2026 20:22:42 +0100
X-Gm-Features: AclHuK9HbC-_CV3YesXglYAaZg8Wzx-8SncZyxYoRat_Abmp1GkIfTy3SwfX3jA
Message-ID: <CA+=Fv5Q-iKk7qhN7TEbv4LuUeNau2iKwSb=vjx_a1w8-6mgEFw@mail.gmail.com>
Subject: linux-next: please add lindholm/alpha.git for-next
To: Mark Brown <broonie@kernel.org>
Cc: Matt Turner <mattst88@gmail.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

I'd like to wire up my alpha repo into linux-next, could you add the following
tree as alpha-lindholm?

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next
  contact: Magnus Lindholm <linmag7@gmail.com>

Regards

Magnus
