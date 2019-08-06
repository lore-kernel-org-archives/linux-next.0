Return-Path: <SRS0=AeLc=WC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BF5C433FF
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 19:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A57BE20880
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 19:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwYoxePl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfHFTp6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 15:45:58 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51295 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfHFTp5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Aug 2019 15:45:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so79400595wma.1
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zqnY4zoExYirv5j275kkSZM5xl5DmrdpmTxFwF+lOzc=;
        b=EwYoxePl/KS6w7E7Ft/Exsa8u38hJ3WVuPExyN5cC/FDcWzSAHXyg/Q/451kVCnuSc
         r2yVnbykRxLXcYvajEd0Ihn60FHLEFnK2GktLeQocU1RHcL/AaLTGK8cSKUlNXhAtpkY
         HNmclOmV7P78RMyreNQoaVPEC5L0i1g/dQ24Brdmuj1/bHMIbh6pYN7SNKhT4aq0IXjl
         zsGaQPTnJBbfqQGKY8qsHepf6Z4rvtViRbKhHjCUHqIGET23NOPzwD+hEd/JuWRKOh3a
         gbmJERJJr4ETZorgu9ExtCQabyJvPLwNnbER5ydIXqEMbyw65lkJKfnmJWvfwXErCwQC
         WUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zqnY4zoExYirv5j275kkSZM5xl5DmrdpmTxFwF+lOzc=;
        b=Hk5X2Ux6h6qeDwTd0UsyjNVuzbUt/5QtRG8vg4HtQXcQps6V12Y0KTceNr41f3+mL1
         FxT4LjB6i1T8nGieXuOCzxTKhsrS3p0pfKGg5uYY37rUGp3OUIJXk/7GorCxZUMJiwoS
         qdxhUXmXmQpkR8RRQaNdJLEBSE1H84ZeUjdyTYkPIHoCaPS6p2kt41d4DGBqd9bdxR9j
         cqZm6IfBNO1D/q7FBJvT5maS8wF/jlisx6DlcJ7UjYneL24hvy4anEd/R7oKAcNOQciq
         yqBxmN5XOXfRNKxIlG+bn9GFhOXTp6UTYx4oSxc3RSRFVNFgNm2s73c2D/thSCymTaE1
         TE1Q==
X-Gm-Message-State: APjAAAX9S7cmsbxk2V8+nIexHF6Np4QPhlXumtdqqFZyOdpr09LxSZQ4
        3JubohiGxpbOOezLMi/JGENxWWY7M/H6YvTx58Y=
X-Google-Smtp-Source: APXvYqzXwbQhPH1/MtKwj6ayoXZ0LVip26qAJLlPdhq0Iu78rygKXhUnocsYSmd520AxEmlG08hdIWBRfBfsMkHCL3g=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr6386822wme.67.1565120755598;
 Tue, 06 Aug 2019 12:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190806103156.3778-1-tao.zhou1@amd.com> <a19ac490-a803-84c0-5598-e78edbb3447b@gmail.com>
In-Reply-To: <a19ac490-a803-84c0-5598-e78edbb3447b@gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 6 Aug 2019 15:45:44 -0400
Message-ID: <CADnq5_Pv8xqexv_gv4F1jBis2RPuTgHfr4wb39OpFR6kJF9KcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix compile error about readq/writeq on arm ARCH
To:     Christian Koenig <christian.koenig@amd.com>
Cc:     Tao Zhou <tao.zhou1@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Hawking Zhang <hawking.zhang@amd.com>,
        Dennis Li <dennis.li@amd.com>, Mark Brown <broonie@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        kernel-build-reports@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 6, 2019 at 7:26 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 06.08.19 um 12:31 schrieb Tao Zhou:
> > readq/writeq can't be found on arm architecture, implement them
> > with 32 bits operations
>
> Mhm, wasn't the whole point about using readq/writeq that we needed
> 64bit atomic operations?

It might be better to use atomic64_read/atomic64_set like we do for doorbel=
ls.

Alex

>
> Christian.
>
> >
> > Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index f62d4f30e810..aaf7f31cf8df 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -29,6 +29,7 @@
> >   #include <linux/kthread.h>
> >   #include <linux/console.h>
> >   #include <linux/slab.h>
> > +#include <linux/io-64-nonatomic-lo-hi.h>
> >   #include <drm/drmP.h>
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_probe_helper.h>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
