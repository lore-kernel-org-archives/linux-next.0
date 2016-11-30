From: Stafford Horne <shorne@gmail.com>
Subject: Re: Add openrisc for-next branch to linux-next
Date: Thu, 1 Dec 2016 07:02:26 +0900 (JST)
Message-ID: <alpine.LFD.2.20.1612010658350.29569@lianli.shorne-pla.net>
References: <alpine.LFD.2.20.1611302214520.29569@lianli.shorne-pla.net> <f7f0e124-00b9-5b21-9ca0-1f17e7c338bd@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34491 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759190AbcK3WCh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 17:02:37 -0500
In-Reply-To: <f7f0e124-00b9-5b21-9ca0-1f17e7c338bd@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stafford Horne <shorne@gmail.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, openrisc@lists.librecores.org



On Wed, 30 Nov 2016, Randy Dunlap wrote:

> On 11/30/16 05:22, Stafford Horne wrote:
>> Hi Stephen,
>>
>> I have been working on getting the OpenRISC backlog of fixes sorted out for upstream.  Can this branch be added to linux-next?
>>
>>   git://github.com/openrisc/linux.git for-next
>>
>> These have been through a few reviews and we plan to ask Linus to pull in the next merge window.
>>
>> -Stafford
>
> Hi,
>
> I see that you have updated MAINTAINERS.  Good.
>
> Does openRISC support VGA console?
> I tried to send a patch to Jason a few days ago.
> Please look at http://marc.info/?l=linux-kernel&m=147968525011508&w=2
> (or I can resend it if you wish).
>
> The kbuild test bot has been reporting this build error for several
> months.  If my fix is wrong, please submit something else.

Hi Randy,

I was watching that thread, I honestly thought it would have been pulled 
in by one of the console maintainers.

Openrisc does not have support for vga console, some people may have 
hacked something together, but its not in our kernel yet.  So I have no 
issue disabling it in the build.

I will pull it in to my branch.

If someone else pulls,
Acked-by: Stafford Horne <shorne@gmail.com>

-Stafford
