From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 30 Nov 2017 12:55:11 +1100
Message-ID: <20171130125511.6313f7d3@canb.auug.org.au>
References: <20171130125121.7d16ef43@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753234AbdK3BzN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Nov 2017 20:55:13 -0500
In-Reply-To: <20171130125121.7d16ef43@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ching Huang <ching2048@areca.com.tw>, Kees Cook <keescook@chromium.org>

Hi Martin

On Thu, 30 Nov 2017 12:51:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> + static void arcmsr_init_set_datetime_timer(struct AdapterControlBlock *pacb)
> + {
>  -	init_timer(&pacb->refresh_timer);
> ++	timer_setup(&pacb->eternal_timer, arcmsr_request_device_map, 0);
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^
That should have been arcmsr_set_iop_datetime, sorry.  I will fix it
tomorrow if you haven't rebased onto v4.15-rc1 by then :-)

-- 
Cheers,
Stephen Rothwell
