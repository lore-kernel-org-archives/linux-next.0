Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5222A3E8C74
	for <linux-next@vger.kernel.org>; Tue, 28 Apr 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371929; cv=none; b=iRMrJieS5Uj5wuT1Jd5cBZ+zaeanQnUIT4lAWCj/WbMlnFjtjf1+sCXjrHI2wGP9j1e/RN6hKgW6iio5StaSX0QSKoviTdnbhdtADRuf3KVf+QvrTKNZltOfuYDeboK5mYYq9iTYKJ4+ZJCiSDW4VNn3tfxHe7DC5IPYoHMPv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371929; c=relaxed/simple;
	bh=Avy9IVHHt5PgMit/mVrXmnOhWLLkuJOBdwNO/N4xFGQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j4+YOBzhxfIdrwZv1SrVbp9UA/6tn5zxoZ4TDWYAvDsENDondU7w/0jnGVVcREzHpTAfCbuS7Clk2C0Zf2ZshqZ2Vj28jpLZT1si0KvJ5ExnP14JDEljdhBSK9y+9I9/bk3uqN3/SpYB/CsCHqzYeM2/VSMCh5G33dml7S7rK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIehnuYE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIehnuYE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8253EC2BCAF
	for <linux-next@vger.kernel.org>; Tue, 28 Apr 2026 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777371928;
	bh=Avy9IVHHt5PgMit/mVrXmnOhWLLkuJOBdwNO/N4xFGQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RIehnuYE6jUlKMxbC44QvWwm5uk7OGoRpT0hJ32ENQbuGf5whjQmO7zKus54uGJYb
	 EhXZW8bJ9yAq/GOjYByCV8plP6nC1vPjntpRrEOt52rM9PETOhJDshelYFuuvGijsD
	 Wh8gzEqBVVIYjU/zgNpIRFM+yvOIv094lKIcBmN+TREBPBRMo1zXfoI/auCHxYky6i
	 A18XCjIRmlMmaEqwtFd32aAWz+Gl32Cp0S5lPrU/rLUgwZZiQ2qZxjMmvxIkFIT9/s
	 CJXLzc4rKsdJd0xsFCNRojjosmwTxcBDGBeOf7hLNzDHg7KQSg6HpRjKwjhqEXNARL
	 e+eKXDEViZtEw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 99E4BF40068;
	Tue, 28 Apr 2026 06:25:27 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 28 Apr 2026 06:25:27 -0400
X-ME-Sender: <xms:F4vwaf8wfZoEevPD8Y02HQiDqJUAv-I8NcjoIUPBo_S9EoKc-vEjAQ>
    <xme:F4vwaWjK9WnB3kbZC9U-LNn2IXBD2GMMROMvmisXWFTii4JjPyDTyJwBVIm91WeQY
    lsfP0KWTDl6wgTe2r0xF9YuFn93pOcs4qit2sp8QIrgEDps8fkdjf_q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhhihgvrhhrhidrrhgvughinhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:F4vwabgGMJAt5qPfi62AOcyB7Jyt6-m6nfli9V40949tP5tPGxCVsw>
    <xmx:F4vwaYKtrVb5UdRp2lX5mpDqbKgmJgyq1zjJShaMRMf7B1aypris8w>
    <xmx:F4vwaTC2gA-5zBe-L5jXxr5TJqF3xddR57W2VHjag8bDpVtBHbXwEg>
    <xmx:F4vwaQhz6zT-aXhwSEtyWbzOUJR63gI8f8OzJGB2bYrxAchr6tBNRg>
    <xmx:F4vwaTk443p5Z_zqvN12LM6PujwhCkH-KL5iqhn_z4j13NH8fUTQ5Bas>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 786DF70006A; Tue, 28 Apr 2026 06:25:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 12:25:07 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Message-Id: <69bfbb1f-8817-44f8-afe8-5eb04094f634@app.fastmail.com>
In-Reply-To: <20260428102251.3877875-1-thierry.reding@kernel.org>
References: <20260428102251.3877875-1-thierry.reding@kernel.org>
Subject: Re: linux-next: build failure after merge of the efi-fixes tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Thierry,

On Tue, 28 Apr 2026, at 12:22, Thierry Reding wrote:
> Hi all,
>
> After merging the efi-fixes tree, today's linux-next build (all of them)
> failed like this:
>
>     /srv/kbuild/next/linux.git/fs/efivarfs/super.c: In function 
> 'efivarfs_d_hash':
>     /srv/kbuild/next/linux.git/fs/efivarfs/super.c:183:20: error: 
> assignment of member 'hash' in read-only object
>       183 |         qstr->hash = end_name_hash(hash);
>           |                    ^
>     /srv/kbuild/next/linux.git/fs/efivarfs/super.c: At top level:
>     /srv/kbuild/next/linux.git/fs/efivarfs/super.c:189:19: error: 
> initialization of 'int (*)(const struct dentry *, struct qstr *)' from 
> incompatible pointer type 'int (*)(const struct dentry *, const struct 
> qstr *)' [-Wincompatible-pointer-types]
>       189 |         .d_hash = efivarfs_d_hash,
>           |                   ^~~~~~~~~~~~~~~
> Caused by commit
>
>     9c7c5eec5bca ("efivarfs: use QSTR() in efivarfs_alloc_dentry")
>
> and like this:
>
>     arm-linux-gnueabihf-ld: 
> drivers/firmware/efi/libstub/relocate.stub.o: in function 
> `efi_relocate_kernel':
>     
> /srv/kbuild/next/linux.git/drivers/firmware/efi/libstub/relocate.c:161:(.text+0x278): 
> undefined reference to `efi_cache_sync_image'
>     arm-linux-gnueabihf-ld: arch/arm/boot/compressed/vmlinux: hidden 
> symbol `efi_cache_sync_image' isn't defined
>     arm-linux-gnueabihf-ld: final link failed: bad value
>
> Caused by commit
>
>     4db2b7fdd6c9 ("efi/libstub: Synchronize instruction cache after 
> kernel relocation")
>
> I've fixed up both issues with the following patches, please squash these
> or equivalent changes into your tree to fix this.
>

Apologies for the breakage.

I'll drop these for now.
