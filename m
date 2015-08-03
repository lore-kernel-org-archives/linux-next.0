From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Mon, 03 Aug 2015 14:58:34 +1000
Message-ID: <1438577914.17319.3.camel@ellerman.id.au>
References: <20150729161912.GF18685@windriver.com>
	 <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
	 <55BA2B91.5070107@windriver.com>
	 <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
	 <1438326061.29353.9.camel@ellerman.id.au> <20150731162921.GA6335@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34104 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752160AbbHCE6g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Aug 2015 00:58:36 -0400
In-Reply-To: <20150731162921.GA6335@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Herrmann <dh.herrmann@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, David Herrmann <dh.herrmann@googlemail.com>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, 2015-07-31 at 09:29 -0700, Greg Kroah-Hartman wrote:
> On Fri, Jul 31, 2015 at 05:01:01PM +1000, Michael Ellerman wrote:
> > It's obviously possible that some samples build with that configuration, but
> > building against another arch'es kernel headers just seems like it's asking for
> > trouble. Even if we can build the samples, they will never run correctly.
> > 
> > So I suggest we should just disable SAMPLES if we're cross compiling, full stop.
> 
> Yes, that seems like a much better solution overall.  Can you send a
> patch for this?

Yep, will do.

cheers
