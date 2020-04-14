Return-Path: <SRS0=lo6o=56=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FDBC2BA19
	for <linux-next@archiver.kernel.org>; Tue, 14 Apr 2020 08:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B5C2206D5
	for <linux-next@archiver.kernel.org>; Tue, 14 Apr 2020 08:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437038AbgDNImy (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 14 Apr 2020 04:42:54 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:43169 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436845AbgDNImw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2020 04:42:52 -0400
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jOH9R-0006mr-Ch; Tue, 14 Apr 2020 10:42:37 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id B570C100D14; Tue, 14 Apr 2020 10:42:36 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the tip tree
In-Reply-To: <20200413100112.2e114e24@canb.auug.org.au>
References: <20200330134746.627dcd93@canb.auug.org.au> <20200401085753.617c1636@canb.auug.org.au> <877dyzv6y2.fsf@nanos.tec.linutronix.de> <20200402090051.741905cd@canb.auug.org.au> <874ku2q18k.fsf@nanos.tec.linutronix.de> <20200413100112.2e114e24@canb.auug.org.au>
Date:   Tue, 14 Apr 2020 10:42:36 +0200
Message-ID: <87sgh6o3ur.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> On Thu, 02 Apr 2020 00:39:55 +0200 Thomas Gleixner <tglx@linutronix.de> wrote:
>> and the below proves it:
>> 
>> diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
>> index e133da303a98..a9151884bc85 100644
>> --- a/arch/arm/include/asm/futex.h
>> +++ b/arch/arm/include/asm/futex.h
>> @@ -165,8 +165,13 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>>  	preempt_enable();
>>  #endif
>>  
>> -	if (!ret)
>> -		*oval = oldval;
>> +	/*
>> +	 * Store unconditionally. If ret != 0 the extra store is the least
>> +	 * of the worries but GCC cannot figure out that __futex_atomic_op()
>> +	 * is either setting ret to -EFAULT or storing the old value in
>> +	 * oldval which results in a uninitialized warning at the call site.
>> +	 */
>> +	*oval = oldval;
>>  
>>  	return ret;
>>  }
>> 
>> I think that's the right thing to do anyway. The conditional is pointless.
>
> Thanks for the analysis.
>
> I am still getting this warning, now from Linus' tree builds.

Yeah. Just noticed that both of us failed to CC the arm folks. :(

Let me send out a proper patch.

Thanks,

        tglx
