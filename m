Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357A3E1200
	for <linux-next@vger.kernel.org>; Wed, 11 Mar 2026 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245507; cv=none; b=U8P1sbPP4z/halr9vvIYDUqcqtHyfbnDyqbhnnpCDS6ooCyFBrs7YF8ZGRiDcHeE5g3u7g3fNLMWSgXeoQ5iukM6Inegieabfhg/Y0R/qrdmOxVzRi0QKMQfma2vHNwTcykyeLCVdAGuEmyCyruVo7AbetlHg7e2g36J0AmfFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245507; c=relaxed/simple;
	bh=67ggNR/tgJa+a4WJ3c5dExlBcaR6P0XgvTEuIaM5dqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loZZAtkQ0J7pBqmPhOkrYzeXFjl9eHJnHVdwfps9Okxq5onKEvYb4s6Z2WrWVh/gdOvrQyPu7c8BpXGbRSIGKb3zt6+W7o3IvnTLGNbpgiiMbbmhJxJeo74605p056Esq60HhB1WcRM/r96ExXHBu9M+dDsav2LmzGx7tYGTZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NbOGaHmD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NbOGaHmD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48532925a4bso104745e9.1
        for <linux-next@vger.kernel.org>; Wed, 11 Mar 2026 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773245504; x=1773850304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMp8gU7rZufSQT9d6sd80vrN0PDhFt31ilnc/v9zgeo=;
        b=NbOGaHmD9zhXG3zcvcjon/habdsvdumtZsRF33Dtwwm+Rs34Ax9WCSz6p555kmGaNn
         qjxiGEu9sEaqDn/qcVIyBAq34250zFnoekPSsS+t7zDndT/G/DRlTTyEg4Ejd0Utchj8
         RU8Ok01teYtZAy+lg8TUcHzDSfxIOmddwkpTRA1b/6YfMZJGZ5P2tCvwiaDFQQKNSphy
         VrRkaXvwXCJf6furjVnAp1NhhEHcsXp3P1QMZgAJ2tgV/i6A0Gdq6wTnezu44jnMNx9o
         WDxzmTxA8ZhinTObgJZCk1W8DW7n8zSB6Zpqmd4WgZKIyzsiQATNJDdfq+FUuuo7F3vB
         1JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245504; x=1773850304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMp8gU7rZufSQT9d6sd80vrN0PDhFt31ilnc/v9zgeo=;
        b=Nd+eIYa/hirdNnII2NkFQP2FDLukL8Bx5eIBw/fkVXuUbYzjhdmo8lLwbECp9D71Xr
         YLaZISCdcYhi6P+4G5OBUE7Yr0xeHAQ1VMIo+rHN6KwnallKnIWWmg5pObB1OxspbEZN
         fxtwwfZ9n9CT4UU+rKiBqp06yOunSNPvTuZmxp7ue65aP2gToMluJ5OasHJFE4fqSsKz
         mmdBgOoIyDtAlx4PReB6n3M7LtuXtzpI8+ysiTWXfqG2a9y5q1JbvAYA+bUgx/jxSQNw
         p2407d7pL1vdUe2UPpX3HakGodbmyKlwMC1vl33x9sKHHbky2Ydwz5pYcMkGXX1XCawx
         lsqw==
X-Forwarded-Encrypted: i=1; AJvYcCUv4BQofWuXbvRCFy6FZJ9XLvmMZoyg7nyEmM8hVZk9KnrMJGIyIsHY3j5oySMuF9GlI/UcMr0Feq3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOvOfq++tCMcnl87p954fbJVPZn0qGXOVaESpATchh4D0cbtk
	IczAhQzn3Slk3DW81LIJr6w/KV41kfEZJBHbgpD0zfCSReYjQSV/Kk02PfeF+wI2QDtt2jseOSa
	jrUbm9w==
X-Gm-Gg: ATEYQzyi/LZ3vzJXXHZE/2Byc79R9Dy/P+1TqIs6b+Qcuqu3B53RyWGsxHhuEoWItsx
	blf+6WnB8xSkBdavWP1g2VJ5wueUhPQahklyYbsxaly8Abeah5auCJgjiP+PXcE5g+gJ1fjoWP+
	mZeMcnazAmX8qHZwBIjaDiyIOc6Mhi0rEuZCO4juMZ6Vb9p90HUt+5tvDIyE1zflywEbRBzfZM8
	hDrevA28kFt3PTcoI2ACV09Q5iF9i5RWs9sOq2KAjXrgQHJj0T7BLinvfAa3uFbP0G2iA72G9S9
	HxiIZC5NqolMGJJXpaS/qfjIksIKxYiNkzlKO6k6WvzECulbtp2LYt5zKzIXJ24aQBfqD66eCT5
	lEXk9kYBDH89QtKGKn3+v9GmlSCYcJdXQRhnjWpa6f9k2Aiz4G59Yx1K4E9xwGht1Pgb4+Rkj12
	N7NhRIyt4f3VuZM4z3igsc26NUhuM5iHxJ2VJfO/KHcmCSbLZZ+HI3I6qvHRYWdDubYI8=
X-Received: by 2002:a05:600c:3e10:b0:483:badb:618f with SMTP id 5b1f17b1804b1-4854b11694dmr46234065e9.25.1773245503909;
        Wed, 11 Mar 2026 09:11:43 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fe27sm67629105e9.9.2026.03.11.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:11:43 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:11:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree
Message-ID: <abGUPMvwu_ILDmtc@google.com>
References: <abGQ_oGjSltl7yxe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abGQ_oGjSltl7yxe@sirena.org.uk>

On Wed, Mar 11, 2026 at 03:57:50PM +0000, Mark Brown wrote:
> Hi all,
> 
> During the final build, today's linux-next build (arm64 allyesconfig)
> failed like this:
> 
> /tmp/next/build/arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No such file or directory
>    16 | #include "simple_ring_buffer.c"
>       |          ^~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Caused by commit
> 
>   680a04c333fa2 (KVM: arm64: Add tracing capability for the nVHE/pKVM hyp)
> 
> It's not clear to me how this is supposed to work for O= builds like
> -next does, the Makefile does:
> 
>    CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/
> 
> which is pointing at the object directory but simple_ring_buffer.c isn't
> generated so I'd expect to be looking for it relative to $(src).  I have
> ignored this for today for the purposes of -next.

Arg of course, it should be

-CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/
+CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/

Marc, how do you want to proceed for that one? 

