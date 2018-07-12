From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-07-10-16-50 uploaded (gpio: gpio-mt721.c)
Date: Wed, 11 Jul 2018 23:01:57 -0700
Message-ID: <74774f1a-9ba3-63db-5777-b122d4b17cea@infradead.org>
References: <20180710235044.vjlRV%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710235044.vjlRV%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.orgStephen Rothwell <sfr@canb.auug.org.au>, Gabor Juhos <juhosg@openwrt.org>, John Crispin <blogic@openwrt.org>
List-Id: linux-next.vger.kernel.org

On 07/10/2018 04:50 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-07-10-16-50 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.

from linux-next.patch:

on x86_64:
when CONFIG_OF is not enabled:

../drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
../drivers/gpio/gpio-mt7621.c:228:10: error: 'struct gpio_chip' has no member named 'of_node'
  rg->chip.of_node = node;
          ^
../drivers/gpio/gpio-mt7621.c:243:10: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  rg->chip.of_gpio_n_cells = 2;
          ^
../drivers/gpio/gpio-mt7621.c:244:10: error: 'struct gpio_chip' has no member named 'of_xlate'
  rg->chip.of_xlate = mediatek_gpio_xlate;
          ^


-- 
~Randy
