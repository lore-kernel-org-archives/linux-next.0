From: "Justin Mattock" <justinmattock@gmail.com>
Subject: Re: Suspend issues on 2.6.27-rc2 (was: Heavy suspend and io problems in 2.6.27-rc1-00156-g94ad374)
Date: Mon, 11 Aug 2008 18:43:05 -0700
Message-ID: <dd18b0c30808111843y3f2aa2fbrbc9fcbd16913311a@mail.gmail.com>
References: <20080731210507.GA6094@denkbrett.schottelius.org>
	 <200808071852.11080.rjw@sisk.pl>
	 <20080811180416.GA22969@denkbrett.schottelius.org>
	 <200808112239.29292.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.224]:60043 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbYHLBnF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2008 21:43:05 -0400
Received: by rv-out-0506.google.com with SMTP id k40so2526710rvb.1
        for <linux-next@vger.kernel.org>; Mon, 11 Aug 2008 18:43:05 -0700 (PDT)
In-Reply-To: <200808112239.29292.rjw@sisk.pl>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nico Schottelius <nico-linux-kernel-bugreport20080731@schottelius.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Mon, Aug 11, 2008 at 1:39 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Monday, 11 of August 2008, Nico Schottelius wrote:
>> Rafael J. Wysocki [Thu, Aug 07, 2008 at 06:52:10PM +0200]:
>> > > The problem continues to exist:
>> > >
>> > > I tested it on vanilla 2.6.27-rc2: Same problem, system does not wake up.
>> > >
>> > > Did not test the proposed patch, because it did not restore the console
>> > > in any tested case yet, though it at least wakes the system up.
>> >
>> > What graphics adapter is there in your box?
>>
>> x1400, using radeonhd (also from git)
>>
>> It's a T60 lenovo thinkpad.
>
> There also are models with Intel graphics, I think.
>
> Anyway, the problem is related to either the graphics driver, or ACPI.
>
> Please verify if any ACPI-related settings haven't changed in your .config
> between the good kernel and the failing one.
>
> Thanks,
> Rafael
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>

Just to let you know, I am having suspend issues as well,
(not kernel related),
ATI chipset, my situation maybe different, but you never know.
last week I was using xorg 7.1 with no issues,
now after an upgrade through debian sid
xorg 7.3(or whatever the number is), the system wakes up
to a black screen, then after around two or three minuetes
I regain my screen again. Could be xorg, or something else.
Maybe you are having the same issue.

-- 
Justin P. Mattock
