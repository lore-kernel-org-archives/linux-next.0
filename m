From: Bo Shen <voice.shen@atmel.com>
Subject: Re: mmotm 2013-08-27-16-51 uploaded
Date: Wed, 28 Aug 2013 09:39:10 +0800
Message-ID: <521D54BE.5060100@atmel.com>
References: <20130827235227.99DB95A41D6@corp2gmr1-2.hot.corp.google.com> <521D494F.1010507@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <521D494F.1010507@codeaurora.org>
Sender: owner-linux-mm@kvack.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Russell King
 - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Stephen Boyd,

On 08/28/2013 08:50 AM, Stephen Boyd wrote:
> On 08/27/13 16:52, akpm@linux-foundation.org wrote:
>> * kernel-time-sched_clockc-correct-the-comparison-parameter-of-mhz.patch
>>
>
> I believe Russell nacked this change[1]? This should probably be dropped

Yes, this is RFC patch, and NACKed by Russell, so we can drop it.

> unless there's been more discussion. Or maybe reworked into a comment in
> the code that doesn't lead to the same change again.
>
> [1] https://lkml.org/lkml/2013/8/7/95
>

Best Regards,
Bo Shen

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
