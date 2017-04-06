From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Fri, 7 Apr 2017 07:51:11 +1000
Message-ID: <20170407075111.5209c0b3@canb.auug.org.au>
References: <20170406133420.3e231d2a@canb.auug.org.au>
        <20170406185857.GA19194@gofer.mess.org>
        <20170406191922.GB6631@kroah.com>
        <20170406203905.GA20704@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752631AbdDFVvP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Apr 2017 17:51:15 -0400
In-Reply-To: <20170406203905.GA20704@gofer.mess.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sean Young <sean@mess.org>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Derek Robson <robsonde@gmail.com>

Hi Sean,

On Thu, 6 Apr 2017 21:39:05 +0100 Sean Young <sean@mess.org> wrote:
>
> I think this is happening:
> 
> On the v4l-dvb tree, 5cd6522 modifies both lirc_sasem.c and lirc_sir.c;
> then both files are removed. Now 87ddb91067b9 is merged from the staging
> tree and both files don't exist any more, so it no longer applies even
> though the patch is the same.

That is exactly right, but ...

> If I drop 87ddb91067b9 from staging-next, I can merge it to v4l-dvb, 
> otherwise I get merge conflicts.

The resolution is trivial, so don't worry about it.

-- 
Cheers,
Stephen Rothwell
