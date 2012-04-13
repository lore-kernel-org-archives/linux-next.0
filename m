From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: "spi/devicetree: Move devicetree support code into spi directory" commit
Date: Fri, 13 Apr 2012 10:23:14 -0600
Message-ID: <20120413162314.868773E0791@localhost>
References: <20120413145623.GA3898@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:45462 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751024Ab2DMQXS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Apr 2012 12:23:18 -0400
Received: by dake40 with SMTP id e40so4107534dak.11
        for <linux-next@vger.kernel.org>; Fri, 13 Apr 2012 09:23:17 -0700 (PDT)
In-Reply-To: <20120413145623.GA3898@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: rob.herring@calxeda.com, linux-next@vger.kernel.org

On Fri, 13 Apr 2012 10:56:23 -0400, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> Hi Grant,
> 
> Can you take a look at this failure?

Hi Paul,

Thanks for telling me about this.  It's fixed in my tree now.

g.

> 
> drivers/spi/spi-fsl-lib.h:56:33: warning: 'struct spi_message' declared inside parameter list
> drivers/spi/spi-fsl-lib.h:56:33: warning: its scope is only this definition or declaration, which is probably not what you want
> drivers/spi/spi-fsl-lib.h:115:64: warning: 'struct spi_message' declared inside parameter list
> drivers/spi/spi-fsl-lib.c: In function 'mpc8xxx_spi_work':
> drivers/spi/spi-fsl-lib.c:68:27: error: dereferencing pointer to incomplete type
> 
> Bisect leads me to:
> 
> ------------
> 6810d770847c0f24555c13dd80b64fcc30c47ad8 is the first bad commit
> commit 6810d770847c0f24555c13dd80b64fcc30c47ad8
> Author: Grant Likely <grant.likely@secretlab.ca>
> Date:   Sat Apr 7 14:16:53 2012 -0600
> 
>     spi/devicetree: Move devicetree support code into spi directory
> ------------
> 
> Failure is in mpc85xx_defconfig.
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/6100610/
> 
> Thanks,
> Paul.
> 
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
