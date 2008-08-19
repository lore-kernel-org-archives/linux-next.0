From: David Brownell <david-b@pacbell.net>
Subject: Re: linux-next: Tree for August 18 (usb gadget build error)
Date: Mon, 18 Aug 2008 17:19:25 -0700
Message-ID: <200808181719.25888.david-b@pacbell.net>
References: <20080818175931.52d2b2d6.sfr@canb.auug.org.au> <200808181555.33062.david-b@pacbell.net> <20080818230056.GA26819@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91]:22476 "HELO
	smtp118.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755389AbYHSAT2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 20:19:28 -0400
In-Reply-To: <20080818230056.GA26819@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lud <linux-usb@vger.kernel.org>

On Monday 18 August 2008, Greg KH wrote:
> On Mon, Aug 18, 2008 at 03:55:32PM -0700, David Brownell wrote:
> > On Monday 18 August 2008, Randy Dunlap wrote:
> > > ERROR: "ecm_bind_config" [drivers/usb/gadget/g_cdc.ko] undefined!
> > > 
> > > config attached.
> > 
> > I'm guessing that's associate with Greg's patches to
> > split the gadget drivers up into lots of little modules.
> > 
> > I'm really not keen on that, and I guess that means I'll
> > have to send the alternate patches (even though I got no
> > feedback from my posts on those topics).
> 
> Sorry, was off trying to enjoy a weekend :)

I hear they get scheduled periodically ... :)


> I just responded, and it looks like I'm going to drop those patches and
> go with David's last patch/idea, hopefully -next tomorrow will be all
> fixed up.
> 
> I'll post the patch series when I get everything building properly to
> linux-usb for review.

Hmm, I'll send my patchset then.  Don't think I've seen your comments
yet, FWIW.  If one of these days "gcc --combine ... " works for kernel
builds, this is one of many issues that will have *nice* fixes.

- Dave
