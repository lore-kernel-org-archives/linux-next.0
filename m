Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD2221FBD
	for <linux-next@vger.kernel.org>; Thu,  2 Apr 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134752; cv=none; b=V6wM6T+EhXvD/I0SlVRoViYprtw3/icTSl24Gw6voN4CyDDD20uNi98ZJ67g+Ok4e6woWOKqqJyZR9cLjsJYkc6uskpSI/cRKvFkovKgwnqDn0WcZV2PkQTdtZ1JOOqFgxtG6Z/bfztJaNtnKS66uqrcgrKRWTfnb1xYLguPXss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134752; c=relaxed/simple;
	bh=gQ7zm2N8jthO9W0DV52rud0Kv9ZG9/U5bZzlkqRVTrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxYZRPOVoo5d4Cwn07CCd3Wo2vFaZkB0elZaFDZoXGiLVJdJjg53rirBH95dxnbEUhOpv7RMlCQVmu7AkAUBAkDfGq9Ob3M9f4t3aRRAde40DtM+u7VPUL2Wzc5zTtlo3lnwxAr20Fxj7opU0wNc/7CpHOgoUL/p+WYakxu2IuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=AZmesciH; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="AZmesciH"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40ea36b56b7so705688fac.3
        for <linux-next@vger.kernel.org>; Thu, 02 Apr 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1775134745; x=1775739545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItWcLERel9KAHwoTJhUOFlhjT7RcxBos0H/0Y7sPm1o=;
        b=AZmesciHkmU6hq3iwsmM9h6XOFmwe89TZKwxBv2yxon7e+XeibQ34GL5ABbbSwup6K
         m6EOWDhM6rtfYgC+pXCy1pngS511QKENf06Z0F0ryna1lrz/Q9/XfsuFsu0hBhTMC4tZ
         r0Cv/o7C6ElmpjMnYyYNGNSj9sMiXsOavhZ6BJFOFwE1XonjzTSMhp9dK7U7AG8rfjH1
         mWAbntV9swVpv1uWWHhLZC46J1kHPmkGsJupEErnZQq2Ia8Of24P76SNMPXxv6vj1sYe
         PwUBjbrJTWE9HGsIcMJiJcBOBi396e9VgwX3uXcoeXhfrtM/YbH87TIAS6EF4PHLJ8jB
         gpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134745; x=1775739545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItWcLERel9KAHwoTJhUOFlhjT7RcxBos0H/0Y7sPm1o=;
        b=RQkwEug0no9qbwFY/2oOjo/mJF3D27aQA7QkNodgN1SwfYDT+QWLVblikCNND87rOq
         l+GCaicyt/4x/AfOCUt1AsnbAk29Q2xiaSd0mlHAePzlVIeXkbK4dD089BUT57tZzCuG
         nesCXwYm7KbbOe7XpxdNvQnrxvBUva0aMmwrNbsldYmPY6DyuhSTGm2RDA9ocfeWUnlA
         q4tlHp10G0Zy1PrU6W16DMhbXu1PGtsnXEhL+6Rh4Dkyr5LpOf6v3WMCF0IaM0o8B38k
         Hqwq4CoDW/XOop1/yDvcf+2heVhW4uAaRNk4RuH7Sx+rgDNbv81wiNJtZsGGR7CL10m3
         WEWA==
X-Forwarded-Encrypted: i=1; AJvYcCWSpZarhY2QtYbixj06P9OklJoaIz77OtRlZTv9U8u15IhovHAhg0YrQAR9mOoTg2t0MBoO1zyEs/bU@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVnuKqopstHp5ycLxG7GaZk8IVoZPksJvuA9oXJ8DX0qNUibj
	7+bAqQdCnr1M9BwZKtxVXol/5cXPgdw3ZyuOHx3jHVw6jBK3JBo/sbdbHAOy5vspM+I=
X-Gm-Gg: ATEYQzxsxOnRcP15yDL/dpheAaLeklnjZnhMccC3TJmIDJQgm8cxr1M//Ad8OM6125U
	E0S4v/MWPJd92n/x4HHqf9YNolxtoV9QM005//Hl03YUUV9G46DnCZqsYXKJgpwaI121DI80JBy
	nnPg6iEOAN0bC8Mbc3bmxaTVA0AjODELfdVKqiRAc6kHKbnM6MQ2r00y218s6bMsOIgm+JhqILG
	y3apZk8WmCeR8wIk/Wm5hovqV9r/8ZWJbe4rTA+HqACmONJEaJsEA8HqBLLFDeCiDsOPoTjEDWW
	mIGyN+ifHu8NmOPaata4xJhgC/DsmJ7ejnPNqknwrOQnNq+OEYJt64R1gcq7Z0V+IUPFhViBG4i
	cXQYZYE1Z41hTKRJUzVqhSHDGyTtTLsq+CnL0Npf1/AzlGtmWXGD0LgVFSTEkHGyOMEADT39UkO
	+vGvJzDZG3v7DZsWCFaSglbbBBEtsr8yEb7z2iq81nrUMEjhv2wRtCzF+GCuKT7q0HKsqbcv0PW
	u7ershTBT3glOALdmch
X-Received: by 2002:a05:6871:3299:b0:41c:ccd1:78b4 with SMTP id 586e51a60fabf-422cfbeb5e6mr4576093fac.10.1775134745214;
        Thu, 02 Apr 2026 05:59:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb25c447sm2233192fac.9.2026.04.02.05.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:59:04 -0700 (PDT)
Message-ID: <4d20cb99-a529-4cb0-9c80-441944e1aa60@kernel.dk>
Date: Thu, 2 Apr 2026 06:59:03 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the block tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>
References: <ac5UWqRPp54d1bM0@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ac5UWqRPp54d1bM0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/26 5:34 AM, Mark Brown wrote:
> In commit
> 
>   7a9ffcf2cbf88 ("io_uring/zcrx: use dma_len for chunk size calculation")
> 
> Fixes tag
> 
>   Fixes: 8c0cab0b7bf76 ("always dma map in advance")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Fixed this and the other one. Pavel, JFYI. What I usually say is
add:

[pretty]
	fixes = Fixes: %h (\"%s\")

[alias]
	fixes = log -1 --format=fixes

to your ~/.gitconfig so you can just run:

$ git fixes 8c0cab0b7bf768594e8efc73f7b8f3d5abeb74f1
Fixes: 8c0cab0b7bf7 ("io_uring/zcrx: always dma map in advance")

and it does the right thing for you. Nobody remembers that full git log
line, and then people try and do it manually, and invariably mess up the
formatting. git fixes <sha> is the way.

-- 
Jens Axboe
