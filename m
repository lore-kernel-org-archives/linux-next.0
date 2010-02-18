From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 18 (staging)
Date: Thu, 18 Feb 2010 08:38:32 -0800
Message-ID: <4B7D6D08.9080600@oracle.com>
References: <20100218204937.54a613d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:30704 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757325Ab0BRQjl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2010 11:39:41 -0500
In-Reply-To: <20100218204937.54a613d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, Greg KH <gregkh@suse.de>

On 02/18/10 01:49, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100217:


duplicated function name:

drivers/staging/built-in.o: In function `format_by_fourcc':
(.text+0x5667): multiple definition of `format_by_fourcc'
drivers/media/built-in.o:(.text+0x2d241): first defined here


in drivers/staging/cx25821/ and drivers/media/common/saa7146_video.c

-- 
~Randy
