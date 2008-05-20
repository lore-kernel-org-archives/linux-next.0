From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: driver-core/pci merge failure
Date: Tue, 20 May 2008 14:08:44 -0700
Message-ID: <200805201408.44509.jbarnes@virtuousgeek.org>
References: <20080519120328.40aa6d5d.sfr@canb.auug.org.au> <200805200039.59938.rjw@sisk.pl> <20080520153123.3e55528c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-129.bluehost.com ([67.222.38.29]:51388 "HELO
	outbound-mail-129.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1761504AbYETVI4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 17:08:56 -0400
In-Reply-To: <20080520153123.3e55528c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

On Monday, May 19, 2008 10:31 pm Stephen Rothwell wrote:
> Hi Rafael, Greg,
>
> On Tue, 20 May 2008 00:39:59 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> > On Monday, 19 of May 2008, Greg KH wrote:
> > > On Mon, May 19, 2008 at 04:25:02PM +0200, Rafael J. Wysocki wrote:
> > > > Please revert "PM: New suspend and hibernation callbacks for PCI bus
> > > > type" until we fix that up.
> > >
> > > Do you want me to drop this from my tree?
> >
> > Yes, please.  I'll send the updated patch to Jesse, if he doesn't object,
> > as I said in the other thread.
>
> I have reverted that patch in linux-next today.  Let me know when things
> change.
>
> (I reverted in the import of the quilt tree, so it appears in
> quilt-import.log not merge.log.)

Ok, I pushed the PCI PM ops patch into my linux-next tree, along with a 
duplicate of the new PM ops patch (which is also in Greg's tree).  This would 
be slightly easier if Greg used git too, since then I could just cherry pick 
the commit...

Thanks,
Jesse
