From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add bvanassche/linux.git/for-next to linux-next
Date: Mon, 19 Dec 2016 09:05:41 +1100
Message-ID: <20161219090529.25e15aa8@canb.auug.org.au>
References: <CA+55aFyYOjRnYhfm3Fu=p9AGqW_OY+=T0sg_AYFHt3M23hveSg@mail.gmail.com>
        <8952a919-1d55-301d-8b50-b3177713acc5@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753595AbcLRWFp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Dec 2016 17:05:45 -0500
In-Reply-To: <8952a919-1d55-301d-8b50-b3177713acc5@acm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, linux-next@vger.kernel.org, target-devel@vger.kernel.org

Hi Bart,

On Sun, 18 Dec 2016 11:51:28 +0100 Bart Van Assche <bart.vanassche@gmail.com> wrote:
>
> Nicholas Bellinger, the official SCSI target maintainer, stopped sending
> pull requests for the SCSI target subsystem (drivers/target) to Linus
> and I would like to take over. Nic has been CC-ed for the e-mail
> conversation below.

[Nicholas, should I remove the the target-updates and/or target-merge
trees from linux-next?]

> I have pushed out the patches I would like to send to Linus during the
> v4.10 merge window to
> kernel.org:/pub/scm/linux/kernel/git/bvanassche/linux.git/for-next.

I assume you meant

  git://git.kernel.org/pub/scm/linux/kernel/git/bvanassche/linux.git#for-next

> Would it be possible to add that branch to the linux-next test system?

Added from today.  For now it is called target-bva, but I will change
that when Nicholas replies to the above question.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
