From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: cifs tree build failure
Date: Tue, 14 Apr 2009 22:10:48 -0500
Message-ID: <524f69650904142010i2403cba8m41a9c159455a4937@mail.gmail.com>
References: <20090414114153.00467d45.sfr@canb.auug.org.au>
	 <20090415125940.98f40db3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.29]:8663 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753604AbZDODKu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 23:10:50 -0400
Received: by yx-out-2324.google.com with SMTP id 31so2971101yxl.1
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2009 20:10:48 -0700 (PDT)
In-Reply-To: <20090415125940.98f40db3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Shirish Pargaonkar <shirishp@us.ibm.com>, =?ISO-8859-1?Q?G=FCnter_Kukkukk?= <linux@kukkukk.com>

fixed in cifs-2.6.git

On Tue, Apr 14, 2009 at 9:59 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Steve,
>
> On Tue, 14 Apr 2009 11:41:53 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> fs/cifs/dir.c: In function 'cifs_lookup':
>> fs/cifs/dir.c:664: error: dereferencing pointer to incomplete type
>>
>> Caused by commit 84c63ad9195b37b3de43427c11471a763c3993cc ("[CIFS] A=
dd
>> support for posix open during lookup") from the cifs tree (probably =
an
>> interaction with commit 5ad4e53bd5406ee214ddc5a41f03f779b8b2d526 ("G=
et
>> rid of indirect include of fs_struct.h") - now in Linus' tree).
>>
>> I have used the cifs tree from next-20090409 for today.
>
> Still there.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Thanks,

Steve
