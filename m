Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D8C369D7A
	for <linux-next@vger.kernel.org>; Thu,  6 Aug 2026 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038838; cv=pass; b=KbFyeOdC90FT0E3AwKOTMKlfecTLmUBoss5ItLf2pLeC0+8lv+9sGIdRvmvdymkM4/47ZjtjJuw93qSJ21sIW6Whh4W9N08deGnPiJwOXVkWXuLNiWlUNrmyTGBSHwAE0pVF5Yr5LJWvkfQgUm4zpDbDOtVb7NtIa4ZChZohsYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038838; c=relaxed/simple;
	bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDzBqVOmr9FufV7P8oemI7I82fp+8NIjCr8VM+Vvai/B5AIouZ6BFo6QnNz1IHjE5qqkrJqKxpb1wT6oBsigE0AbffnRtsjZOYHT5V5Z1/7K648dWGCAFRunNPugwLoUFx9431uiej9oVdK1+quLdLxCxqqSExST/JjVLg6ICqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oo+j6KEe; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oo+j6KEe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so2672455ad.2
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2026 10:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786038836; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3ZgTnMX1s1qzUVTw/QMnmeYhzx3tv0BiDc6sPX4MXkgEGDNhb3hZ0l+Pt4cNXt8RF
         bUPvKy3uhIZcFnDUPjisDb8VBzFiRa0jiqlXNJa275jZdzg+QMPXwagAaA3yPvj9B9fh
         1bO1a1EULbZfqt54ovPHKBl829SfQa8dT+0HgNWoo+uMIjWcyTnWMIC6mBwMe5gxDAK8
         BlzvBNpybX9WfvHyhjgnDst/1L4MBpU3Yfds17RzwdiF4Meq243OIdjgGOcpfL/kcElD
         nKW4R9Z2JbFoOHcKumDLcmkqiVTxB9Ft8NQoauE7aplBNLzgI+Q1dFVLidXBTuzKl7Z+
         FZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
        fh=XoM/IJT04BOcv6HIqWS7lA/1UUD4NZmOtQvBvkaINHw=;
        b=CWic4B3/Dv4pAbcdIVZssBUCBpG6iy9l6AasUIZSl+yox9R78HSrZjyTHE9YR5Gerz
         CGzb3X/4AorxjaPVKvVt0NubRqaTC3eDPGymD2pBK84p6dSoz8Bx+PocEA5UdqLHnTnY
         +/DEYVEUGsfvlg/dNpRpJl2QWWLHb7K3XNnlEvYwYFQ+/w9ZKGiN3oni8Vqhc3fRibPa
         A+PDaAIPbnZRHfGjWL5bjXeOp+BnE4jGXRSacIjsJVfTLST61uTOWEMGN2t0kOhsO4Sn
         wHlpwEgOVzBJJlA4TvvRn3RhEcnf7h8tkCY9R9PTXFcGDY4H/u1nJbf3avz/oU96IELn
         n2DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786038836; x=1786643636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
        b=oo+j6KEeFbR9o3HjUJmzLjJtVse+ageMUPIzirvwVisIR5nTWdF67S3z3e1VI7UBxM
         wMMvChHvbOafjTCOn2AYozEolxEKAKxcn9WWc+rdT4B1YlgcGroAzSBBOS0iQhomOfWQ
         z1RkbuOAD9dYuubMMM9gEZJkSkylub4v+6z/Tm8nZ7r8MAor3eNBpL5lOdljtOq4eA20
         Qx4bXJlWJYL7jLjoWVYzk/BArc/K37jlrJvqqBNUn6KYtCShAI446+ZCTB8rQHdDBzlE
         BACFMRY1QDqiK1Zj06a5/D3+ejpePaAyduRq353APp37Se/xjKJA9svWJP8HF4TgQTEY
         BzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786038836; x=1786643636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
        b=eZs8BM86gZK6CmqCpHYnoVTHA+m9iltLS+CuUm/1c/FphSK5DJqwWWWoqzicLyM6P7
         Ty5ycZsnuX+ktUIjr2WzT50C371Z6nafz3qIf7JBrcUKXjzUlLYjkvjpKoEATcaydVn9
         BSUwemFbKlVuNtHBqOMQKSMV4asIh7x7co1fY1rq7jtWOvyYpgdjmZhN5iPy93pKcuIc
         UBMzWgaohfpSi3frLi1+N6nV0yNzmZodyxmQFHNIX+vriCuFcF/KQYQxzProRiKz9mGi
         L3g4lNdSfNPM9PKbrhF40HoxTADoQKYmQMpYDIxPOxQvGNNaEPxDBg+I8KkGdx5iQ9tW
         qElw==
X-Forwarded-Encrypted: i=1; AHgh+RqsHEOhmsQmmlZtnjl9R6EFUl10qQGNZHfEcC/WvKTzV2aSwJQnjGgH71SF8/PY3NLcWwaBKjHqRv7j@vger.kernel.org
X-Gm-Message-State: AOJu0YzN1c9xoEf3M3dHKVEInEexNP1x9yGDvjzing7uVCIt2gnK1imK
	UuHE53ABalx8MC4D1XUXHNurelt4NcTyAyA8/A+Dui4kU/TjV23eGY41qX9DimdbD/+q75KrYb8
	mvFFxtzSZqCeoUWe8rAffqfC2AkTDL38=
X-Gm-Gg: AR+sD12oGhE11rKY04eHsMAszRzo8KtEE6GTK9eIduIlE845bUgDMSgDg7yHR08FBX4
	6Dow/Ffd2hQzEDF0feaEI9D7vR3+vfGQld0ANX64bzXqlKX5TdlunZGPqffEiuVavsBv+9i1f4H
	0R6V6GM3htbn3YvIJnnT2m4uYE5ScXT1kkyCCEr3+feX/Mmc64aplN+9MAF6I5Crlv3fX1HSYJC
	G9uSo5Oz1izhNxY3+XOiTsx3j0aOfeTjuTsfPtDAU7HED/qHA235iqNPSM6pYY6wyM4WB10Feh8
	qnbSdRza9B9+5ZP1XSB5zWhk65EZr8xRMG6ImG/+ZXLMMHQlHhNk/CcKhm/taArFtAPM1h1y3fg
	ZybfIVPGUEjGtUqP1Br/oi4cGRqM6R3Z+1oPBAhMC0wR5BRmPjHHqqc/SD1SW
X-Received: by 2002:a17:903:19cf:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d0cab0db0dmr153501185ad.3.1786038836158; Thu, 06 Aug 2026
 10:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk> <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
 <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk>
In-Reply-To: <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Aug 2026 19:53:41 +0200
X-Gm-Features: AUfX_mxalOypU0rpE7BnWTwTbtLAHW7HGYNPe48IeVPHDHscmiN_P_36vZMyZtc
Message-ID: <CANiq72mzVuEfaf0xuDLMy1M25Xu+G2WvEVC-E8Xna52hPTn9Pg@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, linux-next@vger.kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 7:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Yes.

Thanks!

(Please let me know if you prefer a proper patch etc., of course)

Cheers,
Miguel
