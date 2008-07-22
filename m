From: Artem Bityutskiy <dedekind@yandex.ru>
Subject: Re: linux-next: manual merge of the ubi tree
Date: Tue, 22 Jul 2008 09:25:05 +0300
Message-ID: <48857D41.9010305@yandex.ru>
References: <20080722133122.29f8e2cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:65469 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbYGVG21 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 02:28:27 -0400
In-Reply-To: <20080722133122.29f8e2cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Stephen,

Stephen Rothwell wrote:
> Today's linux-next merge of the ubi tree got a trivial conflict in
> drivers/mtd/ubi/cdev.c between commit
> 72b67048f5dac18fd6494e3d3bff7e54840e8761 ("UBI: cdev lock_kernel()
> pushdown") from Linus' tree and commit
> 9c0ec8fe1eed2106441e12ca2964f431df044f1d ("UBI: fix checkpatch.pl err=
ors
> and warnings") from the ubi tree.
>=20
> Just overlapping additions of include files.

Could you please amend your scripts and use "linux-next" branch for bot=
h
UBI and UBIFS:

UBI: git://git.infradead.org/~dedekind/ubi-2.6.git linux-next
UBIFS: git://git.infradead.org/~dedekind/ubifs-2.6.git linux-next

Andrew, could you please tweak your scripts as well and use those
branches if you still have UBI/UBIFS in -mm. Thanks and apologies
for inconvenience.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
