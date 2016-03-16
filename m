From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Wed, 16 Mar 2016 10:07:13 -0400
Message-ID: <20160316140713.GC14746@kvack.org>
References: <20160315174634.6766cd88@canb.auug.org.au> <15874870.hBfxUomX5V@wuerfel> <CAHp75VcxkBTSKY_bVg3jaUPUtcyxKZ14sbu=uJK403xRmTYbbQ@mail.gmail.com> <4892345.flKnDo9XDS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:37345 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966111AbcCPOHO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2016 10:07:14 -0400
Content-Disposition: inline
In-Reply-To: <4892345.flKnDo9XDS@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

On Wed, Mar 16, 2016 at 02:59:38PM +0100, Arnd Bergmann wrote:
> On Wednesday 16 March 2016 13:12:36 Andy Shevchenko wrote:
> > 
> > > I've also sent a patch that fixes the link error on ARM and that should
> > > work on all other architectures too.
> > 
> > In case of avr32 signalfd_read() fails. Does your patch help with it as well?
> > 
> > P.S. Bisecting shows same culprit: 150a0b4905f1 ("aio: add support for
> > async openat()")
> 
> I don't know. What is the symptom on avr32? My patch only removes the
> get_user() instances on 64-bit values and replaces them with a
> single copy_from_user() call.

Which is the wrong fix.  Arch code should be able to handle 64 bit values 
in all the get/put_user() variants.  We use 64 bit variables all over the 
place in interfaces to userspace.

		-ben
