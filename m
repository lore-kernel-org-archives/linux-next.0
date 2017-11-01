From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 31 Oct 2017 21:17:10 -0700
Message-ID: <CAM_iQpWmytJSu7=7VS+gDPZUbHWHbtmxn9mwXD2E=fNXSq9zNA@mail.gmail.com>
References: <20171101115836.6b1025ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:55540 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbdKAERb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2017 00:17:31 -0400
In-Reply-To: <20171101115836.6b1025ba@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Pirko <jiri@mellanox.com>

On Tue, Oct 31, 2017 at 5:58 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   net/sched/cls_api.c
>
> between commit:
>
>   822e86d997e4 ("net_sched: remove tcf_block_put_deferred()")
>
> from the net tree and commit:
>
>   8c4083b30e56 ("net: sched: add block bind/unbind notif. and extended block_get/put")
>
> from the net-next tree.

Seems good.

Thanks!
