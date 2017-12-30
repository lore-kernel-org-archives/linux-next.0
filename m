From: Johan Hedberg <johan.hedberg@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the bluetooth
 tree
Date: Sat, 30 Dec 2017 09:44:06 +0200
Message-ID: <20171230074406.GA26800@x1c.home>
References: <20171230102552.4c252635@canb.auug.org.au>
 <20171230103251.43a3f505@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42682 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751002AbdL3HoM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 30 Dec 2017 02:44:12 -0500
Content-Disposition: inline
In-Reply-To: <20171230103251.43a3f505@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcel Holtmann <marcel@holtmann.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On Sat, Dec 30, 2017, Stephen Rothwell wrote:
> On Sat, 30 Dec 2017 10:25:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Commit
> > 
> >   0a03f98b98c2 ("Bluetooth: Add a new 04ca:3015 QCA_ROME device")
> > 
> > is missing a Signed-off-by from its .
>                                       ^
> committer

It was me who originally committed and pushed this to the bluetooth-next
tree, and the commit does have a signed-off-by from me. However, it
looks like Marcel did some reshuffling/rebasing of the tree and now the
commit shows him in the committer field.

Johan
