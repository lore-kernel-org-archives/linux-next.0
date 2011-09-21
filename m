From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH -next v2] bcma: driver_chipcommon_pmu.c needs linux/export.h
Date: Wed, 21 Sep 2011 20:00:57 +0200
Message-ID: <CACna6ryNw+YgTiO5dBSGcTfUabM_yO0LaSsbGpC_X6JrQudnBQ@mail.gmail.com>
References: <20110920173102.d38155c7defbbc29beaae7c0@canb.auug.org.au>
	<4E78CFC0.4020003@xenotime.net>
	<CACna6rxGrd-ORWZrc0xsAOKptU_Xj3eGh9qSfX9vJYCPTZrCRg@mail.gmail.com>
	<4E78FCDB.1010002@xenotime.net>
	<CACna6rywFitSNkkwo6tNy887vdsoyHG5Cadk6Bb8_qBJ+gc42w@mail.gmail.com>
	<4E7A084C.3000304@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58529 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753363Ab1IUSA6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2011 14:00:58 -0400
In-Reply-To: <4E7A084C.3000304@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

W dniu 21 wrze=C5=9Bnia 2011 17:52 u=C5=BCytkownik Randy Dunlap
<rdunlap@xenotime.net> napisa=C5=82:
> On 09/20/2011 11:45 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> W dniu 20 wrze=C5=9Bnia 2011 22:51 u=C5=BCytkownik Randy Dunlap
>> <rdunlap@xenotime.net> napisa=C5=82:
>>> From: Randy Dunlap <rdunlap@xenotime.net>
>>>
>>> bcma/driver_chipcommon_pmu.c needs to include <linux/export.h>
>>> to fix these warnings:
>>>
>>> drivers/bcma/driver_chipcommon_pmu.c:27:1: warning: data definition=
 has no type or storage class
>>> drivers/bcma/driver_chipcommon_pmu.c:27:1: warning: type defaults t=
o 'int' in declaration of 'EXPORT_SYMBOL_GPL'
>>> drivers/bcma/driver_chipcommon_pmu.c:27:1: warning: parameter names=
 (without types) in function declaration
>>
>> Don't you get the same warning for core.c? Weird...
>
> No, I don't. =C2=A0Stranger things have happened, I'm sure.
>
> Feel free to add export.h to other files, or do you want me
> to do that?

Please do that while you're hacking that include anyway.

--=20
Rafa=C5=82
