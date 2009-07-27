From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: linux-next: drbd tree build failure
Date: Mon, 27 Jul 2009 10:09:57 +0200
Message-ID: <20090727080957.GA8046@barkeeper1-xen.linbit>
References: <20090727154816.24e81531.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail09.linbit.com ([212.69.161.110]:59633 "EHLO
	mail09.linbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754738AbZG0IJ6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2009 04:09:58 -0400
Content-Disposition: inline
In-Reply-To: <20090727154816.24e81531.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Mon, Jul 27, 2009 at 03:48:16PM +1000, Stephen Rothwell wrote:
> Hi Philipp,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/block/drbd/drbd_main.c: In function 'drbd_thread_current_set_=
cpu':
> drivers/block/drbd/drbd_main.c:1592: error: implicit declaration of f=
unction 'set_cpus_allowed'
>=20
> Introduced by commit 8a4ebc3fbd90072ac870064a930fe612eea6d9a1 ("DRBD:
> main") from the drbd interacting with commit
> 84cf7f02712e3491fb9776f950a8c4f413204c8b
> ("cpumask:remove-set_cpus_allowed") from the rr tree.
>=20
> I am not sure what the transformation to the new infrastructure is he=
re -
> maybe Rusty can help?
>=20
> For today, I have reverted the rr tree commit above but we need a bet=
ter
> solution.

I think we can easily use set_cpus_allowed_ptr() instead,
as in fact, we do not have the cpu mask on the stack.
But embeded in struct drbd_conf.


--=20
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD=AE and LINBIT=AE are registered trademarks of LINBIT, Austria.
