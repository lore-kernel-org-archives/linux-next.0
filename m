From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: linux-next: Tree for Feb 13 (iio/magnetometer/ak8975.c)
Date: Fri, 13 Feb 2015 16:32:33 -0800
Message-ID: <54DE97A1.2000607@infradead.org>
References: <20150213165615.1ad43047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150213165615.1ad43047-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 02/12/15 21:56, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 
> Changes since 20150212:

on i386:  when CONFIG_I2C is not enabled:

../drivers/iio/magnetometer/ak8975.c: In function 'ak8975_who_i_am':
../drivers/iio/magnetometer/ak8975.c:393:2: error: implicit declaration of function 'i2c_smbus_read_i2c_block_data' [-Werror=implicit-function-declaration]
  ret = i2c_smbus_read_i2c_block_data(client, AK09912_REG_WIA1,
  ^
../drivers/iio/magnetometer/ak8975.c: In function 'ak8975_set_mode':
../drivers/iio/magnetometer/ak8975.c:431:2: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Werror=implicit-function-declaration]
  ret = i2c_smbus_write_byte_data(data->client,
  ^
../drivers/iio/magnetometer/ak8975.c: In function 'wait_conversion_complete_gpio':
../drivers/iio/magnetometer/ak8975.c:555:2: error: implicit declaration of function 'i2c_smbus_read_byte_data' [-Werror=implicit-function-declaration]
  ret = i2c_smbus_read_byte_data(client, data->def->ctrl_regs[ST1]);
  ^
../drivers/iio/magnetometer/ak8975.c: In function 'ak8975_read_axis':
../drivers/iio/magnetometer/ak8975.c:650:2: error: implicit declaration of function 'i2c_smbus_read_word_data' [-Werror=implicit-function-declaration]
  ret = i2c_smbus_read_word_data(client, data->def->data_regs[index]);
  ^
../drivers/iio/magnetometer/ak8975.c: At top level:
../drivers/iio/magnetometer/ak8975.c:846:1: warning: data definition has no type or storage class [enabled by default]
 module_i2c_driver(ak8975_driver);
 ^
../drivers/iio/magnetometer/ak8975.c:846:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
../drivers/iio/magnetometer/ak8975.c:846:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/iio/magnetometer/ak8975.c:837:26: warning: 'ak8975_driver' defined but not used [-Wunused-variable]
 static struct i2c_driver ak8975_driver = {
                          ^
cc1: some warnings being treated as errors
make[4]: *** [drivers/iio/magnetometer/ak8975.o] Error 1


-- 
~Randy
