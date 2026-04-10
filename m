Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C63CEBA5
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830033; cv=pass; b=AX+r4Miynvui/rOSzWCZN5HY7/usTUu7/yXbMs+owsSYf8RqYeRG6sExDSBE+bVGsVszR72iG+CUQNwIiIL93cScHEGP2x7DEf6qMTa2cxoWLy9Gd2EpRwIcNhwS4ZARR916jy/zGBPe1f7nKBdCvq63vJ+eFLiHkixnvsWlQ+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830033; c=relaxed/simple;
	bh=dRT7zI4qHGGTquKymQxL752qgzu5UAKGXRlHaGNYAGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAsPoGKKrNGnJldfknFpgiZWY+wAP81QwnjCznw/lxPIaAEXGZUJJPRYBhtsuelBSpwfYgM+Oijlm7yRY97Ac7pl8V1NZbgp8AlcEXu62dXFwQqULBakEGD0ERCSGKmEFtsqeChhg0A6Lq2hLi5CKS5j5DU4RH0UUS/RL+NTWbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3dACh1P; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3dACh1P"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9358bc9c50so305364666b.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 07:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775830031; cv=none;
        d=google.com; s=arc-20240605;
        b=FTpUKrZurlEcaxKGScH6Af0QvZTaF8RjzLs7IzCfp20dsse8nodwX21Gf9tHW1b9T2
         pmkYXyCcbvbiFuw3oV+qotlcVkbLVk4xGVy/hxvmzboHkeXZ/J/tkdQpzG7kBxU3DmVZ
         W45sx1yBRrkgKnqpCKv32Vfgqj4KVA65FoA3aW0NnRBaQ3bZAeSxzs/MPDhblmvXDO30
         VoA2GXlcHqL97LvVNt1HrTeijUUERCcOpUBz7DnMaeHB8tTs4accdkJLZeYe0e352/Dr
         v0owCYzkqfZ7fu1PfLdZjF7G4s6Q9FuZ3R/jpy1WI7QHwqRoyDQKm6HQaKFpFp1jJE9E
         z2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7QztuYj2+YPxHFsqeBj8RkIsj0A+J82n8lSDLxBNak=;
        fh=8SFSVAugNAhyECVY9pErN3PnHxXHt3p20KDC4Qu8LYQ=;
        b=lqBfreYosyFAWWNevOgeyISgM+do2vt9sQdSegUnmol4uZKZ0ewi2hCqPURkUOD66m
         FpfL44DY2LPIup+BdQbesIU/69JayECoK3busrRyksoLvcgez3iiKJnERAgwHI2IcZ0o
         kqc+KfRe+PwUuQ0mmkXyL/ed7+XGaVkGnZwTOkxk98LH0cS/0SPmHIZLgME3GeqMBuSw
         LT+7qBT/hNOxepA9Gv5TaocHTjH37Sd2Vf7jYyBSnYI+SATb0ou0ZhrX9sKFBtxDBsHn
         y4uKNRj/JVIgsf2yQJGrdTi5NOjU2z2XgYVkpd2aSuvGyzwXgDwNbyzn4S5J/3TLpWEt
         nXXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775830031; x=1776434831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7QztuYj2+YPxHFsqeBj8RkIsj0A+J82n8lSDLxBNak=;
        b=P3dACh1P4yLKA9adrim7Wp04Q0lzcgtD1Jrr/dbZLnurO0KHYxgbPp+w0+QyTsuKfr
         zrhl5RPFgfe9q/W7o/bRG7EgurDyYyvSbsYk4vTRPLP8nrL55x5/UHRZHQLLM5mWIP/p
         jF7oWGKVraMGFiY15ZgPM1gMudKm3Onzo/E4j33ld/bwD7q5wuNdyfwesLPalDKTzu05
         kvTy0TtbSPZq/uUZrsvroX00fh/4K1DxmQgeK9R4JWC5KiqW/zz+HT6AarFbG3F4wT9M
         NvwoBhbjsBOpiPGGTEcL9ssg2XlzMWzEXfPOJ2kpRLMvHg+maLp4ecPXff8OPQc9auC5
         xH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830031; x=1776434831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7QztuYj2+YPxHFsqeBj8RkIsj0A+J82n8lSDLxBNak=;
        b=ELOPhRIV23wQ5dOqHg0+WRKxdBSndUn+mzPM/E/oq2lyw5lTcDYskH/VXZuVagBOE0
         dY7+m9nwN42uYUgLxEGI2d/JEOq9wl1NkZqYshATtKW0NPIbV108C0g/Q+3wHz4w5nVY
         WDIip8NzofHjYunZbtPxLrSSFXlev711zoiVN4hwme0gPpVHyUg3JFBvuiNcikvWkXn4
         bDW5SviNVCgmn9nx8QXKVa2k95wirZZabwKHI6vpGb+LhpRRrdXj+bXZO4tI5LYh2Zs4
         u5ozXamv3xrGiOrbZr/Yc6F4+kX/8EI5yQvp794cSiJ2hd1zYa4/AwFMJDhR8jOtxlRH
         +4tw==
X-Forwarded-Encrypted: i=1; AJvYcCXE1fgwIwdSVa9e8ov7OAmdKWsx576czeyYjKBN9x18aGLtzle4c8To/I66f/hMvrLrN92NOSZuAROa@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJD9YOv/TKGPFpWkKmKEVxcHdRQTvDXa63yrWM4yYU/1rHKlr
	7sXfhYBkdM2D/WdlbZiqqOmwaFedgsPml9IIHB8KCwn7eAFrkPyUakmtJj3F9BTCQYAhB5lN2si
	M/WDl8CILI+nj51iIC+98lh3Wtvrs8PlKBzCOMi9EXg==
X-Gm-Gg: AeBDiev0lAXIYMZAvp79ENOESd9TGeM23Sh5EfoZe3kGExBVzKqe8OrNoX09VCcKtiL
	L1Mt3CPsXOXuVx3fFs15RhrgOoFxTuWqBRzTBaIYyTekwFwjewU7z018gykKpVG/2UQNFuJ2dfr
	QAPTEYF4E0sd3hWQxXE64e9mmjuZAHgCinSn8pl7wY+xV6z/tCysoLhwmu+D2uetGBKUOkJNmMG
	UR6zoSskwXyk/pbJtLnvlpMEHkJbddgkSTy2/PDCdpsNBrTOPG8JDYSgzRkN3rHZWu/Zo87CbTv
	nGbdtaYgr4jreLGhoDdFPROuEdKGudE8G3WlwMs=
X-Received: by 2002:a17:907:26ce:b0:b9b:7f2d:923d with SMTP id
 a640c23a62f3a-b9d72661536mr207795366b.27.1775830030380; Fri, 10 Apr 2026
 07:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410123703.937822-1-sumit.semwal@linaro.org> <c427afeb-15eb-4a46-aa6c-fe24631d24ae@amd.com>
In-Reply-To: <c427afeb-15eb-4a46-aa6c-fe24631d24ae@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 10 Apr 2026 19:36:59 +0530
X-Gm-Features: AQROBzDTpEfzR4ryK5YAY1RA4qEovpocT3VJx89MYLkdYmV0Mtz-BnQUmSjc1y0
Message-ID: <CAO_48GHyBz-CEap=icQDKqVsBgCy+DNazd6ANzf0NucE5yc1cg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix htmldocs error for dma_buf_attach_revocable
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: leon@kernel.org, broonie@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Fri, 10 Apr 2026 at 18:14, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 4/10/26 14:37, Sumit Semwal wrote:
> > linux-next testing showed this htmldoc error due to a missing extra
> > line in the comments; add it.
> >
> > Fixes: be6d4c9e9d714 ("dma-buf: Add dma_buf_attach_revocable()")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thank you; pushed to drm-misc-next-fixes!

Best,
Sumit
>
> > ---
> >  drivers/dma-buf/dma-buf.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a202a308c079..532c3f14bf9d 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1353,6 +1353,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "D=
MA_BUF");
> >   * Upon return importers may continue to access the DMA-buf memory. Th=
e caller
> >   * must do two additional waits to ensure that the memory is no longer=
 being
> >   * accessed:
> > + *
> >   *  1) Until dma_resv_wait_timeout() retires fences the importer is al=
lowed to
> >   *     fully access the memory.
> >   *  2) Until the importer calls unmap it is allowed to speculatively
>
