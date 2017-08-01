From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Aug 1
Date: Wed, 2 Aug 2017 08:55:55 +0900
Message-ID: <20170801235555.GA539@jagdpanzerIV.localdomain>
References: <20170801173746.6962444d@canb.auug.org.au>
 <20170801124204.GA457@jagdpanzerIV.localdomain>
 <CAK8P3a2dUdOf4OTLBEMLAVYXSpMyqFSHsRShz7aLEYBjViw61A@mail.gmail.com>
 <CAK8P3a3vOHteTswgXr+9cO-wX2HGVb_GXd3w3bByZLR=36MXFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:33731 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751600AbdHAXzm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2017 19:55:42 -0400
Content-Disposition: inline
In-Reply-To: <CAK8P3a3vOHteTswgXr+9cO-wX2HGVb_GXd3w3bByZLR=36MXFg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

Hello,

On (08/01/17 15:28), Arnd Bergmann wrote:
[..]
> > Looking into it now, sorry for the breakage.
> 
> Does this fix it? I definitely got this part wrong as I see now, we must
> look up the 'tail' after calling __tty_buffer_request_room, not before.

yes, it does. thanks!

Tested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
