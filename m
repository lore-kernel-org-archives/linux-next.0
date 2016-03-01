From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] rapidio/rio_mport_cdev: fix conflicting DMA configuration
 options
Date: Mon, 29 Feb 2016 17:12:52 -0800
Message-ID: <56D4EC94.4090609@infradead.org>
References: <1456790736-14509-1-git-send-email-alexandre.bounine@idt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40724 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbcCABNO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Feb 2016 20:13:14 -0500
In-Reply-To: <1456790736-14509-1-git-send-email-alexandre.bounine@idt.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Bounine <alexandre.bounine@idt.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Matt Porter <mporter@kernel.crashing.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On 02/29/16 16:05, Alexandre Bounine wrote:
> Fix to ensure that only CONFIG_RAPIDIO_DMA_ENGINE option is used to control
> DMA code build.
> 
> Signed-off-by: Alexandre Bounine <alexandre.bounine@idt.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Matt Porter <mporter@kernel.crashing.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-next@vger.kernel.org
> ---
>  drivers/rapidio/devices/rio_mport_cdev.c |   32 +++++++++++++----------------
>  1 files changed, 14 insertions(+), 18 deletions(-)
> 

Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy
