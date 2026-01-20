Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A3425CC2;
	Tue, 20 Jan 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910882; cv=none; b=U3yhX416Bc8BqEYzEsxFe1YrenM9AFymwB28+TniqzzuPIbiKKFZ8JuWSjf+lvEI25WpIOXRE7wATqGhNQs822OQ0HkTDTjW/vtlEOxGmjUTRvusMn3r/bOKTt+/WzrHUGJ3xxalndV8KakvOOVnQlAFWJbE23u1SCI7gEj33aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910882; c=relaxed/simple;
	bh=uE11EJFef5IsoMT7JjaxYon3qgH9JXUd9zs4rn5vFVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWAo+/kPO/At7pmgHxxx/HOOx1Lyz59I/lXeCwG7de7WDR8m9PxdZ8eFIuyYkZtViJ+7cUmIFBSKutfp4Uj5+2opaMPQ7/pyKp2wzPpu8GQg/L7eV+DhuZ8fepyywE27bkYQAYVM5GIX/JdGiGyqoo6LFfqwbiO+FgSGglzjid8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r90PrAJ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r90PrAJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9832CC16AAE;
	Tue, 20 Jan 2026 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910881;
	bh=uE11EJFef5IsoMT7JjaxYon3qgH9JXUd9zs4rn5vFVw=;
	h=Date:From:To:Cc:Subject:From;
	b=r90PrAJ1KwUGz4XBMq/bmj5hZFNde3g4gtwANdtYWfYvMDhUFZhahM72idNkQTs8W
	 wQZusMuQdlyBXOVDWpOUg3wIWhG5brwimiddgtm3WL7Tcnjb4+KO6h7DwgjXpmrFgb
	 GChBm+q1FfMcoOrupIS1E6QxJpwk5ctdNniSx1+8xbsOMz9LFfcMeupbzFajuyHzIp
	 c1JW8OaodEPv+stWfpGV/6+0V9TjaE9GKCVUEU4MMjrFsOlLItp1FjtGrCk08ODMAr
	 cl+6iGcpWphBzQqtwJQuMVjd2+DY7RR7XTE9fgZpJ/ctLBq7iAEnjPRdDG5gOf2MFe
	 qsH84CF4H0inA==
Date: Tue, 20 Jan 2026 12:07:58 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>, Boris Burkov <boris@bur.io>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <aW9wHq0fs8KpLCyj@sirena.org.uk>
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

/tmp/next/build/fs/btrfs/free-space-tree.c: In function 'btrfs_delete_orphan_free_space_entries':
/tmp/next/build/fs/btrfs/free-space-tree.c:1765:9: error: implicit declaration of function 'BTRFS_PATH_AUTO_RELEASE'; did you mean 'BTRFS_PATH_AUTO_FREE'? [-Wimplicit-function-declaration]
 1765 |         BTRFS_PATH_AUTO_RELEASE(path);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
      |         BTRFS_PATH_AUTO_FREE
/tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: error: 'path' undeclared (first use in this function)
 1765 |         BTRFS_PATH_AUTO_RELEASE(path);
      |                                 ^~~~
/tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: note: each undeclared identifier is reported only once for each function it appears in
/tmp/next/build/fs/btrfs/free-space-tree.c:1817:1: error: control reaches end of non-void function [-Werror=return-type]
 1817 | }
      | ^
cc1: some warnings being treated as errors

Caused by commit

   7fcf8455f610b (btrfs: reject new transactions if the fs is fully read-only)

I have used the version from 20260119 instead.
