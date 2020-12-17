Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8032CC4361B
	for <linux-next@archiver.kernel.org>; Thu, 17 Dec 2020 16:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40F4B208BA
	for <linux-next@archiver.kernel.org>; Thu, 17 Dec 2020 16:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgLQQqx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 17 Dec 2020 11:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgLQQqx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 11:46:53 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D62BC0617B0;
        Thu, 17 Dec 2020 08:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=vC7Z3WFn7lfgjqU5f4LaQjQo78NWsvnXvMhlWmJ7fhs=; b=ETmFcBu//ji/ZRCPKpNiBMR2Rl
        nIOnFvGe7W5DnP8xwSjZBYRjjf1fNLuhmMA4RF92EjyWc39VCSjUI34QLNm5QYusbPtko+3sCr8Hg
        W8dkX20E16SM06pvWHFh1wFGQ2dDAlDrZpqWawwlBD8imwtxj6pE9BZETCjqbS23EIIXToYP2U29f
        UkUOC2fC2rbxp6nUgOSBnJMIVBBoBzZxLcg4BkrAikMv8sO8IAwLyGEek+oag4UthvB5u3ev78mWf
        KWiyAtiNL3PP2O3y2ztsaDIYGuFJI2u5LadwwFvb+eL4B5gR/dRZxT2/BATtBVNa9Qdn2pAMimzQ2
        RAW9Y3Fg==;
Received: from [2601:1c0:6280:3f0::64ea]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kpwPo-00026g-Vd; Thu, 17 Dec 2020 16:46:09 +0000
Subject: Re: linux-next: Tree for Dec 17 (objtool warnings)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20201217165304.42c98402@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3140d3b6-e1f2-38a7-60e8-8dca948f962c@infradead.org>
Date:   Thu, 17 Dec 2020 08:46:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201217165304.42c98402@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/16/20 9:53 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v5.12 destined code to your linux-next included
> branches until after v5.11-rc1 has been released.
> 
> Changes since 20201216:
> 

on x86_64:

(These are on 2 different builds.)

> gcc --version
gcc (SUSE Linux) 7.5.0


drivers/gpu/drm/drm_edid.o: warning: objtool: do_cvt_mode() falls through to next function drm_get_override_edid.isra.30()

lib/iov_iter.o: warning: objtool: iovec_from_user()+0x22d: call to __ubsan_handle_add_overflow() with UACCESS enabled



Do you want .config files or .o files or what?

thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
