From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Build issue with linux next. duplicate member _count in mm_types.h
Date: Thu, 07 Jul 2011 16:41:34 +0200
Message-ID: <4E15C59E.5000900@example.com>
References: <4E143120.2020501@cam.ac.uk> <alpine.DEB.2.00.1107060933460.17202@router.home> <4E15AF1C.7080103@example.com> <alpine.DEB.2.00.1107070841500.17376@router.home> <4E15B945.5060805@example.com> <alpine.DEB.2.00.1107070908320.17929@router.home>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:54742 "EHLO
	mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756661Ab1GGOlg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 10:41:36 -0400
Received: from mail405.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id D4DEF1014F54
	for <linux-next@vger.kernel.org>; Thu,  7 Jul 2011 16:41:55 +0200 (CEST)
In-Reply-To: <alpine.DEB.2.00.1107070908320.17929@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On 07.07.2011 16:09, Christoph Lameter wrote:
> On Thu, 7 Jul 2011, Piotr Hosowicz wrote:
>
>> I attach it. Your patch seems to had worked, I finish making the pac=
kage.
>
> I do not see anything remarkable in the config file.
>
> Which compiler version are you using?
>
> Mine is:
>
> christoph@oldy:~$ gcc --version
> gcc (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5
> Copyright (C) 2010 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions. There i=
s NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
> PURPOSE.

Mine is:

aapi205:~# gcc --version
gcc (Debian 4.6.0-10) 4.6.1 20110526 (prerelease)
Copyright (C) 2011 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is=
 NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.

--=20
Nie pytaj co rz=B1d mo=BFe zrobi=E6 dla ciebie. Pytaj, jak mo=BFesz tem=
u zapobiec.
NP: Nemo -
NB: 3.0.0-rc6-next-20110707
