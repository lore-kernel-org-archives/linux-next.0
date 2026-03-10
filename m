Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833438D6BB
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151328; cv=none; b=jhj+N6nPvxssbAfp8UKCv6SKd4HYIg2yCMlqX0MfaAeYkwZpDN/zS1J48l+X0QVGiRwrs70aUjA2yLeSa7Kljk3oHeOPROnWD45Q18qyWdv3yt3prlZNmGLUSV4taO+bEN9dz3BuETTqirs4PIloBCPOZV4niW5pDAjK7MoIUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151328; c=relaxed/simple;
	bh=oTHr9g8PGvvBBXXo2hrp6vMItZ/xLzZIGMkl37YCDwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnpbKKKBqWiwWY+SGl0R7Fb5tZyRfeamkVvtXA7hPWO+VZrY0M0MiWu1mDZyn50sEVoKbEcchpf3jFNRghT4uzUzi+5nGPLgOK/2NuOMY1EpT7udc/XyzYH4tvD41Q1bqHiMneYYUB3ijdr49JuVf8Ui4Kp0bQ+0HU48Lqsi/R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMqIul+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMqIul+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F94EC2BC86
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2026 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773151328;
	bh=oTHr9g8PGvvBBXXo2hrp6vMItZ/xLzZIGMkl37YCDwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uMqIul+hYAC4PDm7lbM/dLFsJivT3gVWLSXlN/7EJlgsV/K/P2PohIV7la6LG2EVa
	 3MnxrsizYnuTv3vFXG0e2FyM0Py5LtnoIvEG0XTWPQzcfuyuhCwgNtL4QDOczaahWq
	 2QFGXl/sTA3MtFTxyp8zMQtzNNEJ2q0PhffTQsFTP0CutiMvSjrIkbgAmczaCJBgdh
	 S3H5Tc9Zh48zbX9CNRAQLNGOvtzzhIpbI0J+v+EYBtlApwTBr/5rwoqtv/ttab2MB4
	 VRZ/juX/prBDWyTAy+it0TUgmwudluyO8TKig9KWABdFmhx+ccaGHEZKpt1420m6Ut
	 UEWN5tw7yCoKw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-660fc3f30c1so9516649a12.1
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2026 07:02:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUEG3HnFuBrOFaUB6V8kaAwuSWFY4HzK2X8Db7mwR2Bf4mLOUPYCQULtls38kjhSS6I6wjaTYv+8QW@vger.kernel.org
X-Gm-Message-State: AOJu0YxqnzZeW/D1hXLyW+hUFZYYuEh84oQb+zdJ+DJb/+jw5qpDy7Vl
	Qlv8JTSORFM6gvEFHuAsqKasriH5iCQ7VddoJzWfImffkcW03QqG9pqPd1XShiLztfw74nFjWVy
	nzzd7QnlY41n899kBYVPaT1cP5Zx7hvc=
X-Received: by 2002:a17:907:3d87:b0:b96:ed21:f47e with SMTP id
 a640c23a62f3a-b96ed21f883mr487338066b.25.1773151321719; Tue, 10 Mar 2026
 07:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <abAavVrDrfzkzuVR@sirena.org.uk>
In-Reply-To: <abAavVrDrfzkzuVR@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Mar 2026 23:01:49 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8pqP4V-2mhKHZDHx8usomSTkHBS9mHLJTqYc3qqcau6w@mail.gmail.com>
X-Gm-Features: AaiRm51KFUq6MrTBKOSw0O6EMBgyiUC_03FBISBl8qbCKy-5OO9FJWYCwiOoV_8
Message-ID: <CAKYAXd8pqP4V-2mhKHZDHx8usomSTkHBS9mHLJTqYc3qqcau6w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
To: Mark Brown <broonie@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 10:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
Hi Mark,
>
> After merging the vfs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> /tmp/next/build/fs/ntfs/mft.c: In function 'ntfs_may_write_mft_record':
> /tmp/next/build/fs/ntfs/mft.c:773:52: error: passing argument 3 of 'find_=
inode_nowait' from incompatible pointer type [-Wincompatible-pointer-types]
>   773 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_test_in=
ode_wb, &na);
>       |                                                    ^~~~~~~~~~~~~~=
~~~~
>       |                                                    |
>       |                                                    int (*)(struct=
 inode *, long unsigned int,  void *)
> In file included from /tmp/next/build/include/linux/writeback.h:10,
>                  from /tmp/next/build/fs/ntfs/mft.c:11:
> /tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(struc=
t inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsigned =
int,  void *)'} but argument is of type 'int (*)(struct inode *, long unsig=
ned int,  void *)'
>  2955 |                                 int (*match)(struct inode *, u64,=
 void *),
>       |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> /tmp/next/build/fs/ntfs/mft.c:836:52: error: passing argument 3 of 'find_=
inode_nowait' from incompatible pointer type [-Wincompatible-pointer-types]
>   836 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_test_in=
ode_wb, &na);
>       |                                                    ^~~~~~~~~~~~~~=
~~~~
>       |                                                    |
>       |                                                    int (*)(struct=
 inode *, long unsigned int,  void *)
> /tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(struc=
t inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsigned =
int,  void *)'} but argument is of type 'int (*)(struct inode *, long unsig=
ned int,  void *)'
>  2955 |                                 int (*match)(struct inode *, u64,=
 void *),
>       |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>
> Caused by commit
>
>    0b2600f81cefc (treewide: change inode->i_ino from unsigned long to u64=
)
>
> interacting with the addition of the ntfs tree.  I have fixed this up as
> below and can carry as needed:
>
> commit d1b19b9f221c93e8fd0f43b80509ba1660e25cf9
> Author: Mark Brown <broonie@kernel.org>
> Date:   Tue Mar 10 12:33:15 2026 +0000
>
>     ntfs: Fixup merge issue with vfs.all changes
>
>     /tmp/next/build/fs/ntfs/mft.c: In function 'ntfs_may_write_mft_record=
':
>     /tmp/next/build/fs/ntfs/mft.c:773:52: error: passing argument 3 of 'f=
ind_inode_nowait' from incompatible pointer type [-Wincompatible-pointer-ty=
pes]
>       773 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_tes=
t_inode_wb, &na);
>           |                                                    ^~~~~~~~~~=
~~~~~~~~
>           |                                                    |
>           |                                                    int (*)(st=
ruct inode *, long unsigned int,  void *)
>     In file included from /tmp/next/build/include/linux/writeback.h:10,
>                      from /tmp/next/build/fs/ntfs/mft.c:11:
>     /tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(s=
truct inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsig=
ned int,  void *)'} but argument is of type 'int (*)(struct inode *, long u=
nsigned int,  void *)'
>      2955 |                                 int (*match)(struct inode *, =
u64, void *),
>           |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
>     /tmp/next/build/fs/ntfs/mft.c:836:52: error: passing argument 3 of 'f=
ind_inode_nowait' from incompatible pointer type [-Wincompatible-pointer-ty=
pes]
>       836 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_tes=
t_inode_wb, &na);
>           |                                                    ^~~~~~~~~~=
~~~~~~~~
>           |                                                    |
>           |                                                    int (*)(st=
ruct inode *, long unsigned int,  void *)
>     /tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(s=
truct inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsig=
ned int,  void *)'} but argument is of type 'int (*)(struct inode *, long u=
nsigned int,  void *)'
>      2955 |                                 int (*match)(struct inode *, =
u64, void *),
>           |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
>
>     Signed-off-by: Mark Brown <broonie@kernel.org>
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 48e64eaa7ec33..0c3f8d9b7c3a4 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -632,7 +632,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, st=
ruct mft_record *m, int syn
>         return err;
>  }
>
> -static int ntfs_test_inode_wb(struct inode *vi, unsigned long ino, void =
*data)
> +static int ntfs_test_inode_wb(struct inode *vi, u64 ino, void *data)
>  {
>         struct ntfs_attr *na =3D data;
Looks good to me:)
Thanks for fixing it up and carrying the patch!
