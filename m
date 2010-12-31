From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the trivial tree with the ext4 tree
Date: Fri, 31 Dec 2010 17:15:12 +0100
Message-ID: <20101231161512.GG14221@pengutronix.de>
References: <20101231125721.3c3f4604.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60415 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682Ab0LaQPR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Dec 2010 11:15:17 -0500
Content-Disposition: inline
In-Reply-To: <20101231125721.3c3f4604.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>

Hi Stephen,

On Fri, Dec 31, 2010 at 12:57:21PM +1100, Stephen Rothwell wrote:
> diff --cc fs/ext4/ext4.h
> index 2a73925,1f253a9..0000000
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@@ -561,7 -561,23 +561,7 @@@ struct ext4_new_group_data=20
>   #define EXT4_IOC32_SETVERSION_OLD	FS_IOC32_SETVERSION
>   #endif
>  =20
> - /* Max physical block we can addres w/o extents */
>  -
>  -/*
>  - *  Mount options
>  - */
>  -struct ext4_mount_options {
>  -	unsigned long s_mount_opt;
>  -	uid_t s_resuid;
>  -	gid_t s_resgid;
>  -	unsigned long s_commit_interval;
>  -	u32 s_min_batch_time, s_max_batch_time;
>  -#ifdef CONFIG_QUOTA
>  -	int s_jquota_fmt;
>  -	char *s_qf_names[MAXQUOTAS];
>  -#endif
>  -};
>  -
> + /* Max physical block we can address w/o extents */
>   #define EXT4_MAX_BLOCK_FILE_PHYS	0xFFFFFFFF
>  =20
>   /*
>=20
Looks correct.

Independant of this I think it would be better to define
EXT4_MAX_BLOCK_FILE_PHYS to 0xFFFFFFFFUL to have the same type on all
platforms.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
