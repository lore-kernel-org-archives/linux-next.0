Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67016342177
	for <linux-next@vger.kernel.org>; Fri,  6 Mar 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806428; cv=none; b=DcPIDxSnU3ZSS8gcFmRFU0rxjiap47uDeWEZDCdOkWybZByTcbbqfxtkM+me3b6Olir6sl/KX6phzdfOdTfDHMelz0zrHqwmaNqGVDB4RW4JmEmZ+a9+PmvsoxGs8c0Hnb3Nnke1FJ0I2FHouqKwqpo/dEzF0Z/3iIlFi2uZXS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806428; c=relaxed/simple;
	bh=ZyUFO4AlSnqVpcWmctFa9ah2L/c1bifcZ1/Q2SIbKks=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Lrk/gX1AV7yOj5CH78oS7jTEtez5Ld6+Ejiu12D4/EzM/27A1+uI0H9Cy6OXX/vEfzBvVrfoVF/YPX1M/uv5oVG0VD/XQ8MKDMU8gNvXNekHUvJoUC8yoWMWd7Ga9mPwl/sC/B77eV1k4amqoCEjWCJ6a3G7/GlfUTvO1OKEeWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=UrJdq1gz; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UrJdq1gz"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fff13d5a19so181858137.0
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2026 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772806425; x=1773411225; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n06DdaI/vzZT1206sO8RqlYgBmcCnT4QAakgEHnE+0Q=;
        b=UrJdq1gzC12hYCYhsc/w8u39XQTboUbEEpbRB6fuf7Z8zlqjduKyn6iLq6eQi32sgD
         JWvQ+VIaOiV9zIfA47SMx+L7LZIyV7BWzwH5Y9d/KclBqlrg8/k2atcNlVrpACjA/Jaj
         Yz9WhWwcBxIDyoXx8mdKryqsdzTUQuVDE+T6RM3x1Tp66ZTs1OwpMfokKNgDa/dmCwR8
         5AIPbwG63OS43YrUih/agkAzORZAZ/Lfsale39q7JQn2lWzMB20Hc7RHyNjj7HrYC83p
         9ufVg5zZjhaajtOTW4L9LhBtVnDYLrUCJt4YMjbOJhmDkQbi2Rsdk1vgAqu561D6cRV2
         qNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806425; x=1773411225;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n06DdaI/vzZT1206sO8RqlYgBmcCnT4QAakgEHnE+0Q=;
        b=ANVZ22yVPewrbyyAvAhRi2FvaiWWsP71lDehz8Fi8e33fuqJ4jq2xTUQA14XLaETGT
         r0NfkfS4OCYIMatV27Am4LSmAchOv/iCPj437afSuvylrKlK6jGeXiU9b+i2L2Nzl2md
         p3znacXCVOb6K6/HnG28rLz9uL+lyt1GW0UG/DKy6Jj4rfaDiL35E80sPtk/k9pFbpcX
         PzhlthYEIllf5xwVAaUY8n5fyM+3NpqPAPzl1HqpfXQi3MY2V8seufQtJtpfFF6bJF9n
         p1UfcaHmL/6ZnIxHQckfd9lkL76OUQCMq0tYnDLWHa549HTz6PUAESTJfo1jzBUw/h9V
         nIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhUAr010hbKAVyLMAKopx+C6wQEh1+F1c6OC+s/TOA0rRrHk/Qsg2vvCAktABjJZMKfu1J2lmZmdCf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxks/0o56Ld/RIYEgii2K0lxGFCcc9ovvxIsIf1aiHOLE4ncfkn
	m2MHLPVdsMZjHv9NNjn/f/ZGcVzUlJG9skmEiH9pgetlePeYVOObHJWpZ4KtX99o2SZNJtRjm2y
	Lbz/7
X-Gm-Gg: ATEYQzztcH8jEnD2G06IFMQ2s05z19MlRv+iqQMxSx6FNnFhnQ/xrWcJJQ5euIMQFRj
	+zN00HmFNUA2QvYDbUHWKgxNI+dor1hJ+UDhKad6sWqJtwheuhIsj194fOQhamfB3nPFeYUgkk2
	iQL3NW5KLgzrEn9kYTSTYKwS5laVovdXmOYPm+UjAmHTIxIimNwvn56b6yclGYfnMTEsuiyJWvA
	SqhxRHgUnHYgV6a5DEbaEilwCDjlrqmzyQlUTOTPkUocfyWBNe2VYc9wlvo4Ye8jnQ9+9YAJpER
	s9F3yNh9tjRnQ0ImTQoPSHy9GHCJXjDkHoa2w0AKA7MR1Z5F0lU/FpmQ92INR8bOh8nZjHSgzQP
	+3mQsLwQW9YK04ZeR+ONlwkIC5E6lE3xGwuUkVh2bq+iDNVouhSVJ3BnGtyIbmWtJghppohCzor
	mY/tyxQeAkEEQzLF1tZzKsSQfQ+nMjmduJ9BlQE/VOs74HEcxa1Hjcb/z2VAopuHzFOpNESsBdw
	GcSOOnJlOeSIJC1g3lK3r/HJ+RMwne/gfg9gHw=
X-Received: by 2002:a05:6102:c8c:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-5ffeaf07962mr514254137.17.1772806424785;
        Fri, 06 Mar 2026 06:13:44 -0800 (PST)
Received: from smtpclient.apple ([2605:59c0:119b:6708:5c05:eb1b:dd7f:fb41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b57031fsm1503049241.13.2026.03.06.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:13:44 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jens Axboe <axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 6 Mar 2026 09:13:33 -0500
Message-Id: <218A0752-97E0-4291-99B3-6D7D1283A513@kernel.dk>
References: <aargMJFh-37NAsbc@sirena.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
In-Reply-To: <aargMJFh-37NAsbc@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: iPhone Mail (23D127)

On Mar 6, 2026, at 9:09=E2=80=AFAM, Mark Brown <broonie@kernel.org> wrote:
>=20
> =EF=BB=BFHi all,
>=20
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c: In funct=
ion 'iwl_dbgfs_sram_read':
> /tmp/next/build/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c:135:15: e=
rror: implicit declaration of function 'simple_copy_to_iter'; did you mean '=
_copy_to_iter'? [-Wimplicit-function-declaration]
>  135 |         ret =3D simple_copy_to_iter(buf, &iocb->ki_pos, pos, to);
>      |               ^~~~~~~~~~~~~~~~~~~
>      |               _copy_to_iter
> make[9]: *** [/tmp/next/build/scripts/Makefile.build:289
>=20
> Caused by commit
>=20
>  4f2ea80dc6c44 (fixup! treewide: fix remaining read/write iterator convers=
ion issues)
>=20
> I suspect I ought to be applying a merge fixup however since the block
> tree obviously isn't intended to be in the state it's in anyway I've
> merged the version from 20260305 for now instead.
> <signature.asc>

What branch are you merging? rw_iter is just a test branch. Next should only=
 be merging my for-next branch. I=E2=80=99ll check later if I messed up, if t=
he above commit is in my for-next by some accident, just drop my tree for to=
day and I=E2=80=99ll take a look later when I=E2=80=99m on my laptop.=20

