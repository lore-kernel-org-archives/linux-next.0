From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: Tree for May 1 (devtmpfs)
Date: Fri, 1 May 2009 18:51:39 +0200
Message-ID: <ac3eb2510905010951t7da76c10i6d116e58de521940@mail.gmail.com>
References: <20090501163405.973f9088.sfr@canb.auug.org.au>
	<49FB1521.5050500@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:4128 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805AbZEAQwA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 12:52:00 -0400
In-Reply-To: <49FB1521.5050500@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartmann <greg@kroah.com>

On Fri, May 1, 2009 at 17:28, Randy Dunlap <randy.dunlap@oracle.com> wrote:

> drivers/base/devtmpfs.c:41: error: implicit declaration of function 'vfs_mkdir'

Fixed by including fs.h.

> drivers/base/devtmpfs.c:137: error: 'block_class' undeclared (first use in this function)

Fixed by adding #ifdef CONFIG_BLOCK.

Your config seems to compile fine now here.

Thanks a lot for the tests,
Kay
