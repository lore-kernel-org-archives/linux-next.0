From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Wed, 5 Dec 2018 10:37:56 +0100
Message-ID: <CAFqZXNvSOzyhnTUxF2mP4BTFMVQ8H1uh-Yyn2fH2K=4yRDX-tQ@mail.gmail.com>
References: <20181127115246.00967523@canb.auug.org.au> <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au> <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
 <CAFqZXNu_=MxcX5jvX4y=5nrCqi7_btOGVccbH1NZ=xm3TGvaYQ@mail.gmail.com>
 <CAFqZXNv642dfT0PpB0M7sO5J90cAM7Luv0A8nX7JtEXqw=yu1w@mail.gmail.com>
 <CAFqZXNuv_mF8Yt50J3giZjxzZX_WwCOePZeEtmR-G_m+vRyPrQ@mail.gmail.com> <20181203215639.GV2217@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203215639.GV2217@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Dec 3, 2018 at 10:56 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, Dec 03, 2018 at 11:12:59AM +0100, Ondrej Mosnacek wrote:
>
> > I think I figured out what's the problem. NFS still creates the
> > submount via the old vfs_submount() call, which calls
> > vfs_kern_mount(), which creates an fs_context with
> > FS_CONTEXT_FOR_USER_MOUNT because FS_CONTEXT_FOR_SUBMOUNT needs the
> > mountpoint dentry reference and there is currently no way to pass that
> > to vfs_kern_mount(). This is further complicated by the fact that
> > vfs_submount() accepts only a const reference to the mountpoint, while
> > vfs_new_fs_context() expects a non-const one...
> >
> > I think all users of the old vfs_submount call should be converted to
> > the new API before the VFS changes are merged into mainline, otherwise
> > they will break the SELinux submount fix. We could work around it in
> > the SELinux hook by checking the fc->sb_flags[_mask] for SB_SUBMOUNT,
> > but I guess that would be a hack.
>
> Could you take a look at vfs.git#Q28?  There's still a massive reshuffling
> going on, so there will be more branches; this one is the latest at the
> moment.

I just tested the Q28 branch rebased onto a recent Fedora rawhide
kernel (4.20.0-0.rc5.git0.1) and that code seems to be working fine.
The submount test failed with Q28 and succeeds with Q28+fix, as
expected. Also, the overlay tests failures are gone now (except for
the 4 known failures from GH issue #43, since I had to rebase onto
4.20-rcX).

This is the commit that I used as the SELinux submount fix:
https://gitlab.com/omos/linux-public/commit/47922f9c70a83008388b836c285f94c40da1af2b

Kernel builds:
Unfixed Q28:  https://copr.fedorainfracloud.org/coprs/omos/kernel-testing/build/833311/
Fixed Q28:  https://copr.fedorainfracloud.org/coprs/omos/kernel-testing/build/833312/

Selinux-testsuite reports:
=== Q28 ===
Test Summary Report
-------------------
overlay/test              (Wstat: 1024 Tests: 119 Failed: 4)
  Failed tests:  81, 83, 107, 112
  Non-zero exit status: 4
submount/test             (Wstat: 256 Tests: 2 Failed: 1)
  Failed test:  2
  Non-zero exit status: 1
Files=54, Tests=615, 117 wallclock secs ( 0.20 usr  0.04 sys +  1.64
cusr  1.29 csys =  3.17 CPU)
Result: FAIL
Failed 2/54 test programs. 5/615 subtests failed.

=== Q28 + FIX ===
Test Summary Report
-------------------
overlay/test              (Wstat: 1024 Tests: 119 Failed: 4)
  Failed tests:  81, 83, 107, 112
  Non-zero exit status: 4
Files=54, Tests=615, 117 wallclock secs ( 0.22 usr  0.05 sys +  1.54
cusr  1.37 csys =  3.18 CPU)
Result: FAIL
Failed 1/54 test programs. 4/615 subtests failed.

--
Ondrej Mosnacek <omosnace at redhat dot com>
Associate Software Engineer, Security Technologies
Red Hat, Inc.
