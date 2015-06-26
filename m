From: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the ceph tree
Date: Fri, 26 Jun 2015 11:21:52 +0300
Message-ID: <CAOi1vP8-Fz2FABJZdt6_aZq_TNGFBhGuanV-n9kBvdFmyRMsyw@mail.gmail.com>
References: <20150626111755.5f0635bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:38163 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbbFZIVx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2015 04:21:53 -0400
In-Reply-To: <20150626111755.5f0635bd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Sage Weil <sage@newdream.net>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yan, Zheng" <zyan@redhat.com>

On Fri, Jun 26, 2015 at 4:17 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Al,
>
> Today's linux-next merge of the vfs tree got a conflict in:
>
>   fs/ceph/dir.c
>
> between commit:
>
>   fdd4e15838e5 ("ceph: rework dcache readdir")
>
> from the ceph tree and commit:
>
>   dc3f4198eac1 ("make simple_positive() public")
>
> from the vfs tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary (no action
> is required).
>
> Sage: that ceph tree commit has no Signed-off-by from its
> committer :-(  The same is true for almost all the commits in the ceph
> tree ... and the committer (Ilya) is not listed as a maintainer of that
> tree ... and its on github :-(

Well, it has Signed-off-by from a person who is listed as a maintainer
of fs/ceph (Zheng).  We share the same tree for three components: rbd
(drivers/block/rbd.c), cephfs (fs/ceph) and libceph (net/ceph) which is
used by both rbd and cephfs (we should probably split libceph into its
own MAINTAINERS entry).  The volume of commits is not that high and
we prefer to not clutter our 30-40 commits per cycle with a bunch of
merges, so when one of us rebases the committer stamp gets wiped.

As for github, is that a bad thing?  ceph-client.git is certainly not
the only github tree in linux-next.

Thanks,

                Ilya
