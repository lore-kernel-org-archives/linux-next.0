From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree (gpio
 tree relatred)
Date: Wed, 20 Mar 2013 15:57:01 +0000
Message-ID: <CACxGe6shQN=RgPF+TQvQmkBC7E6MsG6Vnisxtxeq3kWgh-XHXw@mail.gmail.com>
References: <20130306114452.a041ab0737783f9730c1486e@canb.auug.org.au>
 <CACxGe6sZKRjSnwa-CHC1OhJoGP-ZQe4H2YbMYjDjNYcSdSyuow@mail.gmail.com> <20130321022524.37baf9fedb1848cdbdfc0eef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f181.google.com ([209.85.210.181]:62543 "EHLO
	mail-ia0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755440Ab3CTP5V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 11:57:21 -0400
Received: by mail-ia0-f181.google.com with SMTP id o25so1501829iad.40
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 08:57:21 -0700 (PDT)
In-Reply-To: <20130321022524.37baf9fedb1848cdbdfc0eef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ian Lartey <ian@slimlogic.co.uk>, Graeme Gregory <gg@slimlogic.co.uk>

On Wed, Mar 20, 2013 at 3:25 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> On Wed, 6 Mar 2013 09:10:42 +0800 Grant Likely <grant.likely@secretlab.ca> wrote:
>>
>> On Wed, Mar 6, 2013 at 8:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Caused by commit 82d4d6637fdf ("gpio/palmas: add in GPIO support for
>> > palmas charger").  I wonder if this was ever build tested. :-(
>>
>> Probably not. Looks like this driver doesn't get enabled without the
>> associated option in MFD. I didn't go searching for it, so my build
>> tests didn't catch it. I'll drop the patch from my tree. Sorry for the
>> pain.
>
> I am still having to revert this commit ....  :-(

Ugh, sorry. I reverted the patch while travelling, but never pushed
out the fixed tree. Try it now.

g.

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
