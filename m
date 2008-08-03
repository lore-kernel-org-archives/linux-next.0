From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: next-20080801: BUG in pktcdvd while mounting dvd
Date: Sun, 3 Aug 2008 15:53:20 +0100
Message-ID: <20080803155320.64702b4e@lxorguk.ukuu.org.uk>
References: <1217765884.9907.5.camel@dhcppc0>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:38224 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756240AbYHCPKk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Aug 2008 11:10:40 -0400
In-Reply-To: <1217765884.9907.5.camel@dhcppc0>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Linux-Next <linux-next@vger.kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, petero2@telia.com

On Sun, 03 Aug 2008 14:18:04 +0200
Thomas Meyer <thomas@m3y3r.de> wrote:

> Greetings.
> 
> Please have a look at this bug report:
> 
> http://kerneloops.org/raw.php?rawid=47211
> 
> reverting commit 5b6155ee70e9c4d2ad7e6f514c8eee06e2711c3a fixes the
> problem

ioctl_by_bdev is calling ioctl methods with filp = NULL which is not
valid. That in turn blocks switching to unlocked_ioctl and BKL removal so
ioctl_by_bdev urgently needs fixing.

Alan
