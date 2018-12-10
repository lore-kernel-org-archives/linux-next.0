From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Date: Mon, 10 Dec 2018 10:47:07 +0100
Message-ID: <20181210094707.GA22095@kroah.com>
References: <20181204153513.1e799336@canb.auug.org.au>
 <20181204074241.GB27141@kroah.com>
 <PU1P153MB01699DCE042ACB59AADCC8D3BFAF0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <PU1P153MB01699DCE042ACB59AADCC8D3BFAF0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Dexuan Cui <decui@microsoft.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KY Srinivasan <kys@microsoft.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 04, 2018 at 08:46:41AM +0000, Dexuan Cui wrote:
> > From: Greg KH <greg@kroah.com>
> > Sent: Monday, December 3, 2018 11:43 PM
> > On Tue, Dec 04, 2018 at 03:35:13PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Today's linux-next merge of the char-misc tree got a conflict in:
> > >
> > >   drivers/hv/channel_mgmt.c
> > >
> > > between commit:
> > >
> > >   37c2578c0c40 ("Drivers: hv: vmbus: Offload the handling of channels to
> > two workqueues")
> > >
> > > from the char-misc.current tree and commit:
> > >
> > >   4d3c5c69191f ("Drivers: hv: vmbus: Remove the useless API
> > vmbus_get_outgoing_channel()")
> > >
> > > from the char-misc tree.
> > >
> > > I fixed it up (I used the former version where they conflicted) and can
> > > carry the fix as necessary. This is now fixed as far as linux-next is
> Hi Stephen, 
> Thank you! I can confirm your rebase for next-20181204 is correct:
> 37c2578c0c40 ("Drivers: hv: vmbus: Offload the handling of channels to two workqueues")
> 
> > > concerned, but any non trivial conflicts should be mentioned to your
> > > upstream maintainer when your tree is submitted for merging.  You may
> > > also want to consider cooperating with the maintainer of the conflicting
> > > tree to minimise any particularly complex conflicts.
> > 
> > Yeah, this is a mess, I'll wait for the hyper-v developers to send me a
> > fixup patch for handling this merge issue, as they know it is happening
> > :(
> > 
> > greg k-h
> 
> Since Stephen has fixed the merge issue correctly, I guess I may not need to send a fixup
> patch for linux-next.git. If I didn't get it right, please let me know which tree/branch I
> should work on to send a fixup patch.
> 
> It looks the conflict here happened because the two related patches, which modify
> the same functions, went into different branches of char-misc.git. I didn't realize this
> could happen... Sorry. The lesson I learnt is that I should not submit an urgent fix
> with an unimportant clean-up patch at the same time, when they can cause a conflict.

I have done the merge in my char-misc-next branch, can you verify that I
got it correct?

thanks,

greg k-h
