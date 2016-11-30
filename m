From: Stafford Horne <shorne@gmail.com>
Subject: Re: Add openrisc for-next branch to linux-next
Date: Thu, 1 Dec 2016 07:37:20 +0900 (JST)
Message-ID: <alpine.LFD.2.20.1612010735330.29569@lianli.shorne-pla.net>
References: <alpine.LFD.2.20.1611302214520.29569@lianli.shorne-pla.net> <20161201083555.1b9005c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33866 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751500AbcK3WhY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 17:37:24 -0500
In-Reply-To: <20161201083555.1b9005c2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stafford Horne <shorne@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, openrisc@lists.librecores.org



On Thu, 1 Dec 2016, Stephen Rothwell wrote:

> Hi Stafford,
>
> On Wed, 30 Nov 2016 22:22:41 +0900 (JST) Stafford Horne <shorne@gmail.com> wrote:
>>
>> I have been working on getting the OpenRISC backlog of fixes sorted out
>> for upstream.  Can this branch be added to linux-next?
>>
>>    git://github.com/openrisc/linux.git for-next
>>
>> These have been through a few reviews and we plan to ask Linus to pull in
>> the next merge window.
>
> Added from today.
>
> Just a note: your top commits has no Signed-off-by from you as the committer ...

Hello,

Right I had been adding those as part of the `git send-email` phase but I 
realize I do need them in git now. Sorry about that.

> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
>
> You will need to ensure that the patches/commits in your tree/series have
> been:
>     * submitted under GPL v2 (or later) and include the Contributor's
>        Signed-off-by,
>     * posted to the relevant mailing list,
>     * reviewed by you (or another maintainer of your subsystem tree),
>     * successfully unit tested, and
>     * destined for the current or next Linux merge window.
>
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Thank You,

-Stafford
