From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: build failure after merge of the final tree (ubi
 tree related)
Date: Wed, 16 Mar 2011 13:48:39 +0200
Message-ID: <1300276119.2817.9.camel@localhost>
References: <20110316175041.67c4f371.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.128.24]:49762 "EHLO mgw-da01.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751290Ab1CPLw0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2011 07:52:26 -0400
In-Reply-To: <20110316175041.67c4f371.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2011-03-16 at 17:50 +1100, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/mtd/ubi/io.c: In function 'ubi_dbg_check_write':
> drivers/mtd/ubi/io.c:1348: error: 'PAGE_KERNEL' undeclared (first use=
 in this function)
> drivers/mtd/ubi/io.c: In function 'ubi_dbg_check_all_ff':
> drivers/mtd/ubi/io.c:1412: error: 'PAGE_KERNEL' undeclared (first use=
 in this function)
>=20
> Caused by commit 823ed5091113 ("UBI: allocate write checking buffer o=
n demand").
>=20
> I don't know how to fix this, so I have left it for today.

=46ixed, sorry for the hassle and thank you!

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
