Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410847;
	b=ENaJBqir9X0RTDI8Jh8zBiqEEdzZj6PFBWUw+SuPM4nDJy2xuiq0BTLA0zEwU22TTKPe
	 5zodt0Yx7k8b7cbjh2Ua2bmONpiLCcHkKRjERbqgbGQU8/bjrDjw/aZ32VkjfKfYUT7XR
	 36DLMWlV8EfshGPp9zAKPNnlV3QjOR6YPAjy119YRxDPyW9ASPJ8YfC0KlNrp+DjWOnyL
	 CDEDvcgg0tdayZWwGh4zUBejTEQRBekQCfUFxTVAhBxp9tkaQCaZWO7ppQXSPOxhseTsr
	 N3EzSZ3CR52boIfRQ/tsDGWRnHz3OuG1G6fvBsTjnL7Zkm+G1xaucOiBvLsgRqQ7esA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=k7+r1wcmBXlzcUNyEBTS2c1P+mYURGBhM2xcEBNrIAo=;
	b=VobruxKsSG1QcI6QGUMqlMsTJ649bEu3VMAKgSQXhyOrUa/sGuz+FndSCnNcPcqrpzR1
	 W7Ki16MsYMLxI5HW1TvDpazUlw/O/6cZEoWjq6lKgVHiA9Km+Ev3s46HQTpwJ2kiQuw1/
	 u4p6/YZ8H8AW5zOG+8EzlxqWjX4uKRYJVs2E2H9uyNSgajcZZukI4ZveZkC1iw457E2BV
	 GLs8p6fX9PdK9jx1ahS36IaJ48s5h5x/pBolqBwG0AL2zn85V9QiJI9xnabgB6wqR/Ha7
	 MZeO3S7m1xUzX76w5te7BLJdA0uU8X6ozyHjCgXFDOov6lwUOhwYqqP2Kf+jLvXFxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="GsL2OZ/4";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB76606A31E
	for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 05:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GsL2OZ/4
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4c685c751so23767577b3.1
        for <linux-next@vger.kernel.org>; Sun, 22 Nov 2026 21:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795410846; x=1796015646; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7+r1wcmBXlzcUNyEBTS2c1P+mYURGBhM2xcEBNrIAo=;
        b=GsL2OZ/4Mo6bTLXTKfrUK0FbIXP/1qWkbs+Suznb/L3HShQQ4vSmJDxfkxx+3OWXn1
         sw4f1SFlFBshgqTApz2A87JLxgbHhd6oEYtVX1kf/VDb2cbXaDRC8kbECVBl2beMDl+8
         mozblqlQACTMV2Qkuvf0hzvK+yJnTpl6xzZtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410846; x=1796015646;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7+r1wcmBXlzcUNyEBTS2c1P+mYURGBhM2xcEBNrIAo=;
        b=VBTuGhNafakyeSt8pDQhCOf0r5+TXjtZBjG0IklTXm/RYeurdpAazwLhcWTwBxDyRt
         sPGTPnZIHPgCvoQH3Bc3j7mUGDCTGRdI4d8IdMnuFMRXQeZcSiI2TaM6q+SbgYnfVMmO
         0rH0bWghYR2xGfMlA/Rj8Hcv2MoaG0OYKIzLpLBTR3Gpkc6Y2UdB0Sk0kcg7C6cr6qVb
         qf3gc7DvH9BSkCQAf9Ms78A6L0k0TgBRaRLSPXaQdm9YbynVsR0X9kzpQqFoyhE78fju
         hOxgzVKrXpjeLbVYIKc7h/O14IxrUhFw79sXdBRtcyj8HyMjF5auQuLeEs6+2MSmnIOj
         FHqw==
X-Forwarded-Encrypted: i=1; AL+hErEr+vHWkPkrJiezHjWavsmtSBmZFlbMm5Ai4I2vjaGYYI0Aqa/ss5D64vWqbCsryTN8o9RPl+2DBSsp@vger.kernel.org
X-Gm-Message-State: APuU4Z8scWBeNRhfTyJgEPj7aYp4RWspXLCVxdKPXlqKW214n75r8hhh
	sKZY+hE+eWdMmjMwN66VSNtevaZ+Dhqjy5dkJhX1leLhE14sOKz6GqqhPmUbW9EIuoI=
X-Gm-Gg: AZFdTZeRtZ9HAY1pOLh9JJe/9iR3ZNXe/shzIckek7gHmxLs9L0Iq2fmlGdXaFptDqg
	DdGsGG4/jbOdaHLaEhCiHFjOF/2Ybrs2LuPfnoKZ6jiPaZYF5LJiD41IEydY5pdwTBDjosiG3Fu
	FWdMYaI67jpgBl7z6RRO6NWuVhb9HeuOnpXuv6r5jquEsiync2PaiZhNeCkCL7tXN4zhFdIKBip
	pR6Tbxvl9Ts/3fw9QJEwfzggdWMkNAvo8GPwst4TrlRGsVh8AUz4Ugo7+pUwUtgKeEACU36AdtI
	EyCCQtXjkReljaBEXBcTGTqxv0XK4LE5gov7z9sNDKzNEVjhulcBaJfweRwggQjoh6H9HK2QDhA
	TpgCT6tQzZkF+p9bum2yc/XGi6a4VS9MFJOjVXcjMhvVOBYSFxyQkcwxczq2tauKIzZUcjYiIho
	sNis6wrQUA+q8BtHH/cYvot9U/yJJnKmgyBlvd94vgX5Gk3CXxVKMDmfJqv1unC2hUhKvKjawiC
	7b5LkspeUO6Jxfv+psWqpj74LKKb9a/ZlQGocEWUd3ranMx1l3HP3TF64EiJyEGUFQqSUGeEMj9
	JCfo4dP80aQMah9EdTrzGHCu9KEvwA5ga+OPFdriiAUasrEapn4J4F6fL6aHhgchusoWfQaGsKL
	TKpzRToO3ByhKs988PzYBKLeDvNMd3xLTWDq7BmgX6OYiGtch/PTySdAWbn2wJQ+MBr0ZCxvj+y
	7NHk4eBkkHUfuQA3pMeD/8Es+95GDpi9Cesy8S4uK5pyIU9C3cV4w5sq03chS1PCXyYkyL5whCE
	GHtMguWCxGNuAmypG9GHxFGI+Yq29fV8S+lfB9jBBgD
X-Received: by 2002:a05:690c:15:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b520435b72mr34672047b3.20.1795410845935;
        Sun, 22 Nov 2026 21:14:05 -0800 (PST)
Received: from [172.20.0.3] (static-host-74-205-137-217.epbinternet.com. [74.205.137.217])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52035bd70sm41821627b3.44.2026.11.22.21.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:14:05 -0800 (PST)
Date: Sun, 22 Nov 2026 21:14:02 -0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
	mm-nonmm-unstable tree
In-Reply-To: <20261117091535.39481792f30792e6067a26a2@linux-foundation.org>
References: <avx98jYYXsZAmkDN@sirena.org.uk>
	<20261117091535.39481792f30792e6067a26a2@linux-foundation.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <awPLmjLsDIPg_dD8@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Andrew,

Andrew Morton writes:
>Chris, could you please redo?  Against fs-next, I guess.  With the
>ro_after_init thing that Kees suggested?

Sorry, I only just saw this. v3 [1] already has the __ro_after_init change,
and Christian has applied it to vfs-7.5.procfs, so I think there's nothing
left to redo, but let me know if not.

Thanks!

Chris

[1] https://lore.kernel.org/r/7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name
