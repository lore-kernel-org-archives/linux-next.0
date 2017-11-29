From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Wed, 29 Nov 2017 10:32:34 +0100
Message-ID: <20171129093234.GA5140@kroah.com>
References: <20171128081651.71a2e92a@canb.auug.org.au>
 <20171128194139.GA2653@kroah.com>
 <ece95101-65e9-9008-1e24-f9b76db13a98@microchip.com>
 <20171129091426.GA4414@kroah.com>
 <226f8ef0-536b-a1e9-64f7-70f1c8031553@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50084 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751334AbdK2Jcc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Nov 2017 04:32:32 -0500
Content-Disposition: inline
In-Reply-To: <226f8ef0-536b-a1e9-64f7-70f1c8031553@microchip.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Gromm <christian.gromm@microchip.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Shvetsov <andrey.shvetsov@k2l.de>

On Wed, Nov 29, 2017 at 10:25:10AM +0100, Christian Gromm wrote:
> On 29.11.2017 10:14, Greg KH wrote:
> > On Wed, Nov 29, 2017 at 09:44:44AM +0100, Christian Gromm wrote:
> > > On 28.11.2017 20:41, Greg KH wrote:
> > > > On Tue, Nov 28, 2017 at 08:16:51AM +1100, Stephen Rothwell wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > Commits
> > > > > 
> > > > >     2525ef557c73 ("staging: most: update driver usage file")
> > > > >     e7e3ce04588c ("staging: most: core: fix list traversing")
> > > > > 
> > > > > are missing a Signed-off-by from their author.
> > > > 
> > > > Ugh, I missed that.  Christian, please be more careful.
> > > > 
> > > 
> > > Hmm, am I missing something here? I have it in.
> > > Here are copies of the patches in question and both have
> > > a "Signed-off-by" line in.
> > > 
> > > ---snip---
> > > Received: from muaddib.microchip.com (10.10.76.4) by
> > > chn-sv-exch05.mchp-main.com (10.10.76.106) with Microsoft SMTP Server id
> > > 14.3.352.0; Tue, 21 Nov 2017 07:05:31 -0700
> > > From: Christian Gromm <christian.gromm@microchip.com>
> > > To: gregkh@linuxfoundation.org
> > > CC: driverdev-devel@linuxdriverproject.org, Andrey Shvetsov
> > > <andrey.shvetsov@k2l.de>, Christian Gromm <christian.gromm@microchip.com>
> > > Subject: [PATCH 48/50] staging: most: core: fix list traversing
> > > Date: Tue, 21 Nov 2017 15:05:22 +0100
> > > Message-ID:
> > > <1511273124-7840-49-git-send-email-christian.gromm@microchip.com>
> > > X-Mailer: git-send-email 2.7.4
> > > In-Reply-To:
> > > <1511273124-7840-1-git-send-email-christian.gromm@microchip.com>
> > > References: <1511273124-7840-1-git-send-email-christian.gromm@microchip.com>
> > > Content-Type: text/plain
> > > Return-Path: christian.gromm@microchip.com
> > > X-MS-Exchange-Organization-AuthSource: CHN-SV-EXCH05.mchp-main.com
> > > X-MS-Exchange-Organization-AuthAs: Internal
> > > X-MS-Exchange-Organization-AuthMechanism: 10
> > > X-MS-Exchange-Organization-AVStamp-Mailbox: SYMANTEC;628359232;0;info
> > > MIME-Version: 1.0
> > > 
> > > From: Andrey Shvetsov <andrey.shvetsov@k2l.de>
> > > This patch fixes the offset and data handling when traversing
> > > the list of devices that are attached to the bus.
> > > 
> > > Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> > > ---
> > >   drivers/staging/most/core.c | 17 +++++++++++++----
> > >   1 file changed, 13 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/most/core.c b/drivers/staging/most/core.c
> > > index d03ff97..9729206 100644
> > > --- a/drivers/staging/most/core.c
> > > +++ b/drivers/staging/most/core.c
> > > @@ -535,10 +535,16 @@ static struct core_component *match_component(char
> > > *name)
> > >   	return NULL;
> > >   }
> > > 
> > > +struct show_links_data {
> > > +	int offs;
> > > +	char *buf;
> > > +};
> > > +
> > >   int print_links(struct device *dev, void *data)
> > >   {
> > > -	int offs = 0;
> > > -	char *buf = data;
> > > +	struct show_links_data *d = data;
> > > +	int offs = d->offs;
> > > +	char *buf = d->buf;
> > >   	struct most_channel *c;
> > >   	struct most_interface *iface = to_most_interface(dev);
> > > 
> > > @@ -560,13 +566,16 @@ int print_links(struct device *dev, void *data)
> > >   					 dev_name(&c->dev));
> > >   		}
> > >   	}
> > > +	d->offs = offs;
> > >   	return 0;
> > >   }
> > > 
> > >   static ssize_t links_show(struct device_driver *drv, char *buf)
> > >   {
> > > -	bus_for_each_dev(&mc.bus, NULL, buf, print_links);
> > > -	return strlen(buf);
> > > +	struct show_links_data d = { .buf = buf };
> > > +
> > > +	bus_for_each_dev(&mc.bus, NULL, &d, print_links);
> > > +	return d.offs;
> > >   }
> > > 
> > >   static ssize_t components_show(struct device_driver *drv, char *buf)
> > > -- 
> > > 2.7.4
> > > 
> > > 
> > > and
> > > 
> > > 
> > > Received: from muaddib.microchip.com (10.10.76.4) by
> > > chn-sv-exch05.mchp-main.com (10.10.76.106) with Microsoft SMTP Server id
> > > 14.3.352.0; Tue, 21 Nov 2017 07:05:26 -0700
> > > From: Christian Gromm <christian.gromm@microchip.com>
> > > To: gregkh@linuxfoundation.org
> > > CC: driverdev-devel@linuxdriverproject.org, Andrey Shvetsov
> > > <andrey.shvetsov@k2l.de>, Christian Gromm <christian.gromm@microchip.com>
> > > Subject: [PATCH 44/50] staging: most: update driver usage file
> > > Date: Tue, 21 Nov 2017 15:05:18 +0100
> > > Message-ID:
> > > <1511273124-7840-45-git-send-email-christian.gromm@microchip.com>
> > > X-Mailer: git-send-email 2.7.4
> > > In-Reply-To:
> > > <1511273124-7840-1-git-send-email-christian.gromm@microchip.com>
> > > References: <1511273124-7840-1-git-send-email-christian.gromm@microchip.com>
> > > Content-Type: text/plain
> > > Return-Path: christian.gromm@microchip.com
> > > X-MS-Exchange-Organization-AuthSource: CHN-SV-EXCH05.mchp-main.com
> > > X-MS-Exchange-Organization-AuthAs: Internal
> > > X-MS-Exchange-Organization-AuthMechanism: 10
> > > X-MS-Exchange-Organization-AVStamp-Mailbox: SYMANTEC;628359232;0;info
> > > MIME-Version: 1.0
> > > 
> > > From: Andrey Shvetsov <andrey.shvetsov@k2l.de>
> > > 
> > > This patch keeps the usage file up to date.
> > > 
> > > Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> > > ---
> > 
> > Why is there no signed-off-by from Andrey?
> > 
> 
> Ah, his "Signed-off-by" is missing. Understood. Wasn't aware that
> this is a prerequisite. Thought the patches need at least one
> person that signs them off.

They do, but that should always be the patch author at the least :)

> This is because we both develop on the driver. And I take the
> patches from our internal gitlab server, prepare them and send
> them upstream. And those two patches missed his Signed-off
> obvioulsy.

You should sign off on your internal patches, to make this more obvious
and easier.

> Should I resend?

It's already in my tree, no need.

thanks,

greg k-h
