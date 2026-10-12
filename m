Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03F48EC79
	for <linux-next@vger.kernel.org>; Mon, 12 Oct 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815443; cv=pass; b=jre8T3pVlH6bRozC1PJt2MRBO0ObdFeRHSiyU909ynPae3eWN6/XD0jeiQEV805iNNjRgqv23mFC8Ajk9rCT0cOF554WtElonNCejz2cHutBAGg2Nx5GIK0KRWMwgSk0P5eb7A81GEhOH9mPjwOMC1Hbiao8R6g//qVayV6KAEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815443; c=relaxed/simple;
	bh=cY/JBGh/hwGpvSrRdbWicIuwFqUbUO1NYgLVdjhfIyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVAtvTf8GOkGpzVEkREFncbeAngsDMAJHeicyIXe+xRdmzB2WCatZg/2UHE2tkwGjwR2T3NIsI5E6bnTCIlhFEuMpuKiJHZ4p5ikE7oWc1N5/abKS3pVULKM2xD3HaGPoOnebprKiqMNfKWPio+X7qwDehsA4NuoIC/YEb6JEuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO6es4hr; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO6es4hr"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98301b325c4so473806241.1
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2026 07:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791815441; cv=none;
        d=google.com; s=arc-20260327;
        b=dctvffBueD9kJx7VKGP0u7iEyxN2C6DprVB0foH6RUzp0q7/mBZv2+jFOt7ldtVbYO
         ebL3wFnMQgiuppG9nq5lZ3747wKKOlZNqSedit6BCqeZXfWSWbriLh6DqCAgvRcrtPzN
         mr303umSdTI8QW6Kx79cmDaCcaSPJB0g2Ky7zIEUr9ITgVi+kh6u/paMNrOP5XttlUSc
         sEG2HdK1CSC0lKbp9LK9hl8dZ5JI9HB1TeSLF4vdhhnT16bXzkYD9m6gjS50YhluVT3p
         jyMab/Wk3Otl4pigFrFole4G/DbLBQOeAwAFy1oQeuXffU70n5uRPg5NLM5nhXoNZaBg
         hmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i53cakjPfkVLTz+URoRixAorII/+Ktg3Ujd3YzzVevU=;
        fh=Rod9Eg6brV/1uKl9ijrl2XaAA7/uddszf+Mymkru070=;
        b=liTnppBDOFCANX7wbqvzyNWHxmpdtmZUQ1aUjIiRg0INB0G+ZINf0Io4406pES22my
         uTNYhHCt52jwQmVyCABSvsSDANgMxP1QyHrCW/GX8KyMBrVTtsuMeswv+e0flgb7Lyes
         RgiVhR2jNLl3nw+3Ys4ZwE9V5kQe9d2yUhLyOXMxzVjIwZl3S+R8qRNknOHYkFL4oHKa
         NM38Uj2Uutx/nYYV/skHBUHsjn4fODfGeZsLsXCaT4T7kKcAUMnHBGoJsdZdeIBx4mb/
         CscdQKFGC0yjs1e4NuIYksauCeZ3I03GsGjF0Zprz0XSteaX00xtU3N/urS+2n7gRQDg
         TmOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815441; x=1792420241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i53cakjPfkVLTz+URoRixAorII/+Ktg3Ujd3YzzVevU=;
        b=XO6es4hr7UFZt+vCQzlHIEk7+R1F1N2exL1e+mqPwbW+ZczPJ8bzfHEzdohWJKGhSf
         Nc9yrKP2zzV2hwrKYrJG9R1amefatBC0W7G82uWdyoifO59VF+1SRpbJbw5j9rUW7kY6
         /vU/e7lRZHbrrnytLLDUXmy6HYw7Fb/UeDqRtJi4sZvLCGRl5idBu1aomGPGmBJ0vOtX
         bWrgFHYcJxreDnliqY1LW2jabzkv5+RV/UL/ESshEhy0GQtwdcokNdpFSXtHAUvcQARB
         3HvfSpavQ/Z5FN8rN7Rxvx5zyxMYNyxgLzhK00dzHXfzW3ejqmC5nyoezH0YXwEqZ3hH
         L0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815441; x=1792420241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i53cakjPfkVLTz+URoRixAorII/+Ktg3Ujd3YzzVevU=;
        b=gnMVZa7SG0unrlQ8nfiMwI26U5+d74rduvf0v0IBji57jJ3TKUTqKouBJmHhjqZhuo
         ryHorVFSHQLH2UagSRyLSxcyrfXAxSGtbUHGDwAmMXa6Cd6zE2XDSTxR22Tu7U4azUHN
         0AHkoHO/axIj2mtX6E1kqi4xGxh1po+MYRleagyrvDsOcBRY6cj1PLCSsQ0qgM5k+l1M
         0gJKrpJ7ZqGR2dEAF3NeNz3c02LewqdN2Ibx9GSlhem4fzRLiLc3m9gaFk2fdGQu23iG
         nXgm18lYV8B4hfQSHF9ucVWfQz/gMhDsG5++abEoUqPzKbELVDlnzzDhJPoEa7jZjbjO
         bWaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4jaq7I8rP09aVQwiaKzXKgRkjmOixMWdVEgyxC509TFcRRRBT+tiwmNCcJXOAUg5Gl10q1y19s6l2@vger.kernel.org
X-Gm-Message-State: AFq9FYLdU6bMc+1Fb4Z5OHUKJA7gLE5XglD1bygSTUMt9X1ryQD4pVBa
	JB52qn4y9T6y0VluC10FAIPuHymkE2y8c9t1OTmlVRXm3GdXs+IsVkDHWllRtdTkQ+MXS8uen/k
	ACHkAU+D+WihFX58KypUPLpuIgknHeSw=
X-Gm-Gg: AYBFou0KcZsDVfpsH2Bi0n4smmd0suUtvgQXA4rsjb5pVCrK8ISpz7YL+2+8USfgmEc
	D3rbc27e5nb/7JUCQ3EzbNjm9TsLf+p6QcdGR0MM3OhHPWuSCsgv1wUnrns2Q45ZlkCVOsiAgGO
	RZ3AYjPD4ZjYnI1sz6ArN4e+HMkmAjBdbk5gOEiawUoYX/gAbAb1MCzQ05YQ+TgJ/KPd1zFE9Ej
	Tr/nClfjZ+vVdlgQRoJBWbvWMkOtFbspj+CXWeWc8DNJKvtHyeiPvlL2x06AF+zQzJ3cTdreK3U
	URVooEq7CwlKjruw8neMO1uLHzFm0DWc8LwtK0EHjTMH/cLd0Yh2Wmg=
X-Received: by 2002:a05:6102:419f:b0:7c8:18a2:f769 with SMTP id
 ada2fe7eead31-7cb391458acmr2293372137.0.1791815440564; Mon, 12 Oct 2026
 07:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aszji59b6B79a3Hi@sirena.org.uk>
In-Reply-To: <aszji59b6B79a3Hi@sirena.org.uk>
From: Ozgur <zgrieee@gmail.com>
Date: Mon, 12 Oct 2026 17:30:28 +0300
X-Gm-Features: AclHuK-FGPOheor9BkRHjONa2cvRES-RJIe10Ctv35rk327UqJcfONC6p4NJl7A
Message-ID: <CAOFRbGnVCnW4CEvhp_x6t58v0sB2to+6AP0hHYtci0EBnUWQzQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Paulo Alcantara <pc@manguebit.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org>, 12 Eki 2026 Pzt, 16:50 tarihinde =C5=9Funu=
 yazd=C4=B1:
>
> Hi all,

Hi Mark,

i noticed Namjae Jeon's commit (2de2cdd9cc08, ntfs: add pathname
access for named streams) is currently present in fs-next and your
reported build failure appears to result from this commit interacting
with VFS changes that make mnt_idmap const in the ->setattr() and
->getattr() callbacks, and i think fs-next before changes are
integrated into linux-next

i compiled linux-next tree but couldnt reproduce the build failure.

Regards

Ozgur

>
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/fs/smb/client/cifsfs.c:1258:18: error: incompatible funct=
ion pointer types initializing 'int (*)(const struct mnt_idmap *, struct de=
ntry *, struct file_kattr *)' with an expression of type 'int (struct mnt_i=
dmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-poi=
nter-types]
>  1258 |         .fileattr_set =3D cifs_fileattr_set,
>       |                         ^~~~~~~~~~~~~~~~~
> /tmp/next/build/fs/smb/client/cifsfs.c:1270:18: error: incompatible funct=
ion pointer types initializing 'int (*)(const struct mnt_idmap *, struct de=
ntry *, struct file_kattr *)' with an expression of type 'int (struct mnt_i=
dmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-poi=
nter-types]
>  1270 |         .fileattr_set =3D cifs_fileattr_set,
>       |                         ^~~~~~~~~~~~~~~~~
> 2 errors generated.
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:290: fs/smb/client/c=
ifsfs.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:551: fs/smb/client] =
Error 2
> make[5]: *** Waiting for unfinished jobs....
> /tmp/next/build/fs/ntfs/namei.c:793:40: error: passing 'const struct mnt_=
idmap *' to parameter of type 'struct mnt_idmap *' discards qualifiers [-We=
rror,-Wincompatible-pointer-types-discards-qualifiers]
>   793 |                 stream_vi =3D ntfs_create_named_stream(idmap, dir=
, base_name,
>       |                                                      ^~~~~
> /tmp/next/build/fs/ntfs/stream.h:35:58: note: passing argument to paramet=
er 'idmap' here
>    35 | struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
>       |                                                          ^
> 1 error generated.
>
>
> Caused by the constification series for mnt_idmap interacting with:
>
>    2de2cdd9cc08f (ntfs: add pathname access for named streams)
>    121e0c35720b2 (smb: client: implement fileattr_set for compression fla=
gs)
>
> from the cifs and ntfs trees.  I have applied the fixup below and can
> carry as needed.
>
> From 6b75090639b332f5fa52a558edbba295d8bb42fc Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Mon, 12 Oct 2026 13:55:24 +0100
> Subject: [PATCH] cifs: Fix semantic conflict with const mnt_idmap
>
> /tmp/next/build/fs/smb/client/cifsfs.c:1258:18: error: incompatible funct=
ion pointer types initializing 'int (*)(const struct mnt_idmap *, struct de=
ntry *, struct file_kattr *)' with an expression of type 'int (struct mnt_i=
dmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-poi=
nter-types]
>  1258 |         .fileattr_set =3D cifs_fileattr_set,
>       |                         ^~~~~~~~~~~~~~~~~
> /tmp/next/build/fs/smb/client/cifsfs.c:1270:18: error: incompatible funct=
ion pointer types initializing 'int (*)(const struct mnt_idmap *, struct de=
ntry *, struct file_kattr *)' with an expression of type 'int (struct mnt_i=
dmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-poi=
nter-types]
>  1270 |         .fileattr_set =3D cifs_fileattr_set,
>       |                         ^~~~~~~~~~~~~~~~~
> 2 errors generated.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  fs/ntfs/named_stream.c | 6 +++---
>  fs/ntfs/stream.h       | 2 +-
>  fs/smb/client/cifsfs.h | 2 +-
>  fs/smb/client/ioctl.c  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
> index d74bebf90966b..95a3c05f98211 100644
> --- a/fs/ntfs/named_stream.c
> +++ b/fs/ntfs/named_stream.c
> @@ -553,7 +553,7 @@ int ntfs_stream_path_names(struct ntfs_volume *vol,
>   *
>   * Return: Referenced stream inode on success, or ERR_PTR() on failure.
>   */
> -struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
> +struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
>                 struct inode *dir, __le16 *base_name, int base_len,
>                 __le16 *stream_name, int stream_len)
>  {
> @@ -988,13 +988,13 @@ static ssize_t ntfs_stream_listxattr(struct dentry =
*dentry, char *buffer,
>  }
>
>  #ifdef CONFIG_NTFS_FS_POSIX_ACL
> -static struct posix_acl *ntfs_stream_get_acl(struct mnt_idmap *idmap,
> +static struct posix_acl *ntfs_stream_get_acl(const struct mnt_idmap *idm=
ap,
>                 struct dentry *dentry, int type)
>  {
>         return ERR_PTR(-EOPNOTSUPP);
>  }
>
> -static int ntfs_stream_set_acl(struct mnt_idmap *idmap,
> +static int ntfs_stream_set_acl(const struct mnt_idmap *idmap,
>                 struct dentry *dentry, struct posix_acl *acl, int type)
>  {
>         return -EOPNOTSUPP;
> diff --git a/fs/ntfs/stream.h b/fs/ntfs/stream.h
> index 5cbf6e8f6b681..76b6c9cca5cc0 100644
> --- a/fs/ntfs/stream.h
> +++ b/fs/ntfs/stream.h
> @@ -32,7 +32,7 @@ struct inode *ntfs_stream_lookup_inode_by_name(struct i=
node *dir,
>                 __le16 *name, int name_len);
>  struct dentry *ntfs_lookup_stream(struct inode *dir, struct dentry *dent=
ry,
>                 const struct ntfs_stream_path *path);
> -struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
> +struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
>                 struct inode *dir, __le16 *base_name, int base_len,
>                 __le16 *stream_name, int stream_len);
>  int ntfs_unlink_named_stream(struct inode *dir, struct dentry *dentry);
> diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
> index 7600467babb67..e54d3798eb2f7 100644
> --- a/fs/smb/client/cifsfs.h
> +++ b/fs/smb/client/cifsfs.h
> @@ -91,7 +91,7 @@ extern const struct inode_operations cifs_namespace_ino=
de_operations;
>
>  struct file_kattr;
>  int cifs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
> -int cifs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> +int cifs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dent=
ry,
>                       struct file_kattr *fa);
>
>
> diff --git a/fs/smb/client/ioctl.c b/fs/smb/client/ioctl.c
> index af4664f5b1202..bb8808289a468 100644
> --- a/fs/smb/client/ioctl.c
> +++ b/fs/smb/client/ioctl.c
> @@ -181,7 +181,7 @@ static int cifs_set_compression(unsigned int xid, str=
uct dentry *dentry,
>                                             compression_state);
>  }
>
> -int cifs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> +int cifs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dent=
ry,
>                       struct file_kattr *fa)
>  {
>         struct cifs_sb_info *cifs_sb =3D CIFS_SB(dentry);
> --
> 2.47.3
>
