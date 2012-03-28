From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Wed, 28 Mar 2012 16:52:17 -0700
Message-ID: <20120328235217.GA17212@kroah.com>
References: <20120326121719.dc4c2b1faca5cf12c8d76d93@canb.auug.org.au>
 <1332748641.2836.8.camel@dabdike>
 <20120326140721.GA19827@kroah.com>
 <20120327221721.GA3233@p183.telecom.by>
 <20120327222216.GB469@kroah.com>
 <20120327223510.GB3233@p183.telecom.by>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:56253 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758782Ab2C1XwV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Mar 2012 19:52:21 -0400
Received: by pbcun15 with SMTP id un15so2474558pbc.19
        for <linux-next@vger.kernel.org>; Wed, 28 Mar 2012 16:52:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20120327223510.GB3233@p183.telecom.by>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 28, 2012 at 01:35:10AM +0300, Alexey Dobriyan wrote:
> On Tue, Mar 27, 2012 at 03:22:16PM -0700, Greg KH wrote:
> > On Wed, Mar 28, 2012 at 01:17:21AM +0300, Alexey Dobriyan wrote:
> > > On Mon, Mar 26, 2012 at 07:07:21AM -0700, Greg KH wrote:
> > > > On Mon, Mar 26, 2012 at 08:57:21AM +0100, James Bottomley wrote:
> > > > > On Mon, 2012-03-26 at 12:17 +1100, Stephen Rothwell wrote:
> > > > > > Hi James,
> > > > > > 
> > > > > > After merging the scsi tree, today's linux-next build (x86_64 allmodconfig)
> > > > > > failed like this:
> > > > > > 
> > > > > > drivers/staging/keucr/scsiglue.c:349:2: error: unknown field 'proc_info' specified in initializer
> > > > > > drivers/staging/rts_pstor/rtsx.c:258:2: error: unknown field 'proc_info' specified in initializer
> > > > > > drivers/staging/rts5139/rts51x_scsi.c:2190:2: error: unknown field 'proc_info' specified in initializer
> > > > > > 
> > > > > > Caused by commit 104c4fe25dc9 ("[SCSI] remove scsi_host_template::proc_info").
> > > > > > 
> > > > > > Since this is a staging driver, I applied these following patches:
> > > > > 
> > > > > Yes, that looks about right, thanks.  We haven't seen anything about
> > > > > these drivers on the SCSI list, so I've no idea where they are in
> > > > > development.
> > > > 
> > > > Why is new patches going into your tree right now, during the 3.4 merge
> > > > window?  API changes should have happened weeks ago, to let others fix
> > > > up things like this.
> > > > 
> > > > As for the "where they are in development", they vary, but, a simple
> > > > grep should have shown you that these in-kernel drivers should also be
> > > > fixed up, or at the least, give me the heads up to let me do it for you.
> > > > 
> > > > Care to send me the patch that causes this problem so I can create a fix
> > > > for this?
> > > 
> > > See commits 422f07001d6638fdde28f1909cc9162bc7f571d3..104c4fe25dc9bde823ba4591e910a77071b98ab5
> > > Especially the first one.

I don't know where to find these patches, care to send them to me, or
point me at a link with them?

> > > Probably the best course of action is to remove proc_info code from
> > > these drivers because the interface was deprecated for a long time.
> > 
> > If the interface is depreciated, yes, I can remove it now, just let me
> > know and I will do so.
> > 
> > > The amount of code once removed from staging prevented me from doing
> > > any work on them.
> > > 
> > > Looking at staging ->read_proc users this is going to be a problem for
> > > its removal. :-(
> > 
> > Why?
> 
> Because if staging does count, I can't remove the interface
> without breaking allmodconfig and it would take forever to convert
> staging stuff. I don't have energy to do it anymore.
> Mainline still have several _hard_ ->read_proc conversions.
> I've tried several times and failed.
> 
> If staging doesn't count, I will break allmodconfig and all those nasty
> emails will show up anyway implying that staging does count.

I don't understand, if read_proc is depreciated, why can't I just remove
it from the staging drivers and then all will be fine, right?

confused,

greg k-h
