From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (ux500-core tree related)
Date: Tue, 28 Dec 2010 01:29:33 +0100
Message-ID: <AANLkTinjwN2-cVy8qsemuPOntPy-x0WS9_3t-Hc4xh0+@mail.gmail.com>
References: <20101223223634.8c92ef31.sfr@canb.auug.org.au>
	<20101227162021.de3af7bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:44835 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152Ab0L1A3e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 19:29:34 -0500
In-Reply-To: <20101227162021.de3af7bc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sundar Iyer <sundar.iyer@stericsson.com>, Dmitry Torokhov <dtor@mail.ru>

2010/12/27 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> On Thu, 23 Dec 2010 22:36:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the final tree, today's linux-next build (powerpc allyesconfig)
>> failed like this:
>>
>> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_enable':
>> drivers/input/keyboard/tc3589x-keypad.c:239: error: 'keypad' undeclared (first use in this function)
>> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_disable':
>> drivers/input/keyboard/tc3589x-keypad.c:268: error: 'keypad' undeclared (first use in this function)
>> drivers/input/keyboard/tc3589x-keypad.c: At top level:
>> drivers/input/keyboard/tc3589x-keypad.c:448: error: expected ',' or ';' before 'static'
>> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_init':
>> drivers/input/keyboard/tc3589x-keypad.c:460: error: 'tc3589x_keypad_driver' undeclared (first use in this function)
>> drivers/input/keyboard/tc3589x-keypad.c: In function 'tc3589x_keypad_exit':
>> drivers/input/keyboard/tc3589x-keypad.c:466: error: 'tc3589x_keypad_driver' undeclared (first use in this function)
>> drivers/input/keyboard/tc3589x-keypad.c:466: warning: 'return' with a value, in function returning void
>>
>> Caused by commit 1967733650dac41c93954a187246c91430c4a94f
>> ("input/tc3589x: add tc3589x keypad support").
>
> This error is still there, so I reverted the above commit for today.

Ooopsie, thanks for noticing. I've reverted this driver and pushed now.
This driver will likely have to wait for the next merge window.

Yours,
Linus Walleij
