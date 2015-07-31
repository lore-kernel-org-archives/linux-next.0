From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Fri, 31 Jul 2015 09:29:21 -0700
Message-ID: <20150731162921.GA6335@kroah.com>
References: <20150729161912.GF18685@windriver.com>
 <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
 <55BA2B91.5070107@windriver.com>
 <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
 <1438326061.29353.9.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33728 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbbGaQ3W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2015 12:29:22 -0400
Content-Disposition: inline
In-Reply-To: <1438326061.29353.9.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: David Herrmann <dh.herrmann@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, David Herrmann <dh.herrmann@googlemail.com>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, Jul 31, 2015 at 05:01:01PM +1000, Michael Ellerman wrote:
> It's obviously possible that some samples build with that configuration, but
> building against another arch'es kernel headers just seems like it's asking for
> trouble. Even if we can build the samples, they will never run correctly.
> 
> So I suggest we should just disable SAMPLES if we're cross compiling, full stop.

Yes, that seems like a much better solution overall.  Can you send a
patch for this?

thanks,

greg k-h
