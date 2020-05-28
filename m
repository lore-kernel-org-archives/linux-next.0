Return-Path: <SRS0=QR2R=7K=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CF9C433E0
	for <linux-next@archiver.kernel.org>; Thu, 28 May 2020 19:44:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BC652078C
	for <linux-next@archiver.kernel.org>; Thu, 28 May 2020 19:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="IZC/B70C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgE1Tom (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 28 May 2020 15:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgE1Tok (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 15:44:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E606BC08C5C7
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 12:44:38 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y198so14088418pfb.4
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 12:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ib/FHwgaIOdIUIJ7nCiAVwkn44DXgxvEAL/KIsGPktg=;
        b=IZC/B70CaBM17tiwjaASXWaq3p1H5KmrmkfylzojgEvAQlJ+Y2ljEL9eqnbgXRWXGh
         nd4QXppBun3LwTQGBG+yX7USHmP1+y0DAbZ5hmfVlIzMcN/gQMs0klo1DYBBRtZyMEhD
         rCLF32H0H4eJGsdFTodijrGcYwWLCVFdydaPjxEBab0eAXeqAZf1NQak/eJOjMAOwhcX
         WIjIBSEohCYvodjjwj1W6NyDxBREpTlhylFywm7lVQNDQR4okJ2rTwto7lslQ/7Ww/Uw
         oh+RTb25OgoMX1rHbS6Hg6+GYQIPwaxQBOKXDrZRa2c/6GPSDaoHnTrCqQTwSk7LHX0q
         42Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ib/FHwgaIOdIUIJ7nCiAVwkn44DXgxvEAL/KIsGPktg=;
        b=AVT01ZW/BSgWdGJtmgCmKNcoX8818ocp19kE+OtdE/9qz6cSaIn7REha22bPefxXiE
         z5CjsncmjUM+B6cIMf1N4e/OnLfnjQUlz/uX/NCVHRfGSUYziZWDwC0Y6UXFkmCJ+6QT
         LFVKnutZ9bFjmkPclK6Rill9HMfMAuf5ig7Wkwjk3Kkj6EAA67lLONvU24zcdEyAyckE
         j5d/HEybcOIKChT6e+fEi431v5FBtLkfJN+WZSQ1SocRgEsTInzjAML/Iu9ynnePPKv/
         NTqxfNnyT2hK8n/mr6C/AQ7xrzMYfpjdL9Xzm+LZS5TnyZgJ++uXGkYNX96TmVRtBama
         WI5w==
X-Gm-Message-State: AOAM533eqSkzyVBxzYH2YjTL8SXAZz1pAN/sRa+gOao7iu+I8SW4kQ4c
        pYJmWeZUUTTTgitJk+AiFw8HqMDacA5V+Q==
X-Google-Smtp-Source: ABdhPJxLCqYWjMiwubKEzX6kGygF5TG67qqXu02lJxE3KeGC6VmXsQv6RzRQm2eIk0fpB5AQVlFzcA==
X-Received: by 2002:a63:d547:: with SMTP id v7mr4537973pgi.413.1590695078382;
        Thu, 28 May 2020 12:44:38 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id y5sm6607079pjp.27.2020.05.28.12.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 12:44:37 -0700 (PDT)
Subject: Re: [PATCH -next] block: add another struct gendisk to
 <linux/blkdev.h>
To:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <9a8676b1-c79e-9963-3ffc-c113b11d988d@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c2c78d99-272f-eec3-993e-ef6684792d8e@kernel.dk>
Date:   Thu, 28 May 2020 13:44:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9a8676b1-c79e-9963-3ffc-c113b11d988d@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/28/20 11:21 AM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Add a forward declaration for struct gendisk when CONFIG_BLOCK is
> not set/enabled to prevent multiple (30 - 50) build warnings.
> 
> In file included from ../kernel/sched/sched.h:39:0,
>                  from ../kernel/sched/core.c:9:
> ../include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside parameter list will not be visible outside of this definition or declaration
>  unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,

Should be fixed already:

https://git.kernel.dk/cgit/linux-block/commit/?h=for-5.8/block&id=dc35ada4251f183137ee3a524543c9329d7a4fa2

-- 
Jens Axboe

