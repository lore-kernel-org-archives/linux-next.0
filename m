From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] drivers/base/inode.c: let vmstat_text be optional
Date: Thu, 04 Aug 2011 22:43:25 -0700
Message-ID: <4E3B82FD.1040500@xenotime.net>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au> <20110804152211.ea10e3e7.rdunlap@xenotime.net> <4E3B57C3.80203@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:34934 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754873Ab1HEFn2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Aug 2011 01:43:28 -0400
In-Reply-To: <4E3B57C3.80203@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, akpm <akpm@linux-foundation.org>

On 08/04/11 19:38, Cong Wang wrote:
> =E4=BA=8E 2011=E5=B9=B408=E6=9C=8805=E6=97=A5 06:22, Randy Dunlap =E5=
=86=99=E9=81=93:
>> From: Randy Dunlap<rdunlap@xenotime.net>
>>
>> vmstat_text is only available when PROC_FS or SYSFS is enabled.
>> This causes build errors in drivers/base/node.c when they are
>> both disabled:
>>
>> drivers/built-in.o: In function `node_read_vmstat':
>> node.c:(.text+0x10e28f): undefined reference to `vmstat_text'
>>
>> Rather than litter drivers/base/node.c with #ifdef/#endif around
>> the affected lines of code, add macros for optional sysdev
>> attributes so that those lines of code will be ignored, without
>> using #ifdef/#endif in the .c file(s).  I.e., the ifdeffery
>> is done only in a header file with sysdev_create_file_optional()
>> and sysdev_remove_file_optional().
>>
>=20
> This looks ugly for me, because other sysfs files here are not option=
al
> only due to that they don't rely on vmstat_text.
>=20
> I still think my approach to fix this is better, that is, introducing
> a new Kconfig for drivers/base/node.c which depends on CONFIG_SYSFS.

Did you post a patch for that?  I must have missed it.

thanks,
--=20
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
