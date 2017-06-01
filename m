From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Wed, 31 May 2017 22:04:04 -0700
Message-ID: <1496293444.27407.184.camel@haakon3.risingtidesystems.com>
References: <20170601141055.3b64fefc@canb.auug.org.au>
         <1496293179.16453.1.camel@sandisk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:42776 "EHLO
        linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750848AbdFAFEG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2017 01:04:06 -0400
In-Reply-To: <1496293179.16453.1.camel@sandisk.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@sandisk.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2017-06-01 at 04:59 +0000, Bart Van Assche wrote:
> On Thu, 2017-06-01 at 14:10 +1000, Stephen Rothwell wrote:
> > Hi Bart,
> > 
> > Today's linux-next merge of the target-bva tree got a conflict in:
> > 
> >   drivers/target/target_core_transport.c
> > 
> > between commit:
> > 
> >   4ff83daa0200 ("target: Re-add check to reject control WRITEs with overflow data")
> > 
> > from the target-updates tree and commit:
> > 
> >   2c66660df665 ("target: Fix overflow/underflow handling of commands with a Data-Out buffer")
> > 
> > from the target-bva tree.
> > 
> > I fixed it up (I think (guidance appreciated), see below) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> 
> Hello Stephen,
> 
> Thanks for having fixed this up. I hadn't noticed that Nic had queued up patches
> that conflict with my patches. I will rebase my tree.
> 

Go ahead and get list review on drivers/target/ changes before pushing
them into linux-next, please.

Btw, I don't care if you queue up one's that do have at least two
Reviewed-bys into your tree, but everything that doesn't have
Reviewed-bys or Acked-by should not be going into linux-next.
