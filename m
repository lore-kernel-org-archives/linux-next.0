From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: [PATCH] hwmon/sch56xx: Depend on watchdog for
	watchdog core functions
Date: Tue, 29 May 2012 19:24:39 +0200
Message-ID: <20120529172439.GY3074@spo001.leaseweb.com>
References: <1337890738-26533-1-git-send-email-hdegoede@redhat.com>
	<20120524205426.GW3074@spo001.leaseweb.com>
	<1338307894.478.68.camel@groeck-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <lm-sensors-bounces@lm-sensors.org>
Content-Disposition: inline
In-Reply-To: <1338307894.478.68.camel@groeck-laptop>
List-Unsubscribe: <http://lists.lm-sensors.org/mailman/options/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=unsubscribe>
List-Archive: <http://lists.lm-sensors.org/pipermail/lm-sensors/>
List-Post: <mailto:lm-sensors@lm-sensors.org>
List-Help: <mailto:lm-sensors-request@lm-sensors.org?subject=help>
List-Subscribe: <http://lists.lm-sensors.org/mailman/listinfo/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=subscribe>
Sender: lm-sensors-bounces@lm-sensors.org
Errors-To: lm-sensors-bounces@lm-sensors.org
To: Guenter Roeck <guenter.roeck@ericsson.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, LM Sensors <lm-sensors@lm-sensors.org>
List-Id: linux-next.vger.kernel.org

Hi Guenter,

> > > Since the watchdog code in sch56xx-common now uses the watchdog core, the
> > > Kconfig entires for the sch5627 and sch5636 should depend on WATCHDOG
> > > being set.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > I added also the "select WATCHDOG_CORE" lines for both drivers.
> > In linux-watchdog-next now.
> > 
> Hi Wim,
> 
> looks like Hans' patches are all in your tree, so I assume I don't have
> to take anything through my hwmon tree. Please let me know if I got that
> wrong.

All is in my tree indeed. So you don't need to do anything on your side.

Kind regards,
Wim.


_______________________________________________
lm-sensors mailing list
lm-sensors@lm-sensors.org
http://lists.lm-sensors.org/mailman/listinfo/lm-sensors
