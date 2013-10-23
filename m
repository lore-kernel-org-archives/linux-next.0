From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH -next] staging/iio/adc: MXS_LRADC depends on INPUT
Date: Wed, 23 Oct 2013 16:55:56 +0100
Message-ID: <5267F18C.2020107@kernel.org>
References: <CA+r1Zhjo08EEoHsWkeDDKoc8Le6eDq4fZxZaa1Jc8cfOLsLsMg@mail.gmail.com> <526603EB.3060504@infradead.org> <201310220651.03499.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310220651.03499.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 10/22/13 05:51, Marek Vasut wrote:
> Dear Randy Dunlap,
> 
>> From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>>
>> mxs-lradc.c uses many input_() functions so it should
>> depend on INPUT to fix build errors.
>>
>> drivers/built-in.o: In function `mxs_lradc_ts_unregister':
>> drivers/staging/iio/adc/mxs-lradc.c:905: undefined reference to
>> `input_unregister_device' drivers/staging/iio/adc/mxs-lradc.c:905:
>> undefined reference to `input_unregister_device' drivers/built-in.o: In
>> function `input_report_abs':
>> include/linux/input.h:399: undefined reference to `input_event'
>> include/linux/input.h:399: undefined reference to `input_event'
>> include/linux/input.h:399: undefined reference to `input_event'
>> drivers/built-in.o: In function `input_report_key':
>> include/linux/input.h:389: undefined reference to `input_event'
>> drivers/built-in.o: In function `input_sync':
>> include/linux/input.h:414: undefined reference to `input_event'
>> drivers/built-in.o:include/linux/input.h:389: more undefined references to
>> `input_event' follow
>>
>> Signed-off-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> 
> Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> 
Applied to the togreg branch of iio.git

Thanks,

Jonathan
> Thanks!
> 
> Best regards,
> Marek Vasut
> 
