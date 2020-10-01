Return-Path: <SRS0=GrK0=DI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3E4C47423
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 05:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEE8A221E8
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 05:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uz+lMmvf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbgJAFKC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Oct 2020 01:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgJAFKC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 01:10:02 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4000C0613D1
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 22:10:01 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id i17so4288749oig.10
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 22:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zfiXEz/Yp7QnacqOD0Bzaygm1o0QXJVF3bzwVd/E22Q=;
        b=Uz+lMmvfUS1+tFLwnQ2LlW/OVHuHJghfAGtFQ6AJ2KGeGLhy1Qky5mnDJwmzbAbpKb
         v7jfYo3oD29S7aGY7clc2Gq9wRpmItDqHfH1GVygOnbaQvgz8ez1XJHACveGMW+v2Pkz
         8PsriqINqCg2XRIaDmvD0VZWhLMRGfypdMvwcLxgWBqJRkf5lvDwAdb+XnVtrmFiMotM
         V8fUdTkREETmdPW7/XkRmjMdWtbJuWLL6y4W4PayDpTK7bIB/RGRZEFGJmcrBULqNU9H
         DuZW+PYMLdDinRJntfZBzT73jAtCISezkDzN1iRG5JrsuSk9LCQhoHbKAcqneS2KZdXV
         Si9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfiXEz/Yp7QnacqOD0Bzaygm1o0QXJVF3bzwVd/E22Q=;
        b=gijO50uh7sQdkig5YVci+lR1hLwwm8Pirli1/kVcUlAtH/ZBnTcdmxFK9Qs5Em4Zgw
         nDMk8q24inPLaSmGBqV78/GEuOXVInz+zSuZFbwdDAR7Sz/oe0hRNgkfV0WXZOKtjrN+
         xeye8nuLROzpxYMojAqFDEhm8aWnCIGWIfP5AuxYnp2UKYlEegVIfa6MQNHS05LxG7gk
         N9Z6f9R/3ITK8ZbP+ccR54qA95q9pLyyxdEMsipWBZxL6+rzsYwzhlvx+6x+uifIjsW3
         NBnEy1apy6do9W755miWpfA7doq46FdBuuIV0CJ0fNvafjAQrJ84STOTn61NpbqVfEvR
         +m9w==
X-Gm-Message-State: AOAM5336/OVTB5W3ft8dnmu9Na88CR6pNVm2lLrSiUvkaH4Sds6mwTBE
        xZEu4aPzkEOPmvtA7sIqKIbbN7foCZaVdDZ/opItZQ==
X-Google-Smtp-Source: ABdhPJzQ6h/KHKuHn3/SzwzefC4Qb4baLReVpfD338TkNEHJRp7rh7ry3lxoUZOLw48LBreyERso58n2djRLzIXnL88=
X-Received: by 2002:aca:4142:: with SMTP id o63mr3062971oia.167.1601529001163;
 Wed, 30 Sep 2020 22:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202650.2530280-1-keescook@chromium.org> <20200928202650.2530280-3-keescook@chromium.org>
In-Reply-To: <20200928202650.2530280-3-keescook@chromium.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 1 Oct 2020 10:39:50 +0530
Message-ID: <CA+G9fYtLQN_dMXUE0zVbWmtYjpu16hbShMb+mxQh3tiedwrXuQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] selftests/run_kselftest.sh: Make each test
 individually selectable
To:     Kees Cook <keescook@chromium.org>
Cc:     Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 29 Sep 2020 at 01:56, Kees Cook <keescook@chromium.org> wrote:
>
> Currently with run_kselftest.sh there is no way to choose which test
> we could run. All the tests listed in kselftest-list.txt are all run
> every time. This patch enhanced the run_kselftest.sh to make the test
> collections (or tests) individually selectable. e.g.:
>
> $ ./run_kselftest.sh -c seccomp -t timers:posix_timers -t timers:nanosleep
>
> Additionally adds a way to list all known tests with "-l", usage
> with "-h", and perform a dry run without running tests with "-n".
>
> Co-developed-by: Hangbin Liu <liuhangbin@gmail.com>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
