Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8891DB551;
	Tue, 16 Jun 2026 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618444; cv=none; b=GoxhhYuCyLejgIPIlajyqYg9+wPITWI8oSEVNSTeOAeanhkQUQPPBTNk46jniTMvjwmW6TDEwJ3MOqpfre+DSo4bKo0L9jcoMi2R5iq5+jhJu/FsyQJ2hZh3eSPdOee/gXgofN4YnF4JUZElWBKoX16SY1QaQtdL27c/QBhOWMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618444; c=relaxed/simple;
	bh=4amIxfdWcLLrH8+SuxcKnp80wxGqQnyby/C34ImCexk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAzUloRI11LmGKgJx/mv+p2xG1p8RQlbgM2su81jfLV8glITTH9F4N0f0qZEDavoEPgaAOck4bp4wrwh3QbDJ7Gnm7eWSn4wov+y07t6Rb3MDcfc4p0CKqy4I+0sPVPnS1vrQ8do6rH8wvpumFeudVTSoxOY6CQwGpubEyhKopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRME9Yki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRME9Yki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694A21F000E9;
	Tue, 16 Jun 2026 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781618443;
	bh=mbef5vtdfTSv4iW/iLjJs5OVAw3OCKaEth2dXLvdjBQ=;
	h=Date:From:To:Cc:Subject;
	b=FRME9YkipDLR8fg/tjlVy/grxAGe89WyYN7VbEr9UguhHY3Z+4dN1NW0pHDHziVZf
	 jhGWZhkax0sXh3jvDUJLFdg/IwEdnh9FDkueXkujipBhyj6mwQ5x0j9LU20oghW26F
	 rZL6b7iDueLwKKUe5Vx83X/9re/s2Ec14AHqJ/T4PS0KujXTqHMxklj3ToSWfcssIm
	 /PJ25qtuom6TM4DOpbww+QlGQzq4RA8KB4pgPjcRTl2XFGxC7t5LnrslvEntAt/z5y
	 ekwP6sgenH0jLNth4giwpcqsegxuPuSFSIT6XdXdmrsuuyeI+a+qgK+QHtvwZalX/k
	 7mhor+kvXbKoQ==
Date: Tue, 16 Jun 2026 15:00:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the origin tree
Message-ID: <ajFXBeLQC96YuC0p@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  io_uring/net.c

between commit:

  9b40ba14edcdf ("Merge tag 'for-7.2/io_uring-20260615' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux")

from the origin tree and commit:

  c59e546eda5aa ("Merge branch 'for-7.2/io_uring' into for-next")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined io_uring/net.c
index 00a7df803b99b,fd51dcaae8ad8..0000000000000
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@@ -1885,7 -1886,7 +1885,7 @@@ out
   * which in turn end up in mnt_want_write() which will grab the fs
   * percpu start write sem. This can trigger a lockdep warning.
   */
 -static int io_bind_file_create(struct sockaddr_storage *addr, int addr_len)
 +static int io_bind_file_create(const struct sockaddr_storage *addr, int addr_len)
  {
  	const struct sockaddr_un *sun;
  
