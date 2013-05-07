From: Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>
Subject: Re: linux-next: Tree for May 6 (b43/bcma)
Date: Mon, 06 May 2013 22:06:23 -0500
Message-ID: <51886FAF.1030801@lwfinger.net>
References: <20130506144207.c812a0227d7763d26e5fec80@canb.auug.org.au>
 <5187EB95.2060605@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <b43-dev-bounces+gldbd-bcm43xx-dev=gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5187EB95.2060605-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/b43-dev>,
 <mailto:b43-dev-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/b43-dev/>
List-Post: <mailto:b43-dev-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:b43-dev-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/b43-dev>,
 <mailto:b43-dev-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "b43-dev" <b43-dev-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: b43-dev-bounces+gldbd-bcm43xx-dev=gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b43-dev-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 05/06/2013 12:42 PM, Randy Dunlap wrote:
>
> on x86_64:
>
> drivers/built-in.o: In function `b43_gpio_cleanup.isra.40':
> main.c:(.text+0x1b425b): undefined reference to `bcma_chipco_gpio_control'
> drivers/built-in.o: In function `b43_wireless_core_reset':
> (.text+0x1b5fb6): undefined reference to `bcma_core_set_clockmode'
> drivers/built-in.o: In function `b43_wireless_core_reset':
> (.text+0x1b6058): undefined reference to `bcma_core_pll_ctl'
> drivers/built-in.o: In function `b43_chip_init':
> main.c:(.text+0x1b8444): undefined reference to `bcma_chipco_gpio_control'
> drivers/built-in.o: In function `b43_wireless_core_init':
> main.c:(.text+0x1b887b): undefined reference to `bcma_core_pci_irq_ctl'
> drivers/built-in.o: In function `b43_bus_bcma_device_disable':
> bus.c:(.text+0x1b9d46): undefined reference to `bcma_core_disable'
> drivers/built-in.o: In function `b43_bus_bcma_device_enable':
> bus.c:(.text+0x1b9d55): undefined reference to `bcma_core_enable'
> drivers/built-in.o: In function `b43_bus_bcma_device_is_enabled':
> bus.c:(.text+0x1b9d64): undefined reference to `bcma_core_is_enabled'
> drivers/built-in.o: In function `b43_nphy_channel_setup':
> phy_n.c:(.text+0x1c8fe5): undefined reference to `bcma_pmu_spuravoid_pllupdate'
> drivers/built-in.o: In function `b43_phy_initn':
> phy_n.c:(.text+0x1cb853): undefined reference to `bcma_chipco_gpio_control'
> drivers/built-in.o: In function `b43_dma_init':
> (.text+0x1d5790): undefined reference to `bcma_core_dma_translation'
> drivers/built-in.o: In function `b43_init':
> main.c:(.init.text+0xa07a): undefined reference to `__bcma_driver_register'
> main.c:(.init.text+0xa09f): undefined reference to `bcma_driver_unregister'
> drivers/built-in.o: In function `b43_exit':
> main.c:(.exit.text+0x153a): undefined reference to `bcma_driver_unregister'
>
>
> Probably mostly due to B43=y and BCMA=m.

Does any Kconfig wizard know the magic incantation to accomplish the following:

1. Ensure that if SSB and BMCA are both selected, then both are either "m" or "y"

2. Ensure that BRCMSMAC is not "y" if BMCA is "m".

3. Ensure that B43 is not "y" if SSB and/or BCMA is "m".

Thanks,

Larry
