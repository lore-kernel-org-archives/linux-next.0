Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789920;
	b=M4kekb6vnMKchy7UzpLTMFWQ32CkkYeB/0xLlZ885RJfzraguNbauifNxGlVN7v63ltg
	 ID+/iS16VMPWv29ZM35Ivi9DYFKPwvyUJyX2vg0VJPvY1uUYOfJjEUWu9BtFbunqBDcqj
	 UP/7SfUnjzGzBxH2OlKm/YoWql/ULFG5oo36vNuRRZGhHUZMVEq9LhzJqfS/cypDRM15y
	 D9xOz4Jej3GavinyVymXshGDDdUJ4/kAfoioshW2BG58HimQBt8WdPxr36a6Qx3yaQJND
	 fISN5ns90u2wnSnZgQ5Xd+ogn8JpzFTkcX61yO83CLOBT3b+BhfEAkzApdTsTcYxANw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789920;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KJxBg4ex3H/5HHHxF4SwuodclxPlqLo270nDqwPlSRQ=;
	b=IAlwmnzUQiZ2SjR+kR5rc1NFOOlSgnlzux7vDATjH2ubrNsZKXfqNhE5Wj3QlZ83RkRj
	 5V0JGuO4sEzPKHwCL/15nSHOqVhTFnco9mKS5lxuzmhrcwfAtVyk1LFFtgGiheCgY8V/j
	 0QddnplzAM1VryhCvbVeGAEVJ20z4AprQXwnKkyTvypxLzzQy0yN9bQiKAb5NN5Fr7G0C
	 dH/+NFVd9uert5EpaibAiWmiSmDVluEvAZjur2hvSfyO/cjoN2O/WQAznUxr92DSstj+0
	 jdjp9y8OFqsl3z4nVFMf5LQRtjkYlNlAXDMglJGYRfsqrGDmNDD7/gFrna2IVDLY7sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9f+Oj7B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5C6606A332;
	Fri, 27 Nov 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9f+Oj7B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4B91F00897;
	Fri, 27 Nov 2026 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789919;
	bh=KJxBg4ex3H/5HHHxF4SwuodclxPlqLo270nDqwPlSRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K9f+Oj7B6veiindmLDVpwrL/sZsjJk9kbUNtFl+acbI64BlTuh2izCTO1msVhewt8
	 0pdHEDW9mp92w0J+WPqbmoAHKoyoNrIBH6cKYyTWv0vOC0+Rb3LKVe2OIiR9HTweDH
	 tvgGEQgM2ondlt22CHVDOMXhnY+ERMyYN+P8C9bpqxYLCmtH3dBLzOQ9rKbQuVYqgA
	 09eyBP1723LL/Ihmd2azTKy6XcBgAHpjmjso1jSo6nMR0WuiZkPriOBc7gS5R+uFRZ
	 HRBeSjP4fAfS6o7gpZRnd9KqGk1YUE85v/qC0mY0TkDUIiWVjC87+j/arRn5H6DxTB
	 FCs+ApVtchwcQ==
Date: Fri, 27 Nov 2026 14:31:54 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chad Aldreda <ca@modelmiser.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: linux-next: manual merge of the mm tree with the origin tree
Message-ID: <awmUVZxlVpEy_DwO@gremlin>
References: <awmTUV81zRGpj0Tu@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awmTUV81zRGpj0Tu@sirena.org.uk>

On Fri, Nov 27, 2026 at 02:27:29PM +0000, Mark Brown wrote:
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
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/ptp/ptp_vmclock.c
> index 3e32a90306616,6a1d5f40a5661..0000000000000
> --- a/drivers/ptp/ptp_vmclock.c
> +++ b/drivers/ptp/ptp_vmclock.c
> @@@ -367,15 -364,13 +367,16 @@@ struct vmclock_file_state
>   	atomic_t seq;
>   };
>
> - static int vmclock_miscdev_mmap(struct file *fp, struct vm_area_struct *vma)
> + static int vmclock_miscdev_mmap_prepare(struct vm_area_desc *desc)
>   {
> - 	struct vmclock_file_state *fst = fp->private_data;
> + 	struct vmclock_file_state *fst = desc->file->private_data;
>   	struct vmclock_state *st = fst->st;
>
>  +	if (READ_ONCE(st->removed))
>  +		return -ENODEV;
>  +
> - 	if ((vma->vm_flags & (VM_READ|VM_WRITE)) != VM_READ)
> + 	if (!vma_desc_test(desc, VMA_READ_BIT) ||
> + 	    vma_desc_test(desc, VMA_WRITE_BIT))
>   		return -EROFS;
>
>   	/*

LGTM thanks!

--
Cheers, Lorenzo
