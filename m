From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Thu, 01 Jun 2017 20:58:07 -0700
Message-ID: <1496375887.27407.223.camel@haakon3.risingtidesystems.com>
References: <20170601141055.3b64fefc@canb.auug.org.au>
         <1496293179.16453.1.camel@sandisk.com>
         <1496293444.27407.184.camel@haakon3.risingtidesystems.com>
         <aff8f6fa-89b4-3dee-2c3f-68eae613fbba@sandisk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:60049 "EHLO
        linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751122AbdFBD6J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2017 23:58:09 -0400
In-Reply-To: <aff8f6fa-89b4-3dee-2c3f-68eae613fbba@sandisk.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@sandisk.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2017-06-01 at 14:14 -0700, Bart Van Assche wrote:
> On 05/31/17 22:04, Nicholas A. Bellinger wrote:
> > Go ahead and get list review on drivers/target/ changes before pushing
> > them into linux-next, please.
> > 
> > Btw, I don't care if you queue up one's that do have at least two
> > Reviewed-bys into your tree, but everything that doesn't have
> > Reviewed-bys or Acked-by should not be going into linux-next.
> 
> It is not your job to rewrite the rules for linux-next. I'm following
> the guidelines I received from Stephen in December 2016. You were copied
> on the e-mail with guidelines Stephen sent to me. See also
> https://www.spinics.net/lists/linux-next/msg38488.html.
> 
> Stephen, if anything would have changed in the meantime that I'm not
> aware of please let me know.
> 

The point is you're not sending PULL requests.

But like I said earlier, I really don't care if you put patches that
have been reviewed into your tree for linux-next before I get a chance
to review and pick them up for target-pending.

However, you putting random un-reviewed changes is where I have to draw
the line, especially considering what happened earlier in year where
what you had in linux-next close to the merge window was completely and
utterly broken.

Would you put un-reviewed block and scsi changes into linux-next..?

What would those subsystem maintainers say about that..?

Why is drivers/target any different..?
