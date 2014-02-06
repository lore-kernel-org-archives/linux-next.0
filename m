From: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Subject: Re: linux-next: bad commits in the f2fs tree
Date: Thu, 06 Feb 2014 09:28:02 +0900
Message-ID: <1391646482.25542.72.camel@kjgkr>
References: <20140206110401.7888b06cbd651b842404b902@canb.auug.org.au>
Reply-To: jaegeuk.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50453 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211AbaBFA3c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Feb 2014 19:29:32 -0500
In-reply-to: <20140206110401.7888b06cbd651b842404b902@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

2014-02-06 (=EB=AA=A9), 11:04 +1100, Stephen Rothwell:
> Hi Jaegeuk,
>=20
> Looking at the f2fs tree today, it has *copies* of several commits th=
at
> are in Linus' tree (including b522196a6ffb "Linus 3.14-rc1" which is
> commit 38dbfb59d117 in Linus' tree).  I assume this happened when you
> tried to rewrite your tree. :-(

I fixed that.
Sorry for the mistake. :)

>=20
> I can't use that tree, so will use the version of f2fs from next-2014=
0105.

--=20
Jaegeuk Kim
Samsung
