From: Adrian Bunk <bunk@kernel.org>
Subject: Re: linux-next: manual merge of the ubifs tree
Date: Thu, 24 Jul 2008 11:59:45 +0300
Message-ID: <20080724085945.GA32109@cs181140183.pp.htv.fi>
References: <20080724152205.1bb53acb.sfr@canb.auug.org.au> <4888325C.8020909@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:44094 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751378AbYGXJAF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2008 05:00:05 -0400
Content-Disposition: inline
In-Reply-To: <4888325C.8020909@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, Jul 24, 2008 at 10:42:20AM +0300, Artem Bityutskiy wrote:
> Stephen Rothwell wrote:
>> Today's linux-next merge of the ubifs tree got conflicts in
>> Documentation/filesystems/ubifs.txt, fs/ubifs/budget.c,
>> fs/ubifs/commit.c, fs/ubifs/debug.c, fs/ubifs/dir.c, fs/ubifs/file.c=
,
>> fs/ubifs/io.c, fs/ubifs/journal.c, fs/ubifs/log.c, fs/ubifs/misc.h,
>> fs/ubifs/orphan.c, fs/ubifs/super.c and fs/ubifs/ubifs.h against Lin=
us'
>> tree.
>>
>> This has happened because of a partial merge of this tree into Linus=
'
>> tree.  I just took the ubifs tree's version of all those files.
>
> Oh. This is because I still have my tree based on 2.6.26, + the same
> patches which are in Linus's tree, + more. I thought you scrips would
> somehow magically deal with this.
>
> I was reluctant to switch to linus tree because the tg3 driver does
> not compile. I will try again, sorry for these troubles.

Are you referring to the firmware compile glitch (that was fixed Monday=
=20
last week) or what compile error do you get?

> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=
=8E=D1=86=D0=BA=D0=B8=D0=B9)

cu
Adrian

--=20

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
