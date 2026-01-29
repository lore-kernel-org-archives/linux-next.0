Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D442E2665;
	Thu, 29 Jan 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769691079; cv=none; b=oCmDCdqaXNbmZssn6KnNuL588bJvZWpW7l8l3gkOrUz/fyp7Dkp2k2b3ofTtjpSj0mCqXewWIWpr1Ycn97fqk/2W9fU4zIJEKX+yrP++Mqhne1Xo3gXL79frDkUHkHT8x7tKgcYcQe05XIL/BFPr8/SIe80Gu4pra799IMsklMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769691079; c=relaxed/simple;
	bh=gytquQeBkKU73EH8XBR+K0TT7uQ14NH8JiSoNEVhmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=blOzmwpKQfOZ4blqQpmL1vg76GeYbmwIEIdh6Y8mu6psGZ6FsQscoBJSKheaRiUZsLIYiKhtSuzmqk7d8pfIQ/NwdfAT95PzHYfK5DAm6DOuavLXgVMShEJTR3ob3XbvQ8nk4iS3ebAk5Zc5f6fwG5ioB2R84IJB76amF4yBh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRUhxob0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRUhxob0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBB9C4CEF7;
	Thu, 29 Jan 2026 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769691079;
	bh=gytquQeBkKU73EH8XBR+K0TT7uQ14NH8JiSoNEVhmoc=;
	h=Date:From:To:Cc:Subject:From;
	b=oRUhxob0jeW0hxZ0TQ3wqN0qycdnZrhyo7kOVFrMUHuhI+l5/qNHr911kr2G7BRW+
	 f1fTYAf3kQq4weL0TA1SrcOVqbSHDqUeC0uDqbWHae65OSuc9ea8khUzo0vMDMVzx0
	 cI0jPIFzV99lcA+EaB0tXwAVSiCPERR3f26cCcCGGxNxCgs91+EbUcSuUQXu/P3BOa
	 3xB+GlIRGq+p85fXbUVJ9G+TxavQnoen1bhId/2Ni4WHQm4VwlJ1ZBBmUPyz07UfFh
	 NwIVuEjKJecqv877QqSlztVdcLhfnePmrFMOFIU+2fJuK69CKEf1gQJGf5pSmximxs
	 NHEtokuW3TFFQ==
Date: Thu, 29 Jan 2026 12:51:15 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <aXtXw3_wMDnrrOxW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the btrfs-fixes tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/fs/btrfs/bio.c: In function 'btrfs_split_bio':
/tmp/next/build/fs/btrfs/bio.c:102:13: error: 'struct btrfs_bio' has no member named 'can_use_append'
  102 |         bbio->can_use_append = orig_bbio->can_use_append;
      |             ^~
/tmp/next/build/fs/btrfs/bio.c:102:41: error: 'struct btrfs_bio' has no member named 'can_use_append'
  102 |         bbio->can_use_append = orig_bbio->can_use_append;
      |                                         ^~
/tmp/next/build/fs/btrfs/bio.c:104:13: error: 'struct btrfs_bio' has no member named 'is_remap'
  104 |         bbio->is_remap = orig_bbio->is_remap;
      |             ^~
/tmp/next/build/fs/btrfs/bio.c:104:35: error: 'struct btrfs_bio' has no member named 'is_remap'
  104 |         bbio->is_remap = orig_bbio->is_remap;
      |                                   ^~

Caused by commit

   4b40b1c47f937 (btrfs: fix copying the flags of btrfs_bio after split)

I have used the version from 20260128 instead.

