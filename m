From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: sound tree build failure
Date: Thu, 4 Jun 2009 11:08:13 +0300
Message-ID: <200906041108.13829.peter.ujfalusi@nokia.com>
References: <20090604173342.b7dbca6d.sfr@canb.auug.org.au> <s5hk53s4e9w.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:25732 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754166AbZFDII7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2009 04:08:59 -0400
In-Reply-To: <s5hk53s4e9w.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thursday 04 June 2009 11:03:07 ext Takashi Iwai wrote:
> At Thu, 4 Jun 2009 17:33:42 +1000,
>
> Stephen Rothwell wrote:
> > Hi Takashi,
> >
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> >
> > sound/soc/codecs/twl4030.c: In function 'twl4030_read_reg_cache':
> > sound/soc/codecs/twl4030.c:152: error: 'cache' undeclared (first us=
e in
> > this function)
> >
> > Caused by commit 16a30fbb0d3aa4ee829a2dd3d0e314e2b5ae96a9 ("ASoC:
> > TWL4030: Use reg_cache in twl4030_init_chip").
> >
> > I reverted that commit for today.
>
> Thanks.  It's likely a cut-and-paste error in that commit.
> I fixed now on sound git tree.

Yes, it was a cut-and-paste error. I have also made the patch to fix it=
=2E
I'll not send it, thanks Takashi for fixing it.

It is so embarrassing, since this is the second time that my patch brok=
e the=20
linux-next build.
I'll try to be even more careful in the future.

Again, sorry about this.

>
> Takashi

--=20
P=E9ter
