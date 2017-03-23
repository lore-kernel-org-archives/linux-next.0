From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the gpio tree with the input tree
Date: Thu, 23 Mar 2017 09:30:49 -0700
Message-ID: <CAKdAkRS8QsxUVzg8DH67nbSNHu0fy_jWJStLGt-4fcxy34R30w@mail.gmail.com>
References: <20170320150340.6d73c179@canb.auug.org.au> <CACRpkdaDUUDkEqYRRp4St=uPs5Z2TRX1XT14+yvsdLiitBaCdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f179.google.com ([209.85.217.179]:32789 "EHLO
        mail-ua0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751336AbdCWQav (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2017 12:30:51 -0400
In-Reply-To: <CACRpkdaDUUDkEqYRRp4St=uPs5Z2TRX1XT14+yvsdLiitBaCdg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>

On Thu, Mar 23, 2017 at 2:27 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Mar 20, 2017 at 5:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Linus,
>>
>> Today's linux-next merge of the gpio tree got a conflict in:
>>
>>   drivers/input/misc/soc_button_array.c
>>
>> between commit:
>>
>>   a01cd17000a4 ("Input: soc_button_array - use NULL for GPIO connection ID")
>>
>> from the input tree and commit:
>>
>>   c5097538c86a ("Input: soc_button_array - Propagate error from gpiod_count()")
>>
>> from the gpio tree.
>
> Dmitry, I could pick the commit from the input tree and apply
> Stephen's solution and put the result in the GPIO tree if you think
> it's a good idea.

I think the fix is trivial and if it does not both Stephen to carry it
on we'll let the other Linus resolve it in his tree when merging. I
think he prefers to have cross-tree merges only happen when it is
needed for development, not simply to resolve conflicts.

Thanks.

-- 
Dmitry
