From: Weston Andros Adamson <dros@primarydata.com>
Subject: Re: linux-next: manual merge of the nfs tree with Linus' tree
Date: Thu, 19 May 2016 01:18:52 +0000
Message-ID: <92AE96EB-7EFB-4C89-B0BD-46F4B9B70A3D@primarydata.com>
References: <20160519104036.3f1ac7cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from us-smtp-delivery-194.mimecast.com ([63.128.21.194]:40603 "EHLO
	us-smtp-delivery-194.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751297AbcESBeO convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 21:34:14 -0400
In-Reply-To: <20160519104036.3f1ac7cf@canb.auug.org.au>
Content-Language: en-US
Content-ID: <66B8EC1521BF0847848C27807B991CEF@namprd11.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hch <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Anna Schumaker <Anna.Schumaker@Netapp.com>


> On May 18, 2016, at 8:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Hi Trond,
>=20
> Today's linux-next merge of the nfs tree got a conflict in:
>=20
>  fs/nfs/direct.c
>=20
> between commit:
>=20
>  c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_=
IO")
>=20
> from Linus' tree and commit:
>=20
>  ed3743a6d4f3 ("nfs: add debug to directio "good_bytes" counting")
>=20
> from the nfs tree.

The merge of the nfs tree=92s commit looks good to me.

-dros

>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your t=
ree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particula=
rly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/nfs/direct.c
> index 741a92c470bb,7f03163b5364..000000000000
> --- a/fs/nfs/direct.c
> +++ b/fs/nfs/direct.c
> @@@ -591,8 -596,8 +594,8 @@@ ssize_t nfs_file_direct_read(struct kio
>  		goto out_unlock;
>=20
>  	dreq->inode =3D inode;
> - 	dreq->bytes_left =3D count;
> + 	dreq->bytes_left =3D dreq->max_count =3D count;
> -	dreq->io_start =3D pos;
> +	dreq->io_start =3D iocb->ki_pos;
>  	dreq->ctx =3D get_nfs_open_context(nfs_file_open_context(iocb->ki_f=
ilp));
>  	l_ctx =3D nfs_get_lock_context(dreq->ctx);
>  	if (IS_ERR(l_ctx)) {
>=20
