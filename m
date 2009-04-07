From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: Next April 7 : x86 allmodconfig failure [kernel/module.c]
Date: Tue, 7 Apr 2009 15:25:05 +0400
Message-ID: <a4423d670904070425y1d38579dv34ba8681c77e43e4@mail.gmail.com>
References: <1239103297.5300.24.camel@subratamodak.linux.ibm.com>
	 <1239103411.5300.26.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:47060 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755607AbZDGLZG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2009 07:25:06 -0400
In-Reply-To: <1239103411.5300.26.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, rusty <rusty@rustcorp.com.au>, rusty <rusty@au1.ibm.com>

2009/4/7 Subrata Modak <subrata@linux.vnet.ibm.com>:
> Sorry,
>
> This occurred on April 7th Tree.
>
> On Tue, 2009-04-07 at 16:51 +0530, Subrata Modak wrote:
>> Hi,
>>
>> Following build failure occurs with April 7 next tree on x86, kernel
>> configuration enabled as randconfig.
>>
>> kernel/module.c: In function =E2=80=98sys_init_module=E2=80=99:
>> kernel/module.c:2401: error: =E2=80=98modules_disabled=E2=80=99 unde=
clared (first use in
>> this function)
>> kernel/module.c:2401: error: (Each undeclared identifier is reported
>> only once
>> kernel/module.c:2401: error: for each function it appears in.)
>> make[1]: *** [kernel/module.o] Error 1
>> make: *** [kernel] Error 2

Hi

Patch is already sent
http://patchwork.kernel.org/patch/16535/
