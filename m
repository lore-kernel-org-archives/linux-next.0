Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8515C433FF
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 04:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 894F8217F5
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 04:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olLNrj+m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbfHGECt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 7 Aug 2019 00:02:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54311 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfHGECt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 00:02:49 -0400
Received: by mail-wm1-f65.google.com with SMTP id p74so80235954wme.4
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 21:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cvxwh5Q1CDvq6FjXTDwKs9pxhptkpkbLpHFBpcmZjFY=;
        b=olLNrj+min9+DpiwL88xfNWSlKYSkBlGciRRSCSLUzj4Q+PQD9g2uATz5gvqMaDrLI
         KcpJaN9ymOMnh74yVqt3OEZIKEsv3KH2RYsMA3TAVVgFy+nSFtfWpl6n2E9yOfU6bwFt
         vi0Zq7+K1Z9nTup+sHKIiAXlvRs6C9f4Hp/bci1Hh5YnDCVhHZQwYDqf/3DxWLHfzfRn
         SAA4iw3VRNeHuH7Ii8oCsTrnZS72mqyJQQLejM0amKEdC8JWKa/HK/F4nnyBFJc2UK7P
         /NGa0+yvP3aqznf9PZu6LTuxTw5Il+6Hn/ZplEEmw5mcoVMq6SJcDVCgRjQdwThC7jWS
         5R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cvxwh5Q1CDvq6FjXTDwKs9pxhptkpkbLpHFBpcmZjFY=;
        b=sdeLEYha5g5FaUaLYBjyGHcwL+ACGU4x0zTJUndD9Ca08dAdWWFSrpKPcNwRSyxC0X
         sWZVk8gGIBUsYZHaxDd3MxkOh3V/XF6J65H23FcKAq1pvGeA8f4oe1yBN7bZTa00qrGx
         i9wnRV15K5SaeGg102ADNYXmWrHUsI2/Bu5Bhe/mwBBOhnDxme11WsQSDbuWBDcZsvxa
         dC6+gcCsHc7o/mIVjn2yzNSFtPAJJYgWDwm5wCbpeaQwle51/VkxzoRzqMpW4uRTnPEI
         xR8jyJ6IrYwoGCiMTH9qguA0a2dLMI/QoHQixhCBiG4U514Hx4yhMdLasFnbuuwNoOd5
         yqpw==
X-Gm-Message-State: APjAAAXJp8Jbng6hsahanQ2FMPceOslMu3IQwoh8GCn/l1pOoRvuf1qm
        pH9/3BkckXIq5R6mQh6bEyIV+fVAf0MdHwNMnlyKEaQZ
X-Google-Smtp-Source: APXvYqzqi1md6aMDXZ0aEKmOL6kqcE4x97weuxHXac0i/Nb9bm41r9lGuXyjHxP2jv8v7CweNvkk+3aOrjWKUOQbeuA=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr7387863wmc.34.1565150567277;
 Tue, 06 Aug 2019 21:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com> <20190807105759.58a28ef0@xhacker.debian>
In-Reply-To: <20190807105759.58a28ef0@xhacker.debian>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 7 Aug 2019 00:02:35 -0400
Message-ID: <CADnq5_O4SJexzU2V5+B8tBcTPDU6nR1LakaOMpNng5veOo4guw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     Tao Zhou <tao.zhou1@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "dennis.li@amd.com" <dennis.li@amd.com>,
        "hawking.zhang@amd.com" <hawking.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 6, 2019 at 11:31 PM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
>
> On Wed, 7 Aug 2019 10:56:40 +0800 Tao Zhou wrote:
>
>
> >
> >
> > readq/writeq are not supported on all architectures
> >
> > Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 558fe6d091ed..7eb9e0b9235a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -272,14 +272,10 @@ void amdgpu_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
> >   */
> >  uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
> >  {
> > -       uint64_t ret;
> > -
> >         if ((reg * 4) < adev->rmmio_size)
> > -               ret = readq(((void __iomem *)adev->rmmio) + (reg * 4));
> > +               return atomic64_read((atomic64_t *)(adev->rmmio + (reg * 4)));
>
> atomic64_read doesn't equal to readq on some architectures..

What we really wanted originally was atomic64.  We basically want a
read or write that is guaranteed to be 64 bits at a time.

Alex

>
> >         else
> >                 BUG();
> > -
> > -       return ret;
> >  }
> >
> >  /**
> > @@ -294,7 +290,7 @@ uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
> >  void amdgpu_mm_wreg64(struct amdgpu_device *adev, uint32_t reg, uint64_t v)
> >  {
> >         if ((reg * 4) < adev->rmmio_size)
> > -               writeq(v, ((void __iomem *)adev->rmmio) + (reg * 4));
> > +               atomic64_set((atomic64_t *)(adev->rmmio + (reg * 4)), v);
> >         else
> >                 BUG();
> >  }
> > --
> > 2.17.1
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
