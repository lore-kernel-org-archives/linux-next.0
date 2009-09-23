From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: linux-next: block tree build failure
Date: Wed, 23 Sep 2009 09:11:52 +0200
Message-ID: <20090923071152.GA8000@barkeeper1-xen.linbit>
References: <20090923145100.1917fdd8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail09.linbit.com ([212.69.161.110]:42574 "EHLO
	mail09.linbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754192AbZIWHLt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2009 03:11:49 -0400
Content-Disposition: inline
In-Reply-To: <20090923145100.1917fdd8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com, Christoph Hellwig <hch@lst.de>

On Wed, Sep 23, 2009 at 02:51:00PM +1000, Stephen Rothwell wrote:
> Hi Jens,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/block/drbd/drbd_tracing.c:29:26: error: linux/marker.h: No su=
ch file or directory
>=20
> Caused by commit 95eaef1cbc63f73df4ff8559dd66b1d29b462535 ("Replaced =
our
> own tracing stuff with Linux's tracepoints") from the block/drbd tree=
s
> interacting with commit fc5377668c3d808e1d53c4aee152c836f55c3490
> ("tracing: Remove markers") from Linus' tree.
>=20
> I have no idea what the correct thing to do is here, so I have revert=
ed
> the merge of the drbd tree into the block tree and will have to drop =
the
> drbd tree for today.

We'll have a look.
A quick fix should be to just disable CONFIG_DRBD_TRACE.

--=20
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD=AE and LINBIT=AE are registered trademarks of LINBIT, Austria.
