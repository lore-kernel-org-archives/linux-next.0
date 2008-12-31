From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the device-mapper tree
Date: Wed, 31 Dec 2008 11:22:49 +1100
Message-ID: <20081231112249.4a0b68b2.sfr@canb.auug.org.au>
References: <20081215115823.dc3029d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Dec_2008_11_22_49_+1100_t1fv3ne5eF/DtZ_Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43541 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752116AbYLaAW4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 19:22:56 -0500
In-Reply-To: <20081215115823.dc3029d5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Kiyoshi Ueda <k-ueda@ct.jp.nec.com>

--Signature=_Wed__31_Dec_2008_11_22_49_+1100_t1fv3ne5eF/DtZ_Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair,

On Mon, 15 Dec 2008 11:58:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the device-mapper tree got a conflict in
> drivers/md/dm.c between commit 0bfc24559d7945506184d86739fe365a181f06b7
> ("blktrace: port to tracepoints, update") from the ftrace tree and commit
> 758cc022ae793c8418fca30ed1e30466efaae37a ("dm-request-add-caches") from
> the device-mapper tree.
>=20
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>=20
> diff --cc drivers/md/dm.c
> index 343094c,50a1f10..0000000
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@@ -52,8 -53,27 +54,29 @@@ struct dm_target_io=20
>   	union map_info info;
>   };
>  =20
> + /*
> +  * For request-based dm.
> +  * One of these is allocated per request.
> +  */
> + struct dm_rq_target_io {
> + 	struct mapped_device *md;
> + 	struct dm_target *ti;
> + 	struct request *orig, clone;
> + 	int error;
> + 	union map_info info;
> + };
> +=20
> + /*
> +  * For request-based dm.
> +  * One of these is allocated per bio.
> +  */
> + struct dm_rq_clone_bio_info {
> + 	struct bio *orig;
> + 	struct request *rq;
> + };
> +=20
>  +DEFINE_TRACE(block_bio_complete);
>  +
>   union map_info *dm_get_mapinfo(struct bio *bio)
>   {
>   	if (bio && bio->bi_private)

This conflict is now between the device-mapper tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Dec_2008_11_22_49_+1100_t1fv3ne5eF/DtZ_Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklau1kACgkQjjKRsyhoI8w0xwCgtiRhKFujXMo59S8x3KRPktsr
DVYAoJDQW8NDt42y8Yt6cOKSOSh90roS
=6uPo
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Dec_2008_11_22_49_+1100_t1fv3ne5eF/DtZ_Q--
