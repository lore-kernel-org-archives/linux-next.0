From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the omap_dss2
 tree
Date: Tue, 9 Apr 2013 11:32:01 +0200
Message-ID: <201304091132.01771.arnd@arndb.de>
References: <20130409174047.c506479e08e9688c0a4ced9a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130409174047.c506479e08e9688c0a4ced9a@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Archit Taneja <archit@ti.com>, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Tuesday 09 April 2013, Stephen Rothwell wrote:
> 
> - #if defined(CONFIG_SMC91X) || defined(CONFIG_SMC91x_MODULE)
>  -static void __init sdp2430_display_init(void)
>  -{
>  -      int r;
>  -
>  -      static struct gpio gpios[] __initdata = {
>  -              { SDP2430_LCD_PANEL_ENABLE_GPIO, GPIOF_OUT_INIT_LOW,
>  -                      "LCD reset" },
>  -              { SDP2430_LCD_PANEL_BACKLIGHT_GPIO, GPIOF_OUT_INIT_LOW,
>  -                      "LCD Backlight" },
>  -      };
>  -
>  -      r = gpio_request_array(gpios, ARRAY_SIZE(gpios));
>  -      if (r) {
>  -              pr_err("Cannot request LCD GPIOs, error %d\n", r);
>  -              return;
>  -      }
>  -
>  -      omap_display_init(&sdp2430_dss_data);
>  -}
>  -
> + #if IS_ENABLED(CONFIG_SMC91X)

Looks good, thanks!

	Arnd
