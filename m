From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Tue, 27 Nov 2018 10:14:16 +0100
Message-ID: <CAFqZXNvUg9wNV4DBsFa+_Kkr5AMrdSGOkGuJmmF17MC59ASCig@mail.gmail.com>
References: <20181127115246.00967523@canb.auug.org.au> <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Nov 27, 2018 at 9:53 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Tue, Nov 27, 2018 at 1:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Paul,
> >
> > Today's linux-next merge of the selinux tree got a conflict in:
> >
> >   security/selinux/hooks.c
> >
> > between commit:
> >
> >   0472421f47a9 ("vfs: Remove unused code after filesystem context changes")
> >
> > from the vfs tree and commit:
> >
> >   2cbdcb882f97 ("selinux: always allow mounting submounts")
> >
> > from the selinux tree.
> >
> > I fixed it up (the former removed the function updated by the latter -
> > I am not sure if there are further changes necessary) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
>
> Hm... seems that there was some massive overhaul in the VFS code right
> at the wrong moment... There are new hooks for mounting now and the
> code that our commit changes is now here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/tree/security/selinux/hooks.c?h=for-next#n3131

For convenience, here are direct links to the most important -next VFS
commits that are related:

https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/commit/?h=for-next&id=c87c47c34750e9ee1ff0345593f3cbf6726b9d4e
https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/commit/?h=for-next&id=4786c3427b2517ee9c685f95bf5b3185e332e64d
https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/commit/?h=for-next&id=37744f3d21f8dbf6bb65e1ecef38c2cf9503d202
https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/commit/?h=for-next&id=0472421f47a97be4b741d55ffd18f68ed9ba7cea

>
> It seems that the logic is still the same, just now our patch (or the
> VFS one) needs to be updated to change the above line as such
> (untested pseudo-patch):
>
> - if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT)
> + if (fc->purpose == (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBMOUNT))
>
> Thanks for the heads up, Stephen!
>
> --
> Ondrej Mosnacek <omosnace at redhat dot com>
> Associate Software Engineer, Security Technologies
> Red Hat, Inc.

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Associate Software Engineer, Security Technologies
Red Hat, Inc.
