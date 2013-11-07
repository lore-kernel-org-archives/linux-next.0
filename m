From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Boot failure on Origen with next-20131107
Date: Thu, 07 Nov 2013 12:29:46 +0100
Message-ID: <4908982.5yt51ejnyk@amdc1227>
References: <CAK9yfHz+H4FQpo_J0ycJP_rvRPMyDgXpZFvx+GvRjyywECUoCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43188 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783Ab3KGL3y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2013 06:29:54 -0500
In-reply-to: <CAK9yfHz+H4FQpo_J0ycJP_rvRPMyDgXpZFvx+GvRjyywECUoCw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>

Hi Sachin,

On Thursday 07 of November 2013 16:25:15 Sachin Kamat wrote:
> Hi,
> 
> Today's linux next fails to boot Origen (Exynos4210) board. However,
> Arndale (Exynos5250) board boots fine. Git bisect points to the
> following as bad commit:
> 
> 2361613206e66ce59cc0e08efa8d98ec15b84ed1 is the first bad commit
> commit 2361613206e66ce59cc0e08efa8d98ec15b84ed1
> Author: Grant Likely <grant.likely@linaro.org>
> Date:   Sun Sep 15 22:32:39 2013 +0100
> 
>     of/irq: Refactor interrupt-map parsing
> 
> Reverting gave several conflicts which I could not resolve with certainty.

This issue has been already fixed, but the fix has not yet been merged.

See: https://lkml.org/lkml/2013/11/5/255

Best regards,
Tomasz
