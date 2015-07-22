From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] memory: pl172: fix modular build
Date: Wed, 22 Jul 2015 16:10:20 -0700
Message-ID: <20150722231020.GA480@localhost>
References: <20150722184345.GB11162@sirena.org.uk>
 <1437603037-18395-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:34982 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797AbbGVXLh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2015 19:11:37 -0400
Received: by pdrg1 with SMTP id g1so145853149pdr.2
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2015 16:11:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437603037-18395-1-git-send-email-manabian@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: arm@kernel.org, broonie@kernel.org, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jul 23, 2015 at 12:10:37AM +0200, Joachim Eastwood wrote:
> Building pl172 as a module fails with:
> > ERROR: "of_default_bus_match_table" [drivers/memory/pl172.ko] undefined!
> 
> Because the symbol of_default_bus_match_table isn't exported by the OF
> core code so can't be referenced from modules. Fix this by removing
> the usage of of_default_bus_match_table for now. The side effect of
> this is that child nodes can't use "simple-bus" or "simple-mfd".
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
> 
> This should fix the allmod build failure introduces by the
> pl172 driver that Mark encountered. After this fix the driver
> should builds just fine as a module and there is no behavior
> change when boot my devkit either since none of children under
> pl172 uses "simple-bus/mfd" right now.

Thanks, applied.


-Olof
