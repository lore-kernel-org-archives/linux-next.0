From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH -next] SOC audio: fix PM=n build
Date: Tue, 17 Jun 2008 19:09:04 +0100
Message-ID: <20080617180904.GA14443@opensource.wolfsonmicro.com>
References: <20080617094629.4859e2c2.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42879 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755913AbYFQSJG (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 14:09:06 -0400
Content-Disposition: inline
In-Reply-To: <20080617094629.4859e2c2.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, liam.girdwood@wolfsonmicro.com, akpm <akpm@linux-foundation.org>

On Tue, Jun 17, 2008 at 09:46:29AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix sound/soc build failure when CONFIG_PM=n:
> 
> linux-next-20080617/sound/soc/soc-core.c:829: error: 'soc_resume_deferred' undeclared (first use in this function)
> soc3.out:make[3]: *** [sound/soc/soc-core.o] Error 1
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
