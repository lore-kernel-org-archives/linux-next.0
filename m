From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: upcoming conflict between the target-updates and
 target-bva trees
Date: Thu, 01 Jun 2017 21:03:44 -0700
Message-ID: <1496376224.27407.228.camel@haakon3.risingtidesystems.com>
References: <20170602133928.2afa3e7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:52310 "EHLO
        linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdFBEDr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2017 00:03:47 -0400
In-Reply-To: <20170602133928.2afa3e7a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bart Van Assche <bart.vanassche@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, 2017-06-02 at 13:39 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Last night the tagret-bva tree was rebased on top of the target-updates
> tree.  Just now, part of the target-updates tree has been rewritten.
> So now I expect to get conflict(s) when I merge these trees since the
> commits in the target-updates tree are no longer the same as those that
> the target-bva tree was rebased on top of.
> 
> Please take a little time to sort out your development process.
> 

Unfortunately, this is going to continue to be a problem once these
patches are list reviewed, and included in target-updates.

Bart, can you please drop the patches until they are list reviewed so
there isn't a constant stream of merge conflicts in linux-next for your
un-reviewed code..?
