From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: adc: stm32-dfsdm: fix unmet direct
 dependencies detected
Date: Mon, 22 Apr 2019 11:16:43 +0100
Message-ID: <20190422111643.0270fba6@archlinux>
References: <1555333251-4422-1-git-send-email-fabrice.gasnier@st.com>
        <1555333251-4422-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555333251-4422-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, benjamin.gaignard@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, linux-iio@vger.kernel.org, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com, olivier.moysan@st.com
List-Id: linux-next.vger.kernel.org

On Mon, 15 Apr 2019 15:00:50 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> This fixes unmet direct dependencies seen when CONFIG_STM32_DFSDM_ADC
> is selected:
> 
> WARNING: unmet direct dependencies detected for IIO_BUFFER_HW_CONSUMER
>   Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
>   Selected by [y]:
>   - STM32_DFSDM_ADC [=y] && IIO [=y] && (ARCH_STM32 [=y] && OF [=y] ||
>     COMPILE_TEST [=n])
> 
> Fixes: e2e6771c6462 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Hmm. I wonder how we never got this one from a rand config.
Anyhow, give we are near the end of this cycle, I'll take this for
the next merge window rather than rushing it through.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 846c7ac..b1b2bde 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -821,6 +821,7 @@ config STM32_DFSDM_ADC
>  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
>  	select STM32_DFSDM_CORE
>  	select REGMAP_MMIO
> +	select IIO_BUFFER
>  	select IIO_BUFFER_HW_CONSUMER
>  	help
>  	  Select this option to support ADCSigma delta modulator for
