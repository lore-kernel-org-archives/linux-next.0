From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: wireless tree build failure
Date: Mon, 4 May 2009 22:55:33 -0400
Message-ID: <20090505025532.GA7917@tuxdriver.com>
References: <20090505115455.0b147aeb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:42219 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751368AbZEEDBG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 23:01:06 -0400
Content-Disposition: inline
In-Reply-To: <20090505115455.0b147aeb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>

On Tue, May 05, 2009 at 11:54:55AM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next build (x86_64_allmodconfig) failed like this:
> 
> net/mac80211/mlme.c: In function 'ieee80211_enable_ht':
> net/mac80211/mlme.c:126: error: 'IEEE80211_CHAN_NO_HT40PLUS' undeclared (first use in this function)
> net/mac80211/mlme.c:131: error: 'IEEE80211_CHAN_NO_HT40MINUS' undeclared (first use in this function)
> 
> Direct cause is commit b3afed6815165a62d20e4487ec2df0d12a2df20d
> ("mac80211: check if HT40+/- is allowed before sending assoc").
> 
> I have used the wireless tree from next-20090504 for today.
> 
> [You guys build this stuff, right? :-(]

Ooops, sorry!  I had to drop a few patches and I didn't get
wireless-next-2.6 pushed back out correctly.  It is fixed now.

Thanks,

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
