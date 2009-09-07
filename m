From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 07 Sep 2009 09:35:09 +0100
Message-ID: <1252312509.23780.15.camel@pc1117.cambridge.arm.com>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
	 <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:63285 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752144AbZIGIfh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 04:35:37 -0400
In-Reply-To: <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>

On Mon, 2009-09-07 at 09:10 +0300, Pekka Enberg wrote:
> Hi Stephen,
> 
> On Mon, Sep 7, 2009 at 8:37 AM, Stephen Rothwell<sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> > net/wireless/scan.c: In function 'cfg80211_inform_bss':
> > net/wireless/scan.c:499: error: implicit declaration of function 'kmemleak_ignore'
> >
> > Caused by commit 74ce35c0d2261896ed4d49799311a894520f7a94 ("cfg80211:
> > clear cfg80211_inform_bss() from kmemleak reports") from the wireless
> > tree (which should have included linux/kmemleak.h into
> > net/wireless/scan.c).  Some interaction with the slab tree has exposed
> > this.
> >
> > I have reverted the above commit for today.
> 
> AFAICT, you're interested in kmemleak.git, not slab.git. Catalin?

I think that's a commit from Luis. It shouldn't have been merged in the
first instance anyway (we shouldn't randomly ignore kmemleak reports
unless we know for sure why kmemleak thinks it is a leak and we should
write a comment explaining why).

-- 
Catalin
