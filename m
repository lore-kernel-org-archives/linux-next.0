From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] zcache: include module.h for MODULE_LICENSE
Date: Wed, 3 Aug 2011 07:26:28 -0700
Message-ID: <20110803142628.GA9756@kroah.com>
References: <20110803141641.00402b8e49dd68aa58c458ac@canb.auug.org.au>
 <1312380040-28249-1-git-send-email-cascardo@holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:50496 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752356Ab1HCO2l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2011 10:28:41 -0400
Content-Disposition: inline
In-Reply-To: <1312380040-28249-1-git-send-email-cascardo@holoscopio.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: ngupta@vflare.org, dan.magenheimer@oracle.com, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, paul.gortmaker@windriver.com, linux-next@vger.kernel.org

On Wed, Aug 03, 2011 at 11:00:40AM -0300, Thadeu Lima de Souza Cascardo wrote:
> The oncoming cleanup of module.h usage requires the explicit inclusion
> of module.h when it was otherwise being included indirectly. Otherwise,
> building zcache will fail.
> 
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

Thanks, but you forgot the Reported-by: tag for this patch that you
should have added.  I've added it this time but please be more careful
next time.

greg k-h
