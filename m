From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Mon, 25 Jul 2016 15:03:01 +0300
Message-ID: <CAHp75Vd=8d6upXK4f-tKQopQR649oSU_TeZYzu=epOf-0DznSA@mail.gmail.com>
References: <20160715121723.0f21f148@canb.auug.org.au> <2196027.ndrBocBl2R@vostro.rjw.lan>
 <20160717181448.GC1814@katana> <2565257.LbcJLfl1sl@vostro.rjw.lan> <20160719034806.GA1640@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34639 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbcGYMDD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 08:03:03 -0400
In-Reply-To: <20160719034806.GA1640@katana>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Jul 19, 2016 at 6:48 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> > Well, not knowing much about ACPI, I just need the conflict resolution
>> > for my latest i2c/for-next and your above branch. If you want to do it,
>> > fine with me. But maybe Jarkko will be back to office on Monday, too.
>>
>> Unfortunately, I don't see how these branches can be merged in a sensible
>> way without adding too much new code into the merge itself.
>>
>> Something needs to be dropped and then rebased and applied again.
>
> Okay, I'll drop the I2C parts. Next to the core parts which I will drop,
> there was also a driver patch making use of the core changes for which I
> requested some updates. Since those did not happen yet (Jarkko on
> holiday?), the core patches alone are not important anyhow.

Jarkko and Mika are on holidays, I recently noticed this thread,
sorry. For now your solution seems okay, since we can't push broken
parts into v4.8-rc1.

-- 
With Best Regards,
Andy Shevchenko
