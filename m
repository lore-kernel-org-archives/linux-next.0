From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Wed, 31 May 2017 21:27:14 -0700
Message-ID: <1496291234.27407.179.camel@haakon3.risingtidesystems.com>
References: <20170601141055.3b64fefc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:46308 "EHLO
        linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751036AbdFAE1Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2017 00:27:16 -0400
In-Reply-To: <20170601141055.3b64fefc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bart Van Assche <bart.vanassche@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 2017-06-01 at 14:10 +1000, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next merge of the target-bva tree got a conflict in:
> 
>   drivers/target/target_core_transport.c
> 
> between commit:
> 
>   4ff83daa0200 ("target: Re-add check to reject control WRITEs with overflow data")
> 
> from the target-updates tree and commit:
> 
>   2c66660df665 ("target: Fix overflow/underflow handling of commands with a Data-Out buffer")
> 
> from the target-bva tree.
> 
> I fixed it up (I think (guidance appreciated), see below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 

Hi Bart,

The majority of this series hasn't been list reviewed, and shouldn't be
getting pushed in linux-next without some form of reviews.

I'll be getting back to v4.13 items now v4.12-rc fixes is out of the
way, but a weeks worth of list silence for your series doesn't mean
you're free to push un-reviewed stuff for drivers/target/ into
linux-next.
