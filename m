From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
Date: Wed, 25 Jul 2018 00:23:22 +0200
Message-ID: <CAHpGcM+WkOKkd+GLMiTWsvnLA_daY_5pBfSQp_KYoPVcRQQHGg@mail.gmail.com>
References: <20180725080130.314f62bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725080130.314f62bb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

2018-07-25 0:01 GMT+02:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Commit
>
>   b6fbc2f6a686 ("GFS2: Fix recovery issues for spectators")
>
> is missing a Signed-off-by from its committer.  It was rebased.

thanks, I've fixed it now but this is getting rather annoying -- and
it must happen to others as well. Do you happen to have git hooks that
prevent this from happening?

Thanks,
Andreas
