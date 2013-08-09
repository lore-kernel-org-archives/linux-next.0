From: Kees Cook <kees@outflux.net>
Subject: Re: linux-next: manual merge of the akpm tree with the ext4 tree
Date: Fri, 9 Aug 2013 15:21:04 -0700
Message-ID: <20130809222104.GY2280@outflux.net>
References: <20130807151903.6281b33735f4e3f79231bf5e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.outflux.net ([198.145.64.163]:40151 "EHLO smtp.outflux.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031204Ab3HIWVX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 Aug 2013 18:21:23 -0400
Content-Disposition: inline
In-Reply-To: <20130807151903.6281b33735f4e3f79231bf5e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Dave Chinner <dchinner@redhat.com>

Hi,

On Wed, Aug 07, 2013 at 03:19:03PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> Today's linux-next merge of the akpm tree got a conflict in
> fs/ext4/extents_status.c between commit 49c6efc7b80e ("ext4: add new
> ioctl EXT4_IOC_PRECACHE_EXTENTS") from the ext4 tree and commit
> "fs-convert-fs-shrinkers-to-new-scan-count-api-fix" from the akpm tre=
e.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc fs/ext4/extents_status.c
> index 28e2627,0361206..0000000
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@@ -947,13 -909,23 +947,15 @@@ static int __ext4_es_shrink(struct ex=
t4
>   	struct ext4_inode_info *ei;
>   	struct list_head *cur, *tmp;
>   	LIST_HEAD(skiped);
> - 	int ret, nr_shrunk =3D 0;
> + 	unsigned long nr_shrunk =3D 0;
>  +	int retried =3D 0, skip_precached =3D 1, nr_skipped =3D 0;
>  =20
>   	spin_lock(&sbi->s_es_lru_lock);
>  =20
>  -	/*
>  -	 * If the inode that is at the head of LRU list is newer than
>  -	 * last_sorted time, that means that we need to sort this list.
>  -	 */
>  -	ei =3D list_first_entry(&sbi->s_es_lru, struct ext4_inode_info, i_=
es_lru);
>  -	if (sbi->s_es_last_sorted < ei->i_touch_when) {
>  -		list_sort(NULL, &sbi->s_es_lru, ext4_inode_touch_time_cmp);
>  -		sbi->s_es_last_sorted =3D jiffies;
>  -	}
>  -
>  +retry:

It seems like fs-convert-fs-shrinkers-to-new-scan-count-api-fix is carr=
ying
this needless chunk above:

>   	list_for_each_safe(cur, tmp, &sbi->s_es_lru) {
> + 		int ret;
> +=20
>   		/*
>   		 * If we have already reclaimed all extents from extent
>   		 * status tree, just stop the loop immediately.

Which is masking the "ret" at the start, leading to warnings at build-t=
ime:

fs/ext4/extents_status.c: In function =E2=80=98__ext4_es_shrink=E2=80=99=
:
fs/ext4/extents_status.c:950:6: warning: unused variable =E2=80=98ret=E2=
=80=99 [-Wunused-variable]

-Kees

--=20
Kees Cook                                            @outflux.net
