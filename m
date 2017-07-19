From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 19 Jul 2017 10:30:43 +0200 (CEST)
Message-ID: <1472208905.102271.1500453043823@ox.hosteurope.de>
References: <20170719130728.3adcae81@canb.auug.org.au>
 <20170719060702.GA9423@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719060702.GA9423@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Hi Greg,
 
I am surprised and happy about getting all the feedback and ideas how to
improve. Wow!
 
Can you tell me, how this is going on? Do I need to collect all those patches,
evaluate and test them or is it done automatically?
 
Do you perhaps need diffrent kind of help from me?
 
Concerning the error on M68k and the warning on sh I have an idea, but I am not
100% sure how to fix that. If I need to find a solution I would appreciate
having the option to have a short discusion with someone a little bit more
experienced....
 
Cheers,
 
Marcus

> Greg KH <greg@kroah.com> hat am 19. Juli 2017 um 08:07 geschrieben:
>
>
> On Wed, Jul 19, 2017 at 01:07:28PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> >
> > Today's linux-next merge of the staging tree got conflicts in:
> >
> > drivers/staging/Kconfig
> > drivers/staging/Makefile
> >
> > between commit:
> >
> > dd55d44f4084 ("staging: vboxvideo: Add vboxvideo to drivers/staging")
> >
> > from the staging.current tree and commit:
> >
> > 874bcba65f9a ("staging: pi433: New driver")
> >
> > from the staging tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging. You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Yeah, I know this is going to happen, I'll be fixing it up when
> staging-linus gets into Linus's tree.
>
> thanks,
>
> greg k-h
>
