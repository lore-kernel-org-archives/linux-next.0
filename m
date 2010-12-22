From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH v3 1/1] input/tc3589x: add tc3589x keypad support
Date: Wed, 22 Dec 2010 13:03:18 +0100
Message-ID: <AANLkTimc4aT+NzQgcY+-Wm0oyFqqO9Fi3qREjPvcT1B0@mail.gmail.com>
References: <1292927011-6898-1-git-send-email-sundar.iyer@stericsson.com>
	<20101222102050.GE22590@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:48281 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752323Ab0LVMDT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2010 07:03:19 -0500
Received: by pzk9 with SMTP id 9so1696201pzk.1
        for <linux-next@vger.kernel.org>; Wed, 22 Dec 2010 04:03:18 -0800 (PST)
In-Reply-To: <20101222102050.GE22590@core.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

2010/12/22 Dmitry Torokhov <dmitry.torokhov@gmail.com>:
> On Tue, Dec 21, 2010 at 03:53:31PM +0530, Sundar Iyer wrote:
>> Add support for the keypad controller module found on the
>> TC3589X devices. This driver default adds the support for
>> TC35893 device.
>>
>> Signed-off-by: Sundar Iyer <sundar.iyer@stericsson.com>
>> ---
>> Changes:
>> =A0- v3: introduced keypad_stopped flag to check suspend/resume/open=
/close
>> =A0 =A0 =A0 =A0operations
>
> Acked-by: Dmitry Torokhov <dtor@mail.ru>
>
> Thanks for making the changes.

I've applied it to the ux500-core branch and pushed so
it gets tested in -next with the rest of the tc3589x stuff...

Yours,
Linus Walleij
