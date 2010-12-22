From: Nick Piggin <npiggin@gmail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Wed, 22 Dec 2010 14:11:51 +1100
Message-ID: <AANLkTima4usWhhT-QOJcmeXv+rBA95YL8QaYpOs-w2oW@mail.gmail.com>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
	<20101221085538.GA9133@amd>
	<20101221182551.GL19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:52050 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab0LVDLx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2010 22:11:53 -0500
In-Reply-To: <20101221182551.GL19804@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Nick Piggin <npiggin@kernel.dk>, sedat.dilek@gmail.com, systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com

On Wed, Dec 22, 2010 at 5:25 AM, Al Viro <viro@zeniv.linux.org.uk> wrot=
e:
> On Tue, Dec 21, 2010 at 07:55:38PM +1100, Nick Piggin wrote:
>> On Tue, Dec 21, 2010 at 09:44:40AM +0100, Sedat Dilek wrote:
>> > Against linux-next (next-20101210) it should look like:
>>
>> Yep, I'll rebase my tree with the fix shortly.
>>
>> >
>> > $ diff -Naur cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-den=
try.patch
>> > cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
>> > --- cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
>> > =A02010-12-21 09:31:38.649601964 +0100
>> > +++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.pa=
tch
>> > =A02010-12-21 09:40:21.151033232 +0100
>> > @@ -83,7 +83,7 @@
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 inode->i_size =3D 0;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 inode->i_fop =3D &cgroup_file_oper=
ations;
>> > =A0 =A0 =A0 =A0 }
>> > -- =A0 =A0 =A0dentry->d_op =3D &cgroup_dops;
>> > +- =A0 =A0 =A0d_set_d_op(dentry, &cgroup_dops);
>> > =A0 =A0 =A0 =A0 d_instantiate(dentry, inode);
>> > =A0 =A0 =A0 =A0 dget(dentry); =A0 /* Extra count - pin the dentry =
in core */
>> > =A0 =A0 =A0 =A0 return 0;
>
> How about not doing that d_set_d_op() at all? =A0See #d_op in vfs-2.6=
=2Egit;
> just set ->s_d_op to that once and be done with that. =A0No need to r=
eassign
> it on a live dentry...

It shouldn't be live there after my patch, but either way it is fixed,
doesn't matter. Your s_d_op patch allows more reuse of code, so
that looks nicer.
