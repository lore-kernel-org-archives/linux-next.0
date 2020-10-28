Return-Path: <SRS0=61Hx=EE=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459FDC55179
	for <linux-next@archiver.kernel.org>; Thu, 29 Oct 2020 01:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10DC520796
	for <linux-next@archiver.kernel.org>; Thu, 29 Oct 2020 01:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbgJ2BXA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-next@archiver.kernel.org>);
        Wed, 28 Oct 2020 21:23:00 -0400
Received: from mail.fireflyinternet.com ([77.68.26.236]:55960 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729908AbgJ1WEG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 18:04:06 -0400
X-Greylist: delayed 1004 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Oct 2020 18:04:05 EDT
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 22829710-1500050 
        for multiple; Wed, 28 Oct 2020 21:46:45 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201029082823.5607849a@canb.auug.org.au>
References: <20201029082823.5607849a@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel-fixes tree
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 28 Oct 2020 21:46:42 +0000
Message-ID: <160392160276.31966.3847690661999837078@build.alporthouse.com>
User-Agent: alot/0.9
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-10-28 21:28:23)
> Hi all,
> 
> Commit
> 
>   d13208a88f41 ("lockdep: Fix nr_unused_locks")
> 
> is missing a Signed-off-by from its author.
> 
> Also, the author's email name is missing the leading 'P'.

And it shouldn't be in the drm-intel-fixes tree.
-Chris
