Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C59EEB64DC
	for <linux-next@archiver.kernel.org>; Tue, 18 Jul 2023 17:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjGRRed (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 18 Jul 2023 13:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjGRRed (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jul 2023 13:34:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A41B3;
        Tue, 18 Jul 2023 10:34:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 06EAE61682;
        Tue, 18 Jul 2023 17:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356D2C433C8;
        Tue, 18 Jul 2023 17:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1689701671;
        bh=NLgWtV0tg4+l5z7gEEcMuzkvMxIf1NEtraZOwJ06IfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=C5WF5p9/kU30Qwqtq87bgaqxnPzH/lZb4WO99af+s9OJqgTpuHS6rXuExvnwgaTxt
         nv25N/fbpKHM2z73lIVLTGqB1YRoHqzsM6UrMEw9v3sd3HDyuO6tnaogZJPM6gHtut
         89levQCl/H4DZofR2obv56S3bku9xiFIwc6noQNM=
Date:   Tue, 18 Jul 2023 10:34:30 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20230718103430.f5062ce13b63171e418c94f3@linux-foundation.org>
In-Reply-To: <ZLaXC29UH3SuTJtP@smile.fi.intel.com>
References: <20230718100257.1ed9290e@canb.auug.org.au>
        <ZLaXC29UH3SuTJtP@smile.fi.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 18 Jul 2023 16:43:39 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Jul 18, 2023 at 10:02:57AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the mm tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> 
> Thank you for this report!
> 
> Andrew, since it's in a separate patch, can you drop the change to
> include/linux/arm-smccc.h?

I actually dropped the whole series.
