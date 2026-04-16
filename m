Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3933DEAD1
	for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349307; cv=pass; b=UBDcOAhGRcmnEaEgua3OnTBykOD0b2uJAqX3H+2EuQ2dpw+f5Gr5T0gI5JKvqDY9+zOtWqFDMeH3RjMbIT3hlf2lL/eDcu6LqFkMXxvExzBFCblvKHCtZo+s0vZZy/411h9ydIRNaehYWxoLRmxo7S7gBqai1z57lN18xQvhy1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349307; c=relaxed/simple;
	bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SK4b8q5ThcjojxwI9de9VJXw+R+6ZJFs5FgBrb4SJtZcu5ul41r8xgxVZ9/lt9+/3J1tZ+ohjGam4dH5EOY/tRJEanEazGkl+wtiTXBf79tXmx6/5bg/UUc2TKrKE2MlNiGbX+tvwMB3PYDAjCH8CIRap/ohz0g6sCeBv3X/aw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZJ2uH/7; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZJ2uH/7"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e6ab06167so1340606e87.0
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 07:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776349304; cv=none;
        d=google.com; s=arc-20240605;
        b=iy6ayW90lbUZE9Ubot5zc0RfpqR7Yc0u/klj4XxhxzFpHMyxZf0+i2y2GD1ZJokQxp
         /xiLKEnA7F2wCit70svqgsLVfIRjkTyIW8/uLQcMBern+vgE/36xZ1qGC8sWMMTSDR6B
         EzoQxDor9L6fIf3fUwaSTuacKkZf3b2vL9ReX3BZyY6IJhyGheiJGxabP53/TSvD4clr
         d1Ca5hZHj6UOIYv3iBm6th5MNyhE2yfiKfDyOL0mt3gem+tEFYwIPJIEWNDlGpS1SrQX
         IemM+7jqwzoqMAeDnLxwaH2+f3Fm5iEnlrF1X3HlZF2W8XgnPQ1EgUBoC6UnHhYlUE4Y
         YrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
        fh=R4qUU++L59/qh64Q8J6b/dBiRJIv0Vfb/QTH7YstEjo=;
        b=bZyKqrq4Nwh2WLoTkzOyA5p/ToIeHrvsidxwzrggDCunJsRzH/YhZpfheeBtDn4slb
         gXbcLBwoj+ZkiOcxqejEQCESUYBJ2c5j99c6k3mz9ED6y6FEV1VXjGlGunGw2G8THAwl
         oBpNZ9giCeDi3z7TqvZAk9xl7aoXr8d+7KYiDgbPoB5hSJOxA5xvGHXVK+4CLR8tDqtt
         54IdXrhXF1cZuSMPyDytfQwRC0/1msK0/sytBgr/ZA08XdBkb9FHNSPxCRSaWKAwjA5S
         eeesWcd3erzy/qaNC1H6fETBc3vCMp45N3LBUw3LFvjkG5zJRWOzuDS4kNYVcKMQYmKv
         RT8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349304; x=1776954104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
        b=ZZJ2uH/7AIlncy8xue0J7AFcTAkBXPh2SnbPtGx4uDCvJPU6B32n8xAUhTf419c2FY
         Wj3xj6xb+RzGmcgNmSyHP70ZC+Fuuf5kA7CuBqyxYfw+eKMsWe+TAefn+a8KgWz8npFm
         PcdGwlxpfy2F8ZwThdygYOIGpyW3dUJtPT+smvDc6wPHblo9JzSePUyub2tK7OAbBtL1
         EqYNm8VPyrxUkVyHU7mnTfYf2B6IPepWxaHckIv3cPaiTfj2GH8TvkiUOn+8hkSmygId
         eVtGf0wo4LvFzPJKDqcgZmx0NicXDzFaQz+bu2OgMzz5yuHQu1Y+vECiBQCOaFSPWo+J
         A3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349304; x=1776954104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxOwhS2FDWc9ixFa3LgQN6gRNfuRoFH5aB+qGv/WyVE=;
        b=O7xb8enz8mR1zs9bS49GwQoNL1fnmWnu7daGjiaHG5MlIi4rdzBReeNPeMmL7biXM1
         7GOsWz0IhzHIwmf1Oo+VA9wU+M+Rd3MMiW9DBVVkliT9xXDCiKjzrVokAiTwByfSToN6
         /mDUhVPxOtjc5gzeZ3OoQ1kDApPwSSKEUUVpXCloQt6045STkS9ZRkBxe4i/tyaCGyPe
         xu464YeeiaD3TOnOCMl9yDJcN44O3gEld2rnmOdRWJ7nP0f7E7Y9YM+PG2T/zN2sad4H
         Hkw/XKC3fhdHhFy8zRDOIvr6Tab1cAY7lOO0NFK8FaKkxmR3ZRmXW5P9CowfQVICAcwd
         XeXQ==
X-Gm-Message-State: AOJu0YxQiW4suS6AFh5vZk4AEk19EotMu3gkcQx8BUxNTLU9bf5MLsC3
	SPZatXnLlVD5tIRuzMwwBigBZqp4akZ9li+Vu1lzpCv2wg1kHbmdIKsGMy+oBQgnL3SkESQQ4le
	yQVA0gsG293ablu0QI7WERurTXiWCAGw=
X-Gm-Gg: AeBDies0FXekxDaSv1UKqWmPjI8IfT2m+1BTP2vDT7gWd+EAEDNveUzZKNyo0FeJXTW
	Ym8Thb37Q2e1YG6Bqdm0r2LDaZXwfEaApnBdbwO/BIsVdiAUTfR2BP0HrrDWTydDdk+goCBdykA
	1cpq/HK3Oi/Kh2PotN9FxGXaNEc9IwT/MC68oKJgNML8fnFcgxmICg+QF27B0ruZf/qg3OPcjk9
	c1vaa4Dm6otEd/DOR4TqNBdRcbWVjQxk8u/tFdmsQVbHmfFS/f+Bd0j4EvQwXV9bNamOFMC/xL/
	pOZVm/ua4QjChlOywjMeHDqXxa/EsQ400LAAhCWJD/qaz+saub6xBSCNB4ps6Q+RjRlrRkrvQD6
	p8oVzbt9/cQWIQpe4H8YMb5U=
X-Received: by 2002:a05:6512:3d88:b0:5a1:38c4:424e with SMTP id
 2adb3069b0e04-5a40fddd84emr585786e87.7.1776349304126; Thu, 16 Apr 2026
 07:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aeDrt2FkMD6ZWaVS@sirena.org.uk>
In-Reply-To: <aeDrt2FkMD6ZWaVS@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Apr 2026 16:21:30 +0200
X-Gm-Features: AQROBzDSw1n5xKGRMRYnlZwT4qYegkVwm-YkQL-Am7-V5rgnKG2Nddsqu5EA96M
Message-ID: <CANiq72neRbNCDYaF3Q1Bj5Jt9HrE2LmLksBPR3VoFokxHfurMQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 16
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 4:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Starting from today rust builds have CLIPPY=3D1 enabled.

Great, thanks for this!

Cheers,
Miguel
