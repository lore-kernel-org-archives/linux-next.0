Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49134E774
	for <linux-next@vger.kernel.org>; Wed,  4 Mar 2026 23:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665819; cv=none; b=cWEkWHXR2BsdGc3yBZi/vW4KQxDJozSBkjWMxcSPfXixXWck9oPWWZHsREEfLOU+P0neudeyroM6BfQ03lyBggrZUfmILmP+5qToM2Bx3BG+So9KVfjG0/xyOus/ljueavnN+3AlW4jS4eVDLMnkTuEvCVqS1wVSqXl9KNbFJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665819; c=relaxed/simple;
	bh=VUl964ADNV7dJBs7RYQP6M1mi+4Su/GHaEbhIxBiJls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qAVXDbrnVawJv6ZWiw6g4xUFAAxZaPpvW+v6ad95gddrqzGTyycrjNziG0BpHN1dPiIRg1APrnt1ZzZERKd1PrWrVND5wWU3XJUN+HoFvu6LTs3EjnOfsmg1+E9hU9ii2bYGnsAavGLtYlcgDzza5BoblNToEvQ8PQXvZs6Xe+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Acn+MqvL; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Acn+MqvL"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae47b3adacso38172015ad.3
        for <linux-next@vger.kernel.org>; Wed, 04 Mar 2026 15:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772665817; x=1773270617; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRrSt8+qsqZxXShVCzBNNFXHtGWznhPr2HpI/zM2u1Q=;
        b=Acn+MqvLEAF8f2rnQ4/9Zrb9w7YasP431qa/psE4SewVKk7/9k02Ad6y3wEArlftnt
         5u+nWxgaZUFpfgQElwnz1+lZSr4wXj+dHow6Mrmj6m9rX+/st1i+skviyBtDj/ErVXMk
         XW3IuCTKyt85TlbWXFgKm3lry1Fk9V4ppsSpGB/ZqefLcYryH5f3yDvssAnNClT1x470
         h3wEBO5UOCu/ux/oUjsEdnv8GHiHShlqZCt6XWAYOjsaRaXCUbnh9lrkv3/iPQyOxW7t
         zP671NfZW8sS3hohPEJn2XwOTJHP4VGVlbVS8NlKA9kdBgyfns9KQBLdJK2mYFXqZArg
         KZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665817; x=1773270617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRrSt8+qsqZxXShVCzBNNFXHtGWznhPr2HpI/zM2u1Q=;
        b=TPBYCHjTcEp3uMd9UAyZVxyAaevQMU+O6V4o9vbS8m5kVbs9vgEjVhuJjB+up8V0FX
         Q7GyQ8g7lo/6U/oMBr3MQjSQSgsqLnS9hnefrIkhXxsHgSttwM7JgePA9cprgiz7pmpe
         0s76ds7KmUJRxqIHZCS80nqY46rUi/rhJGnS5pYCqydwpAtQ4cN/gJlGCvzB+T+c3mjq
         4ZW/Nos2GLDg9OZ8NR7319yUtFSrIr97RlI+scBEoiQznH2ecrPLJ+IXGqD6HgZR5o7i
         6c+ur2xJOqJC+nHVEiGAeDMBznto4uuOg8W+ZaCBj26GetQyJWf3FVnsRS/60duaq1G9
         VyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbkFR4B1HQ1J6Xs4pSHh6UkOHXRwPe0WV0XY1+yLKncGGOcaTYI2fXjoS0przXyGXZUyQmrLTSt1Vg@vger.kernel.org
X-Gm-Message-State: AOJu0YxnROkJjsJMUBXHEoH5yM0ZGeqSzdngIQ0Kh4sCp33iLZP3q1Gr
	hyVuhbQUTB7NwGTzxT+wtNf8D9WinyieGOJJb0HIYnviOAa2GgI5nIEwNoUT02mnpd0dtJjlWG5
	SXoSHiA==
X-Received: from plsq1.prod.google.com ([2002:a17:902:bd81:b0:2a0:835a:fa57])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d60f:b0:2ad:9421:6136
 with SMTP id d9443c01a7336-2ae6aa02975mr39209415ad.1.1772665816428; Wed, 04
 Mar 2026 15:10:16 -0800 (PST)
Date: Wed, 4 Mar 2026 15:10:14 -0800
In-Reply-To: <aagjzN07Pv1fnSHq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aagjzN07Pv1fnSHq@sirena.org.uk>
Message-ID: <aai71uI977FU6599@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chao Gao <chao.gao@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Vishal Verma <vishal.l.verma@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 04, 2026, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> 
> between commit:
> 
>   311214bf1df4b ("x86/virt/tdx: Retrieve TDX module version")
> 
> from the tip tree and commit:
> 
>   75b6c694eaed4 ("x86/virt/tdx: Tag a pile of functions as __init, and globals as __ro_after_init")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> index 4c9917a9c2c39,360963bc9328f..0000000000000
> --- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> +++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> @@@ -7,22 -7,7 +7,22 @@@
>    * Include this file to other C file instead.
>    */
>   
>  +static int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)

Functionally this is a-ok, but we should remember to mention to Linus (and Paolo)
that this can be marked __init when the two branches get smushed together.

Thanks Mark!

>  +{
>  +	int ret = 0;
>  +	u64 val;
>  +
>  +	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000003, &val)))
>  +		sysinfo_version->minor_version = val;
>  +	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000004, &val)))
>  +		sysinfo_version->major_version = val;
>  +	if (!ret && !(ret = read_sys_metadata_field(0x0800000100000005, &val)))
>  +		sysinfo_version->update_version = val;
>  +
>  +	return ret;
>  +}
>  +
> - static int get_tdx_sys_info_features(struct tdx_sys_info_features *sysinfo_features)
> + static __init int get_tdx_sys_info_features(struct tdx_sys_info_features *sysinfo_features)
>   {
>   	int ret = 0;
>   	u64 val;


