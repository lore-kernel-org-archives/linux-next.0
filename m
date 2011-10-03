From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Mon, 3 Oct 2011 08:55:41 +0200
Message-ID: <CACRpkdYyPWkVJpfxvF95PtjC7cv13N-8YtNs_6vfvhTD8fEMvQ@mail.gmail.com>
References: <20110930145042.4a7ee530848262294b297939@canb.auug.org.au>
	<CACRpkdYkVOxHhyV1yap20YupFdw_ux39DqMK6wLb+LR+EHRusg@mail.gmail.com>
	<20110930231906.7859fd1df20e5609301b3646@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:58680 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827Ab1JCGzm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Oct 2011 02:55:42 -0400
In-Reply-To: <20110930231906.7859fd1df20e5609301b3646@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 30, 2011 at 3:19 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> On Fri, 30 Sep 2011 14:52:28 +0200 Linus Walleij <linus.walleij@linar=
o.org> wrote:
>>
>> On Fri, Sep 30, 2011 at 6:50 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>
>> > I have applied the following patch for today (Linus, the
>> > drivers/pinctrl/pinmux.c part of this can be applied to your tree)=
=2E
>>
>> Thanks a lot Stephen, applied and pushed this to the pinctrl tree!
>
> You can't apply the whole patch since export.h doe not exist outside =
the
> moduleh tree in linux-next (did you try to build it?). =A0As I said a=
bove
> only the drivers/pinctrl/pinmux.c part is applicable to your tree.

OK right, I fixed it up, sorry...

Thanks,
Linus Walleij
