From: =?gbk?B?WHVldGFvIEd1YW4g?= <gxt@pku.edu.cn>
Subject: =?utf-8?Q?=E5=9B=9E=E5=A4=8D=EF=BC=9A_Re:_[Consult]_About_only_o?=
 =?utf-8?Q?ne_Signed-of-by_for_the_patches?=
Date: Tue, 27 May 2014 13:07:30 +0800 (CST)
Message-ID: <458532278.27889.1401167250372.JavaMail.root@bj-mail03.pku.edu.cn>
References: <20140527113400.6fa2eeee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx11.pku.edu.cn ([162.105.129.174]:57675 "EHLO mail.pku.edu.cn"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751713AbaE0FQG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2014 01:16:06 -0400
In-Reply-To: <20140527113400.6fa2eeee@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-next@vger.kernel.org


----- Stephen Rothwell <sfr@canb.auug.org.au> =E5=86=99=E9=81=93=EF=BC=9A
> Hi Chen,
>=20
> On Tue, 27 May 2014 09:23:38 +0800 Chen Gang <gang.chen.5i5j@gmail.co=
m> wrote:
> >
> > I find some of patches are only Signed-of-by me, are they OK?
>=20
> Actually, this one is not OK.  Anyone who handles a patch needs to ad=
d a
> Signed-off-by.  In the case below, that patch was commited to the tre=
e
> by Guan Xuetao <gxt@mprc.pku.edu.cn>, so there needs to be a
> Signed-off-by from them as well.
>=20
> The same is true for all the commits in the unicore32 tree ...

Ok, I see.

Then, do I need to reply each mail with my sob? Or only replace acked-b=
y by sob for all commits in my tree?

Xuetao

>=20
> > commit d7de15786d1a10fa18b80fd44026d442e7a84bd2
> > Author: Chen Gang <gang.chen.5i5j@gmail.com>
> > Date:   Tue Apr 15 09:21:30 2014 +0800
> >=20
> >     arch:unicore32:mm: add devmem_is_allowed() to support STRICT_DE=
VMEM
> >    =20
> >     unicore32 supports STRICT_DEVMEM, so it needs devmem_is_allowed=
(), like
> >     some of other architectures have done (e.g. arm, powerpc, x86 .=
=2E.).
> >    =20
> >     The related error with allmodconfig:
> >    =20
> >         CC      drivers/char/mem.o
> >       drivers/char/mem.c: In function =C3=A2<U+0080><U+0098>range_i=
s_allowed=C3=A2<U+0080><U+0099>:
> >       drivers/char/mem.c:69: error: implicit declaration of functio=
n =C3=A2<U+0080><U+0098>devmem_is_allowed=C3=A2<U+0080><U+0099>
> >       make[2]: *** [drivers/char/mem.o] Error 1
> >       make[1]: *** [drivers/char] Error 2
> >       make: *** [drivers] Error 2
> >    =20
> >     Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> >     Acked-by: Xuetao Guan <gxt@mprc.pku.edu.cn>
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
