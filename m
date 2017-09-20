From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [DLPAR CPU][Oops] Bad kernel stack pointer
Date: Wed, 20 Sep 2017 21:42:21 +1000
Message-ID: <878th9lhpe.fsf@concordia.ellerman.id.au>
References: <1505729319.6990.5.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751619AbdITLmY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Sep 2017 07:42:24 -0400
In-Reply-To: <1505729319.6990.5.camel@abdul.in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>, Paul Mackerras <paulus@samba.org>

Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:

> Hi,
>
> Dynamic CPU remove operation resulted in Kernel Panic on today's
> next-20170915 kernel.
>
> Machine Type: Power 7 PowerVM LPAR
> Kernel : 4.13.0-next-20170915
> config : attached
> test: DLPAR CPU remove
>
>
> dmesg logs:
> ----------
> cpu 37 (hwid 37) Ready to die...
> cpu 38 (hwid 38) Ready to die...
> cpu 39 (hwid 39)
> ******* RTAS CReady to die...
> ALL BUFFER CORRUPTION *******

Cool. Does that come from RTAS itself? I have never seen that happen
before.

Is this easily reproducible?

cheers
