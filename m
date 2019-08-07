Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5547CC19759
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 04:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2550621743
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 04:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/fjFJD7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfHGEDR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 7 Aug 2019 00:03:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38497 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfHGEDR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 00:03:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id g17so89860489wrr.5
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DS8TkoatmhBOAOl9/V+vPjhoaY+z/XSVugAwkdDAxDE=;
        b=b/fjFJD70KifetHPM3oBOkfqbuB3X8qM5XiUKl/O/ygxcK8TRWfCWG3yAyHX2mcX4u
         bda+TLKIzAwYDK+F0sxMuVEQClgAT/+1Vg2JeqrnqIeyxVEfojTLSRejKQogYrJay/j0
         z8hegFZhwSrUn0I/Z1GT442l9JkU8oZViVDsS2mSBmLTDjIZtdoUFuZ5cjZXaZ7+84UL
         zKeLNG9zlKXrrWy/jiMmmOMP2BcdMU59OwboLM+TeviH2blbVrJg+cFTv/s5soekn0/A
         wIhMmt6YZIxphAguaEg97B7e39vt13CU/8n9FpO/Aj6ocPPSvAk9UIDlpaa++u1Z4HFj
         cQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DS8TkoatmhBOAOl9/V+vPjhoaY+z/XSVugAwkdDAxDE=;
        b=EXaLzw9l2eCTfsTUyG/Xq78a+C2DqKWUMWnol/voeaoMotaboTcjqeieXlTjAA9Hyt
         iundnFJ3Ed2Ydc21oJOPjMEJu1XiVgDWtIpp5c3DdgEnostOshl//vpOiJMDa4LduStq
         7/LZFuhlcYclNDS+pvLtJYu6KWnncwqtewILZO+N2EErdP1jt7j9nv7Xrk5PRn8NIaFN
         U1aoSS7CnSIB1HTRp9ZpkqjuMnhi//MQsRP2nlBcQPZVWV+K4M3ueu4sbgHubM4LONYK
         8qJp8yqO+XP488nFfJvXrlkw8DruiVExF5xGZh0OKHDIIIj9Oq2quS3rDmXhCNKyZVQ9
         /Wmw==
X-Gm-Message-State: APjAAAUg1956hWW3Li9gA9XF98JthVIKBarq6R1h2vAcxERGt+Xfmf39
        mB7D4Pdq2FL1kk9D0aTijwCEyD1fegcrJpX0oaE=
X-Google-Smtp-Source: APXvYqypr7OZCh/KU83kbzMyUIE6B2KmPb/cud+JZwza2yq2Tl4YmBUJEBmRnmQ76YWLN1ImgGN8IIxHwo/lzSs3tWM=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr7224149wrr.341.1565150595348;
 Tue, 06 Aug 2019 21:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com>
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 7 Aug 2019 00:03:03 -0400
Message-ID: <CADnq5_Pet0SMuxayjJpWpBuWP4gZvkeCbOuQmw=z=iSi9bdNrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
To:     Tao Zhou <tao.zhou1@amd.com>
Cc:     amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Hawking Zhang <hawking.zhang@amd.com>,
        Dennis Li <dennis.li@amd.com>, Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        kernel-build-reports@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 6, 2019 at 10:56 PM Tao Zhou <tao.zhou1@amd.com> wrote:
>
> readq/writeq are not supported on all architectures
>
> Signed-off-by: Tao Zhou <tao.zhou1@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 558fe6d091ed..7eb9e0b9235a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -272,14 +272,10 @@ void amdgpu_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
>   */
>  uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
>  {
> -       uint64_t ret;
> -
>         if ((reg * 4) < adev->rmmio_size)
> -               ret = readq(((void __iomem *)adev->rmmio) + (reg * 4));
> +               return atomic64_read((atomic64_t *)(adev->rmmio + (reg * 4)));
>         else
>                 BUG();
> -
> -       return ret;
>  }
>
>  /**
> @@ -294,7 +290,7 @@ uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
>  void amdgpu_mm_wreg64(struct amdgpu_device *adev, uint32_t reg, uint64_t v)
>  {
>         if ((reg * 4) < adev->rmmio_size)
> -               writeq(v, ((void __iomem *)adev->rmmio) + (reg * 4));
> +               atomic64_set((atomic64_t *)(adev->rmmio + (reg * 4)), v);
>         else
>                 BUG();
>  }
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
