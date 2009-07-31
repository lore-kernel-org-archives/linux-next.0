From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the reiserfs-bkl tree with Linus'
	tree
Date: Fri, 31 Jul 2009 07:05:07 +0200
Message-ID: <20090731050505.GA6115@nowhere>
References: <20090713115114.a871ea68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f217.google.com ([209.85.220.217]:34662 "EHLO
	mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865AbZGaFMr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2009 01:12:47 -0400
Content-Disposition: inline
In-Reply-To: <20090713115114.a871ea68.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

On Mon, Jul 13, 2009 at 11:51:14AM +1000, Stephen Rothwell wrote:
> Hi Fr=E9d=E9ric,
>=20
> Today's linux-next merge of the reiserfs-bkl tree got a conflict in
> fs/reiserfs/journal.c between commit
> 8aa7e847d834ed937a9ad37a0f2ad5b8584c1ab0 ("Fix congestion_wait()
> sync/async vs read/write confusion") from Linus' tree and commit
> e533d8da923c77ed58940309c401584bffda75e0 ("reiserfs: kill-the-BKL") f=
rom
> the reiserfs-bkl tree.
>=20
> Just context changes.  I fixed it up as best I could (see below) and =
can
> carry the fix for a while.
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc fs/reiserfs/journal.c
> index 9062220,86c1ff4..0000000
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@@ -996,8 -984,13 +984,13 @@@ static int reiserfs_async_progress_wai=
t
>   {
>   	DEFINE_WAIT(wait);
>   	struct reiserfs_journal *j =3D SB_JOURNAL(s);
> - 	if (atomic_read(&j->j_async_throttle))
> +=20
> + 	if (atomic_read(&j->j_async_throttle)) {
> + 		reiserfs_write_unlock(s);
>  -		congestion_wait(WRITE, HZ / 10);
>  +		congestion_wait(BLK_RW_ASYNC, HZ / 10);
> + 		reiserfs_write_lock(s);
> + 	}
> +=20
>   	return 0;
>   }
>  =20


Sorry to answer that late. That's the right fix, thanks Stephen!

I've pushed the latest update/rebase of the reiserfs/kill-bkl tree
there:

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.g=
it \
reiserfs/kill-bkl

I've changed the branch name because the previous one had a fixed rc ve=
rsion
inside. This new branch will keep beeing the most up to date.
Could you please drop the old branch and integrate this new one?

Thanks a lot,
=46rederic.
