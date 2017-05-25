From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 25 (pinctrl-ingenic.c)
Date: Thu, 25 May 2017 10:48:17 -0700
Message-ID: <381ac6ca-3bb8-7599-4688-ea2df856e4ad@infradead.org>
References: <20170525124301.0ea98001@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170525124301.0ea98001@canb.auug.org.au>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On 05/24/17 19:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170524:
> 

on x86_64:

# CONFIG_OF not enabled
CONFIG_COMPILE_TEST=y
CONFIG_PINCTRL_INGENIC=y


config PINCTRL_INGENIC
	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
	default y
	depends on MACH_INGENIC || COMPILE_TEST

Needs to depend on OF also..


../drivers/pinctrl/pinctrl-ingenic.c:467:20: error: 'pinconf_generic_dt_node_to_map_all' undeclared here (not in a function)
  .dt_node_to_map = pinconf_generic_dt_node_to_map_all,
                    ^
../drivers/pinctrl/pinctrl-ingenic.c:468:17: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function)
  .dt_free_map = pinconf_generic_dt_free_map,
                 ^


-- 
~Randy
