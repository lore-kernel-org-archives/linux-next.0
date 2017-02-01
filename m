From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: next-20170201 build: 3 failures 3 warnings (next-20170201)
Date: Wed, 1 Feb 2017 12:17:52 +0100
Message-ID: <20170201111752.GI13721@kroah.com>
References: <E1cYsIh-0004Lj-OF@optimist>
 <20170201105627.pmx2c2wjfxjvnujq@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37714 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751807AbdBALRs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Feb 2017 06:17:48 -0500
Content-Disposition: inline
In-Reply-To: <20170201105627.pmx2c2wjfxjvnujq@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Michael Zoran <mzoran@crowfest.net>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

On Wed, Feb 01, 2017 at 10:56:27AM +0000, Mark Brown wrote:
> On Wed, Feb 01, 2017 at 10:38:07AM +0000, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build both arm and arm64 allmodconfigs due to:
> 
> > 	arm64-allmodconfig
> > ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
> 
> > 	arm-allmodconfig
> > ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
> > ../drivers/staging/media/platform/bcm2835/mmal-vchiq.c:453:8: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
> 
> caused by that driver being added.

Doesn't look like vchi_msg_queue is ever exported for modules to use.
Michael, care to make up a patch for that?

Also, the build warning is odd, shouldn't the include files point to the
correct .h file for this?

thanks,

greg k-h
