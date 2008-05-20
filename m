From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: driver-core/pci merge failure
Date: Tue, 20 May 2008 16:53:04 -0700
Message-ID: <200805201653.04543.jbarnes@virtuousgeek.org>
References: <20080519120328.40aa6d5d.sfr@canb.auug.org.au> <200805201408.44509.jbarnes@virtuousgeek.org> <20080520233113.GA5053@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-102.bluehost.com ([69.89.22.12]:41871 "HELO
	outbound-mail-102.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755285AbYETX74 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 19:59:56 -0400
In-Reply-To: <20080520233113.GA5053@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org

On Tuesday, May 20, 2008 4:31 pm Greg KH wrote:
> On Tue, May 20, 2008 at 02:08:44PM -0700, Jesse Barnes wrote:
> > On Monday, May 19, 2008 10:31 pm Stephen Rothwell wrote:
> > > Hi Rafael, Greg,
> > >
> > > On Tue, 20 May 2008 00:39:59 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> 
wrote:
> > > > On Monday, 19 of May 2008, Greg KH wrote:
> > > > > On Mon, May 19, 2008 at 04:25:02PM +0200, Rafael J. Wysocki wrote:
> > > > > > Please revert "PM: New suspend and hibernation callbacks for PCI
> > > > > > bus type" until we fix that up.
> > > > >
> > > > > Do you want me to drop this from my tree?
> > > >
> > > > Yes, please.  I'll send the updated patch to Jesse, if he doesn't
> > > > object, as I said in the other thread.
> > >
> > > I have reverted that patch in linux-next today.  Let me know when
> > > things change.
> > >
> > > (I reverted in the import of the quilt tree, so it appears in
> > > quilt-import.log not merge.log.)
> >
> > Ok, I pushed the PCI PM ops patch into my linux-next tree, along with a
> > duplicate of the new PM ops patch (which is also in Greg's tree).  This
> > would be slightly easier if Greg used git too, since then I could just
> > cherry pick the commit...
>
> It still would be a mess :)

Yeah, if the patches ended up getting replaced or rebased it could get ugly 
(but remember, Linus says "don't do that!" :).

> As I no longer control the PCI tree, this just got more complex.  I have
> no problem with you taking that patch in your tree, you can keep my
> signed-off-by.
>
> Rafael, I'll be dropping the following patches from my tree:
> 	driver-core/pm-introduce-new-top-level-suspend-and-hibernation-callbacks.p
>atch
> driver-core/pm-new-suspend-and-hibernation-callbacks-for-platform-bus-type.
>patch
> driver-core/pm-new-suspend-and-hibernation-callbacks-for-pci-bus-type.patch
>
> I'm guessing you want Jesse to also pick up the platform-bus one as
> well, so that does not get lost.
>
> Is that ok?

Sounds good, thanks Greg.

Jesse
