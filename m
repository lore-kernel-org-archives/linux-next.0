Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996737D128;
	Fri, 27 Mar 2026 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639657; cv=none; b=k0v00XhXw6VrdljS2WeFskgQfPslp8hvDYLLHfqZ5UkA/sQ63RSD2uqm38ISpTm7MEjlpRDN9oSqlNnKqR67rvo9C/XUbV19fqIX1LYsWxPJzdtOG1O/HRpPaW0Xdv21OwZUn7nMkLSv94PIY9Gp7d2LC1Lggi5yGtIYkLRP/tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639657; c=relaxed/simple;
	bh=g9r1gnUcIW0gzRfE6KOJKIbcn0zuU2bf8vBXZIOcX3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCHhyWO442/ZZR9RWI6f+HJGDOLUwRBQacxQpfBYTDTaKOuaqtLIH1J03prF3HQTVhJ6y+WXmPVuRKtuFzsOwCm+zifPUPtCM6YbdQyWFJzEAREiFWZW82+4RTncoFvr+50m8pmJND9e3BttDs0U6AqZjz+e209S0+sxfhNkfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hknqp70l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hknqp70l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D044C19423;
	Fri, 27 Mar 2026 19:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774639656;
	bh=g9r1gnUcIW0gzRfE6KOJKIbcn0zuU2bf8vBXZIOcX3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hknqp70lgFm0KyBLlrJG9rInS7GC+Fp4c4mT8+f9JyqlFzvbE8x09r1fzgPyzVNWv
	 q7mdBOM6/HR4hN0sgp05wPF/EPyWZEwqbibFA971XyXtxVyZTjaixlP7CjtgNUqo1I
	 L+qMaIClDU3Ml3GTpzI0HXjBMEIEdMTji4ZqR1H1w9eGau7kLNiP4UanPlrQH5yO9B
	 cwR91AS+h+NDp0AIH0H/vV85r3sY44ipKh9fiTAhw8c891a2SAxv7FC4silX2FetRE
	 /fz3b+YbYlwAuF42SF6Pny545qBYEOxSTuew9GhkuSUdD3ngmsf5bPaQMJBjbYMYC8
	 0SKCYXs95r9kw==
Date: Fri, 27 Mar 2026 19:27:32 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fs-next tree
Message-ID: <4216ecfd-1407-4bd2-9feb-2b14ea5f26f6@lucifer.local>
References: <acbY5CCmsk8C95m5@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbY5CCmsk8C95m5@sirena.co.uk>

On Fri, Mar 27, 2026 at 07:22:12PM +0000, Mark Brown wrote:
> Hi all,
>
> After merging the fs-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/fs/exfat/file.c: In function 'exfat_file_mmap_prepare':
> /tmp/next/build/fs/exfat/file.c:842:13: error: implicit
> declaration of function 'vma_desc_test_flags'; did you mean
> 'vma_desc_set_flags'? [-Wimplicit-function-declaration]
>   842 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
>       |             ^~~~~~~~~~~~~~~~~~~ vma_desc_set_flags
>
> Caused by commit
>
>   9b373eacd6e6c4 (exfat: add iomap buffered I/O support)
>
> from the exfat tree interacting with
>
>   2c3b5ea7028fa (mm: reintroduce vma_desc_test() as a singular flag test)
>
> from one of the mm trees.  I have applied a fixup which I can carry as
> needed.
>
> From c4935dbc4b15a9119616ac73b17eff29a7e2ec87 Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Fri, 27 Mar 2026 19:08:13 +0000
> Subject: [PATCH] exfat: Fix up merge with mm
>
> /tmp/next/build/fs/exfat/file.c: In function 'exfat_file_mmap_prepare':
> /tmp/next/build/fs/exfat/file.c:842:13: error: implicit
> declaration of function 'vma_desc_test_flags'; did you mean
> 'vma_desc_set_flags'? [-Wimplicit-function-declaration]
>   842 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
>       |             ^~~~~~~~~~~~~~~~~~~ vma_desc_set_flags
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  fs/exfat/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 9a30c32b3a0526..82db5ebaaad7b7 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -839,7 +839,7 @@ static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>  	if (unlikely(exfat_forced_shutdown(file_inode(desc->file)->i_sb)))
>  		return -EIO;
>
> -	if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
> +	if (vma_desc_test(desc, VMA_WRITE_BIT)) {

LGTM, Cheers!

>  		struct inode *inode = file_inode(file);
>  		loff_t from, to;
>  		int err;
> --
> 2.47.3
>
