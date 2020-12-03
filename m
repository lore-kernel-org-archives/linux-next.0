Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF972C63777
	for <linux-next@archiver.kernel.org>; Thu,  3 Dec 2020 09:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53D2E20709
	for <linux-next@archiver.kernel.org>; Thu,  3 Dec 2020 09:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387572AbgLCJSt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 3 Dec 2020 04:18:49 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44171 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgLCJSt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 04:18:49 -0500
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kkkkZ-00068c-MI; Thu, 03 Dec 2020 09:18:07 +0000
Date:   Thu, 3 Dec 2020 10:18:06 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pidfd tree
Message-ID: <20201203091806.id4feveqrtmo4v65@wittgenstein>
References: <20201203075911.7ac53b76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201203075911.7ac53b76@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 03, 2020 at 07:59:11AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   440ec82ebed2 ("selftests: openat2: add RESOLVE_ conflict test")
>   295983402a1a ("openat2: reject RESOLVE_BENEATH|RESOLVE_IN_ROOT")
> 
> are missing a Signed-off-by from their committers.

Thank you!
This is now fixed.
Christian
