From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
Date: Wed, 12 Dec 2018 10:46:05 -0500
Message-ID: <20181212154605.GC17249@pure.paranoia.local>
References: <20181212072402.7b967df7@canb.auug.org.au>
 <20181212073802.2fc8dc53@canb.auug.org.au>
 <CAHpGcM+wCSrj0pk89ZoMENp+L_zSXbSFhEJcsdDEOh1F-GmGvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHpGcM+wCSrj0pk89ZoMENp+L_zSXbSFhEJcsdDEOh1F-GmGvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 11, 2018 at 09:47:43PM +0100, Andreas Grünbacher wrote:
> > Now, after the rebase:
> >
> > Commits
> >
> >   187e4dad3f55 ("gfs2: Remove vestigial bd_ops")
> >
> > is missing a Signed-off-by from its committer.
> 
> Yep, I've not asked for a way to get the server to reject or warn
> about such pushes without a reason.

We don't run checks on push that involve iterating through commits,
because most of the pushes we receive are merges and rejecting on a
commit somewhere deep in an octopus merge would just result in angry
maintainers.

Best,
-K
