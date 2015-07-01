From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: randconfig build error with next-20150620, in drivers/media/v4l2-core/videobuf2-core.c
Date: Wed, 01 Jul 2015 11:07:08 -0700
Message-ID: <55942C4C.70209@infradead.org>
References: <CA+r1Zhheo-_o_AJ2sji6FPKNLiHYmjP81__saW7Jv63wMex9BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40105 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753141AbbGASHL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2015 14:07:11 -0400
In-Reply-To: <CA+r1Zhheo-_o_AJ2sji6FPKNLiHYmjP81__saW7Jv63wMex9BQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, pawel@osciak.com, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, mchehab@osg.samsung.com, linux-media <linux-media@vger.kernel.org>

On 06/20/15 09:44, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> drivers/media/v4l2-core/videobuf2-core.c: In function =91vb2_warn_zer=
o_bytesused=92:
> drivers/media/v4l2-core/videobuf2-core.c:1253:2: error: implicit decl=
aration of
> function =91__WARN=92 [-Werror=3Dimplicit-function-declaration]
>   __WARN();
>   ^
>=20

When CONFIG_BUG is not enabled, there is no definition of __WARN().

Should be add an empty stub for __WARN() or just change the only
user (caller) of it to do something different?

--=20
~Randy
