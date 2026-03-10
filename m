Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F8730E84A;
	Tue, 10 Mar 2026 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127315; cv=none; b=BlusGggKGwrc+MD2HxTgDaXBVHsW/1xFQ08j0QCZXGkqbGUksKpJnZd1O9Pn/jX/ZbFGzM3GVdBYdqTz0wC+SQ1uaj9fbEcJHLYXoizmfW2Tbr5fY/koLi8gZE7F2VDV6/S2T/Ahq20AkN/ORuy02y9MCIUNZ/CxU0L+zQEAH34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127315; c=relaxed/simple;
	bh=MvV1Wk78lGLoTR94hVyg/dKZVwTBxGJOmiAbGOp9TmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9sLjg9bjfc5FWzsJnqrkbxgCbXtChBDhGbb1gn9DeEmIjwFN/am5Tldkzv3Nl5gt2cW4w26uwflXPgbjSBZjQm8U9/VDOA0N6tZvrUkK2t18+xx1T5DU4yr6iYmYV6Tx59is2OeMkWxeKO6IzlFd59f9JGjtPIBci7iGtdmlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gE+jABmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gE+jABmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276FFC19423;
	Tue, 10 Mar 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773127314;
	bh=MvV1Wk78lGLoTR94hVyg/dKZVwTBxGJOmiAbGOp9TmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gE+jABmccARgzhx7aLNSZY0Izhf0PIS5QjlIZrGh6fl3RugdXLbHRCkS1kbo9RrJf
	 Vgrw2K4S4Uqy9WE/KDn/zBz5u205LEAa8ap28nONThSYI9hx8ayIBUyKpH76KWuIyj
	 qpWzo2k8ULrq3Xy+U6K2CcfKSWELcnFYLVf9A1x/DUBaa8rOMgmUo3mcxHKpfKTOql
	 kjGJIupcub3UPFFEC10024Q4CaEp+Pr0HqZU4aK/53lR9AnZukMh209oXEG4iRYVhO
	 VS3tmDy1Lxp2fR81BHK2hx0ZnEN3UPc4QTksD5K/ZSY2fk5X3US6TBJ5Tit+E35++7
	 RYS0b729CxRog==
Date: Tue, 10 Mar 2026 07:21:49 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fs-next tree
Message-ID: <2d3c6e48-5573-44fe-ab0c-26ca4a20cd0c@lucifer.local>
References: <aa7ZT-cQMVdQOOAj@sirena.org.uk>
 <CAKYAXd9m6j8SLdCSssoNz-0pKV0UnoN1zgxFXfTJZ-btpyb3pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKYAXd9m6j8SLdCSssoNz-0pKV0UnoN1zgxFXfTJZ-btpyb3pw@mail.gmail.com>

On Tue, Mar 10, 2026 at 08:08:22AM +0900, Namjae Jeon wrote:
> On Mon, Mar 9, 2026 at 11:29 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi all,
> Hi Mark,
> >
> > After merging the fs-next tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > /tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
> > /tmp/next/build/fs/ntfs/file.c:657:13: error: implicit declaration of function 'vma_desc_test_flags'; did you mean 'vma_desc_set_flags'? [-Wimplicit-function-declaration]
> >   657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
> >       |             ^~~~~~~~~~~~~~~~~~~
> >       |             vma_desc_set_flags
> >
> > Caused by an interaction with commit:
> >
> >   2c3b5ea7028fa (mm: reintroduce vma_desc_test() as a singular flag test)
> >
> > from one of the mm trees, I've fixed it up as below and can carry as
> > needed.
> >
> > commit 8cbd256f4ac9d0b08b6fc30b305cfcb51b9de9f7
> > Author: Mark Brown <broonie@kernel.org>
> > Date:   Mon Mar 9 13:24:55 2026 +0000
> >
> >     ntfs: Fix up mm merge
> >
> >     /tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
> >     /tmp/next/build/fs/ntfs/file.c:657:13: error: implicit declaration of function 'vma_desc_test_flags'; did you mean 'vma_desc_set_flags'? [-Wimplicit-function-declaration]
> >       657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
> >           |             ^~~~~~~~~~~~~~~~~~~
> >
> >     Signed-off-by: Mark Brown <broonie@kernel.org>
> >
> > diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> > index 2735780159999..e5b897a6c1e15 100644
> > --- a/fs/ntfs/file.c
> > +++ b/fs/ntfs/file.c
> > @@ -654,7 +654,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
> >         if (NInoCompressed(NTFS_I(inode)))
> >                 return -EOPNOTSUPP;
> >
> > -       if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
> > +       if (vma_desc_test(desc, VMA_WRITE_BIT)) {
> >                 struct inode *inode = file_inode(file);
> >                 loff_t from, to;
> >                 int err;
> Looks good to me:)
> Thanks for fixing it up and carrying the patch!

Me too, thanks guys, and sorry for the noise!

Cheers, Lorenzo
