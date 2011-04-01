From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 1 [BROKEN ubifs when CONFIG_DEBUG_SECTION_MISMATCH=y]s
Date: Fri, 1 Apr 2011 20:22:41 +0200
Message-ID: <AANLkTimhD_cu46Bhtt9v8MjKMVCnVMT6Es+Ys9RNPOp1@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:65176 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758039Ab1DASWn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Apr 2011 14:22:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: dedekind1@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 1, 2011 at 7:02 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> On Fri, 2011-04-01 at 18:10 +0200, Sedat Dilek wrote:
>> On Fri, Apr 1, 2011 at 6:06 PM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> > Cc'ing Artem,
>> >
>> > On Fri, 1 Apr 2011 17:55:52 +0200 Sedat Dilek <sedat.dilek@googlem=
ail.com> wrote:
>> >>
>> >> With CONFIG_DEBUG_SECTION_MISMATCH=3Dy set, I see in my build.log=
:
>> >> ...
>> >> MODPOST 2742 modules
>> >> ...
>> >> ERROR: "empty_aops" [fs/ubifs/ubifs.ko] undefined!
>> >> make[5]: *** [__modpost] Error 1
>> >> make[4]: *** [modules] Error 2
>> >> make[3]: *** [sub-make] Error 2
>> >> make[2]: *** [all] Error 2
>> >> make[2]: Leaving directory
>> >> `/home/sd/src/linux-2.6/linux-2.6.39-rc1/debian/build/build_i386_=
none_686-iniza'
>> >>
>> >> - Sedat -
>> >>
>> >
>> >
>> > --
>> > Cheers,
>> > Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>> > http://www.canb.auug.org.au/~sfr/
>> >
>>
>> Speculative patch (untested).
>>
>> - Sedat -
>>
>> $ diff -uprN fs/ubifs/xattr.c.orig fs/ubifs/xattr.c
>> --- fs/ubifs/xattr.c.orig =C2=A0 =C2=A0 =C2=A0 2011-04-01 15:56:08.4=
71082117 +0200
>> +++ fs/ubifs/xattr.c =C2=A0 =C2=A02011-04-01 18:08:27.355276827 +020=
0
>> @@ -81,6 +81,7 @@ enum {
>>
>> =C2=A0static const struct inode_operations none_inode_operations;
>> =C2=A0static const struct file_operations none_file_operations;
>> +static const struct address_space_operations empty_aops;
>>
>> =C2=A0/**
>> =C2=A0 * create_xattr - create an extended attribute.
>
> ubifs doess not have 'empty_aops' symbol and does not use such symbol=
=2E I
> do not understand how you got that build issue, but this must be
> something to do with your local setup.
>
> Also:
>
> [dedekind@eru linux-next (master)]$ grep -r 'empty_aops' *
> fs/nilfs2/page.c: =C2=A0 =C2=A0 =C2=A0 static const struct address_sp=
ace_operations empty_aops;
> fs/nilfs2/page.c: =C2=A0 =C2=A0 =C2=A0 mapping->a_ops =3D &empty_aops=
;
> fs/inode.c: =C2=A0 =C2=A0 static const struct address_space_operation=
s empty_aops;
> fs/inode.c: =C2=A0 =C2=A0 mapping->a_ops =3D &empty_aops;
>
> in the current linux-next.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=
=8E=D1=86=D0=BA=D0=B8=D0=B9)
>
>

You are right, I pulled linux-2.6-block.git#for-linus into linux-next.
Looks like linux-2.6-block-for-linus/0007-fs-export-empty_aops.patch
is causing this [1].

- Sedat -

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/axboe/linux-2.6-block.g=
it;a=3Dcommit;h=3D2c9214b7b72cf440024d8b91523eea25bbc76040
