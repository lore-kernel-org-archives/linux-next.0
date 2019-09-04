Return-Path: <SRS0=8W17=W7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39ADFC3A5A7
	for <linux-next@archiver.kernel.org>; Wed,  4 Sep 2019 14:08:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A0AE22CED
	for <linux-next@archiver.kernel.org>; Wed,  4 Sep 2019 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567606095;
	bh=CrCsXT6xQBRtBcoR6/HxfISqO9zeLDFf/flvnoIrXeo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=jQV5qroDsJLn7MhW0tyxSKxtks0Z00i6Hvv51hYfknHIol+2NsahehI60XmJlBMTO
	 rq2p5z2TuWHAqoel2aKhzds5ajRB+ZntBntstFWck29X5F5s4yckSfY4gcaW6D9ElS
	 kJmjWvzrhGwhMwQzIU6Ez91VyBr8ldriSGPQbhFU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbfIDOIO (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 4 Sep 2019 10:08:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727544AbfIDOIO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 10:08:14 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71C2222CEA;
        Wed,  4 Sep 2019 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567606093;
        bh=CrCsXT6xQBRtBcoR6/HxfISqO9zeLDFf/flvnoIrXeo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T2Dukqb0cMLP9VEhwOhvTJWiP7cEOu8Ylx41kWfASybAIGiQXYl/IMnCFNadjBEU+
         eaRJiMm9uGreGQf0BJeKPgeU5vjiW7hZxgc4qdG9DV2by9FFPEY/01N2zqpei2oBrO
         oBrJwyd6Ta4Qcnb3r4XvXoWHl+W36nFmooYNAQZg=
Subject: Re: linux-next: Fixes tag needs some work in the kselftest tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tycho Andersen <tycho@tycho.ws>, shuah <shuah@kernel.org>
References: <20190902073909.7fc3fe5e@canb.auug.org.au>
From:   shuah <shuah@kernel.org>
Message-ID: <9e918857-0ff2-3a36-3445-76eb739697c5@kernel.org>
Date:   Wed, 4 Sep 2019 08:07:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902073909.7fc3fe5e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/1/19 3:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    c321d43b8da1 ("selftests/seccomp: fix build on older kernels")
> 
> Fixes tag
> 
>    Fixes: Commit 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
> 
> has these problem(s):
> 
>    - leading word 'Commit' unexpected
> 

Thanks. I fixed the one in the commit log. I will fix this one as well.

thanks,
-- Shuah
