From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: linux-next: Tree for Oct 9 (bluetooth/bpa10x.c)
Date: Fri, 9 Oct 2015 17:51:36 +0200
Message-ID: <5B7CD6D9-14D0-4080-AD8D-FC9BEE3B813F@holtmann.org>
References: <20151009172448.6aed0174@canb.auug.org.au> <5617DFFF.90702@infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from senator.holtmann.net ([87.106.208.187]:52463 "EHLO
	mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932432AbbJIPvl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2015 11:51:41 -0400
In-Reply-To: <5617DFFF.90702@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org

Hi Randy,

>> Changes since 20151008:
>> 
> 
> on i386:
> 
> warning: (BT_HCIBPA10X) selects BT_HCIUART_H4 which has unmet direct dependencies (NET && BT && BT_HCIUART)
> 
> drivers/built-in.o: In function `bpa10x_rx_complete':
> bpa10x.c:(.text+0x2ac5e2): undefined reference to `h4_recv_buf'

already noticed that issue. Fix for it has already been applied to bluetooth-next tree.

Regards

Marcel
