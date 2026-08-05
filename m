Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88FA481FBF
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946453; cv=pass; b=nXFShdNFTKBnrOvbuCqd6VI0p+3UFUQMn5Tcu1Z3+Z9TKsl7iotAA7xrrol4oNCKEfrkqmy54U2rSlZfc8Ea5YmSbc6JrXMmvBgZS3bqiFZuyKCzJP8j/1pKZ0bEGLmD0K6zct6rj+86QCutjae424aybxuFqLvgMaCnpKuOV+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946453; c=relaxed/simple;
	bh=2wnNNOlf55To7UHvks1T5U1SbM+To0VwwQd7L4Cge78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3XGkjdsnhzojxpVKzhj/cWA9vc64qUmnE8N9e0a3sAlOSC6nd6YCAQbfj6ZS/E7XuWHDUVVq/NLjHQ664FBb9pAZBxQOQodW1/6yc9VP4XSoYktgRwk1o8JngACxDqBaPlxw4G8b/G9reDdA15NKtyJiMJ1X80D+FvJ2FZmtWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApkTtv62; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApkTtv62"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6682259cae6so1300733d50.3
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 09:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785946444; cv=none;
        d=google.com; s=arc-20260327;
        b=XZgn5GqLkpPBLHKw1hvgGF4kxHdD9K9YEyIIZdRxj1PEJ16o8pAggLnwQZCFxTTpBZ
         H0gBFjMFgePCkcaw3IM99nQIFlulHqTswGdxqB4qyhX2YLZTl9G5gPWuM1Ls12KzpiGM
         hSwEGjiJaeIOK1h5jpRKMJa/QAc5UKOJyKqYl9S1I0DZGj84uvzPK7RcV+qhffP8g+u8
         EB7i619SK2bdmTUF00iZc3hfwzq3XQ+rOjYuSU/DVZfLP7MMdUirUjidc9OkLbAaVpdf
         Dq+vGB/aJKORfXYpS6soOekodENwF7ZzdkjoM2r8vpwDeYAp0YN/opZQw5Nk72qDazab
         oFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hvZnf6CAI0o1dUwGHk+spMcwv7x4tAeuzS/+xcS0akQ=;
        fh=L7E6jHQ27vMlS0oFBi9TF6DwOLQCMSwth1qj59b7z9A=;
        b=Z+m7mKu9UUYH2MsGQa7jSKhwKXMT88D9lRl5va3sOcttTTx+tWlEKQNL0nhGIWBbSa
         NYFIAQ1mGBlfzhqiGDHoNPo2DXeNQv8dpcp7eVl1G9x6VaAmcHlTKK3MKvfquM6xkWQa
         bB1eHrGfdLFR47e8d8BO1j2HqPuDdcPiLKlLk7dhX0dJc4lAUUdqaFJ8TbvhwORfD4z0
         y9kEFBmPslVk+l/9nZaJPWGGjBK+iU4MEgBp8D6v7hT/NCRbptQHKO1GS3YDp5S3p458
         +ywiPvA4k7vrDVC5f3lWPqYKP0ILUwjRIQ3+7JjnHj5zE1QSadrpGbLtrqDR8ruj7pox
         Ihjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785946444; x=1786551244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvZnf6CAI0o1dUwGHk+spMcwv7x4tAeuzS/+xcS0akQ=;
        b=ApkTtv627wgG9LXdzf/snyn9ujP1eaPDX1rTJdN4owjAk+8ZYaaxopzhrbvsHRNpmi
         +0RiOf944FR22F2pCUKmidRDkWsVtnj+MFhhKeusiJRCE0MK/N9o3XK8JIoZAfRQPJMO
         BRVO79ZPJZC3dU6XmyvnG9EP1HuodmCZgKVC/NyNX6Dv+Rx6+IGNqUSVWiQcfooMuU4/
         NNxCbmrKI5uXhrPgCbQb6XTExYCtJV4XyolwvJFp3DN+PcuaGZllM2BzYwDNGMMzi87u
         85cIXvqZXwlW9rjtVb23njWhvZF+10SDmnd1PY1jw7SmFH8WpHL1w+KU3ynxeO6lsCi4
         LRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946444; x=1786551244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvZnf6CAI0o1dUwGHk+spMcwv7x4tAeuzS/+xcS0akQ=;
        b=RMZLw6o1ys5imvGyzgzKKYwr2eQKy1tMcD2NKaFkwiwXbSz7ecE6ZdCz4fbm6ojbqu
         ecTi8mX40epyUEqL37TTpfExToNBP8PnSesxEWXYtdj8dYQ8LSluVZJkq7XkwanyWGvZ
         XYLsmAtO/lA97ZbuB1cSGOSF2CVkUmtvMuldsWURS+ChuVYMRHfJiEVek8e5bmNxc/ZN
         i4W9fYSLE5dnQwCLdbDHjq91efxhUV6WDzBJL8Ic6Y8MscJdygc8LDc18h2TgxDuTSBQ
         ddQbEExXuxZ58GYsyfeXnaKMEJOqdfMLI420BDLAjhzMPBcyw5z4O969OzObnfcPh9Yu
         avOg==
X-Forwarded-Encrypted: i=1; AHgh+RoDVwWEO6ns4URnp7Ku57NAVw7dciJQJ66gFEj6/CchhjjQfODF4/rgJGeMglbZ2esARCcct7jMeFyB@vger.kernel.org
X-Gm-Message-State: AOJu0YwQWdbbsQz982jaV/9nQWuw72SICP1+rFobXyqXaaVQ0kWngFXJ
	qIeC1BN/TjVrrSRtyHdniE4iFq59w9mfHOoh4Pfv7AFPyulPBdiVfoJYmUSI5JFydQOhVteevr2
	KRDIaQlhFNrQdK0sGpAewe1oSu8MrGQokdrim
X-Gm-Gg: AR+sD13mXiJA6aLnwwx8cywrDz9w1TRm954EqmL0hnl5jvSNk15Jqb4LiifwPE4VT7I
	JK0E70N0mVW/MrM605/EBSibuPCRTcAmBtybwQyeJyprrWg8koQllXXhfKpWstbeQE9bHydpeuO
	3822yGCWyQtk6xkwBoOz6XfdnIkWCkGV3SSocFoMnhxGNys8ZA4b9ecB5DaptpJBnInM7QV4LLO
	xGJ/Bd3Er+iWjIgtafTulb07F//iFQYq9EYI+wdXVBpzwpvnDLjlQ9AvxctkjCQiM14z05jiC6t
	orz9/2ue2oz12JvDPWeVB87qb2hE4ZObhwQmRvnWbmgXJ825pymtcpDzegGaI1PCK6vpuH5OhOE
	VhiczhsW4l7Yk4ccNAawS5OacWz/2ObcgOfg=
X-Received: by 2002:a53:c90c:0:b0:668:bf66:4e59 with SMTP id
 956f58d0204a3-6699ab2609amr3178804d50.46.1785946444084; Wed, 05 Aug 2026
 09:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anMt1DKhBq-9Hk7h@sirena.org.uk>
In-Reply-To: <anMt1DKhBq-9Hk7h@sirena.org.uk>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 5 Aug 2026 09:13:48 -0700
X-Gm-Features: AUfX_mwZYkIxy7q4g5VaBohjeYm8YKFvWZJr_hd4mJqPzQxtQ1mosucx033XUEU
Message-ID: <CAJnrk1ZqzifYSFNg1tBNz15p2WBe+rMVfRT5yq=B+wCemLt+4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ntfs tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Hyeontae Lee <wonju345@naver.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 5:34=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Hi all,
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>
>   fs/ntfs/iomap.c
>
> between commit:
>
>   9cf6ac617e8e9 ("ntfs: serialize resident iomap reads with mrec_lock")
>
> from the ntfs tree and commit:
>
>   7a7bf7551624f ("ntfs: convert iomap ops to ->iomap_next()")
>
> from the vfs-brauner tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc fs/ntfs/iomap.c
> index 73c50171285aa,d0964ac840d9f..0000000000000
> --- a/fs/ntfs/iomap.c
> +++ b/fs/ntfs/iomap.c
> @@@ -283,22 -274,13 +283,24 @@@ static int ntfs_read_iomap_begin(struc
>                 unsigned int flags, struct iomap *iomap, struct iomap *sr=
cmap)
>   {
>         return __ntfs_read_iomap_begin(inode, offset, length, flags, ioma=
p,
>  -                      srcmap, true);
>  +                      srcmap, true, true);
>   }
>
>  -static DEFINE_IOMAP_ITER_NEXT(ntfs_read_iomap_next, ntfs_read_iomap_beg=
in);
>  +static int ntfs_read_iomap_end(struct inode *inode, loff_t pos, loff_t =
length,
>  +              ssize_t written, unsigned int flags, struct iomap *iomap)
>  +{
>  +      struct ntfs_inode *base_ni =3D iomap->private;
>  +
>  +      if (base_ni)
>  +              mutex_unlock(&base_ni->mrec_lock);
>  +      return written;
>  +}
>  +
> ++static DEFINE_IOMAP_ITER_NEXT_END(ntfs_read_iomap_next, ntfs_read_iomap=
_begin,
> ++                                ntfs_read_iomap_end);
> +
>   const struct iomap_ops ntfs_read_iomap_ops =3D {
> -       .iomap_begin =3D ntfs_read_iomap_begin,
> -       .iomap_end =3D ntfs_read_iomap_end,
> +       .iomap_next =3D ntfs_read_iomap_next,
>   };
>
>   /*

Hi Mark,

This looks correct to me. Thanks for resolving the merge conflict.
