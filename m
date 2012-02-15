From: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Build fail in hugetlbpage.c with linux-next and
 mpc85xx_defconfig
Date: Wed, 15 Feb 2012 23:40:47 +0000
Message-ID: <CAEsOVNfOcH+oaxSqw6Cy1suY_9zVDOhQe+v_e-zTwc0M5Q_Wgg@mail.gmail.com>
References: <14174.1329347321@neuling.org>
 <CAEsOVNcpBLmsmyZLW2HNe3MDR5cx5oJnPMmGD6Mqz4AjG16=9A@mail.gmail.com>
 <16098.1329349063@neuling.org>
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:15352 "EHLO
	TX2EHSOBE005.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754551Ab2BOXkt convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Feb 2012 18:40:49 -0500
In-Reply-To: <16098.1329349063@neuling.org>
Content-Language: en-US
Content-ID: <8B4814FEB7C8A7458DBB92D4FF514B0A@freescale.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Feb 15, 2012 at 11:37 PM, Michael Neuling <mikey@neuling.org> w=
rote:
>> > Becky,
>> >
>> > This has been broken in linux-next for a while. =3DA0Looks like a =
merge
>> > issue but you were the last to touch it...
>> >
>> > arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages=
':
>> > arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'p=
arse_ar=3D
>> gs' makes integer from pointer without a cast
>> > include/linux/moduleparam.h:317: note: expected 's16' but argument=
 is of =3D
>> type 'int (*)(char *, char *)'
>> > arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to fun=
ction '=3D
>> parse_args'
>>
>> A suggest fix has been submitted.
>
> Do you have a link? =A0Which tree is it going in?

http://lists.ozlabs.org/pipermail/linuxppc-dev/2012-February/095903.htm=
l

I just sent it. I'm not sure who would pick this up. Ideally it would
go in the next release.

-M
