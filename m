From: Rob Herring <robh@kernel.org>
Subject: Re: [DLPAR CPU][Oops] Bad kernel stack pointer
Date: Mon, 18 Sep 2017 07:44:14 -0500
Message-ID: <CAL_Jsq+Hoz-NrgxJ9sw0qr7FO9wNWv8p+Ch9GnrQuQRushciDA@mail.gmail.com>
References: <1505729319.6990.5.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752501AbdIRMog (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Sep 2017 08:44:36 -0400
In-Reply-To: <1505729319.6990.5.camel@abdul.in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, mpe <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>

On Mon, Sep 18, 2017 at 5:08 AM, Abdul Haleem
<abdhalee@linux.vnet.ibm.com> wrote:
> Hi,
>
> Dynamic CPU remove operation resulted in Kernel Panic on today's
> next-20170915 kernel.
>
> Machine Type: Power 7 PowerVM LPAR
> Kernel : 4.13.0-next-20170915

I assume this is not something new to 9/15 -next nor only in -next
because you also reported that 4.13.0 broke. Can you provide some
details on what version worked? 4.12?

Rob
