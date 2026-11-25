Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607536;
	b=aKo9Z9fVxUZC8K8e09pA+mlDcvavT23qAo2fq4PnrpacgU1Eey0td056mS5/QKzmvRAy
	 6dH1jzzr/OJ8DRdlWBbYPkHLLIDmdTL2pLWxF/aba5upSXR8Sb51RLH+bvNbaeGoAclOV
	 0xW8lWk7MkPQwLb+QjCxUseWfDCAfQJlWlcllK8J364IOO3wsgl6e/tQwSe7G9ciV9NOo
	 74EoXhKOrhh9jKWf3a6p2qmfp8x5fnQvdoaXjlH2GSmnIiWahporvsC0/668o20arYTUH
	 d3eyPeuCWvv4YvsXaIXHGe4bENEVayb/GK0YWL0GWiJO8x4l190xxr0oj/TXnqceQ2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
	b=jZUxoXVKZCK5em7ERbQa7/X/FluKgiv8yD9Zv6j3HGDd7WQpwL2mBJcPvMnkB2MOiibg
	 SY1J+aJ6ZTwIm7Okbro3y4efd8uzRyFmufSp5JjDg/DRam8FpmtpF+Q7/3ozbfCwcc739
	 yCVKbXO8aWN6tmaY1musEBbyWUQZbk1VPRKc5b9a8JZqV1uG5vi9UV28u9TIN7tr2Bj4P
	 Kmr6gwR1u+XYNTWaTcJ4U/DDt0meMLdPyv0vIUnEMa0bSQ+RFxR5IB0OMNaKi0Mdj0Y2d
	 X0LaOb5pvsgPX9QhRJjDX3Sjjv/bN07ZGEURwWpu20v4/MdlRFF1/j6Y8XIJ6Cvuk7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57037606A32C
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 11:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57037606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqBOILI5
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so7646035a12.0
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 03:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607535; cv=none;
        d=google.com; s=arc-20260327;
        b=QOfX4qgHZ9TS7ioNV225nNruyxWTWsmOGuWYDSOrtubM9E27W5AqKuokBsC3uGvvoQ
         pdH3MC8F7wZiwNVw07QJQKAGat4JR1Mpq+8p0hHdhO3V4vKTosL6KtnObDbrIiSX7NJJ
         CO+YUKk57JwsMcmlIpEz2ZqgpkSsHLZ1BGAMZGMJEOOpY8cXqPHEYnDDkxnp+iL5ZkFS
         T2ZG54JzeSzgCJcdbPJwEc6UFVRMLqGybLMZ1ltWb8takygAoKHC4LcsmRQvpSN37441
         1sF8Jj5jQ51A+qPQqSn6ZKcK9r/9vhfYIBPxDLfjWo8x2Bjp3px16ysB2d3UC4DcjyUm
         /e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        fh=nPnbAxVcoY6XFCOTo2KAiCTYBMiw/AWs2aJFhLOpv+w=;
        b=GJXHzZFO1eLQhqQQVWLYWfp6BvYT0kK5qbErNcxe9vpvN++tW0cd53ilF/6xh7fwwV
         hX2wp94H98FK5LA7pvL6VGFG8wL7M8YxcA5efnia9U3IjncV1Uphwn+Rzt7ATcrtBFGX
         hdp9s8hbLsrnwFEGhtf/+bMv8J2ZtwsTJTlH6VI0B1Oe2PE0yn7XhS9EqzEIm42Cq6mG
         1DVkitBXOCO4YHDVV9VhJjwheFpsHHiMSideQlIH9NvWr3uCbBB7TuYx2R18nYDXHosM
         WV9BCbU/hYGnibBfhhPywOPNA4zG5nrbD9KtTw6Tvf/Pk45qUPzeklCB+oKZiA2MFTRS
         X48g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607535; x=1796212335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=GqBOILI5YHt+I8rgrwlbLHY5BG3XvSU+r+LHqw3oI7Xy0/F1mDTEwsdyR/Vg4NAa45
         Lm5t/VP+Y3VLJbd4SMm6dsdhwLsOEkLXgBKY7IhDbCRVTJW2z5+dEGbV75/b+OILcqVH
         Htz/jZJaC1jTlUIovL+B41koB1HHMD3on30Sq24mS8XcpKvZn84VEQVDg78rRo3NexCv
         CfUpZ4w1ozN2VEO3DGF34fg0s21O2V/GL4YDulN54roVhEA0MtAJ5Rzer/ir/Fv35qKe
         X1ChbSIIuM5mpCM9ks6E4geN5r0vm3yNI4K7txZiLyzSdnRqWF00BxvnRVlU7gqrA66V
         x4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607535; x=1796212335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiTLwnT8J6kdyIB5NBxt5frLTB5XA5RQrMtJGgcHBbQ=;
        b=Cbw7tn9Hfzrf/Z5eRVftDdVEbt4rpxYmUUam8Z7OhAK0egzx7Vx/jjMsp4Pw83ackK
         eGiZcPxU4bWYlOkU73Vf9V8GjCtgYKxA2cPfFzNvP5Ek575NpeG77rsXQes+wSEdGZyZ
         O42p+qH2TbJUUlDUKnJoLhsbWG+/nFFVpWuV0W5Cs/re+lGrirryVBOIEt6d2zUMOmOh
         io+VpolM41QUBEJjmqMcstDtHywqzzHiqU/YzEUtUL36iYEwW6NLxIewdtysRdtVUPB7
         HcTBX3afVs5hI8ChtFtvwkZ2O1R3ueyUSrqze27e6xihrDXZqopkgmD0kjVU0gjYePlh
         mWOw==
X-Forwarded-Encrypted: i=1; AL+hErEgTZmCTupkZ7E+swcNGVSvsmZ01HeInhMHQExvuAfPzB3FtGMd0pBn4N7tJ0ylMrhg/K/uATciC+ix@vger.kernel.org
X-Gm-Message-State: APuU4Z9785pLK4tVdJJSRjLZFf72HiBSgz6AOvLa0LXXDYNhCCL9nzBS
	9JDg1MzieUtWPlZykJ/fg/4x5ZBmfP5ItnEGr9B0tdYljYGXx/anNyeSOtNTlsW98pef5VFxfJw
	0WTD0qFHK/q7FbAqnUYiyXQ2Dys3h3yE=
X-Gm-Gg: AZFdTZeXoTfm3rMAYWBMiKSv5LpXq98HarIOJWjVLerrPKKl3AUB6ylrOle5NvS+cjA
	azmeGygwV1E7NqmYi1Z0LPPAlP7FygfHzpaoNEf76YMakmWsGD12lesizwhtF5oayfc8EnjcXS6
	ZV0gDqxlzT6Suxr1u1wUVF9sDk6xnCtBepF4wil9MVYzUe6Vf2Dows17dCK8YFjmtYA4gs4bJFa
	Gj0xZeVvDgbvdLqZXnejYwfVCQH/q19xb8mnMLMj9Vi0obhiy1+eCnoaYfn5i2e/175s+SHK5yo
	bugo6q1agH4vWrwx99ztwfKAVtviz9ywaxheBkyN82sc0G92PNs8CojLySssk7K/zgH7UnD8RBZ
	rbr7XCCg3N1W7vqLfb9lAeiMJUJEd/31xjxWpC9gTBG96Yg2XE8ROglgyoKZJb1/MOOxhqQ==
X-Received: by 2002:a05:6402:a592:10b0:6b8:8706:8e91 with SMTP id
 4fb4d7f45d1cf-6ba37d6526dmr10123892a12.12.1795607534606; Wed, 25 Nov 2026
 03:52:14 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115103809.1288167-1-linmag7@gmail.com> <20261115103809.1288167-3-linmag7@gmail.com>
 <awVzJMLVw4wUSqky@monoceros> <CGME20261124232303eucas1p10f2da7a94c8aa19fa4e406d089c1367e@eucas1p1.samsung.com>
 <CA+=Fv5QJxoxEoKxRpm5Hisdf=y+VpmM-s_VBC1tDQ2FTCfb08w@mail.gmail.com>
 <3467269e-9929-4c9f-bc19-847976f49527@samsung.com> <awa6Owm3eDW3EitJ@monoceros>
In-Reply-To: <awa6Owm3eDW3EitJ@monoceros>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 25 Nov 2026 12:52:02 +0100
X-Gm-Features: Aa3M54p8sDF24v9l5vsIDk_y4hlZnLV9zBkxaSf0Tu8Y_d4WDzlfpPV0l4Su2os
Message-ID: <CA+=Fv5RttOgZp9vftYN2XfmV31TyC_o_eSejruM_bbf6v7zfBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: enable contiguous memory allocation for
 coherent DMA
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-next@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev, 
	joro@8bytes.org, will@kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe, Marek, Jakub,

On Wed, Nov 25, 2026 at 11:53=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Wed, Nov 25, 2026 at 09:54:08AM +0100, Marek Szyprowski wrote:
> > Hi Magnus,
> >
> > On 25.11.2026 00:22, Magnus Lindholm wrote:
> > > Thanks for catching this and identifying the interacting commits.
> > >
> > > I reproduced the error on next-20261123. In
> > > arch/alpha/kernel/pci_iommu.c, I changed:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL : dma_alloc_contiguous(dev, size, gfp=
);
> > >
> > > to:
> > >
> > > page =3D (gfp & GFP_DMA) ? NULL :
> > > dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
> > >
> > > This fixes the allmodconfig pci_iommu.o build. A full DP264 UP build
> > > with CMA enabled also passed, as did an object build with CMA disable=
d.
> > > The full allmodconfig build hit an unrelated cgroup sample error
> > > involving PATH_MAX and LINE_MAX.
> > >
> > > I'd prefer to keep the Alpha tree independent of the DMA series.
>
> That's up to you, but in my eyes merging in the immutable branch
> provided by Jakub into your tree (or rebasing on top of it as suggested
> by Marek) is really the easiest option. That way you don't have to wait
> for the change to hit Linus' tree and there is no further need for
> coordination or others paying attention to not create non-bisectable
> commit graphs.
>
> However looking at the immutable branch I see it contains both the dma
> API change and then separately various adaptions to ethernet drivers.
> IMHO the immutable branch should only contain the API changes (that is
> the commits up to 31f7e12d621b) to reduce the amount of possible
> conflict.

Thanks, that makes sense. I guess best is for me  to rebase the Alpha chang=
es
onto the shared DMA API changes and update the caller in my CMA commit.

As you point out, using only the four API commits through 31f7e12d621b
would avoid bringing the Ethernet driver conversions into the Alpha tree.

Jakub, Marek, would that commit be a suitable immutable base for this?
A separate stable tag at that point would be helpful.

I'll then rebase, retest, and notify Mark before updating for-next.

Thanks,
Magnus

>
> Best regards
> Uwe
