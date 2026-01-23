Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA72652B6;
	Fri, 23 Jan 2026 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769190183; cv=none; b=dJh6LN+S9D4nQ4FwjjlzSK1yBBbJB6bLej9Vqt0XApIZfeod76DRXFG6DkPda+SkLOcE39+X+tyDi8BhrPGMjjdgqdFZYhvZ8g83ECEpR32DgE2wsoG/ku7wAi52Zv156JnU7Hlu+ElW6j+8w6/q15ZS1pWIY6uMqBwYUJcP2mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769190183; c=relaxed/simple;
	bh=FQYhr2rxEtvxx5dj0UjbQ+jBRiNZsXlWZ1dYSQlSL9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LimRi7+AVI8zrVw6h4ZDU/Z7eoMO6uRSoFWzosTyOju0kBKDnSfJcJ9PUSaZ8vY0Lts7UsVRlpbaeUS0o7qCKytPsQOlwM9aZojSqeu7dMRFRReYxwuiGFmH0h72XBj+LxYa+l4xYt6VVeqDUNytX1AKMyWtKekzm0DN+f2Cs4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfKb6wy0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfKb6wy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A1BC4CEF1;
	Fri, 23 Jan 2026 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190183;
	bh=FQYhr2rxEtvxx5dj0UjbQ+jBRiNZsXlWZ1dYSQlSL9s=;
	h=Date:From:To:Cc:Subject:From;
	b=IfKb6wy0ngHYBAjYknDO5UiyUN+l6u/T4pGORMtqmSxAMjSAr96fyl8jaOs0EFjBq
	 38ozpgpvjbhe+hH0PA5z7LP3Rb5dVnTTKBEF4GwZV9nDFGxDwUlPYr9by65cl2lGRJ
	 iSiyVQnCYuWlzDtVoYWgLLrKAisH6fbZs7O/XNSYpJ/LBggsRLCfazR+OBUl6sRT5a
	 lka/xfFq7+lFz3L4XWeTUrZdZl6nfwqG3n3vd6DOrFMuY735U4QRVeJRKZsuYhrB9L
	 xfNsZRAh0ZZ7C43T+u6VX+5bTQuqRXOmj06Xc/ffJqWfwLM4deG8tzGhKDcEeInuXE
	 dGsVR2LiV25ag==
Date: Fri, 23 Jan 2026 17:42:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <aXOzI6sVTBTdJE5j@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the block tree, today's linux-next build (x86 allmodconfig)
failed like this:

In file included from /tmp/next/build/include/linux/string.h:386,
                 from /tmp/next/build/include/linux/bitmap.h:13,
                 from /tmp/next/build/include/linux/cpumask.h:11,
                 from /tmp/next/build/arch/x86/include/asm/paravirt.h:21,
                 from /tmp/next/build/arch/x86/include/asm/cpuid/api.h:57,
                 from /tmp/next/build/arch/x86/include/asm/processor.h:19,
                 from /tmp/next/build/include/linux/sched.h:13,
                 from /tmp/next/build/include/linux/io_uring.h:5,
                 from /tmp/next/build/io_uring/bpf_filter.c:7:
In function 'fortify_memset_chk',
    inlined from 'io_uring_populate_bpf_ctx' at /tmp/next/build/io_uring/bpf_filter.c:33:2:
/tmp/next/build/include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
  480 |                         __write_overflow_field(p_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  f1e3672e49e2c (io_uring: add support for BPF filtering for opcode restrictions)

I have used the tree from 20260122 instead.
