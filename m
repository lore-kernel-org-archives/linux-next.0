From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Wed, 22 Dec 2010 04:31:31 +0100
Message-ID: <AANLkTi=oNOZWmMf5m2rceOi1p1nj4DM6AmRjwtC0UOGA@mail.gmail.com>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
	<20101221085538.GA9133@amd>
	<20101221182551.GL19804@ZenIV.linux.org.uk>
	<AANLkTima4usWhhT-QOJcmeXv+rBA95YL8QaYpOs-w2oW@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <AANLkTima4usWhhT-QOJcmeXv+rBA95YL8QaYpOs-w2oW@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Nick Piggin <npiggin@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com
List-Id: linux-next.vger.kernel.org

On Wed, Dec 22, 2010 at 4:11 AM, Nick Piggin <npiggin@gmail.com> wrote:
> On Wed, Dec 22, 2010 at 5:25 AM, Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>> On Tue, Dec 21, 2010 at 07:55:38PM +1100, Nick Piggin wrote:
>>> On Tue, Dec 21, 2010 at 09:44:40AM +0100, Sedat Dilek wrote:
>>> > Against linux-next (next-20101210) it should look like:
>>>
>>> Yep, I'll rebase my tree with the fix shortly.
>>>
>>> >
>>> > $ diff -Naur cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-de=
ntry.patch
>>> > cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
>>> > --- cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patc=
h
>>> > =C2=A02010-12-21 09:31:38.649601964 +0100
>>> > +++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.p=
atch
>>> > =C2=A02010-12-21 09:40:21.151033232 +0100
>>> > @@ -83,7 +83,7 @@
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inode->i_=
size =3D 0;
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inode->i_=
fop =3D &cgroup_file_operations;
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>> > -- =C2=A0 =C2=A0 =C2=A0dentry->d_op =3D &cgroup_dops;
>>> > +- =C2=A0 =C2=A0 =C2=A0d_set_d_op(dentry, &cgroup_dops);
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 dget(dentry); =C2=A0 /* Extra count -=
 pin the dentry in core */
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> How about not doing that d_set_d_op() at all? =C2=A0See #d_op in vfs=
-2.6.git;
>> just set ->s_d_op to that once and be done with that. =C2=A0No need =
to reassign
>> it on a live dentry...
>
> It shouldn't be live there after my patch, but either way it is fixed=
,
> doesn't matter. Your s_d_op patch allows more reuse of code, so
> that looks nicer.
>

Hi Nick, Hi Al,

IIRC that vfs-2.6.git#d_op is not in linux-next?
[2] uses "vfs             git
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs-2.6.git#for-next=
"?
Will this tree go into 2.6.38?
I tried to pull that tree into linux-next which resulted into many CONF=
LICTs.

As far as I have understood:
To use s_d_op for kernel/cgroup.c at least means to cherry-pick
"per-superblock default ->d_op" commit [2]?

If Al's tree is expected to be in 2.6.38, it would be good that both
vfs-related trees "vfs-2.6#d_op" and "vfs-scale-working" would be
coordinated.

Can you give details on the plans for 2.6.38 (for linux-next)?
Thanks.

- Sedat -

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3D=
blob;f=3DNext/Trees#l84
[2] http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=3Dco=
mmit;h=3Dee2d6af5897a21441f1ded8c3551da073cbcda87
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
