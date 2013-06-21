From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the leds tree
Date: Fri, 21 Jun 2013 01:27:57 +0100
Message-ID: <CACxGe6vDaQ91_nU7qxSMxv-aTJbtZFu2cM9NpY2SYbqbg2Gpcg@mail.gmail.com>
References: <20130617152908.1b9c999c01f18262a387dc91@canb.auug.org.au>
 <1371450391.658890225@f333.mail.ru> <20130621101600.e9cff446d5f6e21c3e8599c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:55100 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965258Ab3FUA2R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2013 20:28:17 -0400
Received: by mail-ie0-f172.google.com with SMTP id 16so18345505iea.3
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2013 17:28:17 -0700 (PDT)
In-Reply-To: <20130621101600.e9cff446d5f6e21c3e8599c8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 21, 2013 at 1:16 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Guys,
>
> On Mon, 17 Jun 2013 10:26:31 +0400 Alexander Shiyan <shc_work@mail.ru> wrote:
>>
>> > After merging the leds tree, today's linux-next build (x86_64
>> > allmodconfig) failed like this:
>> >
>> > drivers/leds/leds-mc13783.c: In function 'mc13xxx_led_probe':
>> > drivers/leds/leds-mc13783.c:280:4: error: implicit declaration of function 'of_get_next_child' [-Werror=implicit-function-declaration]
>> >     child = of_get_next_child(parent, child);
>> >     ^
>> >
>> > Caused by commit 2ca3a455432f ("leds: leds-mc13783: Add devicetree support").  of_get_next_child() is only defined if CONFIG_OF is set.
>> >
>> > I have used the version of the leds tree from next-20130607 for today.
>>
>> The patch has already been sent by me.
>> http://www.spinics.net/lists/linux-leds/msg00994.html
>
> I anything happening about this?  That patch would need to go into the
> leds tree (with acks from devicetree people - Grant cc'd).

I've gone and looked at the patch. It should be reverted and
revisited. It interleaves a bunch of DT calls with non-DT calls which
the absence of empty stubs when !CONFIG_OF is intended to catch.

g.
