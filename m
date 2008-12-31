From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the security-testing tree
Date: Wed, 31 Dec 2008 12:50:25 +1100
Message-ID: <20081231125025.b74309b1.sfr@canb.auug.org.au>
References: <20081120163734.9e5f0d61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Dec_2008_12_50_25_+1100_1AsRrS723qF=spdn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49406 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751870AbYLaBuf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 20:50:35 -0500
In-Reply-To: <20081120163734.9e5f0d61.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mfasheh@suse.com>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, Tiger Yang <tiger.yang@oracle.com>, James Morris <jmorris@namei.org>, Jan Kara <jack@suse.cz>

--Signature=_Wed__31_Dec_2008_12_50_25_+1100_1AsRrS723qF=spdn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, 20 Nov 2008 16:37:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the security-testing tree got a conflict in
> fs/ocfs2/namei.c between commit 8b50970dda2c81dfbd120ae650fcf5439f268f37
> ("[PATCH 01/10] ocfs2: move new inode allocation out of the transaction")
> from the ocsf2 tree and commit b19c2a3b839b9dfb3f258e8943dc3784ae20c7b0
> ("CRED: Wrap task credential accesses in the OCFS2 filesystem") from the
> security-testing tree.
>=20
> I fixed it up (see below) and can carry it.  The ocfs2 tree change moved
> the place where the security-testing tree change to this file needs to be
> made.  The below patch could be applied to the ocfs2 tree (as part of the
> above security-testing patch as all its dependencies are already upstream.
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>=20
> diff --cc fs/ocfs2/namei.c
> index 98fd325,2545e74..0000000
> --- a/fs/ocfs2/namei.c
> +++ b/fs/ocfs2/namei.c
> @@@ -187,34 -186,6 +187,34 @@@ bail
>   	return ret;
>   }
>  =20
>  +static struct inode *ocfs2_get_init_inode(struct inode *dir, int mode)
>  +{
>  +	struct inode *inode;
>  +
>  +	inode =3D new_inode(dir->i_sb);
>  +	if (!inode) {
>  +		mlog(ML_ERROR, "new_inode failed!\n");
>  +		return NULL;
>  +	}
>  +
>  +	/* populate as many fields early on as possible - many of
>  +	 * these are used by the support functions here and in
>  +	 * callers. */
>  +	if (S_ISDIR(mode))
>  +		inode->i_nlink =3D 2;
>  +	else
>  +		inode->i_nlink =3D 1;
> - 	inode->i_uid =3D current->fsuid;
> ++	inode->i_uid =3D current_fsuid();
>  +	if (dir->i_mode & S_ISGID) {
>  +		inode->i_gid =3D dir->i_gid;
>  +		if (S_ISDIR(mode))
>  +			mode |=3D S_ISGID;
>  +	} else
> - 		inode->i_gid =3D current->fsgid;
> ++		inode->i_gid =3D current_fsgid();
>  +	inode->i_mode =3D mode;
>  +	return inode;
>  +}
>  +
>   static int ocfs2_mknod(struct inode *dir,
>   		       struct dentry *dentry,
>   		       int mode,

This conflict is now between the ocfs2 tree and Linus' tree (the
security-testing tree beat you to being merged :-)).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Dec_2008_12_50_25_+1100_1AsRrS723qF=spdn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklaz+EACgkQjjKRsyhoI8wn/gCfe7TDf1568NquIK1txzE53XLH
uvIAn2swQ7oVaYDxFtXxDDvgLoNHS2TC
=ulAp
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Dec_2008_12_50_25_+1100_1AsRrS723qF=spdn--
