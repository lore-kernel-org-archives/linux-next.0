From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] isdn: fix netjet build errors
Date: Thu, 06 Aug 2009 13:10:03 -0700 (PDT)
Message-ID: <20090806.131003.13979199.davem@davemloft.net>
References: <20090805092635.6e6df57e.randy.dunlap@oracle.com>
	<20090805.120302.204538944.davem@davemloft.net>
	<200908060705.33130.isdn@linux-pingi.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56561
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756634AbZHFUJx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2009 16:09:53 -0400
In-Reply-To: <200908060705.33130.isdn@linux-pingi.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: isdn@linux-pingi.de
Cc: randy.dunlap@oracle.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

From: Karsten Keil <isdn@linux-pingi.de>
Date: Thu, 6 Aug 2009 07:05:32 +0200

> My original approach was to change the Makefile to enter this directory
> unconditional, but it seems that this part of the patch was lost during 
> development.  I will send a new patch after testing with different configs.

Ok, thanks!
