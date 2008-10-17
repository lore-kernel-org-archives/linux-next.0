From: Dmitry <dbaryshkov@gmail.com>
Subject: Re: linux-next: usb tree build failure
Date: Fri, 17 Oct 2008 04:41:50 +0400
Message-ID: <bc64b4640810161741g5329d8c1od6910f05352370b8@mail.gmail.com>
References: <20081014145917.708bace4.sfr@canb.auug.org.au>
	 <20081016160503.GB27769@kroah.com>
	 <20081016213613.GB11876@doriath.ww600.siemens.net>
	 <20081017112610.83a67160.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:10594 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134AbYJQAlv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Oct 2008 20:41:51 -0400
Received: by yw-out-2324.google.com with SMTP id 9so71114ywe.1
        for <linux-next@vger.kernel.org>; Thu, 16 Oct 2008 17:41:50 -0700 (PDT)
In-Reply-To: <20081017112610.83a67160.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

2008/10/17 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Dmitry,
>
> On Fri, 17 Oct 2008 01:36:13 +0400 Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>>
>> After few tries I can come with pretty simple but pretty strange solution:
>>
>> >From 1c6dd41e074c5f526fc29b00a2bf265497d2819d Mon Sep 17 00:00:00 2001
>> From: Dmitry Baryshkov <dbaryshkov@gmail.com>
>> Date: Fri, 17 Oct 2008 01:30:15 +0400
>> Subject: [PATCH] USB: unbreak recursive dependancy
>>
>> After addition of TMIO usb driver Kconfig sees the recursive dependency
>> Break it by rephrasing ARCH_PNX4008 OHCI deps.
>
> I will add this to today's linux-next, thanks.

Thank you. However I suggest to take this as a precaution. As kernel
grows, various interdeps
also grow. I fear that soon we will have to rewrite Kconfig
depencencies to take care
upon impossible combinations of symbols (the chain that raised this
topic is impossible,
as I said before).

-- 
With best wishes
Dmitry
