Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769304;
	b=cOoCdb3l6N8KuRcX3QdM8k7J532PRwhNr/UFirbtUdevz0/cFG2cnev7P+Has2uhTue/
	 6gM54GZGbDOKBJrnYh4nOKBYIOPLQylX5mMRwo7Wctag0t1/IZK482wyTQISob9yt280b
	 RBsQLPb4ecYdoA9+CupZ6eCG2F14OZC+PT35N1AYSV3YzkJUCPTGoRSavKPDJ808ww6jx
	 fBVuxjJijYnikIZm2NMkgB84MwhJqIxuNXzmU/B+PAQCw3dZSs/ucqAmEZtniK+SpPSdJ
	 L5u2ELqt1eDBrP3XfJAGn2YsjcQqkuMqsxjx7lUrRHoW3Qsjd6rV/ntCi0hheJlbM1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QZGX0P2xTOau5TUe7BXI3iIJao07AQUaeE1wHDTDxTw=;
	b=jNfdzdDIVqkGRmCRnpgvsdMBnHgA6PtOhcDi0xNBYEN5hMp73DXYIJpAT2R5iQvUQSr5
	 t6zEcQmwdaQ34oD7US3kjwMNHJoCpLr6nl0USr/xPCfco3hPnsTlO6LHhbU38G8zqLhQ5
	 NzGKqmO6QWs2KIxibSlAAtWmZ1N8CA6Yp2Kj7uMIdf84vnLVIAaoCtHdNw0A3343JbUdo
	 f8xCZNnibaYr2//ZR8g2pUiF/2Alw/LHCVCaSgci2hHE2xe1ZU9zoL9K5iF0q2G0wQagl
	 1GvX3p+mwvPBXaHF1Pzk5TBQYjOPCGaDfiI7Wpiaj80aZCMbB6l5j84hPnycAcyNUvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XJR4uCmy;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC39606A31D
	for <linux-next@vger.kernel.org>; Fri, 23 Oct 2026 15:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC39606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XJR4uCmy
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53667180af3so10696221cf.2
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2026 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792769303; x=1793374103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZGX0P2xTOau5TUe7BXI3iIJao07AQUaeE1wHDTDxTw=;
        b=XJR4uCmy0sVZMFRUNj2/fNf0CMnbpKx0fBPL4GvjpjXRaDJzSJq1kf7WVhAR62Ivjz
         dnA7sAJcAr2k66f/NGLBAjqjMmtG1Gg8Szy6ypNIudi9kEMkjPD03/gq0TLJKnN0vkCb
         0DYgSepQoC0YELTwkmIYWl8HniM2Ju2yAAoUIzGsflt0cEORYhHnkmUWpQdt0oLIahZn
         7T8B821+UEMLMfG9BRk8AFzhkireXvPzMGreYa3v3E4JVXb2fWy/59RACkIoXw6aUBwq
         E5pusLqVK/9xtLl8KZigWh6ZAjyAkMR9C03VuotJKkRy2HhcBFABVV45XtpNc+qYOuGW
         y20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769303; x=1793374103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZGX0P2xTOau5TUe7BXI3iIJao07AQUaeE1wHDTDxTw=;
        b=bd68n2gHngGLWIc0K6LWOiGe7KFCHumUpTvNp4HI9Ho8Afx/wiu2Z3eqDLYabsRoB4
         LAxEJs1F8t5T+eDEstqpVIlhyqU6iQoX5Kb1GYLlYNnTwn0ZCQECRjwRYFOizJjYTczP
         R63BzKnWATmvWng3GUED//cxZNwA+PzIgv2VrV25jm5a/r3x2XG6lXeKn0vwmITpKfBD
         B/aEMHs69wGJ5tPZhZqOjpvPe2xwQWItGRLlo93o4n/A7x2z4g4XYbx7nIgrpJIqPwJA
         8sPgwXzs1jb0v75e5iTyvfO/j/4+F28XA/URWtWEcc0EIoT43ioqFf2W+kLYU3C2ih41
         /d4w==
X-Forwarded-Encrypted: i=1; AKwUvBw2d4yK+ZrG7Z33OndYONozBhN2QzUbeilcOpXopckVTodj2eliij6lsHlR5zzHc7FhyMU0tvULbWrj@vger.kernel.org
X-Gm-Message-State: AFq9FYL9rBzbHZNolnF3PftoFTvARSIKkq6UQegKo1pR58dOtL8X4AQ8
	io5SOxlFK8qO2rjjIWGyQM4RzwLvzW+MFLJwD52audJltBazA0P4vi6uuZR0xaB0LFfbC74BmCl
	kgWxX
X-Gm-Gg: AYBFou1Ry3HySHq472Og8vElgAGTRiytL+VUMWzoO2l3AGnxa72tytgmdEAxdQfmvzW
	R9bfBaQWK261s2vCLd7+ILW1N0kKmsD/XPFf4jxFG/DZ2P+3PtRxcNFiCCTBiM7QtVnRSjpHiOy
	AEtUUD37ydpr4+e1ZqrzEYL+/pkbB9kImcXhEo+/sCLT6MJiZvCQy2IJ0ZmNeBnfN97NdF63j/E
	L1V3rrf73zF9M413HEYOJm9uw3UKE7AjC4ufF8xm6Q/IbAnHH8J6BtUlTJVXFcLSr/5ABxg4i+w
	GQeMc2qVgM1kOzzciHCB3HllQcEPIZOG7P66w3j3A6VJyC4D5dxlLD9P2Cy2QbU7qNjzsM0m6q0
	7w1el4crCZaIzPxgZpopt3J4yHx46V4a/XT4KQqAv6M9aH4v4xFH7C4vznltWqunhu1o7tpyYh6
	JyaM9ocPVI7iCy5HP2aTcOfzOrzVhGzhG5W1IWz26VVu12SFiF7xHQA6Wr+xavFPnKmg4P2RzUy
	AXgpWGvVJ2t15Qm7iCU1tYnTBW4ae71VPryy+p1Gd0FdpHW5WK4R2iFPQXOE4jruCPUqr5xxlum
	JGSP/3wtaa/V+qfj1hFEyCplA8dlpOwnVR8MpQ==
X-Received: by 2002:a05:622a:14c9:b0:536:6856:f58b with SMTP id d75a77b69052e-536c21621f2mr38147761cf.8.1792769302579;
        Fri, 23 Oct 2026 08:28:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836b96bfdsm155091cf.7.2026.10.23.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:28:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKHBt-0000000GmTX-0FLE;
	Fri, 23 Oct 2026 12:28:21 -0300
Date: Fri, 23 Oct 2026 12:28:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the hmm tree with the origin tree
Message-ID: <20261023152821.GI3977851@ziepe.ca>
References: <att4_ahsvKhi4PXD@sirena.co.uk>
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
In-Reply-To: <att4_ahsvKhi4PXD@sirena.co.uk>

On Fri, Oct 23, 2026 at 04:10:53PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the hmm tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   47193113641e5 ("coco/tsm: Update maintainership")
> 
> from the origin tree and commit:
> 
>   c5277e5b71e39 ("coco/tsm: Update maintainership")
> 
> from the hmm tree.
> 
> Alexey is in the origin version and not the hmm version for some
> reason, the changelog looks the same for both...

My bad it got changed at the last min and I didn't update this
temporary branch. I fixed it up.

Jason
