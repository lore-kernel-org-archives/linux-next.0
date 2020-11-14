Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C6FC61DD8
	for <linux-next@archiver.kernel.org>; Sat, 14 Nov 2020 17:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 060DF206D9
	for <linux-next@archiver.kernel.org>; Sat, 14 Nov 2020 17:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VP6O6FTL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgKNR11 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 14 Nov 2020 12:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKNR10 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 14 Nov 2020 12:27:26 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739A4C0613D1;
        Sat, 14 Nov 2020 09:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=nFIjmU3PyYTtN+/KPAaiBpQ9mhotPT9InWONOcxLEKw=; b=VP6O6FTLaPgIzlW2qwuSOXOyzW
        Kolh+nSrb8DTpSIiSxLmzjsPU3KGkOCYELDJBlIBZHa7zSwz3Oyu5Ku2oDCjNOucmmYnEjMoN6fe/
        aPDqJyQs+QbhNchsftgaET7gT43vvPiV7iv/+CE4bWdndy5XCMhLtTe6SYUO8tOEbgeN0h6YMlgvT
        4faDo3sLezINoU/WmkX5iX2VcmP/mHpyZpgYzv8yEjVBemVItqcMnQIDrU0q/jFk3MhJ6dbWBslV7
        3LRH/AV/7IJM27h7IqM5UwczPd1T4+DTgLUxTlJ2hR2fS6QFXJ67ONDYAWqAqCJwBJLlPUgwM5s1a
        wcvG93Iw==;
Received: from [2601:1c0:6280:3f0::f32]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kdzKb-0006hj-7C; Sat, 14 Nov 2020 17:27:21 +0000
Subject: Re: [PATCH net-next] net: linux/skbuff.h: combine NET + KCOV handling
To:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Willem de Bruijn <willemb@google.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-next@vger.kernel.org,
        netdev@vger.kernel.org
References: <20201114011110.21906-1-rdunlap@infradead.org>
 <52502fe4-8f41-0630-5b9c-be2e07b6932c@tessares.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8198558c-55f0-0ea3-3a23-e3dafb2cb09d@infradead.org>
Date:   Sat, 14 Nov 2020 09:27:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <52502fe4-8f41-0630-5b9c-be2e07b6932c@tessares.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/14/20 12:01 AM, Matthieu Baerts wrote:
> Hi Randy,
> 
> On 14/11/2020 02:11, Randy Dunlap wrote:
>> The previous Kconfig patch led to some other build errors as
>> reported by the 0day bot and my own overnight build testing.
> 
> Thank you for looking at that!
> 
> I had the same issue and I was going to propose a similar fix with one small difference, please see below.
> 
>> --- linux-next-20201113.orig/include/linux/skbuff.h
>> +++ linux-next-20201113/include/linux/skbuff.h
>> @@ -4608,7 +4608,7 @@ static inline void skb_reset_redirect(st
>>   #endif
>>   }
>>   -#ifdef CONFIG_KCOV
>> +#if IS_ENABLED(CONFIG_KCOV) && IS_ENABLED(CONFIG_NET)
>>   static inline void skb_set_kcov_handle(struct sk_buff *skb,
> Should we have here CONFIG_SKB_EXTENSIONS instead of CONFIG_NET?
> 
> It is valid to use NET thanks to your commit 85ce50d337d1 ("net: kcov: don't select SKB_EXTENSIONS when there is no NET") that links SKB_EXTENSIONS with NET for KCOV but it looks strange to me to use a "non direct" dependence :)
> I mean: here below, skb_ext_add() and skb_ext_find() are called but they are defined only if SKB_EXTENSIONS is enabled, not only NET.
> 
> But as I said, this patch fixes the issue. It's fine for me if we prefer to use CONFIG_NET.

I think it would be safer to use CONFIG_SKB_EXTENSIONS.

>> @@ -4636,7 +4636,7 @@ static inline u64 skb_get_kcov_handle(st
>>   static inline void skb_set_kcov_handle(struct sk_buff *skb,
>>                          const u64 kcov_handle) { }
>>   static inline u64 skb_get_kcov_handle(struct sk_buff *skb) { return 0; }
>> -#endif /* CONFIG_KCOV */
>> +#endif /* CONFIG_KCOV &&  CONFIG_NET */
> 
> (Small detail if you post a v2: there is an extra space between "&&" and "CONFIG_NET")

Oops. Fixed in v2. Thanks for looking.

v2 on the way.

-- 
~Randy

