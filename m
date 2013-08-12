From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Aug 9 (staging/ozwpan)
Date: Sun, 11 Aug 2013 23:22:11 -0700
Message-ID: <20130812062211.GA865@kroah.com>
References: <20130809161540.f65dd6412ac59d49a32881c8@canb.auug.org.au>
 <5206BB86.2000604@infradead.org>
 <5206C9AB.8050706@infradead.org>
 <CB57019DFBA97B45884DCA732411B955341FA6C8@hnombx02.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CB57019DFBA97B45884DCA732411B955341FA6C8@hnombx02.corp.atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gujare, Rupesh" <Rupesh.Gujare@atmel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Aug 11, 2013 at 09:04:00AM +0000, Gujare, Rupesh wrote:
> 
> ________________________________________
> From: Randy Dunlap [rdunlap@infradead.org]
> Sent: 11 August 2013 00:15
> To: Stephen Rothwell
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; devel@driverdev.osuosl.org; Gujare, Rupesh; Greg Kroah-Hartman
> Subject: Re: linux-next: Tree for Aug 9 (staging/ozwpan)
> 
> On 08/10/13 15:15, Randy Dunlap wrote:
> > On 08/08/13 23:15, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20130808:
> >>
> >> *crickets*
> >>
> >
> > on i386:
> >
> > ERROR: "__divdi3" [drivers/staging/ozwpan/ozwpan.ko] undefined!
> >
> 
> 2 occurrences of this in oz_hcd_heartbeat().
> 
> >
> >
> > Apologies if this has already been reported/fixed.
> >
> 
> Yes, It had been already been fixed here :-
> 
> http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2013-August/040091.html
> I have been waiting for Greg to apply this patch to his tree.

Yes I have it, will apply it tomorrow, thanks.

greg k-h
