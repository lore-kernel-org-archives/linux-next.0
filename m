From: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Subject: Re: linux-next: Tree for August 11
Date: Mon, 11 Aug 2008 13:11:17 -0700
Message-ID: <48A09CE5.70402@ct.jp.nec.com>
References: <20080811164617.7b06df12.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [63.81.120.158] ([63.81.120.158]:36326 "EHLO
	gateway-1237.mvista.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752532AbYHKULV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Aug 2008 16:11:21 -0400
In-Reply-To: <20080811164617.7b06df12.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alan Cox <alan@redhat.com>, Jeff Dike <jdike@addtoit.com>

I got an error on um defconfig;

arch/um/drivers/line.c: In function 'line_ioctl':
arch/um/drivers/line.c:306: error: implicit declaration of function 'tioclinux'
make[1]: *** [arch/um/drivers/line.o] Error 1


This commit may cause it.

commit 1aa5f1fab397054a9133bcaf511973db5a6b97be
Author: Alan Cox <alan@redhat.com>
Date:   Mon Aug 11 10:27:35 2008 +1000

    tty-fixup-uml

    Add a new nicer hook for tioclinux

thanks
Hiroshi Shimamoto
