From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Aug 1
Date: Wed, 2 Aug 2017 13:13:12 +0200
Message-ID: <CAK8P3a245ufEQHoR1ewJAROy8ay0r-59Et7U4utAT9ogLU-Asw@mail.gmail.com>
References: <20170801173746.6962444d@canb.auug.org.au> <20170801124204.GA457@jagdpanzerIV.localdomain>
 <CAK8P3a2dUdOf4OTLBEMLAVYXSpMyqFSHsRShz7aLEYBjViw61A@mail.gmail.com>
 <CAK8P3a3vOHteTswgXr+9cO-wX2HGVb_GXd3w3bByZLR=36MXFg@mail.gmail.com> <20170801235555.GA539@jagdpanzerIV.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:37424 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752883AbdHBLNN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2017 07:13:13 -0400
In-Reply-To: <20170801235555.GA539@jagdpanzerIV.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On Wed, Aug 2, 2017 at 1:55 AM, Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
> On (08/01/17 15:28), Arnd Bergmann wrote:
>> Does this fix it? I definitely got this part wrong as I see now, we must
>> look up the 'tail' after calling __tty_buffer_request_room, not before.
>
> yes, it does. thanks!
>
> Tested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

Thanks for testing! I've now submitted that fix properly with a real
changelog and your Tested-by tag.

        Arnd
