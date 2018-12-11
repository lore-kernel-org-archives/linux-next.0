From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
Date: Tue, 11 Dec 2018 21:47:43 +0100
Message-ID: <CAHpGcM+wCSrj0pk89ZoMENp+L_zSXbSFhEJcsdDEOh1F-GmGvg@mail.gmail.com>
References: <20181212072402.7b967df7@canb.auug.org.au> <20181212073802.2fc8dc53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212073802.2fc8dc53@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi,

Am Di., 11. Dez. 2018 um 21:40 Uhr schrieb Stephen Rothwell
<sfr@canb.auug.org.au>:
> Hi all,
>
> On Wed, 12 Dec 2018 07:24:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Commit
> >
> >   ec702fa79702 ("gfs2: Dump nrpages for inodes and their glocks")
> >
> > is missing a Signed-off-by from its committer.
>
> Now, after the rebase:
>
> Commits
>
>   187e4dad3f55 ("gfs2: Remove vestigial bd_ops")
>
> is missing a Signed-off-by from its committer.

Yep, I've not asked for a way to get the server to reject or warn
about such pushes without a reason.

Thanks,
Andreas
