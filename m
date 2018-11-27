From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Tue, 27 Nov 2018 09:53:32 +0100
Message-ID: <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
References: <20181127115246.00967523@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127115246.00967523@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Nov 27, 2018 at 1:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the selinux tree got a conflict in:
>
>   security/selinux/hooks.c
>
> between commit:
>
>   0472421f47a9 ("vfs: Remove unused code after filesystem context changes")
>
> from the vfs tree and commit:
>
>   2cbdcb882f97 ("selinux: always allow mounting submounts")
>
> from the selinux tree.
>
> I fixed it up (the former removed the function updated by the latter -
> I am not sure if there are further changes necessary) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Hm... seems that there was some massive overhaul in the VFS code right
at the wrong moment... There are new hooks for mounting now and the
code that our commit changes is now here:

https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/tree/security/selinux/hooks.c?h=for-next#n3131

It seems that the logic is still the same, just now our patch (or the
VFS one) needs to be updated to change the above line as such
(untested pseudo-patch):

- if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT)
+ if (fc->purpose == (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBMOUNT))

Thanks for the heads up, Stephen!

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Associate Software Engineer, Security Technologies
Red Hat, Inc.
