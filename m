From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the battery tree
Date: Tue, 27 Nov 2012 08:38:29 +0000
Message-ID: <201211270838.29360.arnd@arndb.de>
References: <20121127155223.849e73a08fc1b382d4622ff8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121127155223.849e73a08fc1b382d4622ff8@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Jamie Lentin <jm@lentin.co.uk>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "Rajanikanth H.V" <rajanikanth.hv@stericsson.com>, Olof Johansson <olof@lixom.net>, Anton Vorontsov <avorontsov@ru.mvista.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Tuesday 27 November 2012, Stephen Rothwell wrote:

>   
>  -config AB8500_BATTERY_THERM_ON_BATCTRL
>  -	bool "Thermistor connected on BATCTRL ADC"
>  -	depends on AB8500_BM
>  -	help
>  -	  Say Y to enable battery temperature measurements using
>  -	  thermistor connected on BATCTRL ADC.
>  -
> + source "drivers/power/reset/Kconfig"
> + 
>   endif # POWER_SUPPLY
>   
>   source "drivers/power/avs/Kconfig"
> 


Looks good, thanks!

	Arnd
