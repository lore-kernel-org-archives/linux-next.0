Return-Path: <SRS0=APSk=VI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF80C742A1
	for <linux-next@archiver.kernel.org>; Thu, 11 Jul 2019 22:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 041DA21019
	for <linux-next@archiver.kernel.org>; Thu, 11 Jul 2019 22:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="VH/9uOk0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbfGKWD0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 11 Jul 2019 18:03:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38625 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbfGKWD0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jul 2019 18:03:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id z75so3569050pgz.5
        for <linux-next@vger.kernel.org>; Thu, 11 Jul 2019 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q8RZCLFdcTRhPC9HdHVx8tpyTmGbfsxe7u6TfcnHY6Q=;
        b=VH/9uOk0fZ8tODBZyyOskKTIUklQdEW5OYBC9oYfzFrsJTx3D0DNt27s57rBPAPi8S
         /hOfMakDXyl3MKvRO/VUlg7IdjKoZpvFhHuYOK7/G5ISxjOJnUHfQUWgksBrDoP/tXh9
         +Y9QBeEyDrY1J6JP0j/ITtX0eygfD1/U4GS0N93BSHb/oh2WQYiBI2yOhVcegP8X3peq
         aNVgh3fpWGKsR9Gop6vaL9tquFl3FdlxhjSs7X2WZw5cx6xj6xosjqoGPspAD0KZ4mcF
         /i6fZ62O0gXQxN1UZQJkQ8da76TtbI/xOaYoh81B1BFmwwt/7m6plFC/FDG00f5z/KfS
         PLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q8RZCLFdcTRhPC9HdHVx8tpyTmGbfsxe7u6TfcnHY6Q=;
        b=cWvwYwLUgInCg342Ggp6A6qUPoYNaVOcjfVJOYgFFWKRNJMDb7D8/AqELjhNzeTB2V
         KaXWyDz3q+A5aAQkU/dmYeE33qgwjiITpFsrIcj4W5/vx+DqMh5Wk3M11F7z9Fo+P/og
         7aoyD6VT/qeCLoOOcpmFOmYyzmzt1SsTfuugOJ52g+91+ZgeYTTSlYkux8rHgShxigS7
         jLmpUNMNdKZK7VOz+zhUr/HHBtI7ttaRKp7GyjlA6rRO8NFlmh8RDYhiXV9FVMinTvD5
         BLVjqnnfwM0zY56rs5o++Rcm5/F6tCX1do6hpd3jebrv5rC9fY3Rm4qmGhY45peWF3E0
         tATQ==
X-Gm-Message-State: APjAAAX0lAyMQ0f7O30LHC6F8n3vAHrgnXRcS6ioEK0wnkgQ12rVfT1W
        Pug19FNcfI4z3WAoQRWbQ2g=
X-Google-Smtp-Source: APXvYqwmO2wRtqZNIfjEe4Vpym1QieQkvocKU859foeTq6yi/NSz56Kd/1PTaDh1F9AclkrrnPVQTQ==
X-Received: by 2002:a63:5212:: with SMTP id g18mr2387440pgb.387.1562882605792;
        Thu, 11 Jul 2019 15:03:25 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
        by smtp.gmail.com with ESMTPSA id o14sm6161760pjp.29.2019.07.11.15.03.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 15:03:24 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Minwoo Im <minwoo.im.dev@gmail.com>
References: <20190712073511.53bd6665@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a04e21e3-3bf7-276d-ccfd-d617e88c80b6@kernel.dk>
Date:   Thu, 11 Jul 2019 16:03:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712073511.53bd6665@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/11/19 3:35 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    8f3858763d33 ("nvme: fix NULL deref for fabrics options")
> 
> Fixes tag
> 
>    Fixes: 958f2a0f8 ("nvme-tcp: set the STABLE_WRITES flag when data digests
> 
> has these problem(s):
> 
>    - SHA1 should be at least 12 digits long
>      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>      or later) just making sure it is not set (or set to "auto").
>    - Subject has leading but no trailing parentheses
>    - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.  Also do not
> include blank lines among the tags.

I should have caught that. Since it's top-of-tree and recent, I'll
amend it.

-- 
Jens Axboe

