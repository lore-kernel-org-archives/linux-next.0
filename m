From: Minchan Kim <minchan.kim@gmail.com>
Subject: Re: linux-next: manual merge of the cleancache tree with Linus' tree
Date: Thu, 24 Mar 2011 14:58:06 +0900
Message-ID: <AANLkTimQQHHN6pS17R_mGmF+oG33D3Apb6E_pNvsLHwv@mail.gmail.com>
References: <20110324135524.261bb5a9.sfr@canb.auug.org.au>
	<20110323205615.6984f974.akpm@linux-foundation.org>
	<AANLkTikagME334Y6PH4P_Nybf_h=fov5CiNBAY7KxYyN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49542 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752396Ab1CXF6H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Mar 2011 01:58:07 -0400
In-Reply-To: <AANLkTikagME334Y6PH4P_Nybf_h=fov5CiNBAY7KxYyN@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Magenheimer <dan.magenheimer@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Thu, Mar 24, 2011 at 2:38 PM, Minchan Kim <minchan.kim@gmail.com> wr=
ote:
> On Thu, Mar 24, 2011 at 12:56 PM, Andrew Morton
> <akpm@linux-foundation.org> wrote:
>> On Thu, 24 Mar 2011 13:55:24 +1100 Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
>>
>>> Hi Dan,
>>>
>>> Today's linux-next merge of the cleancache tree got a conflict in
>>> mm/truncate.c between commit 5adc7b518b54 ("mm: truncate: change
>>> remove_from_page_cache") from Linus' tree and commit 03e838947c8a
>>> ("mm/fs: add hooks to support cleancache") from the cleancache tree=
=2E
>>>
>>> I fixed it up (see below) but am really not sure of the fix. =C2=A0=
I can carry
>>> this fix as necessary.
>>>
>>> Is this stuff going to be merged into Linus' tree this time round?
>>> --
>>> Cheers,
>>> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>>>
>>> diff --cc mm/truncate.c
>>> index a956675,cd94607..0000000
>>> --- a/mm/truncate.c
>>> +++ b/mm/truncate.c
>>> @@@ -106,8 -108,13 +108,12 @@@ truncate_complete_page(struct addres=
s_s
>>> =C2=A0 =C2=A0 =C2=A0 cancel_dirty_page(page, PAGE_CACHE_SIZE);
>>>
>>> =C2=A0 =C2=A0 =C2=A0 clear_page_mlock(page);
>>> =C2=A0- =C2=A0 =C2=A0remove_from_page_cache(page);
>>> =C2=A0 =C2=A0 =C2=A0 ClearPageMappedToDisk(page);
>>> =C2=A0+ =C2=A0 =C2=A0delete_from_page_cache(page);
>>> + =C2=A0 =C2=A0 /* this must be after the remove_from_page_cache wh=
ich
>>> + =C2=A0 =C2=A0 =C2=A0* calls cleancache_put_page (and note page->m=
apping is now NULL)
>>> + =C2=A0 =C2=A0 =C2=A0*/
>>> + =C2=A0 =C2=A0 cleancache_flush_page(mapping, page);
>>> =C2=A0- =C2=A0 =C2=A0page_cache_release(page); =C2=A0 =C2=A0 =C2=A0=
 /* pagecache ref */
>>> =C2=A0 =C2=A0 =C2=A0 return 0;
>>> =C2=A0 }
>>
>> I did the cleancache_flush_page() before the delete_from_page_cache(=
),
>> in case the delete_from_page_cache() freed the page. =C2=A0I didn't =
actually
>> check whether that makes sense though.
>
> I am not sure cleancache's put and flush semantic.
> If I understand rightly with old __remove_from_page_cache's comment,
> maybe cleancache_flush_page is to invalidate the page.(If I understan=
d
> right, I hope the name is changed to cleancache_invalidate_page)
>
> " =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * if we're uptodate, flush out into the c=
leancache, otherwise
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * invalidate any existing cleancache entr=
ies. =C2=A0We can't leave
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * stale data around in the cleancache onc=
e our page is gone
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PageUptodate(page))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleancache_put=
_page(page);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleancache_flu=
sh_page(mapping, page); "
>
> So I think cleancache_flush_page should be done after
> delete_from_page_cache because delete_from_page_cache calls
> cleancache_put_page(maybe this function would flush the content of
> memory into cleancache's target) before we invalidates the page.
>
> And it should not be a problem in case the delete_from_page_cache
> freed the page since cleancache should have a reference the page but =
I
> didn't check cleancahe always has a reference of page. If it isn't,
> it's a critical problem.
>
> Dan, Could you comment this?

Dan, one more thing.

#define cleancache_fs_enabled_mapping(_mapping) \
        (mapping->host->i_sb->cleancache_poolid >=3D 0)

One is "_mapping", another is  "mapping"


--=20
Kind regards,
Minchan Kim
