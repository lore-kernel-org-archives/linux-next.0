From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: manual merge of the cleancache tree with Linus' tree
Date: Thu, 24 Mar 2011 08:37:03 -0700 (PDT)
Message-ID: <8e934520-3ed7-470a-ada4-80ae2b41ae60@default>
References: <20110324135524.261bb5a9.sfr@canb.auug.org.au>
 <20110323205615.6984f974.akpm@linux-foundation.org>
 <AANLkTikagME334Y6PH4P_Nybf_h=fov5CiNBAY7KxYyN@mail.gmail.com
 AANLkTimQQHHN6pS17R_mGmF+oG33D3Apb6E_pNvsLHwv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimQQHHN6pS17R_mGmF+oG33D3Apb6E_pNvsLHwv@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Minchan Kim <minchan.kim@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

> >>> Is this stuff going to be merged into Linus' tree this time round=
?

Hi Stephen --

Still TBD.  Some discussion has occurred offlist.

> >> I did the cleancache_flush_page() before the
> delete_from_page_cache(),
> >> in case the delete_from_page_cache() freed the page. =C2=A0I didn'=
t
> actually
> >> check whether that makes sense though.
> >
> > I am not sure cleancache's put and flush semantic.
> > If I understand rightly with old __remove_from_page_cache's comment=
,
> > maybe cleancache_flush_page is to invalidate the page

Hi Minchan and Stephen --

I will take a close look at this and possibly ask Chris Mason to
take a look as well (since these hooks were placed by Chris in 2008
and this is the first significant change around the hooks since then).

I think as long as the page is still locked and the mapping
remains valid, the ordering may not matter, but will confirm
and test.
=20
> Dan, one more thing.
>=20
> #define cleancache_fs_enabled_mapping(_mapping) \
>         (mapping->host->i_sb->cleancache_poolid >=3D 0)
>=20
> One is "_mapping", another is  "mapping"

Oops!  Nice catch, Minchan!  Will fix (using C, per
Andrew's reply).

Thanks,
Dan
