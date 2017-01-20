From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the staging tree
Date: Fri, 20 Jan 2017 15:36:22 +1100
Message-ID: <20170120153622.03c28b85@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55081 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751059AbdATEjC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Jan 2017 23:39:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Greg,

After merging the staging tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_I2C_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_I2C && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_I2C)
warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_SPI_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_SPI && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_SPI)
warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_SPI_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_SPI && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_SPI)
warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_I2C_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_I2C && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_I2C)
warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_SPI_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_SPI && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_SPI)
warning: (IIO_ST_ACCEL_3AXIS) selects IIO_ST_ACCEL_I2C_3AXIS which has unmet direct dependencies (IIO && !SENSORS_LIS3_I2C && IIO_ST_ACCEL_3AXIS && IIO_ST_SENSORS_I2C)

Introduced by commit

  762227721fe6 ("iio: accel: st_accel: handle deprecated bindings")

-- 
Cheers,
Stephen Rothwell
