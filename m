From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: mtd tree build failures (Was: Re: linux-next: Tree
 for December 16)
Date: Wed, 17 Dec 2008 11:32:12 +0200
Message-ID: <4948C71C.2000700@nokia.com>
References: <20081216223754.0c8e21d4.sfr@canb.auug.org.au>	<20081216152607.f232fafd.akpm@linux-foundation.org> <20081217175911.594ae84f.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:62914 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865AbYLQJe5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Dec 2008 04:34:57 -0500
In-Reply-To: <20081217175911.594ae84f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <David.Woodhouse@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Hunter <ext-adrian.hunter@nokia.com>, Andrew Morton <akpm@linux-foundation.org>

ext Stephen Rothwell wrote:
> On Tue, 16 Dec 2008 15:26:07 -0800 Andrew Morton <akpm@linux-foundati=
on.org> wrote:
>> This MTD patch:
>>
>> commit 69423d99fc182a81f3c5db3eb5c140acc6fc64be
>> Author:     Adrian Hunter <ext-adrian.hunter@nokia.com>
>> AuthorDate: Wed Dec 10 13:37:21 2008 +0000
>> Commit:     David Woodhouse <David.Woodhouse@intel.com>
>> CommitDate: Wed Dec 10 13:37:21 2008 +0000
>>
>>     [MTD] update internal API to support 64-bit device size
>>
>> broke the i386 build:
>=20
> Also a few arm configs and the m68k allmodconfig.  I shall revert the=
 mtd
> tree from linux-next today.

It would be nice if you sent the error messages. I do not have m68k
compilers, but I could fix the errors anyway, because it is just
about doing divisions with 'do_div()'.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
