Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3435B65E
	for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905696; cv=none; b=BQdlb9gVBFyQatKn4aDeXjTJ9nc51fctromfqvuCFRSJrtg2HixhuJMXtgSoubPHYNslT6d+XhCfVvTRApunFhpIbEdFmkYpi1ZU2+lfD9qtAmZChcl6greDnQuHPqXLhvScsYmhD/hH4UoeQWkTj6kNnhlgCu0lWuBbUCAffwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905696; c=relaxed/simple;
	bh=iUuLHefbY2t+oisBotVFZzXFiowEU5sk215/b1eNJtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxr0h3p5alCfXEYZ5NiJue4FInlRXEQwFb8fzXwTEwds8Ush/+/rgRljxCbchYDJDMUAVcPhLxRpPLONJknbolSPsVbSvvAcDECzfLWNE8RkagrkOG5iy91gbgoIDHDbKzyjqmh+CVklOmN+IhAz8IzbCXxsh3gCEzAI0kgUyR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R2Lx8Knp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjrwMimx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R2Lx8Knp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjrwMimx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770905693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXfVCnaDM2RBdvtkMyyWRYu6V6AUtCSnxcxi171tkxs=;
	b=R2Lx8KnpgfD1iPX2DpdoooOmxfW5i6yDZcxHLcsmfj+Bp1/eVdmUdZbMF8+0VEFCYMHAPI
	p2kFx0612Yr/2HR5XmagYrsDIfRKhTzila9Sea0mKnoYMTQaNVlkLhKmQ6w818an+5U8kf
	D33S4j0DtSFyKOthbQk3Wdd2JJnahME=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-_GNtOxNmNpO8E1NMk4xRnQ-1; Thu, 12 Feb 2026 09:14:51 -0500
X-MC-Unique: _GNtOxNmNpO8E1NMk4xRnQ-1
X-Mimecast-MFC-AGG-ID: _GNtOxNmNpO8E1NMk4xRnQ_1770905690
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so60483985e9.3
        for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770905690; x=1771510490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXfVCnaDM2RBdvtkMyyWRYu6V6AUtCSnxcxi171tkxs=;
        b=QjrwMimxKZOv5ICzIlWwg7xI5clWt+DbjF5UnMQMD+4OOywhk4IxjNM689meB869np
         iU1IMftsLN8Hd6RUBIRC8O+SrLumnlBLm0neQUuBk6uC51PBnI7UOowIr2kqqNAXftFY
         hC6hLZdOhozLusqFfRj+t5yheb8D4soJVc4r1D0pzk/GyOosiExW631wZRh7jFE7Mlqc
         xHxHl3eTC79AnIP06otMKLkYeqZ5iPghjfqZpvF/gZy7bvTXEe0vppGxC5SJnrAm+hXQ
         bIxy4gPYMRfSCocJFk7L1/Ckze4APxdY7Ry/NYH2Z2mwH0L9N3t++tMy0T8zgmrZ6z25
         fwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770905690; x=1771510490;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXfVCnaDM2RBdvtkMyyWRYu6V6AUtCSnxcxi171tkxs=;
        b=MyE/XapOqF+luhX79XTI04lwAqBTIywlfl4OFU0nlgmyTFsiyQChni+vitkAm3SWio
         8D2tpwFFAKaoK5lvlb7aDo+Hy7xpMxXIhkhMXeX08u/iJmdxlhpF56kH07kZOKPAFN1y
         XUpBoXwbgDlxdqB3vKTl70JxjeijY0fzCowpKQvnrZmcBr0rAvS3JxsE9VMpZH1LAbl6
         ds10Q92ng/ch+bYojCRrh3y+aOrWnCwbxauFbmubVyM4gHXx5vIfvVDcmO+IT5yhXbzh
         xjBINu9ZdQWZnEsj/453+HAg3q8vAZS8oK7K7PCTo3sp6aWqFPI8WNmsrx5W8whWEyIH
         d3/A==
X-Forwarded-Encrypted: i=1; AJvYcCVSGXRrY6w+FViA4P0QlEu+DKwT+KSJnOmakLZR8jyDISXXF4cnoo/B7UOGa5ibBgYtjUQTb57aCWsA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn/Y7qTsMLJmXdiaPBubS/6VtIp8+5BZP14WDwYq//A6f+xJMq
	chmd7M+lMCbTSJ5pY2sMTc6SfAujGZoD54T7oLhrOsnnOJXvfOLxDJaGXj6Zi3GkspZEJ51fSz3
	sVqnc1QMlDCB/ZCKhKbG+6n13IgYbg/m6v4ghbYpV3smZ8e86Dyiy57GYXJUMQjE=
X-Gm-Gg: AZuq6aL9qlS2kWgRtOTmpHLwAwQ8hbjjghauuSZnc5sKssaRDg+pgwqSAG97IDcHGfn
	AIjV4ZdwC7Y7IRYbJsbEqJIwWT18GDFC2CoOc1IeRF4qLU4isG1VYm1bUJQO5Y21AWXxfVtzI6N
	0bYHH7zNQQgWDAI0EgOVwKZPXXgC2fGZRJLQz7mKl+p9XGUq6sHntfFQpSqq6IIbKhJxd6h7RNy
	uK4w6lg0VQcn0Rpcm23PoGq+oF8Etk9HrPgTA1nvmFj1yIUGpar/wF498lapvBCHQz2NsD5aXT9
	f8orjN1REFNHanppEWzTdQ+W9D5NgHyklMU70CgqIlDCOsKmsPrmhzCKm4dH4wB3LiUSJOsUlrk
	0FlsZT2FS7XRAZA+CjbOZuxUbbRM592mb7+Qb3E8um54nb6/c88NGdjkDwizWAVrZun0JFc4ZRU
	SsTUuglY6GSL7jNgLC+f9uYUrsdt7YrE1QcYYg7aJKclRefJrW69c=
X-Received: by 2002:a05:600c:8b2f:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-4836570e519mr42505885e9.24.1770905690180;
        Thu, 12 Feb 2026 06:14:50 -0800 (PST)
X-Received: by 2002:a05:600c:8b2f:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-4836570e519mr42505435e9.24.1770905689729;
        Thu, 12 Feb 2026 06:14:49 -0800 (PST)
Received: from [10.32.181.178] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm197739675e9.9.2026.02.12.06.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 06:14:49 -0800 (PST)
Message-ID: <d68022c2-0c62-4acd-b287-8a409daa2c89@redhat.com>
Date: Thu, 12 Feb 2026 15:14:47 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm tree
To: Mark Brown <broonie@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aY3e0hIT1UDqLcvK@sirena.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
In-Reply-To: <aY3e0hIT1UDqLcvK@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/26 15:08, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got conflicts in:
> 
>    arch/x86/kvm/svm/svm.c
>    arch/x86/kvm/vmx/vmx.c
> 
> between commit:
> 
>    9e03b7caf4e65 ("Merge tag 'kvm-x86-misc-6.20' of https://github.com/kvm-x86/linux into HEAD")
> 
> from the kvm tree and commit:
> 
>    f8ade833b733a ("KVM: x86: Explicitly configure supported XSS from {svm,vmx}_set_cpu_caps()")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, this is the tree that will go to Linus later today, so Sean will 
simply have to reset his tree to Linus's as usual.

Paolo

> diff --combined arch/x86/kvm/svm/svm.c
> index 8f8bc863e2143,5f0136dbdde6b..0000000000000
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@@ -5389,6 -5389,7 +5389,6 @@@ static __init void svm_set_cpu_caps(voi
>    	kvm_cpu_cap_clear(X86_FEATURE_MSR_IMM);
>    
>    	kvm_setup_xss_caps();
>   -
>    	kvm_finalize_cpu_caps();
>    }
>    
> diff --combined arch/x86/kvm/vmx/vmx.c
> index 967b58a8ab9d0,11bb4b9332274..0000000000000
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@@ -8247,6 -8247,7 +8247,6 @@@ static __init void vmx_set_cpu_caps(voi
>    	}
>    
>    	kvm_setup_xss_caps();
>   -
>    	kvm_finalize_cpu_caps();
>    }
>    

