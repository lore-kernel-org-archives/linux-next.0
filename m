Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442C3C0630
	for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465341; cv=none; b=c6uCs2aP52yWw+IQD5dyYKUOKK435obSShhKUcBVVhwJfB0+f5YYDJtPNpyO34T09eJO6cDQ0BZdJmroZjLKp8ZgWXv/BUYuhpOogSZGv0lmG1bvZ8RMKLDf/Dq+74t8zUuBfKecN1rIoMyNj6WH5ELlOP35TnjhpxpecCBPO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465341; c=relaxed/simple;
	bh=M01jVocE+wh8QVq8SkqCrDJBc2gtK8S2LUO2prZxzAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVDCpWWUzncBh9VMWaJ4WZQM3KWV5V0AXvKPRUoMjN1iiWeoziqnXqVcZySVKNDcdrGzGJ4ZWWNpb9dBQhhomgwS3tj5EtZrqghS/tlaebS31EcEODuXblJvSEdkmuG1msxg98s4QoeNOrA8II0yVxda5112Qbvh/DcdPQlxV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LWRUG/wb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LWRUG/wb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacef7d299so120725ad.1
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786465339; x=1787070139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvR7bqwYYWMLIGJXI3Fulc6th37mQoSz7Zqx7w5XSQo=;
        b=LWRUG/wbYSnCjlipyQbSGwsDBSNBYId+gxX6HymaMnwuGrcQrvmZzMT03Rson8GAjD
         BvOSxuDqOW7Q6HgexFzE/rRpv742XI71P3bruBRbrHE4ZGfLlMdaqWtkFGRmgHBR0VXL
         lGovnsgXuIbd2+xKeXuP2virV19mws+t4R4q7DFJG0mo1XAU3MhoP74ioPYDQEGBS0PB
         ils4eePVdJdT3LSw6EHpOwYs+XcUu4LoABfbQjzWBFMg2I4kxx/+T8NzoW3Mvw8XRZU1
         7pZFa4hBjyLL1O6g/a0DpGksNqGG2fVjprMfNN7e3DXugtQIKmGY9Go+WNKxwxudiMT6
         0YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465339; x=1787070139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvR7bqwYYWMLIGJXI3Fulc6th37mQoSz7Zqx7w5XSQo=;
        b=aj0i5ma1NKHiYyTFUjjtNDM15yfc55kl9O6Ai7j2kmL31SsBAUAHAK7JUrNgOBGPnE
         VDJ/cM1JAHlUtodxnMsH3ZXjSElJ/Uq9Ad4Ex9A5hVmtVEJq2kjahVMic9xivzQXd/zq
         3tRGBOfwPwIZ2OIMbowsNnJI3OkNO0DaNj3VAto7rmlgFjRyN3tbFqqbeX+LJpZlbc9d
         cKlmKXKOZbIKk3xwQ+4p850wD+oS96zgStEk1ID8/I+C+l5GRmbeHAIjauzUdZ4amTyt
         Darp5crzbEJoCpkbwhBsAgqy+s/ZoKNMIlUA2bU0GVmlH+hBN3VGEa/zm3g7RGfM4g5H
         mr/w==
X-Forwarded-Encrypted: i=1; AHgh+RqJUEnTRzJD6T8fKghrLybiaW4uUvC+t/eHclBatCjbx/PFBRARbCWJDt3F0+O7MDDRw+f9r9tmqxnp@vger.kernel.org
X-Gm-Message-State: AOJu0Yym8h2fueleHxE+0HaEbsy81H0dZN1je5jKkV/6NgcCOJHXql9A
	IUu+Ibf2XcuYxA/T6P9HYqJ0uFxnpajY9R7kuqL3P/HCbG0EEGSQJdvQxt/Np+fu4w==
X-Gm-Gg: AR+sD1150SAZr/sZdii46PsSAkRGKoduu91sjb+IHquQWRFILQQAaxmefOfq1lzRqU7
	OucGJYYWPCAlSrIKcRleaoabGzmXDEfILlRUvO6k9GNP4jX0OTUfufu20vuh9NCi9sTCAQ5Tm51
	TdUqAKKX9lkiuvdXXUXYLBq/GzCv80ICyJoW7PoaAjBOvMADQNia5hXn6ATHqqnZOd8pxFycu3W
	oZTaVKp3W0asXzVUFU3vCYuDB8IMZRkjHGdRo2dKlg6KpgPDeMs3ZhV0EXuZ0eXOEuss1HSZnCs
	+05CAfWSFQPKRglKEvP0XwLQcFN2AJ/uLv/+rg0knWNncB3hy6bHPHvPAqk+70enJ3D3I0PIbx/
	iKrTcmOa1vG33uG2u4yIUT0WgJAhYmI/jtZGry3Zb3CqOylZn7m3p2RAQrNpGhRex9DWEkAgrft
	qJegpQ8jtGNQ9wo7WERVy52gx4czCTO9S1O9xwZXWhNVZQRxYbqnAxvW1VQlyhOCjbfQf1kzvuU
	7zxQRPtmxoYohOOlfVZsFAR5IiWdhSWiw3VMDr32msBNQiwTQMQ8hiGJ1996wkDnu2bZW6+Pr9w
	MjBipb8=
X-Received: by 2002:a17:903:181:b0:2bf:1000:d3ac with SMTP id d9443c01a7336-2d31753ccaemr5360545ad.11.1786465338735;
        Tue, 11 Aug 2026 09:22:18 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935fee4sm71663a91.8.2026.08.11.09.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:22:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:22:13 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
Message-ID: <antMNVcZNPw4ojxI@google.com>
References: <ans8lsGbkro4pO6N@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ans8lsGbkro4pO6N@sirena.org.uk>

On Tue, Aug 11, 2026 at 04:15:34PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   rust/uapi/uapi_helper.h
> 
> between commit:
> 
>   cdfcaa36ac93a ("rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h")
> 
> from the rust tree and commit:
> 
>   f14e0c8183bc7 ("rust_binder: report netlink transactions")

I don't think this commit touches the file mentioned below. Maybe the
conflict was in rust/uapi/uapi_helper.h with the header includes?


> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc include/uapi/linux/kvm.h
> index 70e36e6a0ad4b,9fc8dfdfd65ff..0000000000000
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@@ -997,7 -997,7 +997,8 @@@ struct kvm_enable_cap 
>   #define KVM_CAP_S390_KEYOP 247
>   #define KVM_CAP_S390_VSIE_ESAMODE 248
>   #define KVM_CAP_S390_HPAGE_2G 249
>  -#define KVM_CAP_ARM_PMU_V3_STRICT 250
>  +#define KVM_CAP_PPC_COMPAT_CAPS 250
> ++#define KVM_CAP_ARM_PMU_V3_STRICT 251
>   
>   struct kvm_irq_routing_irqchip {
>   	__u32 irqchip;


