From: Dmitry Monakhov <rjevskiy@gmail.com>
Subject: Re: linux-next: ext3 tree build warning
Date: Tue, 15 Dec 2009 12:58:36 +0300
Message-ID: <c18d6aa20912150158m1b77c17ey2dcfacb3aa86d67a@mail.gmail.com>
References: <20091215105925.59a66556.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:37707 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757665AbZLOJ6h convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2009 04:58:37 -0500
In-Reply-To: <20091215105925.59a66556.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2009/12/15 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Jan,
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>
> fs/quota/dquot.c: In function 'dquot_alloc_inode':
> fs/quota/dquot.c:1521: warning: passing argument 1 of 'mark_all_dquot=
_dirty' discards qualifiers from pointer target type
> fs/quota/dquot.c:327: note: expected 'struct dquot **' but argument i=
s of type 'struct dquot * const*'
> fs/quota/dquot.c: In function 'dquot_free_inode':
> fs/quota/dquot.c:1649: warning: passing argument 1 of 'mark_all_dquot=
_dirty' discards qualifiers from pointer target type
> fs/quota/dquot.c:327: note: expected 'struct dquot **' but argument i=
s of type 'struct dquot * const*'
What's why my original patch contained type casts.
In fact i dont understand why {alloc,free}_inode accept pointer to
const struct inode, it's contradicts to normal logic
Even if inode is not in a good state, quta code may and must(what's
how it designed for now) change it internals.
>
> Introduced by commit e91077e3d523c2ac2090b3447bf6244567cf7128 ("quota=
:
> Move duplicated code to separate functions").
>
> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
