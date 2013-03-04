From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: linux-next: Tree for Mar 4 (iio)
Date: Mon, 04 Mar 2013 20:15:05 +0100
Message-ID: <5134F2B9.2060605@metafoo.de>
References: <20130304144358.bd62a57601d4d4793921213e@canb.auug.org.au> <5134EAB7.1040004@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5134EAB7.1040004-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 03/04/2013 07:40 PM, Randy Dunlap wrote:
> On 03/03/13 19:43, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130301:
>>
> 
> on x86_64:
> 
> warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
> 
> and then:
> 
> drivers/iio/industrialio-triggered-buffer.c:20:16: error: 'iio_sw_buffer_preenable' undeclared here (not in a function)
> make[3]: *** [drivers/iio/industrialio-triggered-buffer.o] Error 1
> 

Hi,

Thanks for the report. Guenter already fixed the problem last Friday, so the
patch should hopefully show up in next soon.

- Lars
