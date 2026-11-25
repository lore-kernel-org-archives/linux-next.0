Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601128;
	b=L5cMqSJJndOmjtEiG5cgIKn6bk2tnOtDeiKRb3QRP/KyLVziORYtP8ANUGTzOm0/rTaq
	 HeLfnJWxU1w8HBQogRnOqZi6S2iMLoetRj3Ts3C733zMtK+LuK6Tt6bT+hoYk4PooGsKu
	 wQUHLrS+TZ9Y+d+hk3LsMUhvlbJpzlmAwQOAtRxOMl/ZZJMNR9MzyDLGxTtROrNWhA3Kh
	 lKK6/EgJGreP3/3CKnK58qLVco077Ptctc+yTI7pH5gCu6zuo+/XWh2ClGl2Wh5VXJNbi
	 47V0c7emPPs6m+/ZoZrbzCBLKmLTzZZwjoUr3K105dy+hxWxhmjSBrsNsHNtVHm+kzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601128;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Woj++cmz8X0Ca17RrIardhBj1/Jdq/Wh35+v3dglLIA=;
	b=G5sv2DqqddEMSuz9yaUdj5oC6np/pnewVuN+fCs86CITEtF3Dx1dmrk/gCdYXumwXsYL
	 BAlPVW3Zy9YaaYdgaUjzLBDD0rS3J6y4NiMWScAREolqaU3r0Q0UtqVMDHtCLkXzu4DGk
	 E6eyiYnvV3fKGLj8XxYv866gEILPnEVcex/lVj+vGlfhZbtwhK9EqjFNNkimY/ZDNEKtv
	 YLsT4XjgOmjH1yIJ9dW8RiQjrLpmed9Oj2wmh6Q7sD63KlpSuxDy7kaucDuhSa5F44y+k
	 Oxqkd5cOkf/drl1ofFUb9ecgTdkKGbytRrpFbAp7p/FPQmuOq+pmT5jxX7tnhhYaJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/oJOQN2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0C606A31E;
	Wed, 25 Nov 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/oJOQN2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2721F000C6;
	Wed, 25 Nov 2026 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795601127;
	bh=Woj++cmz8X0Ca17RrIardhBj1/Jdq/Wh35+v3dglLIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/oJOQN2KYggiBTrRienCOAu05fSgB/7NvsrzMwrDN6x0Z1jGoHLsKBiJJMBE4acl
	 VAtKsN3UpQr+JM2z1r6Th85quLqT5wQudPDnVuOao6pyisVmrCtyecPrpcFPY0ZVgM
	 oKd2yQEVkwm8BZmwO9u1eYep9PohWGK0kiRXELTnqq0XJDaRzsjZnY5YIzzeafOF8W
	 0OmftJ9/jqxGWnDqtfuVQa/Vof+JnV+JCtrny0jCa45cWgl2fK8s+iCvhWeQ8mKKU7
	 SHpXl2zlCm1frzCp0fOXoWjHevg8+PoyhVH6tmv3g5SzREMv8UegyMRv2FZCv6Wlwv
	 MbxIPysyO+/5g==
Date: Wed, 25 Nov 2026 11:05:22 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <away4tDOZQoAWXky@gmail.com>
References: <awXHMlpalEe2U_vC@sirena.org.uk>
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
In-Reply-To: <awXHMlpalEe2U_vC@sirena.org.uk>


* Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> /tmp/next/build/drivers/thermal/intel/intel_hfi.c:407:38: error: too many arguments to function call, expected single argument 'msr', have 2 arguments
>   407 |         rdmsrq(MSR_IA32_HW_FEEDBACK_CONFIG, msr_val);
>       |         ~~~~~~                              ^~~~~~~
> /tmp/next/build/arch/x86/include/asm/paravirt.h:153:28: note: 'rdmsrq' declared here
>   153 | static __always_inline u64 rdmsrq(u32 msr)
>       |                            ^      ~~~~~~~
> 
> Caused by commit
> 
>    437ce3015e51c (thermal: intel: hfi: Disable HFI on shutdown and kexec)
> 
> from the pm tree interacting with
> 
>    e7f9f17e00130 (treewide: Convert rdmsrq() from a macro to an inline function)
> 
> I have applied Sasha's fix below.

Sasha's fix looks good to me.

Technically this is not a 'build failure after the merge of the
tip tree', but a 'manual merge of the tip tree with the pm tree',
with the semantic conflict that went unnoticed, right?

Thanks,

	Ingo
