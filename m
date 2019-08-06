Return-Path: <SRS0=AeLc=WC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D3DC31E40
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 11:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAA3C2075B
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 11:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoejvXx4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbfHFL0k (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 07:26:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38017 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfHFL0k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Aug 2019 07:26:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so54744243wmj.3
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/bvE/+rT0hqQd9DEVs/wAQSXv8Qv9MrLv1HMgeH12XY=;
        b=OoejvXx4Lwte+KoWCzvOh8zT6a2jBCn5tmxATTCyE1IfLYdWwc2BQe9RRsmiZNHR8T
         K2V0XzrzTGtSil3Zxegj2HgN5p3U2XNUWLm76W6TcX7+XJVnlxGF8DdvDfHU/acDLQxe
         O+TyLzq2AZgNunii/1t23V7R/4DkooMnnNvLI9A54iGISwQfv2nNma0SxzYDaY1Wo0f0
         HTCsXWYRfnz49VqJppdcmvznJE81AuJF/Oz5HtU/AhtffSk9bT8hk8LmlLEXDoxGeKXo
         JLZ6fZA9RxerIfyVcG0dEqIC0Vttho8Al+rOsdZBCalZdfRW6ZF+zVzfO27XpTpVbkBy
         iSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=/bvE/+rT0hqQd9DEVs/wAQSXv8Qv9MrLv1HMgeH12XY=;
        b=M0aX0+SuszQ59zYrTp1sYlRkA6gF12Aq2jpv6LNn9F3HLWdIcZu756cuu8h5OVdLX0
         +CfgZ1n+v/SlbZWx/h/CYrqRK2wZL6S1Ddq1iUYTXsvNboQ1NwCUz8ZUEei9ZAtoEloE
         Qz78Ikqa9TSZWBP82RshQPjOEwfcHQ3WXdtkIAt33TEHc60EkG/GjCmYMdiEJA1dnE0f
         bx7iJWefhfsTlAjJS2uDgEtoZRJee6llabi7esVZRkDBHQQTK5WP4bidR226OdYzNCbv
         92K36KHbd96OQ5HC9ZWecg3S4vyDdoFDUT8HfkDoOZAp/0U+tQeFsCkS9V9yyIz+Rn0i
         DO8w==
X-Gm-Message-State: APjAAAXY/7/2GEWtJtv1p7VNe7HR8liU98u5FRJfNhPAe9mrPg7kz3DB
        r/RT/FWtqKXtNzXSzLy679s=
X-Google-Smtp-Source: APXvYqy+aGW32eLte4S/O5X+3t5EFW+6HZI3ZHqTmkeIaX9Usk34wMHzhohgAORdtpN129ijwTzGzQ==
X-Received: by 2002:a05:600c:34d:: with SMTP id u13mr4477382wmd.48.1565090798068;
        Tue, 06 Aug 2019 04:26:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id 66sm2286039wrc.83.2019.08.06.04.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 04:26:37 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH] drm/amdgpu: fix compile error about readq/writeq on arm
 ARCH
To:     Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
        alexander.deucher@amd.com, hawking.zhang@amd.com,
        dennis.li@amd.com, broonie@kernel.org
Cc:     linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-build-reports@lists.linaro.org
References: <20190806103156.3778-1-tao.zhou1@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a19ac490-a803-84c0-5598-e78edbb3447b@gmail.com>
Date:   Tue, 6 Aug 2019 13:26:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806103156.3778-1-tao.zhou1@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Am 06.08.19 um 12:31 schrieb Tao Zhou:
> readq/writeq can't be found on arm architecture, implement them
> with 32 bits operations

Mhm, wasn't the whole point about using readq/writeq that we needed 
64bit atomic operations?

Christian.

>
> Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f62d4f30e810..aaf7f31cf8df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -29,6 +29,7 @@
>   #include <linux/kthread.h>
>   #include <linux/console.h>
>   #include <linux/slab.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>   #include <drm/drmP.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>

