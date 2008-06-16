From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: linux-next: arm build failure
Date: Tue, 17 Jun 2008 01:52:37 +0400
Message-ID: <20080616215237.GA9755@doriath.ww600.siemens.net>
References: <20080616160747.27909f11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.159]:4255 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755830AbYFPVw6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jun 2008 17:52:58 -0400
Received: by fg-out-1718.google.com with SMTP id 19so3387104fgg.17
        for <linux-next@vger.kernel.org>; Mon, 16 Jun 2008 14:52:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080616160747.27909f11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

Hi,

On Mon, Jun 16, 2008 at 04:07:47PM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/mfd/tc6393xb.c:91: error: field 'gpio' has incomplete type
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_get':
> drivers/mfd/tc6393xb.c:116: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/mfd/tc6393xb.c:116: warning: initialization from incompatible pointer type
> drivers/mfd/tc6393xb.c: In function '__tc6393xb_gpio_set':
> drivers/mfd/tc6393xb.c:126: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/mfd/tc6393xb.c:126: warning: initialization from incompatible pointer type
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_set':
> drivers/mfd/tc6393xb.c:141: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/mfd/tc6393xb.c:141: warning: initialization from incompatible pointer type
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_direction_input':
> drivers/mfd/tc6393xb.c:154: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/mfd/tc6393xb.c:154: warning: initialization from incompatible pointer type
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_direction_output':
> drivers/mfd/tc6393xb.c:172: warning: type defaults to 'int' in declaration of '__mptr'
> drivers/mfd/tc6393xb.c:172: warning: initialization from incompatible pointer type
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_register_gpio':
> drivers/mfd/tc6393xb.c:199: error: implicit declaration of function 'gpiochip_add'
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_attach_irq':
> drivers/mfd/tc6393xb.c:272: error: implicit declaration of function 'set_irq_flags'
> drivers/mfd/tc6393xb.c:272: error: 'IRQF_VALID' undeclared (first use in this function)
> drivers/mfd/tc6393xb.c:272: error: (Each undeclared identifier is reported only once
> drivers/mfd/tc6393xb.c:272: error: for each function it appears in.)
> drivers/mfd/tc6393xb.c:272: error: 'IRQF_PROBE' undeclared (first use in this function)
> drivers/mfd/tc6393xb.c:275: error: 'IRQT_FALLING' undeclared (first use in this function)
> drivers/mfd/tc6393xb.c: In function 'tc6393xb_probe':
> drivers/mfd/tc6393xb.c:423: error: implicit declaration of function 'gpiochip_remove'
> 
> I have reverted the commit that added this driver
> (ed1f4e8e88fcf43dd1679968477a6139d53bc852 "[ARM] 5096/1: Support Toshiba
> TC6393XB Mobile I/O Controller" from the arm tree) for now.  I suspect
> that it needs some dependencies in it Kconfig.

Yup. I forgot that not all platforms do have gpiolib. Please use the
following patch.


>From 2707a8c78089894e3db6363c7921c89fd69c6ad4 Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 17 Jun 2008 01:44:35 +0400
Subject: [PATCH] Fix Kconfig entry for TC6393XB

The tc6393xb driver breaks if no gpiolib is present. Depend on
HAVE_GPIO_LIB.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/mfd/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 66c3e53..2619f9e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -40,6 +40,7 @@ config HTC_PASIC3
 
 config MFD_TC6393XB
 	bool "Support Toshiba TC6393XB"
+	depends on HAVE_GPIO_LIB
 	help
 	  Support for Toshiba Mobile IO Controller TC6393XB
 
-- 
1.5.5.3


-- 
With best wishes
Dmitry

