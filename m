From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 1 (lightnvm)
Date: Sun, 1 Nov 2015 17:16:41 -0800
Message-ID: <5636B979.9010507@infradead.org>
References: <20151102035340.17310681@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40773 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbbKBBQs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Nov 2015 20:16:48 -0500
In-Reply-To: <20151102035340.17310681@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Matias Bjorling <m@bjorling.me>

On 11/01/15 08:53, Stephen Rothwell wrote:
> Hi all,
> 
> I start again a day early, and this is how you all repay me? ;-)
> 
> Changes since 20151022:
> 

on i386:

../include/linux/lightnvm.h:143:4: error: width of 'resved' exceeds its type

# CONFIG_LBDAF is not set


-- 
~Randy
