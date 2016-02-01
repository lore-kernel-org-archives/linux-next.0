From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dt-rh tree with the qcom tree
Date: Mon, 1 Feb 2016 13:10:17 +1100
Message-ID: <20160201131017.5a843363@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35457 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933224AbcBACKT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jan 2016 21:10:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Andy Gross <agross@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Rob,

Today's linux-next merge of the dt-rh tree got a conflict in:

  MAINTAINERS

between commit:

  43ed2986476d ("MAINTAINERS: add qcom i2c and spi drivers to list")

from the qcom tree and commit:

  e68d7c143a62 ("MAINTAINERS: Add missing platform maintainers for dts files")

from the dt-rh tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 5318f7972fb9,973336739ae5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -1431,9 -1434,8 +1440,10 @@@ S:	Maintaine
  F:	arch/arm/boot/dts/qcom-*.dts
  F:	arch/arm/boot/dts/qcom-*.dtsi
  F:	arch/arm/mach-qcom/
+ F:	arch/arm64/boot/dts/qcom/*
 +F:	drivers/i2c/busses/i2c-qup.c
  F:	drivers/soc/qcom/
 +F:	drivers/spi/spi-qup.c
  F:	drivers/tty/serial/msm_serial.h
  F:	drivers/tty/serial/msm_serial.c
  F:	drivers/*/pm8???-*
