From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the bluetooth tree
Date: Sun, 31 Dec 2017 13:32:18 +0200
Message-ID: <CAHp75VeLSrkJU0QFQjawn_sfOVhE5_4N68WX1hjenD7ONRz1yw@mail.gmail.com>
References: <20171230102552.4c252635@canb.auug.org.au> <20171230103251.43a3f505@canb.auug.org.au>
 <20171230074406.GA26800@x1c.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:46302 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750910AbdLaLcT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Dec 2017 06:32:19 -0500
In-Reply-To: <20171230074406.GA26800@x1c.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johan Hedberg <johan.hedberg@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Marcel Holtmann <marcel@holtmann.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Dec 30, 2017 at 9:44 AM, Johan Hedberg <johan.hedberg@gmail.com> wrote:
> Hi,
>
> On Sat, Dec 30, 2017, Stephen Rothwell wrote:
>> On Sat, 30 Dec 2017 10:25:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Commit
>> >
>> >   0a03f98b98c2 ("Bluetooth: Add a new 04ca:3015 QCA_ROME device")
>> >
>> > is missing a Signed-off-by from its .
>>                                       ^
>> committer
>
> It was me who originally committed and pushed this to the bluetooth-next
> tree, and the commit does have a signed-off-by from me. However, it
> looks like Marcel did some reshuffling/rebasing of the tree and now the
> commit shows him in the committer field.

In PDx86 subsystem we in the result of this check split our (Darren's
and mine) review queues to a separate *non-published* (OK, they are
visible, but not considered published) branches.
Rebase, as stated that time by Linus, as formally creating new commits.

-- 
With Best Regards,
Andy Shevchenko
