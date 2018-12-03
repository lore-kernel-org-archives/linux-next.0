From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Mon, 3 Dec 2018 21:56:39 +0000
Message-ID: <20181203215639.GV2217@ZenIV.linux.org.uk>
References: <20181127115246.00967523@canb.auug.org.au>
 <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au>
 <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
 <CAFqZXNu_=MxcX5jvX4y=5nrCqi7_btOGVccbH1NZ=xm3TGvaYQ@mail.gmail.com>
 <CAFqZXNv642dfT0PpB0M7sO5J90cAM7Luv0A8nX7JtEXqw=yu1w@mail.gmail.com>
 <CAFqZXNuv_mF8Yt50J3giZjxzZX_WwCOePZeEtmR-G_m+vRyPrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqZXNuv_mF8Yt50J3giZjxzZX_WwCOePZeEtmR-G_m+vRyPrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Dec 03, 2018 at 11:12:59AM +0100, Ondrej Mosnacek wrote:

> I think I figured out what's the problem. NFS still creates the
> submount via the old vfs_submount() call, which calls
> vfs_kern_mount(), which creates an fs_context with
> FS_CONTEXT_FOR_USER_MOUNT because FS_CONTEXT_FOR_SUBMOUNT needs the
> mountpoint dentry reference and there is currently no way to pass that
> to vfs_kern_mount(). This is further complicated by the fact that
> vfs_submount() accepts only a const reference to the mountpoint, while
> vfs_new_fs_context() expects a non-const one...
> 
> I think all users of the old vfs_submount call should be converted to
> the new API before the VFS changes are merged into mainline, otherwise
> they will break the SELinux submount fix. We could work around it in
> the SELinux hook by checking the fc->sb_flags[_mask] for SB_SUBMOUNT,
> but I guess that would be a hack.

Could you take a look at vfs.git#Q28?  There's still a massive reshuffling
going on, so there will be more branches; this one is the latest at the
moment.

I really hate the situation around sb_clone_mnt_opts/sb_set_mnt_opts and
I'm none too fond of the way fs_context_validate is done, so there will
be quite a bit of LSM tweaking.  If we are doing that, let's do it
right...
