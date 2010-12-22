From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Wed, 22 Dec 2010 05:38:06 +0100
Message-ID: <AANLkTimLdMfVUbu01cmxy83957iTp56+y9qCQ=4+SMsZ@mail.gmail.com>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
	<20101221085538.GA9133@amd>
	<20101221182551.GL19804@ZenIV.linux.org.uk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20101221182551.GL19804@ZenIV.linux.org.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Nick Piggin <npiggin@kernel.dk>, systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com
List-Id: linux-next.vger.kernel.org

On Tue, Dec 21, 2010 at 7:25 PM, Al Viro <viro@zeniv.linux.org.uk> wrot=
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
>> > =C2=A02010-12-21 09:31:38.649601964 +0100
>> > +++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.pa=
tch
>> > =C2=A02010-12-21 09:40:21.151033232 +0100
>> > @@ -83,7 +83,7 @@
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inode->i_s=
ize =3D 0;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inode->i_f=
op =3D &cgroup_file_operations;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > -- =C2=A0 =C2=A0 =C2=A0dentry->d_op =3D &cgroup_dops;
>> > +- =C2=A0 =C2=A0 =C2=A0d_set_d_op(dentry, &cgroup_dops);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 dget(dentry); =C2=A0 /* Extra count - =
pin the dentry in core */
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>
> How about not doing that d_set_d_op() at all? =C2=A0See #d_op in vfs-=
2.6.git;
> just set ->s_d_op to that once and be done with that. =C2=A0No need t=
o reassign
> it on a live dentry...
>

Hey, cool :-)!
Still waiting to see the content of "switch cgroup" commit in
vfs-2.6#d_op GIT from [1] (slow kernel-mirrors [2]).
Thank you Al for the quick execution!

- Sedat -

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=3Dco=
mmit;h=3D0438db3de35bc969624794d6b891e2a178e24645
[2] https://lkml.org/lkml/2010/12/21/361
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
