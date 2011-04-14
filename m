From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: manual merge of the cleancache tree with Linus' tree
Date: Thu, 14 Apr 2011 14:04:58 -0700 (PDT)
Message-ID: <662075c7-1510-43f0-baaa-82541276b2c8@default>
References: <20110324135524.261bb5a9.sfr@canb.auug.org.au>
 <20110323205615.6984f974.akpm@linux-foundation.org
 AANLkTikagME334Y6PH4P_Nybf_h=fov5CiNBAY7KxYyN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:63582 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926Ab1DNVGh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Apr 2011 17:06:37 -0400
In-Reply-To: <AANLkTikagME334Y6PH4P_Nybf_h=fov5CiNBAY7KxYyN@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Minchan Kim <minchan.kim@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

> From: Minchan Kim [mailto:minchan.kim@gmail.com]
> Sent: Wednesday, March 23, 2011 11:38 PM
> To: Andrew Morton
> Cc: Stephen Rothwell; Dan Magenheimer; linux-next@vger.kernel.org;
> linux-kernel@vger.kernel.org; Linus
> Subject: Re: linux-next: manual merge of the cleancache tree with
> Linus' tree
>=20
> On Thu, Mar 24, 2011 at 12:56 PM, Andrew Morton
> <akpm@linux-foundation.org> wrote:
> > On Thu, 24 Mar 2011 13:55:24 +1100 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >
> >> Hi Dan,
> >>
> >> Today's linux-next merge of the cleancache tree got a conflict in
> >> mm/truncate.c between commit 5adc7b518b54 ("mm: truncate: change
> >> remove_from_page_cache") from Linus' tree and commit 03e838947c8a
> >> ("mm/fs: add hooks to support cleancache") from the cleancache tre=
e.
> >>
> >> I fixed it up (see below) but am really not sure of the fix. =C2=A0=
I can
> carry
> >> this fix as necessary.
> >>
> >> Is this stuff going to be merged into Linus' tree this time round?
> >> --
> >> Cheers,
> >> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
> >>
> >> diff --cc mm/truncate.c
> >> index a956675,cd94607..0000000
> >> --- a/mm/truncate.c
> >> +++ b/mm/truncate.c
> >> @@@ -106,8 -108,13 +108,12 @@@ truncate_complete_page(struct
> address_s
> >> =C2=A0 =C2=A0 =C2=A0 cancel_dirty_page(page, PAGE_CACHE_SIZE);
> >>
> >> =C2=A0 =C2=A0 =C2=A0 clear_page_mlock(page);
> >> =C2=A0- =C2=A0 =C2=A0remove_from_page_cache(page);
> >> =C2=A0 =C2=A0 =C2=A0 ClearPageMappedToDisk(page);
> >> =C2=A0+ =C2=A0 =C2=A0delete_from_page_cache(page);
> >> + =C2=A0 =C2=A0 /* this must be after the remove_from_page_cache w=
hich
> >> + =C2=A0 =C2=A0 =C2=A0* calls cleancache_put_page (and note page->=
mapping is now
> NULL)
> >> + =C2=A0 =C2=A0 =C2=A0*/
> >> + =C2=A0 =C2=A0 cleancache_flush_page(mapping, page);
> >> =C2=A0- =C2=A0 =C2=A0page_cache_release(page); =C2=A0 =C2=A0 =C2=A0=
 /* pagecache ref */
> >> =C2=A0 =C2=A0 =C2=A0 return 0;
> >> =C2=A0 }
> >
> > I did the cleancache_flush_page() before the
> delete_from_page_cache(),
> > in case the delete_from_page_cache() freed the page. =C2=A0I didn't
> actually
> > check whether that makes sense though.
>=20
> I am not sure cleancache's put and flush semantic.
> If I understand rightly with old __remove_from_page_cache's comment,
> maybe cleancache_flush_page is to invalidate the page.(If I understan=
d
> right, I hope the name is changed to cleancache_invalidate_page)
>=20
> "        /*
>          * if we're uptodate, flush out into the cleancache, otherwis=
e
>          * invalidate any existing cleancache entries.  We can't leav=
e
>          * stale data around in the cleancache once our page is gone
>          */
>         if (PageUptodate(page))
>                 cleancache_put_page(page);
>         else
>                 cleancache_flush_page(mapping, page); "
>=20
> So I think cleancache_flush_page should be done after
> delete_from_page_cache because delete_from_page_cache calls
> cleancache_put_page(maybe this function would flush the content of
> memory into cleancache's target) before we invalidates the page.
>=20
> And it should not be a problem in case the delete_from_page_cache
> freed the page since cleancache should have a reference the page but =
I
> didn't check cleancahe always has a reference of page. If it isn't,
> it's a critical problem.
>=20
> Dan, Could you comment this?

In case anyone was waiting for a resolution on this, it
was resolved offlist.

The answer is that the order doesn't matter and the V8
cleancache patch will include a fix for this.

Thanks,
Dan
