Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460936C59B;
	Mon,  2 Feb 2026 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042336; cv=none; b=loP/9FYCc7DcczCPvAGEKbo+QfPPXv9ubBsp/lmWg4A0eAhXSBf+mBZpmfxHDplsw7AcBwbL7zbU5wonx4rTrvxWZc2oxYRL+IYTCva2jW22sd0ERkZM4jM344mQMrP2TgeYJxMSkXNSBVLBem6ilMwzC4CJ2fi+Me5jBK36CEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042336; c=relaxed/simple;
	bh=MfLhM5e97Nipl4AuIOyTgqniVaWOPQgKJJgli6NMNCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILoEDkOhE2P2xTvXp2OP6CU+TnAE4ZepuY/g+H/mdODiR+V+qKys/Yw0kmQyyvX0LaHnyVBkF0qa4EJ9dkVQ8yOJh/DznWWjqo4t1XT2mpfSM3c9VCLgiadG52txBNzUvUiJOcrsTqqZZLDiWc+NXu/pAeBKztic+wRVv6lY2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDXIlJxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDXIlJxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE28DC116C6;
	Mon,  2 Feb 2026 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770042336;
	bh=MfLhM5e97Nipl4AuIOyTgqniVaWOPQgKJJgli6NMNCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JDXIlJxalYQDWocevJIuWbRY0YNX+owQ2GEsU2DgXG/UZbzgujNWfsPDRQOpzyfLL
	 ZEvvetqwZ+wqMPFeMmDpfkzhtOShAf+rQ2ETWW+NHZzixfC/y8fsIKwueH32Tewey5
	 vl3W1Ir56S45h/qSLEu1QGsV9IIYyFoGVQENWRw0VdIU/KMa748ksbLCAuW90AGedx
	 kd0D66jWDtmenDyhW1zHABaePvfsqZ2Bqkbsl+NEZycE4TwSbls7z7F5w7FwEPJZpN
	 AxEWma99f4Dok+Q280RPCfMOe0PJgPhNJhrK+3VGZzsswTdLEDXeUMs2Y7iRMIL+xT
	 KDXFzHPDK3TiA==
Message-ID: <02fe7f9e-f25b-4b6b-8420-57de982147bd@kernel.org>
Date: Mon, 2 Feb 2026 08:25:34 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd: Check if ASPM is enabled from PCIe
 subsystem"
To: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260201002446.1293486-1-spasswolf@web.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260201002446.1293486-1-spasswolf@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/26 6:24 PM, Bert Karwatzki wrote:
> This reverts commit 7294863a6f01248d72b61d38478978d638641bee.
> 
> This commit was erroneously applied again after commit 0ab5d711ec74
> ("drm/amd: Refactor `amdgpu_aspm` to be evaluated per device")
> removed it, leading to very hard to debug crashes, when used with a system with two
> AMD GPUs of which only one supports ASPM.
> 
> Link: https://lore.kernel.org/linux-acpi/20251006120944.7880-1-spasswolf@web.de/
> Link: https://github.com/acpica/acpica/issues/1060
> Fixes: 0ab5d711ec74 ("drm/amd: Refactor `amdgpu_aspm` to be evaluated per device")
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---

Amazing detective work, thanks so much.

This added the code initially:
cba07cce39ace drm/amd: Check if ASPM is enabled from PCIe subsystem

This effectively removed it:
0ab5d711ec74d drm/amd: Refactor `amdgpu_aspm` to be evaluated per device

This was the accidental re-apply:
7294863a6f012 drm/amd: Check if ASPM is enabled from PCIe subsystem

It looks like this as right on the edge of the 5.17-rc6 and 5.18-rc1.
I think drm-fixes-2022-02-25 and amd-drm-next-5.18-2022-02-25 ended up 
with different content.

Nonethless this is the correct change and I've applied it to 
amd-staging-drm-next.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index d6d0a6e34c6b..95d26f086d54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2405,9 +2405,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   			return -ENODEV;
>   	}
>   
> -	if (amdgpu_aspm == -1 && !pcie_aspm_enabled(pdev))
> -		amdgpu_aspm = 0;
> -
>   	if (amdgpu_virtual_display ||
>   	    amdgpu_device_asic_has_dc_support(pdev, flags & AMD_ASIC_MASK))
>   		supports_atomic = true;

