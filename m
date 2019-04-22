From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] iio: adc: stm32-dfsdm: fix triggered buffer build
 dependency
Date: Mon, 22 Apr 2019 11:17:54 +0100
Message-ID: <20190422111754.018878c0@archlinux>
References: <1555333251-4422-1-git-send-email-fabrice.gasnier@st.com>
        <1555333251-4422-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555333251-4422-3-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, benjamin.gaignard@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, linux-iio@vger.kernel.org, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com, olivier.moysan@st.com
List-Id: linux-next.vger.kernel.org

On Mon, 15 Apr 2019 15:00:51 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> This fixes build errors seen when CONFIG_STM32_DFSDM_ADC is set, as
> stm32-dfsdm-adc driver now also relies on triggered buffer API:
> 
> Fixes: 11646e81d775 ("iio: adc: stm32-dfsdm: add support for buffer modes")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index b1b2bde..f3bd32e 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -823,6 +823,7 @@ config STM32_DFSDM_ADC
>  	select REGMAP_MMIO
>  	select IIO_BUFFER
>  	select IIO_BUFFER_HW_CONSUMER
> +	select IIO_TRIGGERED_BUFFER
>  	help
>  	  Select this option to support ADCSigma delta modulator for
>  	  STMicroelectronics STM32 digital filter for sigma delta converter.
