Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EEA334C33;
	Tue, 10 Mar 2026 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169607; cv=none; b=ssrgMt4a1BC91Pg3HL8FQT1V5vorPdFAIMXDC3Ayvtdzk4jw+25ItfeZySw8qf/QjMyJRdcb0HkMovTnJZZIl4m9Q7On0ukHjb6VjtGuPgpzCMtdnJx7BfyuPbp8Bytj5TJ9SkV+ntYFW4Cm2tCJabiHhvRtdnbs6/lUar5Iwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169607; c=relaxed/simple;
	bh=yGJifDF745OAPYfkYe+0BqcyfYv9fP9RdXtVJ1TpHpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3r0iwdQkQKWxmCQzgj38QJ+BqhZfU08tWZ2SwyIEYhZnPPDYfQ5gzpvs0DMCEqYC6zfWSkJ+Fd5OfRMYESL3abz+dSSHzJWYRNP4X52J8UxRUVXhdzVXOeFg73bfuD23OodKrKm5xvP7TsYFx7gZHUVCjR45HTvj2Nds+2O+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/Mag5bw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/Mag5bw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9E5C19423;
	Tue, 10 Mar 2026 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169606;
	bh=yGJifDF745OAPYfkYe+0BqcyfYv9fP9RdXtVJ1TpHpc=;
	h=Date:From:To:Cc:Subject:From;
	b=P/Mag5bwnifv431WC16HlzNliVlLMzA2Edw8GuFIHeZKvXkoKCB6KMMtDksMXJlNK
	 ZfvMw4Nzfc7yHMFF01JPyv/9TzY+eVWkHGnkMMj6P9aaUepttrQIB4Vi966qEGs++H
	 X+jjKKo2dBu8na+JAkL62A49pO2EKyq13RrKDMFJnYCaNJBYBVE/8WD4KuJH1GEO/p
	 LOF06GXr0pwjCXNlxMeP9fSQIs3MiW8kbJL87sVAbZGVB8cobyNQNDAjR1LsPzhj4l
	 j80bgNb8QqYfiS5wFUVWCPbrf21n2Lhgi3NnVptX8a8SJmEYMOkS4ARVxn41dIi1um
	 f06L1krL0N8EQ==
Date: Tue, 10 Mar 2026 19:06:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the efi tree
Message-ID: <abBrwtoAg8oKcImt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the efi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/firmware/efi/efi.c: In function 'efi_mem_type':
/tmp/next/build/drivers/firmware/efi/efi.c:1009:44: error: passing argument 2 of 'efi_mem_desc_lookup' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
 1009 |         if (efi_mem_desc_lookup(phys_addr, &md))
      |                                            ^~~
In file included from /tmp/next/build/drivers/firmware/efi/efi.c:22:
/tmp/next/build/include/linux/efi.h:757:66: note: expected 'efi_memory_desc_t *' but argument is of type 'const efi_memory_desc_t *'
  757 | extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md);
      |                                               ~~~~~~~~~~~~~~~~~~~^~~~~~

Caused by commit

  5992265762e66 (efi: make efi_mem_type() and efi_mem_attributes() work on Xen PV)

I have used the tree from 20260309 instead.
