From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: Re: linux-next: build warnings after merge of the usb-gadget tree
Date: Wed, 20 May 2015 09:18:45 +0200
Message-ID: <555C3555.5030400@samsung.com>
References: <20150520162937.5cca5b00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9342 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751341AbbETHSu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 03:18:50 -0400
In-reply-to: <20150520162937.5cca5b00@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Felipe Balbi <balbi@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

W dniu 20.05.2015 o 08:29, Stephen Rothwell pisze:
> Hi Felipe,
>
> After merging the usb-gadget tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>
> drivers/usb/gadget/function/rndis.c: In function 'rndis_proc_write':
> drivers/usb/gadget/function/rndis.c:1147:4: warning: passing argument 1 of 'rndis_signal_connect' makes pointer from integer without a cast
>      rndis_signal_connect(p->confignr);
>      ^
> drivers/usb/gadget/function/rndis.c:748:5: note: expected 'struct rndis_params *' but argument is of type 'u8'
>   int rndis_signal_connect(struct rndis_params *params)
>       ^
> drivers/usb/gadget/function/rndis.c:1151:4: warning: passing argument 1 of 'rndis_signal_disconnect' makes pointer from integer without a cast
>      rndis_signal_disconnect(p->confignr);
>      ^
> drivers/usb/gadget/function/rndis.c:755:5: note: expected 'struct rndis_params *' but argument is of type 'u8'
>   int rndis_signal_disconnect(struct rndis_params *params)
>       ^
>
> Probably caused by commit 83210e59ee15 ("usb: gadget: rndis: use
> rndis_params instead of configNr").
>
There is already a patch series for that:

http://www.spinics.net/lists/linux-usb/msg125003.html

AP
