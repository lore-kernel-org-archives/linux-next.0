From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Date: Fri, 20 Jan 2017 09:37:20 +0100
Message-ID: <20170120083720.GA29509@kroah.com>
References: <20170120153622.03c28b85@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170120153622.03c28b85@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 20, 2017 at 03:36:22PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_I2C_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_I2C && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_I2C)
> warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_SPI_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_SPI && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_SPI)
> warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_SPI_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_SPI && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_SPI)
> warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_I2C_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_I2C && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_I2C)
> warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_SPI_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_SPI && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_SPI)
> warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_I2C_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_I2C && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_I2C)
> 
> Introduced by commit
> 
>   762227721fe6 ("iio: accel: st_accel: handle deprecated bindings")

Ick.  I've added Jonathan to the thread, any thoughts?

thanks,

greg k-h
