From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the bkl-ioctl tree with the
	bkl-procfs tree
Date: Thu, 29 Apr 2010 22:59:47 +0200
Message-ID: <20100429205944.GC5392@nowhere>
References: <20100429154954.84966e61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:39624 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933465Ab0D3SLO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2010 14:11:14 -0400
Received: by bwz19 with SMTP id 19so295243bwz.21
        for <linux-next@vger.kernel.org>; Fri, 30 Apr 2010 11:10:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20100429154954.84966e61.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On Thu, Apr 29, 2010 at 03:49:54PM +1000, Stephen Rothwell wrote:
> Hi Fr=E9d=E9ric,
>=20
> Today's linux-next merge of the bkl-ioctl tree got a conflict in
> drivers/char/i8k.c between commit
> 64ef834551d7696f54553d7608eba80a5a800e77 ("procfs: Push down the bkl =
from
> ioctl") from the bkl-procfs tree and commit
> 59ce88717d9d8af8cb14af3a0a505cafb692b482 ("drivers: Push down BKL int=
o
> various drivers") from the bkl-ioctl tree.
>=20
> I used the version from the bkl-procfs tree for today.
>=20
> Can you guys please sort out these various bkl removal trees, please.


I'll do a test merge of my branches and solve the conflicts I can find.
Sorry about that.
