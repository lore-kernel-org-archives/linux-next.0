From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] serial: st-asc: Use new GPIOD API to obtain RTS pin
Date: Tue, 21 Feb 2017 11:26:21 +0100
Message-ID: <CACRpkdbehwfPghwpnG1sEhFngbRQ5WUS12UEDybsBvoAt7fnpA@mail.gmail.com>
References: <20170208161113.1b597c01@canb.auug.org.au> <20170208092425.azqkx3nwf4jhsfz5@dell>
 <20170208130039.GA28327@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:38023 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751352AbdBUK0X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Feb 2017 05:26:23 -0500
Received: by mail-it0-f41.google.com with SMTP id y135so44741369itc.1
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2017 02:26:22 -0800 (PST)
In-Reply-To: <20170208130039.GA28327@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Wed, Feb 8, 2017 at 2:00 PM, Greg KH <greg@kroah.com> wrote:

>> -                     gpiod = devm_get_gpiod_from_child(port->dev, "rts",
>> -                                                       &np->fwnode);
>> -                     if (!IS_ERR(gpiod)) {
>> -                             gpiod_direction_output(gpiod, 0);
>> +                     gpiod = devm_fwnode_get_gpiod_from_child(port->dev,
>> +                                                              "rts",
>> +                                                              &np->fwnode,
>> +                                                              GPIOD_OUT_LOW,
>> +                                                              np->name);
>
> I can't apply this :(
>
> Usually, when you move apis around, you add it, then convert it, wait a
> kernel release, then remove the old one.  That allows for issues like
> this when new code is added in one maintainer's branch but not yours.

Sorry about this, I guess I got a bit stressed too recently so I was not
able to solve this in the ultimate way.

We converted over all existing users of the APIs but I guess I optimistically
assumed no new users would be added in this
kernel cycle, but of course they did.... this new driver was using it, Stephen
fixed that up in next and now a patch to that driver arrived on top, ouch.

> So how about reverting your "drop the function" patch and then wait for
> -rc2 to really remove it?

I never did a thing like this before, hm sorry for the inexperience. :(

I did make an immutable branch like Andy suggested but didn't advertise
it well enough. But as stated that approach sucks anyways.

Typically I saw this suggestion right after sending the pull request to
Torvalds (yeah I should have seen it first, my inbox is chaotic too, mea
culpa).

I'll follow up on it asking him not to pull that and look for a resolution like
you suggest instead. Since it is three patches that then have users on
top I guess it is best to add back the old prototype helper for this driver
exclusively then fix it for -rc2.

Yours,
Linus Walleij
