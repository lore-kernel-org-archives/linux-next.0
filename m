From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH] staging: fix more iio builds when IIO_RING_BUFFER is
 not enabled
Date: Sat, 25 Jun 2011 12:16:39 +0100
Message-ID: <4E05C397.9090701@cam.ac.uk>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au> <20110624092832.36ef2eae.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110624092832.36ef2eae.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, gregkh <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 06/24/11 17:28, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> 
> Fix lots more build errors in staging/iio when CONFIG_IIO_RING_BUFFER
> is not enabled by moving enums and defines outside of the
> CONFIG_IIO_RING_BUFFER ifdef block.
> 
> Examples (one from each driver; there were 116 total errors):
> 
> drivers/staging/iio/accel/adis16204_core.c:437: error: 'ADIS16204_SCAN_SUPPLY' undeclared here (not in a function)
> drivers/staging/iio/accel/adis16209_core.c:410: error: 'ADIS16209_SCAN_SUPPLY' undeclared here (not in a function)
> drivers/staging/iio/gyro/adis16260_core.c:420: error: 'ADIS16260_SCAN_GYRO' undeclared here (not in a function)
> drivers/staging/iio/imu/adis16400_core.c:565: error: 'ADIS16400_SCAN_SUPPLY' undeclared here (not in a function)
Thanks Randy! I should really have taken the time to test the rest of these after
your first patch.

There's one more hiding in there I think, the adis16240.
I'll fire off a patch for this one with you as reported-by.
> 
> Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
> Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/staging/iio/accel/adis16204.h |    2 +-
>  drivers/staging/iio/accel/adis16209.h |    4 ++--
>  drivers/staging/iio/gyro/adis16260.h  |    2 +-
>  drivers/staging/iio/imu/adis16400.h   |    2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> --- linux-next-20110624.orig/drivers/staging/iio/accel/adis16204.h
> +++ linux-next-20110624/drivers/staging/iio/accel/adis16204.h
> @@ -84,7 +84,6 @@ struct adis16204_state {
>  
>  int adis16204_set_irq(struct iio_dev *indio_dev, bool enable);
>  
> -#ifdef CONFIG_IIO_RING_BUFFER
>  enum adis16204_scan {
>  	ADIS16204_SCAN_SUPPLY,
>  	ADIS16204_SCAN_ACC_X,
> @@ -93,6 +92,7 @@ enum adis16204_scan {
>  	ADIS16204_SCAN_TEMP,
>  };
>  
> +#ifdef CONFIG_IIO_RING_BUFFER
>  void adis16204_remove_trigger(struct iio_dev *indio_dev);
>  int adis16204_probe_trigger(struct iio_dev *indio_dev);
>  
> --- linux-next-20110624.orig/drivers/staging/iio/accel/adis16209.h
> +++ linux-next-20110624/drivers/staging/iio/accel/adis16209.h
> @@ -121,8 +121,6 @@ struct adis16209_state {
>  
>  int adis16209_set_irq(struct iio_dev *indio_dev, bool enable);
>  
> -#ifdef CONFIG_IIO_RING_BUFFER
> -
>  #define ADIS16209_SCAN_SUPPLY	0
>  #define ADIS16209_SCAN_ACC_X	1
>  #define ADIS16209_SCAN_ACC_Y	2
> @@ -132,6 +130,8 @@ int adis16209_set_irq(struct iio_dev *in
>  #define ADIS16209_SCAN_INCLI_Y	6
>  #define ADIS16209_SCAN_ROT	7
>  
> +#ifdef CONFIG_IIO_RING_BUFFER
> +
>  void adis16209_remove_trigger(struct iio_dev *indio_dev);
>  int adis16209_probe_trigger(struct iio_dev *indio_dev);
>  
> --- linux-next-20110624.orig/drivers/staging/iio/gyro/adis16260.h
> +++ linux-next-20110624/drivers/staging/iio/gyro/adis16260.h
> @@ -104,7 +104,6 @@ struct adis16260_state {
>  
>  int adis16260_set_irq(struct iio_dev *indio_dev, bool enable);
>  
> -#ifdef CONFIG_IIO_RING_BUFFER
>  /* At the moment triggers are only used for ring buffer
>   * filling. This may change!
>   */
> @@ -115,6 +114,7 @@ int adis16260_set_irq(struct iio_dev *in
>  #define ADIS16260_SCAN_TEMP	3
>  #define ADIS16260_SCAN_ANGL	4
>  
> +#ifdef CONFIG_IIO_RING_BUFFER
>  void adis16260_remove_trigger(struct iio_dev *indio_dev);
>  int adis16260_probe_trigger(struct iio_dev *indio_dev);
>  
> --- linux-next-20110624.orig/drivers/staging/iio/imu/adis16400.h
> +++ linux-next-20110624/drivers/staging/iio/imu/adis16400.h
> @@ -158,7 +158,6 @@ struct adis16400_state {
>  
>  int adis16400_set_irq(struct iio_dev *indio_dev, bool enable);
>  
> -#ifdef CONFIG_IIO_RING_BUFFER
>  /* At the moment triggers are only used for ring buffer
>   * filling. This may change!
>   */
> @@ -182,6 +181,7 @@ int adis16400_set_irq(struct iio_dev *in
>  #define ADIS16300_SCAN_INCLI_X	12
>  #define ADIS16300_SCAN_INCLI_Y	13
>  
> +#ifdef CONFIG_IIO_RING_BUFFER
>  void adis16400_remove_trigger(struct iio_dev *indio_dev);
>  int adis16400_probe_trigger(struct iio_dev *indio_dev);
>  
