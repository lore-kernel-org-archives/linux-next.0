From: Michael Neuling <mikey@neuling.org>
Subject: Re: Build fail in hugetlbpage.c with linux-next and mpc85xx_defconfig
Date: Thu, 16 Feb 2012 16:01:28 +1100
Message-ID: <8058.1329368488@neuling.org>
References: <14174.1329347321@neuling.org> <CAEsOVNcpBLmsmyZLW2HNe3MDR5cx5oJnPMmGD6Mqz4AjG16=9A@mail.gmail.com> <16098.1329349063@neuling.org> <CAEsOVNfOcH+oaxSqw6Cy1suY_9zVDOhQe+v_e-zTwc0M5Q_Wgg@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42854 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727Ab2BPFBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Feb 2012 00:01:30 -0500
In-reply-to: <CAEsOVNfOcH+oaxSqw6Cy1suY_9zVDOhQe+v_e-zTwc0M5Q_Wgg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

In message <CAEsOVNfOcH+oaxSqw6Cy1suY_9zVDOhQe+v_e-zTwc0M5Q_Wgg@mail.gmail.com>
 you wrote:
> On Wed, Feb 15, 2012 at 11:37 PM, Michael Neuling <mikey@neuling.org> wrote:
> >> > Becky,
> >> >
> >> > This has been broken in linux-next for a while. =3DA0Looks like a merge
> >> > issue but you were the last to touch it...
> >> >
> >> > arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
> >> > arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'parse=
> _ar=3D
> >> gs' makes integer from pointer without a cast
> >> > include/linux/moduleparam.h:317: note: expected 's16' but argument is =
> of =3D
> >> type 'int (*)(char *, char *)'
> >> > arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to functio=
> n '=3D
> >> parse_args'
> >>
> >> A suggest fix has been submitted.
> >
> > Do you have a link? =A0Which tree is it going in?
> 
> http://lists.ozlabs.org/pipermail/linuxppc-dev/2012-February/095903.html
> 
> I just sent it. I'm not sure who would pick this up. Ideally it would
> go in the next release.

I think that's a different problem, as that's already in next.

sfr posted where problem patch is

Mikey
