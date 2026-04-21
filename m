Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA593845AD;
	Tue, 21 Apr 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776403; cv=none; b=WO856zo0B09+yPX1/v8pebdIGfcjyloOSgfYkUyUnE+xMK62/gTU6ZgXd0rNRe3zMSS+mYwhm8MX1aTNh7hu29mwUaZ9BV+9iv+pkxiLscSoyfqjc1FCjyH6/up3wEjGwJVC5PK0I5nCa90WYVeZS0PJPyk1wYsCs5pPteaSkYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776403; c=relaxed/simple;
	bh=+fNffo3uHZyj/YNFnAyE/9UvmwHwMraB40GEmRlkgdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=odHczHNuQR0JTVkbjxLG3j4IPtqAWgPiubVWJu85nhEE0MgETx7GhxMyw3s9v+LLHyYXYWH5VFTlZxsCDIdImpTgoq6wyjLzwfpVo8xtkjf3CWpB+9US5HuzVzF0t8W3Ie8azhIo7GYe+awYBlVecS0bNAgj+El1abfMsESyvAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXIvah5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXIvah5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522E9C2BCB0;
	Tue, 21 Apr 2026 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776776403;
	bh=+fNffo3uHZyj/YNFnAyE/9UvmwHwMraB40GEmRlkgdk=;
	h=Date:From:To:Cc:Subject:From;
	b=TXIvah5ew4aPfGJsjb9mUIbneGC7GvQS0OJFMOGDkbNiwMZn+aBv1/6X2jVSNvaOm
	 ZWwzZyCzZpGaDgYFhOkOv3/kn3gNglq8b6yVccLQOO4b2jCuGulxI1Orknp3wbNDnu
	 Bd5hM1cym9caV6t6ngNOGKUa7UyZDLP1fHKlCy1jSYJCr6pnSygsUwoYxKQ26rPMLq
	 7ujkEL1+FiMdAM22eoWose1D/AUXU3mOEdyZ0ayXil9fTKazajrt+BGxohKePIArBI
	 /yR2aUJF8uAUvOWUooEAZk+QCOnXNNc0alsNGd/LS8S9xxNMTWT6pya3ATGzuBoo2m
	 wIoi53/JjZWrw==
Date: Tue, 21 Apr 2026 13:59:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <aed0zrXLgMtO33NQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (arm64
allnoconfig) failed like this:

ld: Unexpected GOT/PLT entries detected!
ld: Unexpected run-time procedure linkages detected!
ld: arch/arm64/mm/fault.o: in function `tag_clear_highpages':
fault.c:(.text+0xc40): undefined reference to `mte_clear_page_tags'

Caused by commit

  99e63a49650cc (mm/page_alloc: fix initialization of tags of the huge zero folio with init_on_free)

I have used the version from next-20260420 instead.  The commit removed
the system_supports_mte() check from tag_clear_highpages() which makes
the MTE operations in the function unconditional and goes badly when MTE
is disabled in Kconfig, the system_supports_mte() check should be added
back.
