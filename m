Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724342;
	b=f7F++1C5iCXn7dT6JaPPD97os3NeB21kRLoVTM3inl8t4O+0egv6z+P/FoFsgxhmg4uN
	 FDnNovD7pfbQKD9dGuhq3UiIcmz60PIj/OCRcGJsZN0WlkTDYexuETkLDi29zd8PBnUWf
	 8jR04OrockI1TRk4XX65RX4PQtIYXAkKQrCZvIKQGq2t0YCmKTKc5oW+9KIAXKWqbO1Aw
	 Xte2vHhJQSzNbshf5hKVpF6KYaKPG7r5x3LTQFOHjCrTJGZ+8CL+qTPTxZ8rZlovMAEhY
	 MHeiy5mdxvqSlQzuOQ7Td/UA5azJE+vGN/2ihqc/8M0bi5sR/cOqslD25xqurhx8vpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724342;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MAR7LJCS0SUT3RCdSFs4KBM4b+uQalvzyuF8N4kUcD0=;
	b=JUXZQU2Hr3N92k1gF4UGPM2BintWgHAq4UXYX8GAacl0PsV2rrmrcwWCpJ+qoAsS00/P
	 SExtNESqfFDusZFKXCcMaD/lHNucmfNmLxznnjil547sl1ccErl5HUJ+GAygPuaOxUDYD
	 g5csCR1/RtFoCA4jynIO/TL8Wahe9Qc6zRXu7iBec4j9pPPjMaIDHjmhPyhtPXzi4QgWt
	 kiB8J8roS/vGgw0TU4tmoRqDAsXffSDcd9BgLtP0lApy+gOOHJpN+5qnoz1ikyu6Uza3I
	 yRy0RJbIWWqIGrebZskLZta5NkFVNWSUDsTSilz79SrOaN7pWnmkNn/J2WjAdON1VXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SwLq9jEK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7B606A31C;
	Thu, 26 Nov 2026 20:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SwLq9jEK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293931F000C1;
	Thu, 26 Nov 2026 20:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795724341;
	bh=MAR7LJCS0SUT3RCdSFs4KBM4b+uQalvzyuF8N4kUcD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SwLq9jEKlMz6KkGaBndPft5926iaBOJImHZXqwRvTGrypAE1k29/40E3mKG58yguf
	 08+2iQ6ZiePqjKUNKRVXz6H0q27FcZ++fyWOBARYt1UwenDQfkMGbFU1nWNcHOleKT
	 wsoYaMZHXprJgNae+1tkEmjvVDJ+ypODumNtb1Z+WNcHWRLVjMW5kDH6btlx45G2ly
	 GhiHyDsI8jGQYKc696Dvew6v3E0wIVlGZcimFf3aw8acY8a8nE/IYzUVu6n7LJHepp
	 xNiwdjKpbXiVuSu3ibkLCd+CaY9I9hOba5hxeGmf/8aw652OA+O1yRjYQBOpFP2HUx
	 ED6IymlgFISgA==
Date: Thu, 26 Nov 2026 22:18:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the liveupdate tree with the kexec
 tree
Message-ID: <awiULyDeMTGLqKot@kernel.org>
References: <awhNUUXe4ywAjq8b@sirena.org.uk>
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
In-Reply-To: <awhNUUXe4ywAjq8b@sirena.org.uk>

On Thu, Nov 26, 2026 at 03:16:33PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the liveupdate tree got a conflict in:
> 
>   arch/riscv/Kconfig
> 
> between commit:
> 
>   e583fcbe5b585 ("arch, kexec: declare kexec and crash capabilities in Kconfig.kexec")
> 
> from the kexec tree and commit:
> 
>   48ea610913a6d ("riscv: Add support for KHO")
> 
> from the liveupdate tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> I imagine this isn't an ideal resolution and the new hunk should also
> move over to Kconfig.kexec but git rerere won't remember that.
>
> diff --cc arch/riscv/Kconfig
> index ed02c6ad0cca2,a5c56252ff44a..0000000000000
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -1120,9 -1116,30 +1120,12 @@@ config ARCH_SELECTS_KEXE

...
 
>  -config ARCH_SUPPORTS_KEXEC_PURGATORY
>  -	def_bool ARCH_SUPPORTS_KEXEC_FILE
>  -
> + config ARCH_SUPPORTS_KEXEC_HANDOVER
> + 	def_bool 64BIT && MMU
> + 

I'll fix it up in liveupdate/kexec tree.

>  -config ARCH_SUPPORTS_CRASH_DUMP
>  -	def_bool y
>  -
>  -config ARCH_DEFAULT_CRASH_DUMP
>  -	def_bool y
>  -
>  -config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  -	def_bool CRASH_RESERVE
>  -
>  -config ARCH_SUPPORTS_CRASH_HOTPLUG
>  -	def_bool y
>  -
>   config COMPAT
>   	bool "Kernel support for 32-bit U-mode"
>   	default 64BIT



-- 
Sincerely yours,
Mike.
