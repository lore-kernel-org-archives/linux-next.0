From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 2 Aug 2017 19:42:31 -0700
Message-ID: <20170802194231.26a45521@xeon-e3>
References: <20170803120137.697ebace@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:34702 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751753AbdHCCmf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2017 22:42:35 -0400
Received: by mail-pg0-f45.google.com with SMTP id u185so676703pgb.1
        for <linux-next@vger.kernel.org>; Wed, 02 Aug 2017 19:42:35 -0700 (PDT)
In-Reply-To: <20170803120137.697ebace@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>

On Thu, 3 Aug 2017 12:01:37 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   drivers/net/hyperv/netvsc.c
> 
> between commit:
> 
>   4a0dee1ffe0e ("netvsc: Initialize 64-bit stats seqcount")
> 
> from the net tree and commit:
> 
>   35fbbccfb417 ("netvsc: save pointer to parent netvsc_device in channel table")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks, that looks right.
