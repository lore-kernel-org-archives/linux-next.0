Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE39BC07E9A
	for <linux-next@archiver.kernel.org>; Tue, 13 Jul 2021 03:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A473661288
	for <linux-next@archiver.kernel.org>; Tue, 13 Jul 2021 03:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhGMDGB (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 12 Jul 2021 23:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhGMDGA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 23:06:00 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379D0C0613DD;
        Mon, 12 Jul 2021 20:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=hCvS0V4DQfhz8R+UHlcTBcTPDCFY19yLBE8PW1IYyvc=; b=WYkR7Z7xepZ9Gfsa44Gxj7FRNV
        +Wah2tpxoviDi3RN/DupfGQe2MmfV8eDDc+fKAoPoToMFvMqUf5jqVPHTnlq0cSAUKSj6ZaP2t1+h
        a5k+j7aPtAOxRi/zzkPeTPfHVMeLQ2E6kVOK42LCWXScG/47pxrWmrCdNXUn+apzl8dZtXPqk+Oll
        Z4ICSQsQp9hFXREA+ZHeHcj2t9eTcgqVEm58HXKylz12f8Ii996EA6RUPYvi2tcGgcXEhBIP5i/vk
        zBbaxkK5Sv/sK3YR7gr8aTG+Rvf209OFKe/P1g3JVdYDm2gvtMVzVtqYiMpGxCwE82Y/dwL+AN3MK
        nTMq5MVw==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m38hR-0090Gi-DL; Tue, 13 Jul 2021 03:03:09 +0000
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210712120828.5c480cdc@canb.auug.org.au>
 <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
 <20210713111029.77bfb9bb@elm.ozlabs.ibm.com>
 <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
Message-ID: <8ed74a96-7309-3370-4b8b-376bface7cc6@infradead.org>
Date:   Mon, 12 Jul 2021 20:03:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/12/21 6:43 PM, Randy Dunlap wrote:
> On 7/12/21 6:10 PM, Stephen Rothwell wrote:
>> Hi Randy,
>>
>> On Mon, 12 Jul 2021 08:24:16 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> I am getting no builds completing. I see this:
>>>
>>> Error: No compiler specified.
>>> Usage:
>>> 	../scripts/rust-version.sh <rust-command>
>>> init/Kconfig:71: syntax error
>>> init/Kconfig:70: invalid statement
>>>
>>> and then 'bc' running continuously until I kill it.
>>
>> OK, this is weird.  init/Kconfig has not changed from Friday and I
>> don't see these errors at all in my builds.  I also have no rust
>> compiler installed.  And the kernel ci bot seems happy (well nothing
>> like this anyway).
>>
> 
> Hm, OK, I'll check for patch/merge problems (since I am using
> tarballs and patches).

I'm still checking. I see a bunch of build errors in 2021-07-12 but
they could just be source tree problems -- I don't have much confidence
in them.  I'll hope for better results tomorrow (07-13) but see if I
can determine what is going on here.

thanks.
-- 
~Randy

