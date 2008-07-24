From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: manual merge of the ubifs tree
Date: Thu, 24 Jul 2008 12:15:53 +0300
Message-ID: <48884849.8050102@nokia.com>
References: <20080724152205.1bb53acb.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:43619 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbYGXJTs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jul 2008 05:19:48 -0400
In-Reply-To: <20080724152205.1bb53acb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Stephen,

Stephen Rothwell wrote:
> Today's linux-next merge of the ubifs tree got conflicts in
> Documentation/filesystems/ubifs.txt, fs/ubifs/budget.c,
> fs/ubifs/commit.c, fs/ubifs/debug.c, fs/ubifs/dir.c, fs/ubifs/file.c,
> fs/ubifs/io.c, fs/ubifs/journal.c, fs/ubifs/log.c, fs/ubifs/misc.h,
> fs/ubifs/orphan.c, fs/ubifs/super.c and fs/ubifs/ubifs.h against Linu=
s'
> tree.
>=20
> This has happened because of a partial merge of this tree into Linus'
> tree.  I just took the ubifs tree's version of all those files.

I've re-based both UBI and UBIFS trees against todays Linus' tree,
i.e. commit 338b9bb3adac0d2c5a1e180491d9b001d624c402

I compile-tested that - looks fine. Internally I still keep working
with 2.6.26 release for several reasons, but UBI/UBIFS are so isolated
that I thing the re-based stuff is fine. At lease this has always
be the case in the past. Thanks.

Hopefully this time -next merge will go smoothly.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
