From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the cortex tree with Linus' tree
Date: Tue, 16 Oct 2012 08:51:49 +0200
Message-ID: <20121016065149.GO639@pengutronix.de>
References: <20121016132052.0ac9f1f6b3fcbe946503793c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51912 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754319Ab2JPGvv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Oct 2012 02:51:51 -0400
Content-Disposition: inline
In-Reply-To: <20121016132052.0ac9f1f6b3fcbe946503793c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Russell King <rmk@arm.linux.org.uk>

On Tue, Oct 16, 2012 at 01:20:52PM +1100, Stephen Rothwell wrote:
> Hi Uwe,
>=20
> Today's linux-next merge of the cortex tree got a conflict in
> arch/arm/kernel/process.c between commit 9e14f828ee4a ("arm: split
> ret_from_fork, simplify kernel_thread() [based on patch by rmk]") fro=
m
> Linus' tree and commit 2f3e7d3436cb ("Cortex-M3: Add support for
> exception handling") from the cortex tree.
>=20
> I have no idea how to fix this up, so I have just dropped this tree f=
or
> today.
I'll look into it and rebase accordingly.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
