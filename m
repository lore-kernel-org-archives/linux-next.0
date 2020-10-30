Return-Path: <SRS0=1Blo=EF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A511C00A89
	for <linux-next@archiver.kernel.org>; Fri, 30 Oct 2020 16:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 018442075E
	for <linux-next@archiver.kernel.org>; Fri, 30 Oct 2020 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604075887;
	bh=zvp0Ib0Srp64WOH+7nNTS4cZMI1QvCPW/+X3tGRCkx0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=F0fKc553rechgXcoMdAqPQtDSZLSqeVzoGxQ3ro2EtVzpoyhhrpLNRZGkGd68GXbv
	 aFR2aXVJgJmxd4HLaySfE1RmJNkYCs9UUOXLcfgc+AXT6BNPh5KgW3o0otKg9phHDE
	 I1MYSMB5jpMjJ9mWCJZPirepXoOLS+jhdwZ8i2Rs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgJ3QiG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 30 Oct 2020 12:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3QiG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Oct 2020 12:38:06 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB44C0613CF
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 09:38:06 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id h21so8128775iob.10
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/NMWfJdThiQHSZltQUuuJFzcFqVdG447qNC171x9a/Y=;
        b=ODWyrEvD6hidSish6vxd8Gj+j/RCGcIS4EiPZu2JeJFn1Ph2/oGamcYM7lFsTI8q/J
         RKAhniFX7WMVaSJrLOMYIxo/DPh5HbfEFQOkvhmUc7TBhKmkssDlboMAxSfP6LKFb9/B
         85PwTBYi6N5UAuGwhd6XBVCHMT9sdo33zxoTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/NMWfJdThiQHSZltQUuuJFzcFqVdG447qNC171x9a/Y=;
        b=CKeYTG8Upy2rMZSSo/4G0x7TkRLYRdUg86OXa1eg2PrNZj9Jx+kyjmtnQAcQP9tksA
         ir/t5L2Y0VtePGFQCVn8InuKs+Q78mb6F2qD4sCMu0nfH0F3cLpcrJZI5x5Spv9FFAtL
         OQ0PpO6WwXUATfElmYU9YJ1QWpLmsHDSBLXuFDKo/7b1nAmQSIJ3QTNoCTlOGniOXO2E
         /RjGx92Y7IwSJeDWo306lw5KWGzZF1pri/psEtbTtiWYpDrfhV7MDfjGsyOMVrmAy9Na
         ZM0n8Ep2Qhllj+g+XMhaOGuUJUT7OZ2bfdiZwo/C7Dvv+0SAJ1D7RBdcu8dhlIvnlxx0
         ZiSA==
X-Gm-Message-State: AOAM532WjMLNgWXPkecATa0WwlXwhYtKYTNuBx0NopnRWCk7BI4a8cOg
        IQFU2Mv/TqPbn7XMdqrk50P1WA==
X-Google-Smtp-Source: ABdhPJyfLkj0EO05SQ+gdoV9tNN97dvMwlZ6+Icbb6ArpuE3Z++p7arHViQSYKInsp6wZuFWBL07Gg==
X-Received: by 2002:a05:6638:102c:: with SMTP id n12mr2611533jan.87.1604075885305;
        Fri, 30 Oct 2020 09:38:05 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b14sm6133790ilg.63.2020.10.30.09.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 09:38:04 -0700 (PDT)
Subject: Re: linux-next: manual merge of the staging tree with the
 kselftest-fixes tree
To:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <shuah@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tommi Rantala <tommi.t.rantala@nokia.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201029132713.3a41c80b@canb.auug.org.au>
 <20201029052225.GC282324@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2de3f605-23f7-e36d-6cee-2f9c6cf36e55@linuxfoundation.org>
Date:   Fri, 30 Oct 2020 10:38:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029052225.GC282324@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/28/20 11:22 PM, Greg KH wrote:
> On Thu, Oct 29, 2020 at 01:27:13PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the staging tree got conflicts in:
>>
>>    tools/testing/selftests/android/ion/ipcsocket.c
>>    tools/testing/selftests/android/ion/ipcsocket.h
>>
>> between commit:
>>
>>    08c5d41130e5 ("selftests: android: fix multiple definition of sock_name")
>>
>> from the kselftest-fixes tree and commit:
>>
>>    e722a295cf49 ("staging: ion: remove from the tree")
>>
>> from the staging tree.
>>
>> I fixed it up (I just removed the files) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
> 
> Easy fix, thanks!
> 

Thanks for catching it. I knew this test was removed. My bad.

-- Shuah

