From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: linux-next: manual merge of the logfs tree with Linus' tree
Date: Wed, 2 Nov 2011 20:00:46 +0100
Message-ID: <20111102190046.GB3485@logfs.org>
References: <20111101141000.3531dbfbf0490c6d3521d6b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111101141000.3531dbfbf0490c6d3521d6b6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Tue, 1 November 2011 14:10:00 +1100, Stephen Rothwell wrote:
>=20
> Hi all,
>=20
> Today's linux-next merge of the logfs tree got a conflict in
> fs/logfs/file.c between commit 02c24a82187d ("fs: push i_mutex and
> filemap_write_and_wait down into ->fsync() handlers") from Linus' tre=
e
> and commit 39da12ef4bbe ("logfs: take write mutex lock during fsync a=
nd
> sync") from the logfs tree.
>=20
> I have no idea what needs to be done here.  I fixed it like below to =
make
> it build, but a better fix is needed.

=46rom a code perspective your fix below is correct, to the best of my
judgement.  I'm less sure what to do from a git perspective.
Explicitly tell Linus about it in the logfs pull request?

> diff --cc fs/logfs/file.c
> index b548c87,f85d603..0000000
> --- a/fs/logfs/file.c
> +++ b/fs/logfs/file.c
> @@@ -219,20 -219,13 +219,22 @@@ long logfs_ioctl(struct file *file, u=
ns
>   	}
>   }
>  =20
>  -int logfs_fsync(struct file *file, int datasync)
>  +int logfs_fsync(struct file *file, loff_t start, loff_t end, int da=
tasync)
>   {
>   	struct super_block *sb =3D file->f_mapping->host->i_sb;
>  +	struct inode *inode =3D file->f_mapping->host;
>  +	int ret;
>  +
>  +	ret =3D filemap_write_and_wait_range(inode->i_mapping, start, end)=
;
>  +	if (ret)
>  +		return ret;
>  =20
>  +	mutex_lock(&inode->i_mutex);
> + 	logfs_get_wblocks(sb, NULL, WF_LOCK);
>   	logfs_write_anchor(sb);
> + 	logfs_put_wblocks(sb, NULL, WF_LOCK);
>  +	mutex_unlock(&inode->i_mutex);
>  +
>   	return 0;
>   }
>  =20



J=C3=B6rn

--=20
You can take my soul, but not my lack of enthusiasm.
-- Wally
