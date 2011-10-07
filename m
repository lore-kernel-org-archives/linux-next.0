From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Fri, 7 Oct 2011 17:41:48 +0200
Message-ID: <201110071741.49151.arnd@arndb.de>
References: <20111004112623.aa04e959d29cb19af8053739@canb.auug.org.au> <20111006111317.531e6fcc1829fc9927d4924d@canb.auug.org.au> <4E8EC1D8.4070200@atmel.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:51646 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750747Ab1JGPmD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Oct 2011 11:42:03 -0400
In-Reply-To: <4E8EC1D8.4070200@atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org

On Friday 07 October 2011, Nicolas Ferre wrote:
> Well, on my side, applying Arnd's correction, I can run a x86_64
> allmodconfig without this error.
> 
> With this new dependency it seems impossible to even select the driver.
> 
> Do you have a link to a log of this failure? Have the .config been
> re-generated?
> 

I just had not gotten around to do the changes I promised. It should
be ok in arm-soc/for-next now.

	Arnd
