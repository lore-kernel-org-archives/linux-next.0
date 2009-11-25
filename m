From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: alacrity tree build failure
Date: Tue, 24 Nov 2009 16:41:05 -0800
Message-ID: <4B0C7D21.7010008@goop.org>
References: <20091124185843.d2cab90c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:59616 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933068AbZKYAlB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 19:41:01 -0500
In-Reply-To: <20091124185843.d2cab90c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gregory Haskins <gregory.haskins@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>, Mark McLoughlin <markmc@redhat.com>, Greg KH <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

On 11/23/09 23:58, Stephen Rothwell wrote:
> Today's linux-next build (x86_6 _allmodconfig) failed like this:
>
> drivers/vbus/built-in.o:(.data+0x0): multiple definition of `dev_attr_modalias'
> drivers/xen/built-in.o:(.data+0x46d0): first defined here
>
> Caused by commit 59aa8f441d27c8470764a513dafa46a77f33e953 ("vbus: add
> autoprobe capability to guest").  The DEVICE_ATTR(modalias ...) should
> probably be static.  I should probably be static in
> drivers/xen/xenbus/xenbus_probe.c as well.
>   

All those DEVICE_ATTR()s should be static in that case.  Indeed, I guess
they should be almost universally?  Should DEVICE_ATTR() include the
static?  (Hm, almost every instance in the kernel already has static; it
should probably have been part of the definition from the start, but
changing it now would cause a lot of churn.)

    J
