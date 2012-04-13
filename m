From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: "spi/devicetree: Move devicetree support code into spi
 directory" commit
Date: Fri, 13 Apr 2012 10:56:23 -0400
Message-ID: <20120413145623.GA3898@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:63382 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751633Ab2DMO41 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Apr 2012 10:56:27 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: grant.likely@secretlab.ca
Cc: rob.herring@calxeda.com, linux-next@vger.kernel.org

Hi Grant,

Can you take a look at this failure?

drivers/spi/spi-fsl-lib.h:56:33: warning: 'struct spi_message' declared inside parameter list
drivers/spi/spi-fsl-lib.h:56:33: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/spi/spi-fsl-lib.h:115:64: warning: 'struct spi_message' declared inside parameter list
drivers/spi/spi-fsl-lib.c: In function 'mpc8xxx_spi_work':
drivers/spi/spi-fsl-lib.c:68:27: error: dereferencing pointer to incomplete type

Bisect leads me to:

------------
6810d770847c0f24555c13dd80b64fcc30c47ad8 is the first bad commit
commit 6810d770847c0f24555c13dd80b64fcc30c47ad8
Author: Grant Likely <grant.likely@secretlab.ca>
Date:   Sat Apr 7 14:16:53 2012 -0600

    spi/devicetree: Move devicetree support code into spi directory
------------

Failure is in mpc85xx_defconfig.

http://kisskb.ellerman.id.au/kisskb/buildresult/6100610/

Thanks,
Paul.
