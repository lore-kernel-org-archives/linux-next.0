From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: Tree for Sep 1
Date: Wed, 10 Sep 2014 11:19:23 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1409101118420.2209@gentwo.org>
References: <20140901230728.GM29327@sirena.org.uk> <1627064.QhxvejlWdk@amdc1032> <alpine.DEB.2.11.1409020857110.9201@gentwo.org> <alpine.DEB.2.11.1409020958530.9608@gentwo.org> <20140904171123.GD26364@mtj.dyndns.org> <20140909003729.GA11706@mtj.dyndns.org>
 <alpine.DEB.2.11.1409100914180.23942@gentwo.org> <20140910150447.GV30828@titan.lakedaemon.net>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qmta08.emeryville.ca.mail.comcast.net ([76.96.30.80]:40510 "EHLO
	qmta08.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750956AbaIJQT0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Sep 2014 12:19:26 -0400
In-Reply-To: <20140910150447.GV30828@titan.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>

On Wed, 10 Sep 2014, Jason Cooper wrote:

>
> Thanks Chris.  I'm a bit behind on irqchip stuff, so I may have missed
> something here...  Did we get Cc'd on the original patch that caused the
> regression?  I'm fairly certain I haven't seen it to Ack it.

This is a trivial fix to the original patch in linux-next that introduced
a bug by dropping one level of indirection.
