From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
Date: Tue, 15 May 2018 10:58:47 +0200
Message-ID: <3798543.7VT4y5RNEA@aspire.rjw.lan>
References: <20180515082109.3b57619a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180515082109.3b57619a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tuesday, May 15, 2018 12:21:09 AM CEST Stephen Rothwell wrote:
> 
> --Sig_/LKqNOwcm4.nPHJQHAB_CO6g
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,

Hi Stephen,

> Commit
> 
>   e689ba60f1f0 ("Merge branch 'opp/genpd-pstate-updates' of git://git.kerne=
> l.org/pub/scm/linux/kernel/git/vireshk/pm")
> 
> is missing a Signed-off-by from its author and committer.
> 
> This is probably because (despite its description) this is not a merge
> commit - it seems to have been flattened in the rebase :-(

Thanks for letting me know!

This commit shouldn't have reached you at all, sorry about that.

Should be fixed now.

Thanks,
Rafael
