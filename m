From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Jun 4 (pch_phub.c)
Date: Tue, 4 Jun 2013 23:02:31 +0200
Message-ID: <201306042302.31866.arnd@arndb.de>
References: <20130604174107.99848a1dbb2532ceffe993eb@canb.auug.org.au> <51AE4C54.6000709@infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51AE4C54.6000709@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On Tuesday 04 June 2013, Randy Dunlap wrote:
> 
> On 06/04/13 00:41, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20130603:
> > 
> 
> when CONFIG_NET is not enabled:
> 
> ERROR: "mac_pton" [drivers/misc/pch_phub.ko] undefined!

Andy Shevchenko just posted "[PATCH] net: core: move mac_pton() to
lib/net_utils.c" to fix this.

	Arnd
