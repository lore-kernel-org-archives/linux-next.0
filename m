From: Neal Cardwell <ncardwell@google.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Sun, 6 Aug 2017 22:21:43 -0400
Message-ID: <CADVnQyncPCCp5T+jDU=S4KF-X+Od8sPFJGEdFhWE9k5VABJqFQ@mail.gmail.com>
References: <20170807120113.5e51eec0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:37186 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751507AbdHGCWP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Aug 2017 22:22:15 -0400
Received: by mail-qk0-f169.google.com with SMTP id z18so33024167qka.4
        for <linux-next@vger.kernel.org>; Sun, 06 Aug 2017 19:22:14 -0700 (PDT)
In-Reply-To: <20170807120113.5e51eec0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yuchung Cheng <ycheng@google.com>

On Sun, Aug 6, 2017 at 10:01 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   net/ipv4/tcp_output.c
>
> between commit:
>
>   a2815817ffa6 ("tcp: enable xmit timer fix by having TLP use time when RTO should fire")
>
> from the net tree and commit:
>
>   bb4d991a28cc ("tcp: adjust tail loss probe timeout")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry about that. Will try to follow that procedure in the future.

thanks,
neal
