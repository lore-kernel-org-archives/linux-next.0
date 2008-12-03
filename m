From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 3 Dec 2008 20:49:52 -0200
Message-ID: <20081203204952.3542c303@pedra.chehab.org>
References: <20081202103741.9b234e49.sfr@canb.auug.org.au>
	<20081202080302.2f1180e8@pedra.chehab.org>
	<20081203110843.cd9cbb20.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:44673 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753694AbYLCWuB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 17:50:01 -0500
In-Reply-To: <20081203110843.cd9cbb20.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 3 Dec 2008 11:08:43 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Tue, 2 Dec 2008 08:03:02 -0200 Mauro Carvalho Chehab <mchehab@infradead.org> wrote:
> >
> > On Tue, 2 Dec 2008 10:37:41 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > 
> > > drivers/media/video/em28xx/em28xx-video.c: In function 'em28xx_supports_audio_extension':
> > > drivers/media/video/em28xx/em28xx-video.c:1966: error: 'EM28XX_NO_AUDIO' undeclared (first use in this function)
> > > drivers/media/video/em28xx/em28xx-video.c:1966: error: (Each undeclared identifier is reported only once
> > > drivers/media/video/em28xx/em28xx-video.c:1966: error: for each function it appears in.)
> > > drivers/media/video/em28xx/em28xx-video.c:1977: error: 'EM28XX_AC97' undeclared (first use in this function)
> > > drivers/media/video/em28xx/em28xx-video.c:1981: error: 'EM28XX_I2S_3_SAMPLE_RATES' undeclared (first use in this function)
> > > drivers/media/video/em28xx/em28xx-video.c:1985: error: 'EM28XX_I2S_5_SAMPLE_RATES' undeclared (first use in this function)
> > > 
> > > I have dropped the v4l-dvb tree again today.
> > 
> > I suspect you've pulled from my tree while I was testing it, or before my last
> > update yesterday night. Anyway, I've re-merged my patches at my linux-next and
> > tested. Everything seems to be ok now.
> 
> I got the same error as yesterday, so the tree remains dropped.
> 
> Just to be clear, I am fetching the master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git and
> it doesn't appear to have changed since yesterday's fetch.

I've pushed on linux-next from the wrong local branch. That's why I was compiling fine here...

I fixed earlier today.

Cheers,
Mauro
