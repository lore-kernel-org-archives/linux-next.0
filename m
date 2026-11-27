Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813448;
	b=0sH39pGHSS3lC1pJKvb73k6DKOlYuDcw/nz4UdVjDLIiMlonM4b/9MvZbV5RmKTBjgMI
	 4kQtucVpXMD+rIV8742+SbazhWlmYXuxn9EFNN6mF2Bq2Ng4k7JH1tadh9sOPk6TNR2Ip
	 pO74sQ0PVm5BpMvVDFoR8Sxb5J+Qf6VxjvN9NpH/WbqJivk+nQfpjSKlLZPDL46EgMcNk
	 u3HHDsZFE4NvEFZum52TxWt/xKC1aaxQnBuI2HqrIsnXWge9deOJPyGnT8qluAZe5s9yg
	 U0RAlk97/hBuuTxy27MNZJel9I8709lzNUuKopsvUcK2mkTu0ZF0d/KjS8S/z5A9OBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813448;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GAoq+RcQ0Lw22y6awH5Xbvi9EvBxYPh9wHpeY9E3FxI=;
	b=aR9hT3h6qgI/qqILyY4sO2tkw9DQCafefd3wlpPcDjvQ2aegtBbAe/S3+S9AmQ5EevC2
	 AfVrpWdUnSw07Oxdl3aokkwcL51YDd9tzsnXQzr15iz1qokDp+AYhuiQmS20Vo5Sg7XDs
	 UokjvKBKzLMacOc835/vzsVXc+v8nBErkNmwP3APilfkkiP4XQwtfSuWrYzVSPgwtxty1
	 LDZEcOu7E1DNzFGu4v0QEa7Pj0loQZkufhImig4fbHtd6vi6JWmN/hBR496uuPQJsXwZ2
	 OLRqIO2n9AhLCc/QvB/+2utqKLJfVBEgSPnnXCc/fImSlM4J1F390N2NGrdw5E+B+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NiW4+rWe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3A606A31C;
	Fri, 27 Nov 2026 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NiW4+rWe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9719D1F00898;
	Fri, 27 Nov 2026 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795813447;
	bh=GAoq+RcQ0Lw22y6awH5Xbvi9EvBxYPh9wHpeY9E3FxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NiW4+rWe5FKOvFuS5i/sWpWIC14QYmqQsAmnHWhZP1YVkYKstuKxXNLvB82dQdwPC
	 iqjxX24800k5rGzbu+ENQw/67Mjvr3oQTYop3E9qEzoNszhLgqWotuQiS/v8vvwY9D
	 CbF2UbPyeYm8GylNmj0DQSVFCdtlKea8Wu1+oBLw=
Date: Fri, 27 Nov 2026 13:04:07 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Chad Aldreda <ca@modelmiser.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: linux-next: manual merge of the mm tree with the origin tree
Message-Id: <20261127130407.a16eb8d76a635c13b024d234@linux-foundation.org>
In-Reply-To: <awmTUV81zRGpj0Tu@sirena.org.uk>
References: <awmTUV81zRGpj0Tu@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Nov 2026 14:27:29 +0000 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm tree got a conflict in:
> 
>   drivers/ptp/ptp_vmclock.c
> 
> between commit:
> 
>   e6474ead54b8a ("ptp: vmclock: keep the device state until the last file is closed")
> 
> from the origin tree and commit:
> 
>   92cdcfbf70344 ("ptp: vmclock: convert mmap hook to mmap_prepare")
> 
> from the mm tree.
> 

Yup, thanks.  I've resynced with upstream, hit the same thing and
resolved it thusly:

static int vmclock_miscdev_mmap_prepare(struct vm_area_desc *desc)
{
	struct vmclock_file_state *fst = desc->file->private_data;
	struct vmclock_state *st = fst->st;

	if (READ_ONCE(st->removed))
		return -ENODEV;

	if (!vma_desc_test(desc, VMA_READ_BIT) ||
	    vma_desc_test(desc, VMA_WRITE_BIT))
		return -EROFS;

	/*
	 * Restrict the read-only mapping so it cannot be upgraded to
	 * writable later with mprotect().
	 */
	vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);

	if (vma_desc_size(desc) != PAGE_SIZE || desc->pgoff)
		return -EINVAL;

	mmap_action_ioremap_full(desc, st->res.start >> PAGE_SHIFT);
	desc->action.error_override = -EAGAIN;

	return 0;
}

