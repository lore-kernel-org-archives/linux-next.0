From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: build failure after merge of the amlogic tree
Date: Thu, 09 Jun 2016 15:43:48 -0700
Message-ID: <7hziquc7a3.fsf@baylibre.com>
References: <20160606095559.67cf4f00@canb.auug.org.au>
	<CAOi56cVQPutG1ZBw16=HWBAVdbV+i2VL4vDRdc_23qVT+MEL+A@mail.gmail.com>
	<20160606140231.394f5db7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:36742 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917AbcFIWnu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2016 18:43:50 -0400
Received: by mail-pf0-f169.google.com with SMTP id t190so17017337pfb.3
        for <linux-next@vger.kernel.org>; Thu, 09 Jun 2016 15:43:50 -0700 (PDT)
In-Reply-To: <20160606140231.394f5db7@canb.auug.org.au> (Stephen Rothwell's
	message of "Mon, 6 Jun 2016 14:02:31 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Kevin,
>
> On Sun, 5 Jun 2016 20:40:28 -0700 Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Not forgotten, but merged through Philip's reset tree, which I thought
>> was already in linux-next.  Sorry about that.
>
> It may well be, but we dislike implicit dependencies between trees ...
> it makes the merge order matter :-(  What you should have is a common
> non-rebasing branch that both trees merge.

Yup, I'll work this out with Philipp.

Kevin
