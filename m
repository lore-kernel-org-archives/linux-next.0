From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: dac: ad5064: fix section mismatch in ad5064_init()
 in linux-next
Date: Thu, 12 Jul 2012 20:22:43 +0100
Message-ID: <4FFF2403.5090809@kernel.org>
References: <1341979502-27440-1-git-send-email-dev@snitselaar.org> <4FFD23BA.8070502@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FFD23BA.8070502-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Gerard Snitselaar <dev-RR6//3E8fTwgb5+hjvvj3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 07/11/2012 07:56 AM, Lars-Peter Clausen wrote:
> On 07/11/2012 06:05 AM, Gerard Snitselaar wrote:
>> ad5064_init() calls ad5064_spi_unregister_driver() which is annotated
>> __exit.
>>
>> Signed-off-by: Gerard Snitselaar <dev-RR6//3E8fTwgb5+hjvvj3w@public.gmane.org>
> 
> Thanks,
> 
> Acked-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
merged to fixes-togreg and pull request sent.
> 
>> ---
>>  drivers/iio/dac/ad5064.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
>> index aa739c4..6ec1319 100644
>> --- a/drivers/iio/dac/ad5064.c
>> +++ b/drivers/iio/dac/ad5064.c
>> @@ -582,7 +582,7 @@ static int __init ad5064_spi_register_driver(void)
>>  	return spi_register_driver(&ad5064_spi_driver);
>>  }
>>  
>> -static void __exit ad5064_spi_unregister_driver(void)
>> +static void ad5064_spi_unregister_driver(void)
>>  {
>>  	spi_unregister_driver(&ad5064_spi_driver);
>>  }
> 
