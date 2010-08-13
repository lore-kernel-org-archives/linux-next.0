From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the final tree (usb
 tree related)
Date: Fri, 13 Aug 2010 09:05:48 -0700
Message-ID: <20100813160548.GA21222@kroah.com>
References: <20100802141823.143b2a36.sfr@canb.auug.org.au>
 <20100813144929.GA25259@kroah.com>
 <AANLkTi=GY7ndsAhe4u0ZjpuGU8Bhh+dUxQt+oaNtvTC0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41163 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755034Ab0HMQFw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Aug 2010 12:05:52 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTi=GY7ndsAhe4u0ZjpuGU8Bhh+dUxQt+oaNtvTC0@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 13, 2010 at 06:03:49PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 13, 2010 at 5:49 PM, Greg KH <greg@kroah.com> wrote:
> >> After merging the final tree, today's linux-next build (powerpc
> >> allyesconfig) produced these warnings:
> >>
> >> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:718: warning: 'fsg_show_nofua' defined but not used
> >> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:782: warning: 'fsg_store_nofua' defined but not used
> >> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:718: warning: 'fsg_show_nofua' defined but not used
> >> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:782: warning: 'fsg_store_nofua' defined but not used
> >>
> >> Introduced by commit ed4825f7332669779540be27cb263daf22af3b1c ("USB:
> >> gadget: storage: optional SCSI WRITE FUA bit") from the usb tree.
> >
> > Sorry about missing this, I have a patch to fix this up now.
> 
> I hope you are talking about last Michal's approach:
> <550ddf8273d87cb418dd5716cbec906e74aa03d4.1281625724.git.m.nazarewicz@samsung.com>

Yes.
