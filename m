Return-Path: <SRS0=H+3J=BT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D6CC433DF
	for <linux-next@archiver.kernel.org>; Sun,  9 Aug 2020 18:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0680B206E9
	for <linux-next@archiver.kernel.org>; Sun,  9 Aug 2020 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596996292;
	bh=OPs635+YB2E/9UhkNy4T3ZJerTKavMQ4keusGFgxqcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=IUaEX7lMD/JfCAzJXg9EzJbIDJczBiS2MzPuwE6SUVe0v0pakpLFXsq9iIBAIxMxb
	 XBD47ONY4YCWF/a4iZJl9qE3KUel5fF+lpDVKKHOmD/Nkobc+ErFpvdoSb9zp4JsNi
	 kO0yyNe5u2a01CuYlc6QbD0psApt+LDLYkl5tBaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgHISEu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 9 Aug 2020 14:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgHISEt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 14:04:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C2CC061786
        for <linux-next@vger.kernel.org>; Sun,  9 Aug 2020 11:04:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v4so7251871ljd.0
        for <linux-next@vger.kernel.org>; Sun, 09 Aug 2020 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1BG/6UUzuOweVBBcANerDegzEOPHQ5euSh32fkjDyuE=;
        b=OqO3VVcpPivDRCvdlKEfFTIX6VdwAKXPXAn5HYXdTcxmrve3rpBOTbaiLrxFRJ16TN
         5ZLeYSCR2Q/kI21RJEFXYWbUtHAGQ+SEp6kXG4eBNfM0Y4uSwPpOQx7cw0XZUYfv1IzN
         7G8kphPPMbI9cZa9e/xIAFf2B5EwFg5bJFviY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1BG/6UUzuOweVBBcANerDegzEOPHQ5euSh32fkjDyuE=;
        b=PnIYPNJFpT7iz6ePPTioD9HCIUqgf7es5WIP7qoz7JMc3k2Xq+bMMQcEsoD0wsthnp
         KLH2Tf6BNp6fWltisHbtnrCp0+Wx21octz/r/K+ZaIk9sKRMRBtB9xe6z1vZMnL4AHZH
         TFzq6YpnxCw/tgU2b12rvDr41tAQ58gZs09Je2/x0n8xwZTIZkpb2FFAevLMO2tmcASp
         YhskVQpM0OCbnqFwO7Ktwf4W8WrkZuRooTfXNeCrZ45dktujJaZACWxlTZW1Kt0Y8M08
         KpfSn6CZ9pC1oS9c84AeCAjxHMI5H4OdIry4UkBwyWBJjLcvZhFtoNbUxfO7q5fbPFI+
         jghA==
X-Gm-Message-State: AOAM532cBBzTrcGqbtkDm/Dndh0EuAyqX8Jzm2O/oNfBfuIZKXNrJAMk
        dFw3tDvqI+o+OdbOSuqMlH6S19uwoh8=
X-Google-Smtp-Source: ABdhPJyVezSxvzlOrkn47j8FchSHziECp39lOmzqPCyhq0uKrhOWY15BIDmlILciNxNK8eDCU4vi5Q==
X-Received: by 2002:a2e:9913:: with SMTP id v19mr9954327lji.292.1596996285337;
        Sun, 09 Aug 2020 11:04:45 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id c4sm8044312ljk.70.2020.08.09.11.04.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2020 11:04:44 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id x24so3537679lfe.11
        for <linux-next@vger.kernel.org>; Sun, 09 Aug 2020 11:04:44 -0700 (PDT)
X-Received: by 2002:a19:408d:: with SMTP id n135mr11132205lfa.192.1596996283903;
 Sun, 09 Aug 2020 11:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200630160346.696f6419@canb.auug.org.au> <20200809181838.23c6b829@canb.auug.org.au>
In-Reply-To: <20200809181838.23c6b829@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 9 Aug 2020 11:04:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjsrVPKirEN7hTioibRYSOZuo82seuUm6k7=tqeWHnZg@mail.gmail.com>
Message-ID: <CAHk-=wjjsrVPKirEN7hTioibRYSOZuo82seuUm6k7=tqeWHnZg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Aug 9, 2020 at 1:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I looks like the above report got lost along the way to you :-(

Hmm. Why didn't I see this as a build failure?

Oh. Because the USB4_KUNIT_TEST stuff requires everything to be built
in. And I have them as modules.

That's a bit unfortunate. I see the commentary in commit 54509f5005ca
("thunderbolt: Add KUnit tests for path walking") about how this is
fine because only developers run the tests, but it has this very
unfortunate side issue of not getting a lot of build coverage either.

> Here's the patch in case you want to directly apply it:

Will do. Thanks,

             Linus
