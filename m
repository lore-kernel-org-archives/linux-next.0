From: Michael Zoran <mzoran@crowfest.net>
Subject: Re: next-20170201 build: 3 failures 3 warnings (next-20170201)
Date: Wed, 01 Feb 2017 05:45:31 -0800
Message-ID: <1485956731.16868.1.camel@crowfest.net>
References: <E1cYsIh-0004Lj-OF@optimist>
         <20170201105627.pmx2c2wjfxjvnujq@sirena.org.uk>
         <20170201111752.GI13721@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw.crowfest.net ([52.42.241.221]:43398 "EHLO gw.crowfest.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751320AbdBANvr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Feb 2017 08:51:47 -0500
In-Reply-To: <20170201111752.GI13721@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

On Wed, 2017-02-01 at 12:17 +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 01, 2017 at 10:56:27AM +0000, Mark Brown wrote:
> > On Wed, Feb 01, 2017 at 10:38:07AM +0000, Build bot for Mark Brown
> > wrote:
> > 
> > Today's -next fails to build both arm and arm64 allmodconfigs due
> > to:
> > 
> > > 	arm64-allmodconfig
> > > ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error:
> > > implicit declaration of function 'vchi_msg_queue' [-
> > > Werror=implicit-function-declaration]
> > > 	arm-allmodconfig
> > > ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error:
> > > implicit declaration of function 'vchi_msg_queue' [-
> > > Werror=implicit-function-declaration]
> > > ../drivers/staging/media/platform/bcm2835/mmal-vchiq.c:453:8:
> > > error: implicit declaration of function 'vchi_msg_queue' [-
> > > Werror=implicit-function-declaration]
> > 
> > caused by that driver being added.
> 
> Doesn't look like vchi_msg_queue is ever exported for modules to use.
> Michael, care to make up a patch for that?
> 
> Also, the build warning is odd, shouldn't the include files point to
> the
> correct .h file for this?
> 

This is because vchi_msg_queue was replaced with
vchi_queue_kernel_message and vchi_queue_user_message.

vchi_msg_queue was removed from the header and made static since it's
no longer needed by other modules.

The correct fix is to replace vchi_msg_queue with
vchi_queue_kernel_message in the two dependent drivers.

I should have a patch shortly, but I'm currently having some very slow
network issues.
