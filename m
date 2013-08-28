From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: mmotm 2013-08-27-16-51 uploaded
Date: Tue, 27 Aug 2013 17:50:23 -0700
Message-ID: <521D494F.1010507@codeaurora.org>
References: <20130827235227.99DB95A41D6@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20130827235227.99DB95A41D6@corp2gmr1-2.hot.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, voice.shen@atmel.com, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On 08/27/13 16:52, akpm@linux-foundation.org wrote:
> * kernel-time-sched_clockc-correct-the-comparison-parameter-of-mhz.patch
>

I believe Russell nacked this change[1]? This should probably be dropped
unless there's been more discussion. Or maybe reworked into a comment in
the code that doesn't lead to the same change again.

[1] https://lkml.org/lkml/2013/8/7/95

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
