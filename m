From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: mx51_efika: update platform data for new mfd changes
Date: Fri, 04 Mar 2011 21:58:56 +0300
Message-ID: <4D713670.70506@ru.mvista.com>
References: <20110304080653.3f2c3f19@debxo>	<4D710FF9.6040305@ru.mvista.com> <20110304083822.0f40d120@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:48701 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760049Ab1CDTA3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Mar 2011 14:00:29 -0500
In-Reply-To: <20110304083822.0f40d120@debxo>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: Sergei Shtylyov <sshtylyov@mvista.com>, Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Amit Kucheria <amit.kucheria@canonical.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org

Hello.

Andres Salomon wrote:

>>> Note that this relies on stuff currently in mfd's next tree, but
>>> this is also a newer driver.  I'm not sure which tree it should go
>>> through, as it's a problem that shows up in next.

>>     This passage should be under --- tear line.

> What?

    See Documentation/SubmittingPatches, section 15, "The canonical patch format".

>>> From: Andres Salomon <dilinger@queued.net>

>>> MFD changes in c738892f cause the mc13xxx_platform_data struct

>>     Linus asks to also specify the commit summary in parens.

> Also, what?  If there are changes to how patches should be submitted,
> please provide a reference (Documentation/SubmittingPatches should
> be updated, as well).

    I have no time to rummage in the mail archives, sorry.

>>> to change.  This changes one more (new) user of it, fixing a build
>>> error.
>>> Signed-off-by: Andres Salomon <dilinger@queued.net>

WBR, Sergei
