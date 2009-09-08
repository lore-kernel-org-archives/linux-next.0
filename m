From: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Subject: Re: linux-next: slab tree build failure
Date: Tue, 8 Sep 2009 09:32:36 -0700
Message-ID: <20090908163236.GB8839@mosca>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
 <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
 <1252312509.23780.15.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751762AbZIHQcg@vger.kernel.org>
Received: from mail.atheros.com ([10.10.20.105])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Tue, 08 Sep 2009 09:32:38 -0700
Content-Disposition: inline
In-Reply-To: <1252312509.23780.15.camel@pc1117.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis Rodriguez <Luis.Rodriguez@Atheros.com>, "John W. Linville" <linville@tuxdriver.com>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 07, 2009 at 01:35:09AM -0700, Catalin Marinas wrote:
> On Mon, 2009-09-07 at 09:10 +0300, Pekka Enberg wrote:
> > Hi Stephen,
> >
> > On Mon, Sep 7, 2009 at 8:37 AM, Stephen Rothwell<sfr@canb.auug.org.au> wrote:
> > > Hi all,
> > >
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > >
> > > net/wireless/scan.c: In function 'cfg80211_inform_bss':
> > > net/wireless/scan.c:499: error: implicit declaration of function 'kmemleak_ignore'
> > >
> > > Caused by commit 74ce35c0d2261896ed4d49799311a894520f7a94 ("cfg80211:
> > > clear cfg80211_inform_bss() from kmemleak reports") from the wireless
> > > tree (which should have included linux/kmemleak.h into
> > > net/wireless/scan.c).  Some interaction with the slab tree has exposed
> > > this.
> > >
> > > I have reverted the above commit for today.
> >
> > AFAICT, you're interested in kmemleak.git, not slab.git. Catalin?
> 
> I think that's a commit from Luis. It shouldn't have been merged in the
> first instance anyway (we shouldn't randomly ignore kmemleak reports
> unless we know for sure why kmemleak thinks it is a leak and we should
> write a comment explaining why).

I asked John to revert it, feel free to do the same.

  Luis
