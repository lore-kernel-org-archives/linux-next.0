From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v2] staging: make board support depend on OF_IRQ and CLKDEV_LOOKUP
Date: Thu, 25 Jun 2015 10:13:22 -0400
Message-ID: <558C0C82.3080709@windriver.com>
References: <CAMuHMdWS_-=yn8n2_UruwDjK3tnWg6GWkn3PEe4DBNMAEOZOVA@mail.gmail.com> <1434842903-24708-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434842903-24708-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 15-06-20 07:28 PM, Paul Gortmaker wrote:
> Building allmodconfig for arch/cris currently fails with:
> 
> drivers/built-in.o: In function `board_staging_register_clock':
> drivers/staging/board/board.c:131: undefined reference to `clk_add_alias'
> make: *** [vmlinux] Error 1

Just checking this didn't fall through the cracks, as its absence
causes several arch breakage on linux-next for several days now:

(.init.text+0xf968): undefined reference to `clk_add_alias'

 
x86:     http://kisskb.ellerman.id.au/kisskb/buildresult/12448913/
powerpc: http://kisskb.ellerman.id.au/kisskb/buildresult/12449785/
parisc:  http://kisskb.ellerman.id.au/kisskb/buildresult/12449940/

and possibly others I've missed.

Paul.
--

> 
> The clk_add_alias lives in drivers/clk/clkdev.c and that file
> is only compiled for CONFIG_CLKDEV_LOOKUP, so it would seem
> we need to add a dependency on that.
> 
> Geert also reported seeing this in his build coverage:
> 
>   There seems to be another missing dependency on OF_IRQ:
> 
>   drivers/built-in.o: In function `board_staging_gic_fixup_resources':
>   (.init.text+0x21c2): undefined reference to `irq_create_of_mapping'
> 
> so we might as well fix that at the same time since it is
> on the same line.
> 
> Cc: Magnus Damm <damm+renesas@opensource.se>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
> [v2: fold in Geert's OF_IRQ addition suggestion.]
> 
>  drivers/staging/board/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/board/Kconfig b/drivers/staging/board/Kconfig
> index b8ee81840666..3f287c48e082 100644
> --- a/drivers/staging/board/Kconfig
> +++ b/drivers/staging/board/Kconfig
> @@ -1,6 +1,6 @@
>  config STAGING_BOARD
>  	bool "Staging Board Support"
> -	depends on OF_ADDRESS
> +	depends on OF_ADDRESS && OF_IRQ && CLKDEV_LOOKUP
>  	help
>  	  Select to enable per-board staging support code.
>  
> 
