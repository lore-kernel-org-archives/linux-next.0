Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888A3876B3;
	Thu,  9 Jul 2026 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621436; cv=none; b=CXYtZkqA9RBmg71IXYdUgBaGRuYh/qd81CeUaVUsyXJgPmY9UGST/ZZ++p6dzyUITmGGq8O8jwCgQBTGOfjMY4EIEMkIV/lBMQUWSgHygkKiTHsm1rTzIepMDT0a/mS9/8NaADKZjom5iDt4IAOdARw2z/vq/Zf50h6qM7oGPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621436; c=relaxed/simple;
	bh=ooB6utJroZD4KfFF3raO19EwKd9l1L+wfGYjc3Q0OWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8nRtPssHTtdjL7VQsKEKy1lHFsVpq904AQpVztydgm0fjeyZ7k16tx6+rhLN0pk7tHkGUlkC6X3V1TRNhUoWGJwj6el9EFt9xCfkQq8m3tbHXxYduulgwiUh4GEiWaTMqoINANGHQtVG885kwF4MMKTOQI3ikBYRJ31gt0iZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HDNHPzPk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HDNHPzPk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YnqarTgy0D0htDBKBMRAk90GEEctz896WdQ3FnbljDo=; b=HDNHPzPkoyRv41XVzG+0pPFbJr
	0vgwd4aQfN1IkANAY/KCtBQwgjDUr1ERCm7TLpNk1FUBxMuRHTORGi3waQsLFsTl6sVvUKR4aAGeb
	XroE4oYVnzSaFG1C8nqKAIJZ7UrzsFyo3i63OpIanzwHD2bndkOjmbhLzIeog10vtT7jOGFH1n/3R
	JnRFVjofwFHzSxlDNAj7Tn/WRUUWH/JLECjHrzsoKjmdeX1rih1oFxwUWruGAAZQmJag5W8PRej7s
	4BSUXz8CRe4IR8ChGLaXKc047t14odzEvoOtA2K6haWpOPnpshdoV77yqdGFCpXTTsNkd83s/I73N
	LLikkWXg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtPc-00000003DZO-3G8l;
	Thu, 09 Jul 2026 18:23:52 +0000
Message-ID: <54f6efe8-cab8-4fc8-bf00-f012b3224e54@infradead.org>
Date: Thu, 9 Jul 2026 11:23:51 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/amd/display: amdgpu_dm_plane_test.ko fails to
 build due to modpost "too long symbol"
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 george.zhang@amd.com, bhawanpreet.lakha@amd.com,
 LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, christian.koenig@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, broonie@kernel.org,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <fde3656e-9e22-4e4c-937f-7e8cb918da6b@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <fde3656e-9e22-4e4c-937f-7e8cb918da6b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/26 10:05 PM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> linux-next is failing to build for me with:
> 
> ERROR: modpost: too long symbol
> "amdgpu_dm_plane_fill_gfx9_plane_attributes_from_modifiers"
> [drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_plane_test.ko]
> 
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [Makefile:2165: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> The failure occurs during modpost while building:
> 
> drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.ko
> 
> This appears to be a regression in the AMD display KUnit test code.
> 
> Could someone please take a look?
> 
> 
> If you happen to fix this, please add below tag.
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Hi,
I cannot reproduce this when using gcc v15.3.0.

Which compiler & version are you using?


-- 
~Randy

