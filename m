Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC3DC54EBE
	for <linux-next@archiver.kernel.org>; Tue, 17 Jan 2023 03:08:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbjAQDID (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 16 Jan 2023 22:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbjAQDH5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Jan 2023 22:07:57 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BA8233DF
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2023 19:07:55 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id z13so4364469plg.6
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2023 19:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pnJ9Zmocxu4Xq5ufmgMvMkKxKjqhgHcC/CXVZl3M6Kg=;
        b=VT/EEiv5boIzMV75DdA9/aJwFxF8Is84Rhw3/LYBmRMMYQpCUAgfOvntIelHvMClTW
         yMMYT/gArron1p5NI3ZWwNx7VwexbGk5nFEciNhajeDchErJns5L+5ncMt8OcUPsVqtQ
         jQb27l54t7AeQHJvNQXLmE7rhaplUy52bbmBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnJ9Zmocxu4Xq5ufmgMvMkKxKjqhgHcC/CXVZl3M6Kg=;
        b=p3T1o0DmmiHx254rWGiTo1IGgPnb6ysHElHqsQ740zbYEx8eG4VjbmKwLh6wu/kIOR
         cBeNYKFTO/ddVLTd1afJc8tPMOJ8oZIA/N02DRsrU+WusVMt7k4JMmeBIhFhVIo0oJOP
         iS2l68v4PkJHYDMaKX1FxNtOpWB3iWWCofwKgMQ0Xqz+IP6VIcgKZZBqOWzz22D1aCS7
         5FMxHIbxkpGHRlWib/kza0qiPZyBtMNXtFcjEX/YgqV+lcNeSwbT5if4Gox/F+fR5Z0K
         QaNvgVVgaEZs3Uk5/lFRPGQLFMVsFg4vZafWsxyUr602gXZ/N2K4XlIc6RMF3WoK3kcH
         ZeqQ==
X-Gm-Message-State: AFqh2ko+qP/RqMIJkdz1WZcNZzIBrmKNg71+Yk+1cUVTqZg24SWd705W
        Zr7iDhEGcJ7cwLAM5XOyfBlUsT9eIiZ7tIa6
X-Google-Smtp-Source: AMrXdXtQj78NfF9qx+TabtfHmEG+hyBEpYjSaH0gM6kYOQE/gPWnG4sWnLISWWRe0lGgYM28aT9AHQ==
X-Received: by 2002:a17:903:54d:b0:193:a5b:ccf6 with SMTP id jo13-20020a170903054d00b001930a5bccf6mr808312plb.0.1673924875310;
        Mon, 16 Jan 2023 19:07:55 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id s21-20020a170902b19500b00189e1522982sm19987634plr.168.2023.01.16.19.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 19:07:54 -0800 (PST)
Date:   Tue, 17 Jan 2023 12:07:50 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        coverity-bot <keescook@chromium.org>,
        John Ogness <john.ogness@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: console_prepend_dropped(): Memory - corruptions
Message-ID: <Y8YRBo7ZmtzWT4J1@google.com>
References: <202301131544.D9E804CCD@keescook>
 <Y8KAhaiZQOWTcfyF@google.com>
 <Y8V8tqMJeB7t+rcJ@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8V8tqMJeB7t+rcJ@alley>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (23/01/16 17:35), Petr Mladek wrote:
> 
> I am going to send a patch.

Sure, sounds good.

> The code might be safe with the current size of the buffer and
> the string. But it is true that the following is wrong:
> 
> 	len = snprintf(scratchbuf, scratchbuf_sz,
> 		       "** %lu printk messages dropped **\n", dropped);

Wouldn't

	if (WARN_ON_ONCE(len + PRINTK_PREFIX_MAX >= outbuf_sz))
		return;

prevent us from doing something harmful?
