Return-Path: <SRS0=10KW=YV=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0938BCA9EAF
	for <linux-next@archiver.kernel.org>; Mon, 28 Oct 2019 03:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C836C20679
	for <linux-next@archiver.kernel.org>; Mon, 28 Oct 2019 03:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="iqavAp5G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbfJ1DZL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 27 Oct 2019 23:25:11 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45525 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfJ1DZL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Oct 2019 23:25:11 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so5859995pgj.12
        for <linux-next@vger.kernel.org>; Sun, 27 Oct 2019 20:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iuuv5uDzwQjuDzXqpsithGymUPeE73L3D0NeEzp8Q00=;
        b=iqavAp5G7CGwQYt0MWbkcL6EzvmJ+n3PRBTotiKoMMZjLT6V4QFfwpTr+u+vwScKD3
         KpVutZfM/P9dzi5rPohWCEOKxw/+MDYaZJ7evH+VuGZUyWFoNsa296gMKRSkhfQ51ZGR
         AgGsF8JqqNnY1CZn3OIIShlpQOZY41kmWdA5swBm3Mj+mwOVYEQVxC8p/7fdnD+0nr0T
         mVLJwZ+7g3Su4tEENVu3y3hcWGRx3/gSpmcsNFCFvVAmsLyoCH9a81g3aF+eE7vnrWtq
         FxT9W1WvQNEjC9uz3Tbv0Fk2rMA0MrGR5tpvAZB8w2SxwRGWp9rKcpiB8i4j5m1nSO8j
         6xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iuuv5uDzwQjuDzXqpsithGymUPeE73L3D0NeEzp8Q00=;
        b=XLMNXY8ZoW9v43dk4dUIiLs3uXTNds5qzWajXiNKYYBvlKvtsi+W8M33EVctbc4WX5
         nIsGS/sqKplsXah84Auh0hvMz9ECclYJHyr3izud7E9l4LyEiVd6kgY6ww0faj/L433G
         SforXweYd8aL2WBZEK0ZsGnzgcbrpKrw3BVghBWxiujVLryJoStapg3kp2V+HoUHCRxC
         UQ82JAjR3UEkJnnuWnNl0YyXUn+ypWOD81FHFqlbn/aJXWSI8wpeZs3GDmLNpLkveeBF
         8zCZuIzzFbazh/NlW/qQcRLrJ1UXq+EYB+aO1Iq3Cvkp3/1msU+NcDhcTCVtm+TCo3PI
         wVFg==
X-Gm-Message-State: APjAAAVKy/FkiJ1cAK45NZsnlZxF3nvDgbyQNR4OgXRBbEoFDwjQ6H1X
        Mt1fcrXq5LAdxvtBP/cGPOR9YXx+NgoYUg==
X-Google-Smtp-Source: APXvYqzaXi4g/x7LVLX5SWooWOl0YI/9dw1mF1GZ4B5OOrCrUhnAkiY+AyLAxR53ILruyo2LWer3cQ==
X-Received: by 2002:a17:90a:4804:: with SMTP id a4mr3869284pjh.102.1572233109088;
        Sun, 27 Oct 2019 20:25:09 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
        by smtp.gmail.com with ESMTPSA id k124sm10106917pga.83.2019.10.27.20.25.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 20:25:07 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191028135945.5b2ed0fa@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <27de542b-aa30-78e4-40ad-4a024e42e643@kernel.dk>
Date:   Sun, 27 Oct 2019 21:25:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028135945.5b2ed0fa@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/27/19 8:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/io_uring.c: In function '__io_sqe_files_unregister':
> fs/io_uring.c:3010:12: error: invalid storage class for function 'io_sqe_files_unregister'
>   3010 | static int io_sqe_files_unregister(struct io_ring_ctx *ctx)
>        |            ^~~~~~~~~~~~~~~~~~~~~~~
> fs/io_uring.c:3010:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>   3010 | static int io_sqe_files_unregister(struct io_ring_ctx *ctx)
>        | ^~~~~~
> 
> Caused by commit
> 
>    ed9e02e4bad1 ("io_uring: support for larger fixed file sets")
> 
> I have used the block tree from next-20191025 for today.

Ah shoot, forgot to update for-next, I did fix this silly error
yesterday. If you're up for it, pull for-next again in 2 min and I'll
have it updated. If not, I guess it'll be there in the next one. Usually
doesn't matter, only asking because syzbot keeps flagging the same issue
that is also fixed.

-- 
Jens Axboe

