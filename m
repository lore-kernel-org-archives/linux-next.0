From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware build failure
Date: Wed, 04 Jun 2008 10:53:38 +0100
Message-ID: <1212573218.4042.83.camel@shinybook.infradead.org>
References: <20080604164623.3d5f38d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:58988 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbYFDJxg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 05:53:36 -0400
In-Reply-To: <20080604164623.3d5f38d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 2008-06-04 at 16:46 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> firmware/whiteheat_loader.fw.gen.S: Assembler messages:
> firmware/whiteheat_loader.fw.gen.S:8: Error: alignment not a power of 2
> firmware/whiteheat_loader.fw.gen.S:12: Error: alignment not a power of 2

> Also:
> 
> drivers/net/usb/kaweth.c: In function 'kaweth_download_firmware':
> drivers/net/usb/kaweth.c:422: error: 'data' undeclared (first use in this function)

OK, both those should be fixed in the firmware-2.6.git tree now; thanks.

-- 
dwmw2

