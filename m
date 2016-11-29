From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 29 Nov 2016 07:32:30 +0100
Message-ID: <583D20FE.7060707@iogearbox.net>
References: <20161129113126.2626e7fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:38923 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754124AbcK2Gcg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Nov 2016 01:32:36 -0500
In-Reply-To: <20161129113126.2626e7fe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/29/2016 01:31 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>    net/sched/cls_flower.c
>
> between commit:
>
>    d936377414fa ("net, sched: respect rcu grace period on cls destruction")
>
> from the net tree and commit:
>
>    13fa876ebd03 ("net/sched: cls_flower: merge filter delete/destroy common code")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!
