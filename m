From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Wed, 31 May 2017 22:15:07 -0700
Message-ID: <1496294107.27407.191.camel@haakon3.risingtidesystems.com>
References: <20170601141055.3b64fefc@canb.auug.org.au>
         <1496291234.27407.179.camel@haakon3.risingtidesystems.com>
         <1496293517.16453.3.camel@sandisk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:34755 "EHLO
        linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751036AbdFAFPJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2017 01:15:09 -0400
In-Reply-To: <1496293517.16453.3.camel@sandisk.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@sandisk.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2017-06-01 at 05:05 +0000, Bart Van Assche wrote:
> On Wed, 2017-05-31 at 21:27 -0700, Nicholas A. Bellinger wrote:
> > but a weeks worth of list silence for your series doesn't mean
> > you're free to push un-reviewed stuff for drivers/target/ into
> > linux-next.
> 
> I think this is an example of the pot calling the kettle black.
> Your patch "target: Re-add check to reject control WRITEs with
> overflow data" has not been reviewed by anyone but was pushed
> into linux-next and sent to Linus anyway.

Heh, it fixed a regression you yourself pointed out.  :)

If your going to report a bug and not review the patch to address the
regression, I'm not going to let that regression slide to restore
existing behavior, just because you didn't bother to review the patch in
three plus weeks for the bug you reported.

Anyways, I'll get to your patches, but please get reviews on the list by
sending series that people want to review, instead of large unwieldy
series that intermix new features and random bug-fixes without any
context.

No wonder why people don't send time reviewing them!
