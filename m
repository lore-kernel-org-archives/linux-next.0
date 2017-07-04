From: Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the pm tree
Date: Tue, 4 Jul 2017 11:00:30 -0500
Message-ID: <CAL_Jsq+bGVONzeRZ-wQ2UGARe537SLe1kqSxPYVQwwXneK3m9g@mail.gmail.com>
References: <20170623122534.3303f515@canb.auug.org.au> <20170703125524.5403a422@canb.auug.org.au>
 <s5ha84lipbt.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752038AbdGDQAw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Jul 2017 12:00:52 -0400
In-Reply-To: <s5ha84lipbt.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Mon, Jul 3, 2017 at 9:10 AM, Takashi Iwai <tiwai@suse.de> wrote:
> On Mon, 03 Jul 2017 04:55:24 +0200,
> Stephen Rothwell wrote:
>>
>> Hi all,
>>
>> [cc-ing the sound tree maintainer]
>
> Thanks.
>
>> With the merge window opening, just a reminder that this conflict
>> still exists.
>
> Rob, do you have an immutable branch to drag the affecting commit so
> that I can merge & resolve in my side?

Yes, use this branch:

git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/property-move

Rob
