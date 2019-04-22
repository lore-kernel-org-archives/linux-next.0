From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] iio: trigger: stm32-timer: fix build issue when
 disabled
Date: Mon, 22 Apr 2019 11:14:43 +0100
Message-ID: <20190422111443.276572ff@archlinux>
References: <1555321642-482-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555321642-482-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, benjamin.gaignard@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, linux-iio@vger.kernel.org, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com, olivier.moysan@st.com
List-Id: linux-next.vger.kernel.org

On Mon, 15 Apr 2019 11:47:22 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> This fixes a build issue when CONFIG_IIO_STM32_TIMER_TRIGGER isn't set but
> used in stm32-dfsdm-adc driver (e.g. CONFIG_STM32_DFSDM_ADC is set):
> ERROR: "is_stm32_timer_trigger" [drivers/iio/adc/stm32-dfsdm-adc.ko]
> undefined!
> 
> There are two possible options to fix this issue:
> - select IIO_STM32_TIMER_TRIGGER along with CONFIG_STM32_DFSDM_ADC.
>   This is what's being done currently for CONFIG_STM32_ADC.
> - stub "is_stm32_timer_trigger" function
> 
> Choice is made to stub this function as suggested in [1]. This is also
> inspired by similar "is_stm32_lptim_trigger" function (see [2]) in
> include/linux/iio/timer/stm32-lptim-trigger.h
> 
> [1]
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1977377.html
> [2] https://lkml.org/lkml/2017/9/10/124
> 
> Fixes: 11646e81d775 ("iio: adc: stm32-dfsdm: add support for buffer modes")
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fix-suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Hmm. That feels a bit more complex than I was anticipating but fair enough,
it seems to cover the combinations.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to have another poke at it.

Thanks,

Jonathan

> ---
>  include/linux/iio/timer/stm32-timer-trigger.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/iio/timer/stm32-timer-trigger.h b/include/linux/iio/timer/stm32-timer-trigger.h
> index d68add8..cbb7c7a 100644
> --- a/include/linux/iio/timer/stm32-timer-trigger.h
> +++ b/include/linux/iio/timer/stm32-timer-trigger.h
> @@ -73,6 +73,15 @@
>  
>  #define TIM17_OC1	"tim17_oc1"
>  
> +#if IS_REACHABLE(CONFIG_IIO_STM32_TIMER_TRIGGER)
>  bool is_stm32_timer_trigger(struct iio_trigger *trig);
> -
> +#else
> +static inline bool is_stm32_timer_trigger(struct iio_trigger *trig)
> +{
> +#if IS_ENABLED(CONFIG_IIO_STM32_TIMER_TRIGGER)
> +	pr_warn_once("stm32-timer-trigger not linked in\n");
> +#endif
> +	return false;
> +}
> +#endif
>  #endif
