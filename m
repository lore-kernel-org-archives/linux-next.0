From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Staging: agnx: switch config_interface to
	bss_info_changed
Date: Tue, 12 May 2009 12:02:54 -0700
Message-ID: <20090512190254.GB1957@kroah.com>
References: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com> <20090512164448.GJ16247@kroah.com> <a4423d670905121037i3ea96b01s68367c082802684d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:55064 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752011AbZELT1d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 15:27:33 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670905121037i3ea96b01s68367c082802684d@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: gregkh@suse.de, johannes@sipsolutions.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 12, 2009 at 09:37:56PM +0400, Alexander Beregalov wrote:
> 2009/5/12 Greg KH <greg@kroah.com>:
> > On Tue, May 12, 2009 at 03:23:13PM +0400, Alexander Beregalov wrote=
:
> >> Fix this build error:
> >> drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
> >> drivers/staging/agnx/pci.c:315: error: dereferencing pointer to in=
complete type
> >> ..
> >> drivers/staging/agnx/pci.c:424: error: unknown field 'config_inter=
face' specified in initializer
> >>
> >> config_interface was removed in 2d0ddec5b2b
> >> ("mac80211: unify config_interface and bss_info_changed")
> >
> > I do not see that patch in Linus's tree. =A0Is it in some other tre=
e
> > (wireless?) and not yet in mainline?
> Yes, it is in wireless from linux-next.
> You asked to send patches based on linux-next, right?
> Should I always mark patches for staging-next tree as [PATCH -next] ?

Hm, yes, -staging patches need to be against -next, but I have to be
able to build these somehow on my own without the wireless tree...

I think something like this might better go through the wireless tree a=
s
it depends on changes that happen there.  Sound good to you?

If so, please send them to the wireless maintainer.

thanks,

greg k-h
