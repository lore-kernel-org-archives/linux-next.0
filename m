Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B06336EE9;
	Mon, 26 Jan 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445690; cv=none; b=DPFlgxH8FmIC1+B0zun3I80XnF9GPupOSHzPO7Zt4Wu+jiVI/GucROFCJL4rIUN7gHaDITkfI27FkOU//XhcyNKRWebiNmt69X4wjXTfc86KzdZks36ZLgic/vHqGTayomo90xmNtDLL3FqhUgNy+vl+tN5Kh7IN4dpNAGg8iic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445690; c=relaxed/simple;
	bh=Z74lkMJb3I9UKlJrSNVP86KkQlF+aZZsJUIMVfLvrVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N28KgTOz6ixGDHvI6qaNNWaary56QBRMKBxEROSqtB1SjhZWyOF9I92fZXoAnNt8FzVKimTYm+Ah3FWCfBoKS3/cY7pEwMFhOZEz8V1KvZdrc7HCVhonlWUaPVYGhYL6IZGHHTbY0JBNb8Q9H97nHwduadOEUx77kRJ0u3W9RB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljWBMUeF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljWBMUeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A446C116C6;
	Mon, 26 Jan 2026 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445689;
	bh=Z74lkMJb3I9UKlJrSNVP86KkQlF+aZZsJUIMVfLvrVA=;
	h=Date:From:To:Cc:Subject:From;
	b=ljWBMUeFBnpUQcFtzkEuIe4gZVvUkq7BqaapwOKnNQmVPy4Pmb4goUF/EymyhNfli
	 M3BQLE9tr9QjgZO59vIeZC89hoGfBVxVD30+wStJgBM+pYjvpai+/BTeli461zUaEe
	 vtMWCVBphR3KMGwO3JV0kYqSoq1OTU+fP3fWfGdxj4731vkNoN09z6Vk7jgOIzx0qU
	 1EQswfWX6x5tvxZBczTjvHOc6bzybkKnDOkdSHcWbt7bxqZthfkjhm4stxJKkipfa8
	 H5G3mu620Pyis4y1inahOvXbNH4onOByfvwNSXs/l/CfpM4mHdvw0T50TJeMWhbLzv
	 RZU2/RVMGLnwA==
Date: Mon, 26 Jan 2026 16:41:25 +0000
From: Mark <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: linux-next: manual merge of the fs-next tree with the mm-unstable
 tree
Message-ID: <aXeZNSiVv82Gc9HF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/ntfs3/file.c

between commit:

  77a150da4e780 ("mm: update all remaining mmap_prepare users to use vma_flags_t")

from the mm-unstable tree and commit:

  9d5403b1036cd ("fs: convert most other generic_file_*mmap() users to .mmap_prepare()")
  099ef9ab9203d (fs/ntfs3: implement iomap-based file operations)

from the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ntfs3/file.c
index 2902fc6d9a85d,571ee85e82594..0000000000000
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@@ -346,8 -246,7 +246,7 @@@ static int ntfs_file_mmap_prepare(struc
  	struct file *file = desc->file;
  	struct inode *inode = file_inode(file);
  	struct ntfs_inode *ni = ntfs_i(inode);
- 	u64 from = ((u64)desc->pgoff << PAGE_SHIFT);
 -	bool rw = desc->vm_flags & VM_WRITE;
 +	const bool rw = vma_desc_test_flags(desc, VMA_WRITE_BIT);
  	int err;
  
  	/* Avoid any operation if inode is bad. */
