From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 4 (pch_phub.c)
Date: Tue, 04 Jun 2013 13:21:40 -0700
Message-ID: <51AE4C54.6000709@infradead.org>
References: <20130604174107.99848a1dbb2532ceffe993eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:35685 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751366Ab3FDUWm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jun 2013 16:22:42 -0400
In-Reply-To: <20130604174107.99848a1dbb2532ceffe993eb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>

On 06/04/13 00:41, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130603:
> 

when CONFIG_NET is not enabled:

ERROR: "mac_pton" [drivers/misc/pch_phub.ko] undefined!


-- 
~Randy
