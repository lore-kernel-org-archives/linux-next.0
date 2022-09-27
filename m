Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFE4C07E9D
	for <linux-next@archiver.kernel.org>; Tue, 27 Sep 2022 21:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbiI0VdY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 27 Sep 2022 17:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiI0VdX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2022 17:33:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CAC105D5E;
        Tue, 27 Sep 2022 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=H7YtPOYhV29gP4WdkjcppH5vTdIvl+SSSIWTHEeQBx4=; b=4BVQpJgnjA+og9uC0hy0fjpk3y
        1OlXuoXdUF+e/x47FLLo6Zzsy7FEnaSk3t3LrhyeOr3ZYarIOHcR9T3X54KTUwBIf4HfxFfhb6EeY
        vbTRwOMGm1OnA7tyDObWHiufHqMLwI4MCAUIv1nH2+SJuLmGPFcsw0xFjWfmDGa6gWNfll6W2brfs
        iM4xlX6OdiYO4ARFGAA/momuSmCr+gJGbmnmel63sDH5x/Mf1eA3Tr4UWC16CA//6tNswNfkekn/n
        GtNoMnYhp8X9aXzd9MBHVB6WRiMXrs6EpS34oTGU9QRDgVUgqn/3TIAUZ8XtsDVP7xjWiK0E8eQMa
        GV0fcXBw==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1odICe-00CjXe-VF; Tue, 27 Sep 2022 21:33:21 +0000
Message-ID: <1d54d4ff-c8a3-145a-7ec5-f32107eda21e@infradead.org>
Date:   Tue, 27 Sep 2022 14:33:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: linux-next: Tree for Sep 27 (uml 64-bit or 32-bit: tinyconfig)
Content-Language: en-US
To:     paulmck@kernel.org
Cc:     broonie@kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>
References: <20220927201053.518736-1-broonie@kernel.org>
 <f1b22431-074d-32f1-b67a-34c51e4d072a@infradead.org>
 <20220927212821.GX4196@paulmck-ThinkPad-P17-Gen-1>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220927212821.GX4196@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 9/27/22 14:28, Paul E. McKenney wrote:
> On Tue, Sep 27, 2022 at 02:13:29PM -0700, Randy Dunlap wrote:
>>
>>
>> On 9/27/22 13:10, broonie@kernel.org wrote:
>>> Hi all,
>>>
>>> Changes since 20220923:
>>>
>>
>> In file included from ../include/linux/notifier.h:16,
>>                  from ../include/linux/memory_hotplug.h:7,
>>                  from ../include/linux/mmzone.h:1244,
>>                  from ../include/linux/gfp.h:7,
>>                  from ../include/linux/slab.h:15,
>>                  from ../include/linux/crypto.h:20,
>>                  from ../arch/x86/um/shared/sysdep/kernel-offsets.h:5,
>>                  from ../arch/um/kernel/asm-offsets.c:1:
>> ../include/linux/srcu.h: In function ‘srcu_read_lock_nmisafe’:
>> ../include/linux/srcu.h:181:26: error: implicit declaration of function ‘__srcu_read_lock_nmisafe’; did you mean ‘srcu_read_lock_nmisafe’? [-Werror=implicit-function-declaration]
>>   181 |                 retval = __srcu_read_lock_nmisafe(ssp, true);
>>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>>       |                          srcu_read_lock_nmisafe
>> ../include/linux/srcu.h: In function ‘srcu_read_unlock_nmisafe’:
>> ../include/linux/srcu.h:226:17: error: implicit declaration of function ‘__srcu_read_unlock_nmisafe’; did you mean ‘srcu_read_unlock_nmisafe’? [-Werror=implicit-function-declaration]
>>   226 |                 __srcu_read_unlock_nmisafe(ssp, idx, true);
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>       |                 srcu_read_unlock_nmisafe
> 
> Could you please send your .config or tell me how you generated it?


For x86_64 SUBARCH, ARCH=um:

mkdir UML64
make ARCH=um SUBARCH=x86_64 O=UML64 tinyconfig
make ARCH=um SUBARCH=x86_64 O=UML64 all


-- 
~Randy
