From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: [lm-sensors] [PATCH] hwmon/sch56xx: Depend on watchdog for
 watchdog core functions
Date: Tue, 29 May 2012 09:11:34 -0700
Message-ID: <1338307894.478.68.camel@groeck-laptop>
References: <1337890738-26533-1-git-send-email-hdegoede@redhat.com>
	 <20120524205426.GW3074@spo001.leaseweb.com>
Reply-To: guenter.roeck@ericsson.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imr4.ericy.com ([198.24.6.9]:38168 "EHLO imr4.ericy.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754075Ab2E2QN5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 May 2012 12:13:57 -0400
In-Reply-To: <20120524205426.GW3074@spo001.leaseweb.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Hans de Goede <hdegoede@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, LM Sensors <lm-sensors@lm-sensors.org>

On Thu, 2012-05-24 at 16:54 -0400, Wim Van Sebroeck wrote:
> Hi Hans,
> 
> > Since the watchdog code in sch56xx-common now uses the watchdog core, the
> > Kconfig entires for the sch5627 and sch5636 should depend on WATCHDOG
> > being set.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I added also the "select WATCHDOG_CORE" lines for both drivers.
> In linux-watchdog-next now.
> 
Hi Wim,

looks like Hans' patches are all in your tree, so I assume I don't have
to take anything through my hwmon tree. Please let me know if I got that
wrong.

Thanks,
Guenter
