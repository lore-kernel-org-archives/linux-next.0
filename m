From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/iio: fix duplicate dev_attr_name
Date: Fri, 21 Aug 2009 13:59:08 -0700
Message-ID: <20090821135908.259b222f.randy.dunlap@oracle.com>
References: <20090821164140.71968b47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933042AbZHUVgM@vger.kernel.org>
In-Reply-To: <20090821164140.71968b47.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

device attr's should be static, otherwise duplicate identifiers are
created:

drivers/staging/iio/trigger/iio-trig-gpio.o:(.data+0x1c): multiple definition of `dev_attr_name'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/iio/accel/lis3l02dq_ring.c          |    2 +-
 drivers/staging/iio/trigger/iio-trig-gpio.c         |    2 +-
 drivers/staging/iio/trigger/iio-trig-periodic-rtc.c |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20090821.orig/drivers/staging/iio/accel/lis3l02dq_ring.c
+++ linux-next-20090821/drivers/staging/iio/accel/lis3l02dq_ring.c
@@ -441,7 +441,7 @@ static int lis3l02dq_data_rdy_trigger_se
 				 &t);
 	return ret;
 }
-DEVICE_ATTR(name, S_IRUGO, iio_trigger_read_name, NULL);
+static DEVICE_ATTR(name, S_IRUGO, iio_trigger_read_name, NULL);
 
 static struct attribute *lis3l02dq_trigger_attrs[] = {
 	&dev_attr_name.attr,
--- linux-next-20090821.orig/drivers/staging/iio/trigger/iio-trig-gpio.c
+++ linux-next-20090821/drivers/staging/iio/trigger/iio-trig-gpio.c
@@ -46,7 +46,7 @@ static irqreturn_t iio_gpio_trigger_poll
 	return IRQ_HANDLED;
 }
 
-DEVICE_ATTR(name, S_IRUGO, iio_trigger_read_name, NULL);
+static DEVICE_ATTR(name, S_IRUGO, iio_trigger_read_name, NULL);
 
 static struct attribute *iio_gpio_trigger_attrs[] = {
 	&dev_attr_name.attr,
--- linux-next-20090821.orig/drivers/staging/iio/trigger/iio-trig-periodic-rtc.c
+++ linux-next-20090821/drivers/staging/iio/trigger/iio-trig-periodic-rtc.c
@@ -81,10 +81,10 @@ static ssize_t iio_trig_periodic_read_na
 	return sprintf(buf, "%s\n", trig_info->name);
 }
 
-DEVICE_ATTR(name, S_IRUGO,
+static DEVICE_ATTR(name, S_IRUGO,
 	    iio_trig_periodic_read_name,
 	    NULL);
-DEVICE_ATTR(frequency, S_IRUGO | S_IWUSR,
+static DEVICE_ATTR(frequency, S_IRUGO | S_IWUSR,
 	    iio_trig_periodic_read_freq,
 	    iio_trig_periodic_write_freq);
 



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
