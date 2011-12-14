From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next not booting on snowball
Date: Wed, 14 Dec 2011 16:27:19 +0800
Message-ID: <20111214082718.GC3072@opensource.wolfsonmicro.com>
References: <4ED79454.1090304@linaro.org>
 <20111201145801.GB2103@sirena.org.uk>
 <4ED79E9F.7060103@linaro.org>
 <alpine.LFD.2.02.1112011400380.2357@xanadu.home>
 <4ED8087F.7030507@linaro.org>
 <alpine.LFD.2.02.1112011856310.2357@xanadu.home>
 <4ED90B6F.6050205@linaro.org>
 <alpine.LFD.2.02.1112062227120.2907@xanadu.home>
 <CACRpkdaJUNap3498-cORbW77EBT-4_pyxeLQahn4g3UOhHm3bg@mail.gmail.com>
 <CACRpkda_EzSbYAmeXQz1XjwKLfmV6JiDcC=4+4HiABWRVg2UPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38959 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753323Ab1LNI1Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Dec 2011 03:27:25 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkda_EzSbYAmeXQz1XjwKLfmV6JiDcC=4+4HiABWRVg2UPw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Srinidhi KASAGAR <srinidhi.kasagar@stericsson.com>, Rabin VINCENT <rabin.vincent@stericsson.com>

On Wed, Dec 14, 2011 at 09:24:33AM +0100, Linus Walleij wrote:

> The above remaps and reads from some random ROM page to get
> the ASIC ID is actually not screwing things up. Right now.

The ASIC ID reads are also done by Samsung platforms which boot fine -
it's not strictly good but it happens to work (and has done for some
considerable time).
