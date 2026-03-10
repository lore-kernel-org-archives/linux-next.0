Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07F31AABF
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156978; cv=pass; b=XT+4ro7p0aSkg8FPr7NaBcr9PggK/hsI5eRzSvhDzDtx3bobw2TnHs7ik4p8ZXUYJQPsuH5WUlFSVdpB+Na255GMQW4M6e4Sn1g3RgHTMhzZll8NOXn+aG8Xjsc9Gp8r/0xvAfCy/6iGW22epztISLjR43FdkhCf3dePUTIHA18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156978; c=relaxed/simple;
	bh=d3a2tV5nrqo0rz9ONmYfaZ3TdZhnerzNM71/TP0X82o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVlWtAWF33ott4arxQbmT9WOJZG+7wZZ247M5Fp6L5/9XXDZrEwyB2J1DRnEPUlCD98517uzVhWCzmBp4JmCOFcR8zr/Ov80Kd+WAAhd3Vk5txHPtMGxxVtiB/NgC6Fgr0yL2NW9GdPBFxNp6jrvTTJO3oU7RcwAm43ttWFOyVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOWIh+bi; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOWIh+bi"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46704177543so1306030b6e.2
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2026 08:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773156976; cv=none;
        d=google.com; s=arc-20240605;
        b=CawlroHvsquu8fUtZuNRkchAhDNycoU1gAMr6q+oiL4yScM/3a2jQGsGwEJxZLkgCI
         xjr+pIgcUbSOL5rcE191Rq8zZPkZ7c1M5b1WA3jlm7mt/FqfnmDCwPWi0svMemZoav5G
         KgavcTp30C8nylM8HW9cX3DqfrkHQgOI1d5s1gHZZjoCGZdY4f1Uuq6MQ92n7Nyl+5U9
         9qTYsVhlbrcDrgU1TxYDXQiTSTM+Zci7zp0Vjbp1yE74t2F+jaIPRcKdBiUN2rp4Ur+I
         xADvMplBQRvtVAX9SZKUpgPTEjg0nhM/PiEDv5dL/GrOEkxgRR5xpsN8J8Hod8QWnHgH
         qU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FH3GsLN21Xfn+bOV/WIfL9kN7JlMHSiLB2/TebpexMQ=;
        fh=oBNIUTwksfe62Upw6+Hhlz1IOTwO6z+zyvU8r0x6A/s=;
        b=V0W8Gl1477IlK+ioy8wS5kjR6ydUhY3nAYsAtr3/61xH4xthLfg94vW90272h6on2R
         WuoipD3iJOPKZlPuUgll+GDkAHnd3RVih7Qov6SoOK6uofSzCmu4SeuvKEKp/sFOPJc4
         s428oqp0JcNwMeym7PSAxhgL+7hwEztmWvUvHYaZFD2ckyQ1IfLeTXZYtpmvVJc/LdXS
         0BXc+xI4tT67cPzX+HQPOaWEDy0RYEXnaI2LYfeFNTlVpcCezZIVfTx5fodbxGzejX9J
         y5LPyFVT1bcF/Fm9kEgMqLzvNPFXqhgjj/ioKyfPgXG2ccROx3ZnDhNQa72KxlSoesna
         vP+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773156976; x=1773761776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH3GsLN21Xfn+bOV/WIfL9kN7JlMHSiLB2/TebpexMQ=;
        b=dOWIh+bi6+bMfkR5A7nGM1HPhACYZrptSfzXKpspRuikNJ4kcJ+WTtlVuR+vwj6t/p
         qHhhYZZgAxCn6O13HO1/opnloHUen3KV0GiI0gD85uqEOH7r5+gL4JiZB2/m5BCxFA7k
         cpZhZojkT+YoLLvWm8UfULXqUeam/OTOH6PQyc/8dPQwzhsTgClZZXALo/6m4daVI2ng
         bRtYZjCxZ+1zPazyP+SwFsZgxvgViIVuBFd+aWlkeF9A+X/YKgT+8HVGONh6ZcWIRZBb
         svBP3K7kjJE3uKJ6zTCn8o59794R8d7BgBPLZnFIDLGIFVjBFshBL3IVw6skmKsRz7s3
         RiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156976; x=1773761776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FH3GsLN21Xfn+bOV/WIfL9kN7JlMHSiLB2/TebpexMQ=;
        b=Uugu9/G2mFkP67DYRGjSSFKNbcb++DU9ouizcnMRrsdUi2B09LeO13uzAx69/QplrZ
         ASpSpA4iXrz1rohcYRQ4OEv2sDFHsoRZMfElYfUtEI06BY9Ghll/tHR8FzV+Z2c9W1mW
         7kWiwCSN3y3LAJtcMMSAcvXjSyvfBLeNtAJoJ3UkqPjiVU6xZsAFI2XPB62vN/PGsnYi
         nFu0EAi12KHHl0Duuupnhd+1r8GyoW786Y+F2GfoIleS/AQEnVNfCZ9RqBpShmEkbbbo
         DDRr17dfQdyEnm9dEWmCI5kzRvoDhLDI6QRljjzPBnRfRPmIx+/mF0xj57dlWkCTolee
         3Cxg==
X-Forwarded-Encrypted: i=1; AJvYcCV1xIGqwmMIet1J8dynqVqOHFucUPkemKSLRrAllJwUpJve5ijNxs+M7RtsN2d/fe70GEnCfLEw2GYe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/ZP0XTzb/xITj3xuKIeOlqEp6e5vnjVNx4AwlEK2SFwdHAoZ
	J+fC23gJ3tykujUM13QPXfpo/rdwP3RuLYSJWHy4UZCDlgl3EXoi6PQEujyhVtARQBMvZTnkYmz
	MqRsfydPnqsTtUXTdcFGCOptlrycyZEs9TWBkCUZuxQkJQao6PRV0EgJL
X-Gm-Gg: ATEYQzxEa9pwDgPwLntB27R7fbu//X5pnd2mKJTvzavaVN7QNghyZHMvF+vYsQDvJ+r
	xab9J7aaQ5westqaQBMDHJ3FT+9FddpY7ihEOkj2JWmvlYOjR5hglJs9usKonzDg/R+WRCEt5kI
	PGGYx6sm9Yvoq4NDLR9yEGGii3PguZlSPTbAgcIwuZVeok5BslJyhQmrs6yDU4gyzDA7kpoONLv
	/rzhYw4vXY0fUAfK589yF0/ZNRp9JtIjexA1x6paEPUWnftXT/UIE0YWnrc642UYi+Y4/hTmOBt
	xsq2wnlF
X-Received: by 2002:a05:6820:81d0:b0:65f:1012:69c5 with SMTP id
 006d021491bc7-67b9bd8f1f7mr9765167eaf.76.1773156975641; Tue, 10 Mar 2026
 08:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <abA38r3vfTOr8_Ks@sirena.org.uk>
In-Reply-To: <abA38r3vfTOr8_Ks@sirena.org.uk>
From: Jacob Moroni <jmoroni@google.com>
Date: Tue, 10 Mar 2026 11:36:03 -0400
X-Gm-Features: AaiRm51wVVBlPMTvaAT6EcVMD3GhJWvIEJ-4o8MHsdePedgS2U6yS68GfVGyJmQ
Message-ID: <CAHYDg1REy71bfkeovp+XjuCxa1JDZxpmK-gfgqjVyxSa0kNMEg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Mark Brown <broonie@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jacob Moroni <jmoroni@google.com>

On Tue, Mar 10, 2026 at 11:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/infiniband/core/umem_dmabuf.c:210:10: error: 'str=
uct dma_buf_attach_ops' has no member named 'move_notify'
>   210 |         .move_notify =3D ib_umem_dmabuf_revoke_locked,
>       |          ^~~~~~~~~~~
>
>
> Caused by commit
>
>   932f1eef09ecb (RDMA/umem: Add pinned revocable dmabuf import interface)
>
> from the rdma tree interacting with commit
>
>   ef246da8e63c4 (dma-buf: Rename .move_notify() callback to a clearer ide=
ntifier)
>
> from the drm tree.  I have fixed this up as below and can carry as
> required.
>
> commit 0cab8756cbc2f43cec2b8e88f2ea3c985491a426
> Author: Mark Brown <broonie@kernel.org>
> Date:   Tue Mar 10 15:15:19 2026 +0000
>
>     drm/rdma: Fix up merge
>
>     /tmp/next/build/drivers/infiniband/core/umem_dmabuf.c:210:10: error: =
'struct dma_buf_attach_ops' has no member named 'move_notify'
>       210 |         .move_notify =3D ib_umem_dmabuf_revoke_locked,
>           |          ^~~~~~~~~~~
>     make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drive
>
>     Signed-off-by: Mark Brown <broonie@kernel.org>
>
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/c=
ore/umem_dmabuf.c
> index d7ade877bf9d1..ad023c2d84d85 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -207,7 +207,7 @@ static void ib_umem_dmabuf_revoke_locked(struct dma_b=
uf_attachment *attach)
>
>  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_revocable_=
ops =3D {
>         .allow_peer2peer =3D true,
> -       .move_notify =3D ib_umem_dmabuf_revoke_locked,
> +       .invalidate_mappings =3D ib_umem_dmabuf_revoke_locked,
>  };
>
>  static struct ib_umem_dmabuf *
