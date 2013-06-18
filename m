From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 18 usb/chipidea)
Date: Tue, 18 Jun 2013 11:52:36 -0700
Message-ID: <51C0AC74.5050705@infradead.org>
References: <20130618173030.16d73801ab72b7c611faccea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:53129 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756153Ab3FRSxM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Jun 2013 14:53:12 -0400
In-Reply-To: <20130618173030.16d73801ab72b7c611faccea@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, David Lopo <dlopo@chipidea.mips.com>

On 06/18/13 00:30, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130617:
> 


on i386:

# CONFIG_USB_PHY is not set

drivers/built-in.o: In function `ci_hdrc_probe':
core.c:(.text+0x20446b): undefined reference to `of_usb_get_phy_mode'


chipidea needs to depend on or select some kind of USB_PHY support...?


-- 
~Randy
