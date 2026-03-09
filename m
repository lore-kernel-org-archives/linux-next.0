Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE4934F479
	for <linux-next@vger.kernel.org>; Mon,  9 Mar 2026 23:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097717; cv=none; b=IqJz4DYHENEJRwP2DtYclxTN55MZ0x9oUEk1fm6746l0EGaV3UsG6rxfEdFuGPfcnhbLpcz7VczEJa4Pddjun0lw7cnwWxpROTFRRr5G8hVGJoAKfa2fJZjsaSlZu7yvLh0dll0ldS1Ppz1+MceYeNRh49c5SXcqzbZJnlWMFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097717; c=relaxed/simple;
	bh=VvOnQkOeuN2Hx/XiZQ+IcI6Hxn2CeLn7WfQqN5oGmDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qab3LsVTuTYlrh0hFiUqL/RpZHXBsoVzGMd0dh41clr6FaYNee+0C/v5t0h2sFwzZhVaMwaCY0sXr6SMGBJPoY4nbZiQuClWM0yzO84/Zu4Cr3pdOLVJAdGjJa/exCuWjGC9rpT9MMSENe+ui+NAoLkKr3fN+XTwE4uWxj8XZ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGPHMvSk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGPHMvSk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7901C2BCAF
	for <linux-next@vger.kernel.org>; Mon,  9 Mar 2026 23:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773097716;
	bh=VvOnQkOeuN2Hx/XiZQ+IcI6Hxn2CeLn7WfQqN5oGmDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EGPHMvSk8pFHPp+lezHQHgzWakFvCVK+rqDeWMGANimA3yO9zCE6kK6TTHZ5mskpY
	 +6D9QJWdVmD0BAOVSWlLoZnlAVKtK5WtMsxDPqVnoDpqBA9xtHNu9c3YrWhj88WnNU
	 Cti1eeUyy1MHC+5AViQExAW2u6/praEes5iUaXCDnFvkW9YEzHZEsaMjDB6dOYtRSE
	 gQCdtP9OHb0nCQSqimJ9yOxj82hBzOBXp2GMmXSbeQk3PKsv5nvtjH9sBqNxLyy/az
	 SHDHm4pULIk5oM06OThB7e8OJNdy3728f/8UeGSYCeuTS/pourDTV78sRlxJIgbchn
	 OtddU1Nkb6LuA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1466627366b.2
        for <linux-next@vger.kernel.org>; Mon, 09 Mar 2026 16:08:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVklcKJoNC5XKIbRqTn7559XkkmiwyXqmazfibNa7ifbGoYd2w5z4PkJOaeTLBpJwN60qv3OtfFBmgO@vger.kernel.org
X-Gm-Message-State: AOJu0YxROT+8vWvl2VgAEmUm8Zk5J3urfjWqopnyt0qPsrKsLBGJxmdJ
	4m476Pp5EtdLqAYig6cUT5IC//4khA/c7wEHKWEV3Vx3QwpNIVn1O02EiayJKBi/957L6h2Z+Jz
	ZKhEsHvgKtSAfYhrCZWv2lO5HUeIvNkg=
X-Received: by 2002:a17:907:d09:b0:b93:ff4d:8e38 with SMTP id
 a640c23a62f3a-b942dbde65amr733554966b.20.1773097715032; Mon, 09 Mar 2026
 16:08:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aa7ZT-cQMVdQOOAj@sirena.org.uk>
In-Reply-To: <aa7ZT-cQMVdQOOAj@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Mar 2026 08:08:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9m6j8SLdCSssoNz-0pKV0UnoN1zgxFXfTJZ-btpyb3pw@mail.gmail.com>
X-Gm-Features: AaiRm52ANdTn0fvMcSTQQ1FwbacODXwuEYz9XpK7qKoGc-5JjfYGC2vJVSV3zvs
Message-ID: <CAKYAXd9m6j8SLdCSssoNz-0pKV0UnoN1zgxFXfTJZ-btpyb3pw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the fs-next tree
To: Mark Brown <broonie@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 11:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
Hi Mark,
>
> After merging the fs-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> /tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
> /tmp/next/build/fs/ntfs/file.c:657:13: error: implicit declaration of fun=
ction 'vma_desc_test_flags'; did you mean 'vma_desc_set_flags'? [-Wimplicit=
-function-declaration]
>   657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
>       |             ^~~~~~~~~~~~~~~~~~~
>       |             vma_desc_set_flags
>
> Caused by an interaction with commit:
>
>   2c3b5ea7028fa (mm: reintroduce vma_desc_test() as a singular flag test)
>
> from one of the mm trees, I've fixed it up as below and can carry as
> needed.
>
> commit 8cbd256f4ac9d0b08b6fc30b305cfcb51b9de9f7
> Author: Mark Brown <broonie@kernel.org>
> Date:   Mon Mar 9 13:24:55 2026 +0000
>
>     ntfs: Fix up mm merge
>
>     /tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
>     /tmp/next/build/fs/ntfs/file.c:657:13: error: implicit declaration of=
 function 'vma_desc_test_flags'; did you mean 'vma_desc_set_flags'? [-Wimpl=
icit-function-declaration]
>       657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
>           |             ^~~~~~~~~~~~~~~~~~~
>
>     Signed-off-by: Mark Brown <broonie@kernel.org>
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 2735780159999..e5b897a6c1e15 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -654,7 +654,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc=
 *desc)
>         if (NInoCompressed(NTFS_I(inode)))
>                 return -EOPNOTSUPP;
>
> -       if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
> +       if (vma_desc_test(desc, VMA_WRITE_BIT)) {
>                 struct inode *inode =3D file_inode(file);
>                 loff_t from, to;
>                 int err;
Looks good to me:)
Thanks for fixing it up and carrying the patch!
