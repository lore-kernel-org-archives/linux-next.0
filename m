From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: Boot failure on Origen with next-20131107
Date: Thu, 7 Nov 2013 17:22:00 +0530
Message-ID: <CAK9yfHz-ZhR-k59SDmoUO8L57XjBp24A25AMKzXbpkNzLDpQEQ@mail.gmail.com>
References: <CAK9yfHz+H4FQpo_J0ycJP_rvRPMyDgXpZFvx+GvRjyywECUoCw@mail.gmail.com>
	<4908982.5yt51ejnyk@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4908982.5yt51ejnyk@amdc1227>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Tomasz,

On 7 November 2013 16:59, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
> On Thursday 07 of November 2013 16:25:15 Sachin Kamat wrote:
>> Hi,
>>
>> Today's linux next fails to boot Origen (Exynos4210) board. However,
>> Arndale (Exynos5250) board boots fine. Git bisect points to the
>> following as bad commit:
>>
>> 2361613206e66ce59cc0e08efa8d98ec15b84ed1 is the first bad commit
>> commit 2361613206e66ce59cc0e08efa8d98ec15b84ed1
>> Author: Grant Likely <grant.likely@linaro.org>
>> Date:   Sun Sep 15 22:32:39 2013 +0100
>>
>>     of/irq: Refactor interrupt-map parsing
>>
>> Reverting gave several conflicts which I could not resolve with certainty.
>
> This issue has been already fixed, but the fix has not yet been merged.
>
> See: https://lkml.org/lkml/2013/11/5/255

Thanks for the pointer. With your patch I am able to boot Origen using
the latest next tree.
I have replied to your patch with my tested-by.

-- 
With warm regards,
Sachin
