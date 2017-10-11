From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: Tree for Oct 9th (drivers/dma/stm32-mdma.c)
Date: Wed, 11 Oct 2017 18:25:28 +0530
Message-ID: <20171011125528.GI30097@localhost>
References: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk>
 <a86da771-5abc-acc9-cc2e-c31984fba659@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:46012 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751991AbdJKMvT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Oct 2017 08:51:19 -0400
Content-Disposition: inline
In-Reply-To: <a86da771-5abc-acc9-cc2e-c31984fba659@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pierre-Yves Mordret <pierre-yves.mordret@st.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>

On Tue, Oct 10, 2017 at 09:27:18AM -0700, Randy Dunlap wrote:
> On 10/09/17 14:21, Mark Brown wrote:
> > For my birthday I've gone and got myself a linux-next tree:

Nice thing you chose to do for the day :D

> > 
> > Changes since 20170929:
> > 
> 
> on i386:
> 
> drivers/dma/stm32-mdma.o: In function `stm32_mdma_prep_dma_memcpy':
> stm32-mdma.c:(.text+0x1174): undefined reference to `__umoddi3'
> stm32-mdma.c:(.text+0x1208): undefined reference to `__umoddi3'
> stm32-mdma.c:(.text+0x134c): undefined reference to `__umoddi3'
> stm32-mdma.c:(.text+0x141d): undefined reference to `__umoddi3'

The driver uses DIV_ROUND_UP but this should have worked, let me check more.
Was generic i386 defconfig used or some other config

-- 
~Vinod
