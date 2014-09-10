From: Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 9 Sep 2014 19:50:18 -0700
Message-ID: <CAD=FV=UwnNLJ+11sz73RqrNJa4n5yKUHzjZyQ4HpN_9MQ-2iuA@mail.gmail.com>
References: <20140908183350.5a4e357c@canb.auug.org.au>
	<20140909223952.GL2601@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:46800 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751925AbaIJCuS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Sep 2014 22:50:18 -0400
Received: by mail-vc0-f173.google.com with SMTP id le20so3918343vcb.32
        for <linux-next@vger.kernel.org>; Tue, 09 Sep 2014 19:50:18 -0700 (PDT)
In-Reply-To: <20140909223952.GL2601@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Zhong <zyw@rock-chips.com>

Hi,

On Tue, Sep 9, 2014 at 3:39 PM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Sep 08, 2014 at 06:33:50PM +1000, Stephen Rothwell wrote:
>
>> drivers/regulator/rk808-regulator.c:312:18: warning: 'struct rk808_board' declared inside parameter list
>>            struct rk808_board *pdata)
>
> Chris, as previously requested please send me any changes needed to
> update for the changes in the MFD driver.

See <https://patchwork.kernel.org/patch/4873501/>

-Doug
