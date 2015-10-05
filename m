From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Mon, 5 Oct 2015 09:38:50 +0200
Message-ID: <CACRpkdbFisagqT0XXK87M0rPaXvX6CAmid_WeqEhyqFwrui5Qw@mail.gmail.com>
References: <20150925133410.3c9e2b03@canb.auug.org.au>
	<20151002133751.739bb08c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34099 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbJEHiu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2015 03:38:50 -0400
Received: by oiev17 with SMTP id v17so86218164oie.1
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2015 00:38:50 -0700 (PDT)
In-Reply-To: <20151002133751.739bb08c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>

On Fri, Oct 2, 2015 at 5:37 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>> Caused by commit
>>
>>   776180848b57 ("pinctrl: introduce driver for Atmel PIO4 controller")
>>
>> I have used the pinctrl tree from next-20150924 for today.
>
> I am still getting this error.

Sorry for slow fixing, I was travelling.

It should be fixed today.

Yours,
Linus Walleij
