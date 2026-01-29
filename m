Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0119F40B
	for <linux-next@vger.kernel.org>; Thu, 29 Jan 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710412; cv=none; b=d9uYJFC4xpp5iD013P6IedFPOu3MkjJM76yk0YWiSnVA8LvhHnrylC8JzdABKoC3pDf3RnRmoyiL28/7CMbb3+ZNqUBVDRMwRuHv+G+rvb2dmsdnu9kKvvfF/Ug0jgENriiZK6vVhe8DJsA/RveMitsHhX666TuT86P+0KoSDI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710412; c=relaxed/simple;
	bh=5MbzFGZpSMoaro4h3ftGR35i2jGrPp+ZRv/dNpjRoiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1mJloE5YAa8wIzJne3DQ5KMS/2S4hUSpaDrNGACbrUWc6bWHRYPnF6wbVxNl63XflyDkEt55V0S0GOuQlGPQ6uT5dN9G93flpHvtV+mHePz3VxIl0XCyK1o1U8hI3Kqt8iQ3+0rusTp4UyMMwqivWPAUQ9AZEEDgIJDtFXb7Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2nVIaY8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QIWj/l5n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2nVIaY8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QIWj/l5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769710410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3WKQQbWWzUaCTPqEmr4cq7kPABkGTBBBgdoVhz4Za/4=;
	b=c2nVIaY8Awo64TJYxpray0OtJ7mV9ob95CwN/n5FAHRYkfI1cfUUT2o1ko9p11CKCliqCy
	9Ra3fpMA8LmszmWMClJz7lALSzCqc3PAF5OHvwt+WODmGDu24drVPtnYHY1Onwu7OmDFe/
	J0s9OSfeWOCCGl1VVZ/AgOKGK+8DO+g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-dTYL8H-1McOnRV1DS0q6Ww-1; Thu, 29 Jan 2026 13:13:29 -0500
X-MC-Unique: dTYL8H-1McOnRV1DS0q6Ww-1
X-Mimecast-MFC-AGG-ID: dTYL8H-1McOnRV1DS0q6Ww_1769710408
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-431026b6252so1451891f8f.1
        for <linux-next@vger.kernel.org>; Thu, 29 Jan 2026 10:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769710408; x=1770315208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3WKQQbWWzUaCTPqEmr4cq7kPABkGTBBBgdoVhz4Za/4=;
        b=QIWj/l5nhf5nvsjFuFST3/djbTFVqzpr1uBri8zfO9BbICy4vbPURZHco2iLSxhnqa
         MZ8yOlkayaZ3YQ2QPV5wrgvego95NKGTTYgVHovx8AdgSwCEwehTqsxcMtdl3qb2Onqx
         KNlUPTXR4ity+n2SiXnuzTt4ltHeJORYpD5LIFen8i8xzrQ7LVJHxQDLp7emc8erkJZN
         pf4LfD34PV9PyhuNBDeEYrXy0yH7xSMbRGSYQPY35VB4ikpB4Mev4/z2R381aqefhQ42
         33VS9MmpnL6VYcqU1/xLdsVQBUraZ+VG/BqVe5U2JayJMu9Xzt9tzTJ3FLZf5dvqpwc1
         s+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710408; x=1770315208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WKQQbWWzUaCTPqEmr4cq7kPABkGTBBBgdoVhz4Za/4=;
        b=lpsfjRWm32yZiRhC5RKkibwX35iJnRDuQKfpcmejlykwtmH07jS69pDIWVVzPgP+Hd
         DFWZUYQkMM0qJCtXkRyu9xZ5CZ/hAC3cFKeeG1mLOjC0qrMcmHzoxOcmvg3cRyjMQTFx
         DjD7pN/ASgM1hscs+JAjD5FevDC5sTlpvp5JOmMRpj18MwjdzbATGy/77yDfjNoSaexE
         Khh1Lgz5GP8pAKTihScxnYT/VLQ3qbvSSU2dokRx5ad7ioXLNeBAeRIS6ec94ROQhSoG
         8NtVudFkxBVWKl+b8oz36yxG9FWp/1f5jm3SuFRfThr690a776cLS3q774lKOggbpkat
         7Irg==
X-Forwarded-Encrypted: i=1; AJvYcCWdAFEGqoCgUf9gqRcdnsq57sLtB73Wug8ByUhypNr82kkRKOtgQBxjAH/L+ks4GDS7sdQqPckftOfh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qiIQg6rWf16oFWxsHK3Vwd+fkkKO0oP8a8UsJBb/1C9OSwkT
	BJCI5US/6i557t9VRNI2GdLEC3dQiVaT1kuoxJ2P9mmmJBWYx5KOWFLS5GnjTJgoFzXrcgmaqJ5
	0841MsluD6mGesg1MAf4l1MsgEu9ZwU6MCRbQ/C81y6Sgt+Lphuem0w8Nx4uZnHns7HB8Rbs=
X-Gm-Gg: AZuq6aKY7PMIgJOaxTFC+FsnGo4KXWfu5P7T5LidHEQD50++HNWpDl5/jXMqGRXIsbG
	TSmwe2zDRRpxPLuVt+8Lq61F0ZHTStZth6PIgTcMOP8R1vLAbtdAGD0Wdgz2cotnTFoAuGbV8gV
	vKFWpBzVOcs1eBgWlgxGrUjgAdItO+RyhcmS2b/mjgHgC9HxMfrW+ujRpx6+k5rtz/bLSsKwdOq
	2RZcOdNJg9NgmgM1ZZYtqLnrC80je8AGlN64RZPdWDaR4Z2ROV2fv2XPpT6VlJdHYCoczXZXqBr
	ZR/dvhgQUVOW/xBPbu/hJ4T4XsF0i5zYlAeOglmocwxja5Ms0BckS9aekWkhz2WBAmfGM4LmYly
	iKpTIkKuqU46FJZ/Z1SC6h2WpK6hPq/Jpcg==
X-Received: by 2002:a05:6000:1ac7:b0:42f:b707:56f0 with SMTP id ffacd0b85a97d-435f3aaa42fmr697712f8f.37.1769710407753;
        Thu, 29 Jan 2026 10:13:27 -0800 (PST)
X-Received: by 2002:a05:6000:1ac7:b0:42f:b707:56f0 with SMTP id ffacd0b85a97d-435f3aaa42fmr697684f8f.37.1769710407302;
        Thu, 29 Jan 2026 10:13:27 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee562sm16610026f8f.18.2026.01.29.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:13:26 -0800 (PST)
Date: Thu, 29 Jan 2026 13:13:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the vhost tree
Message-ID: <20260129131316-mutt-send-email-mst@kernel.org>
References: <aXtD9lwdROdWhyt6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXtD9lwdROdWhyt6@sirena.org.uk>

On Thu, Jan 29, 2026 at 11:26:46AM +0000, Mark Brown wrote:
> Commit
> 
>   295f63d502b62 ("nvdimm: virtio_pmem: serialize flush requests")
> 
> is missing a Signed-off-by from its committer

fixed, thanks!

