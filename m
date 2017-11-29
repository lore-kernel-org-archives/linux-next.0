From: Christian Gromm <christian.gromm@microchip.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Wed, 29 Nov 2017 13:42:15 +0100
Message-ID: <147c43f2-18de-2bde-d704-f9f33a0b0cf5@microchip.com>
References: <20171128081651.71a2e92a@canb.auug.org.au>
 <20171128194139.GA2653@kroah.com>
 <ece95101-65e9-9008-1e24-f9b76db13a98@microchip.com>
 <20171129232446.5b268bcb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:35434 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751961AbdK2Mkm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Nov 2017 07:40:42 -0500
In-Reply-To: <20171129232446.5b268bcb@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Shvetsov <andrey.shvetsov@k2l.de>

On 29.11.2017 13:24, Stephen Rothwell wrote:
> Hi Christian,
> 
> On Wed, 29 Nov 2017 09:44:44 +0100 Christian Gromm <christian.gromm@microchip.com> wrote:
>>
>> Hmm, am I missing something here? I have it in.
>> Here are copies of the patches in question and both have
>> a "Signed-off-by" line in.
> 
> According to the From: line in the body of these emails, the author of
> this patch is Andrey Shvetsov <andrey.shvetsov@k2l.de>, and there is no
> Signed-off-by line from Andrey.
> 
Got it. Thanks! We will fix our process so it won't happen again :)

regards,
Chris
