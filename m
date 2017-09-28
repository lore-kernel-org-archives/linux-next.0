From: Nik Nyby <njn2118@columbia.edu>
Subject: Re: linux-next: Signed-off-by missing for commit in the gpio tree
Date: Thu, 28 Sep 2017 11:12:57 -0400
Message-ID: <f1943a33-8771-b17b-0f20-78fa9d928c84@columbia.edu>
References: <20170928073704.1f271e4e@canb.auug.org.au>
 <CACRpkdZmkjv=Js1wbBXcbCph9eF9CnYU3O1BW9jQ61c9N3GGCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outprodmail02.cc.columbia.edu ([128.59.72.51]:55072 "EHLO
        outprodmail02.cc.columbia.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752671AbdI1PNC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Sep 2017 11:13:02 -0400
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
        by outprodmail02.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id v8SF88bw032891
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2017 11:13:01 -0400
Received: from hazelnut (localhost.localdomain [127.0.0.1])
        by hazelnut (Postfix) with ESMTP id B4C1A80
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2017 11:13:01 -0400 (EDT)
Received: from sendprodmail02.cc.columbia.edu (sendprodmail02.cc.columbia.edu [128.59.72.14])
        by hazelnut (Postfix) with ESMTP id 617AE80
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2017 11:13:01 -0400 (EDT)
Received: from mail-qt0-f197.google.com (mail-qt0-f197.google.com [209.85.216.197])
        by sendprodmail02.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id v8SFD1Gh053694
        (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2017 11:13:01 -0400
Received: by mail-qt0-f197.google.com with SMTP id u48so669949qtc.6
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2017 08:13:01 -0700 (PDT)
In-Reply-To: <CACRpkdZmkjv=Js1wbBXcbCph9eF9CnYU3O1BW9jQ61c9N3GGCA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 09/27/2017 06:47 PM, Linus Walleij wrote:
> On Wed, Sep 27, 2017 at 11:37 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi Linus,
>>
>> Commit
>>
>>    937a0df4f4ea ("gpio: amd8111 Kconfig typo fix (trivial)")
>>
>> is missing a Signed-off-by from its author.
> 
> OMG! How could I miss that.
> 
> The patch is so trivial that I just dropped it.
> 
> Yours,
> Linus Walleij
> 

Agh - sorry about that. I thought git send-email did that for me and I'm 
just not used to sending patches. I'll pay more attention next time.
