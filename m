Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7F3DB321
	for <linux-next@vger.kernel.org>; Mon,  1 Jun 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327080; cv=none; b=LoI3a3y5Ay+mSzG6/fDQsmWQL8lXlELWHKMv3LWqRb3xdwkzROfEtxkalatZUBur19qeuIpnBroBzW3wgsWeiOZzNCAwSVH9O62nPWEusPIbNqIR/gwUDU1eQ1WnqonVupTvUesPTgJud5cVKqHS1/1fXIoX3+3MJyaWZIxl/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327080; c=relaxed/simple;
	bh=g4pXajuHyRysM6eBiEyAvw2mmOdENp0Ba7ZB6bfRxO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eErFl5NJbbJ+sPqwNxEwBOeb+oaQn4ydUk1/raXQD8CwEZr/uCgHZbuJOjBK1+kobxfuA2zq1vIlxVUvEci5Xl+lwZWcKWiI063rAZzFU/r1V4CKN8MDcM90la7gXxnY42q23WHDsTvvr8aN3UNSjqcqkcYE4j71SayYUTeyMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gms.tku.edu.tw; spf=pass smtp.mailfrom=gms.tku.edu.tw; dkim=pass (2048-bit key) header.d=gms-tku-edu-tw.20251104.gappssmtp.com header.i=@gms-tku-edu-tw.20251104.gappssmtp.com header.b=oDfQZcIj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gms.tku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gms-tku-edu-tw.20251104.gappssmtp.com header.i=@gms-tku-edu-tw.20251104.gappssmtp.com header.b="oDfQZcIj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso14563245ad.1
        for <linux-next@vger.kernel.org>; Mon, 01 Jun 2026 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gms-tku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1780327071; x=1780931871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTwdDoBnu46cjUDEevjCAl59d136jpqiGFHXPNDUUx8=;
        b=oDfQZcIj/j9FB8G3OvGv/94v2eQnkRkdMXl0+Ow9aGQCSr/Ntr392O2ixmIbuiGMbc
         Nqhgb1ZJETJywyL3p0aKu/2CyUDDiA8WQ5hoWRZklTTxBRz7IBqrXCOqQpMTcJKuov8X
         pzoJFBTIAv29osAB/+d0/eQtu/2/pSz+mIRib8JTQpYFBiNszkJDHO6IyFxVl1ytkjr4
         IOlRfQgu2QM/9cmNnIU0Ww0UKQM8+zgv30DuedfVYAB6xV76MJ0RG/J/pknDeV4ErSUL
         uGmN1NTtBIT15pxXB0WtpOw/RJDiVMQNi0BLW2YnPjKPI4xws56XUB7IbhK4Vv4tKhjT
         +q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327071; x=1780931871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTwdDoBnu46cjUDEevjCAl59d136jpqiGFHXPNDUUx8=;
        b=SbOvWXX26EOML1KjINuyG13cdxeSX1ouAXaSpg+814oF16ffqk47EuudKKPv5gMUCu
         9cyBOMDLFlIEUGpszFCp6O+of6VbkjbjxRp2jWyvXQLfUpFiqXLx264YM9it6j9uESnM
         B/iYC81LvMaEKAVDc6v40XDpq8/gD5lgu7zDPzk6++xXllxlKDkEaOW+LbvPoR8OlNSi
         pn/U2fKggekGyKr403IDMb9xSABmzHMr7+DMuvXhNBwEN6frEMnZHXr0Xa+DU/cB3U4x
         iATwhxN0rDuWnQgbCdt/oXfyGMYK0qEPqWyKEwML04QuqMzhqANS+KyGpSeB9y4co9c8
         +k/A==
X-Forwarded-Encrypted: i=1; AFNElJ8vQwXuRIen/EHGtSKVLQLLcR7jfRjT3dwDdj37jD30sOMfsq+2bAM+8U3K4HrrESZklq4sAlDl6KaY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQSzwYFm2v2o91qbpDFUphwNY4lN6lHyTLEAu2gthZQX8rluO
	qWjTXEkznRd8/Sm5OUWmhgctmmqrRjs+GjBucYXNXQNirdWPqu/prtNxLPVzSfJu+qg=
X-Gm-Gg: Acq92OGE+1Tzs4az2i5FA6o2oYdzEte7DcE9mer6FAM5VEA113pgFmeqLp9f+LYHQr2
	xNY0kUtPUdIo01tW5emY0/FcNKLKsKBwwYTZwyWL6QWfbTIAER21UnKrUkVy9+Yv9YNMa6u3wjL
	b0lI2jeokf1c+UHU2dchWhJkDGUVGgCX58/H+2dJV64fS7NweqEpEI7SEGoqo4KTDVCdKkxwBpc
	Mv0Z556PtjacL8K0w9dxSJYh5hsbFVln9smVpCmUI/dH3wA4TtdnIMvN3RcBiARg5fY8y4JByU0
	FyBlsGxmFnQTFG7eC4t6Hlsyp+IVry6KX25Q/THWtjjhth0nVtRkeZNjaqe7DsPCNeEMNXLJjD/
	JtR5T6lNNODGb51wWNKmX11AYGY+JNoVVzfVByvRnbxGHeeLXvLgG0s7eiDaNRGrTQIdZXmF++k
	qqIn17NYwMT+ojN1HlDVrPg0EbAxdJAnBPoqHB/xi1z904bqpj1vWXDBo=
X-Received: by 2002:a17:903:4b07:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2c0b6c725bcmr80094945ad.4.1780327071348;
        Mon, 01 Jun 2026 08:17:51 -0700 (PDT)
Received: from wu-Pro-E500-G6-WS720T ([2001:288:7001:2703:1013:acf5:f772:1b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b00ea6sm140279925ad.42.2026.06.01.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:17:50 -0700 (PDT)
Date: Mon, 1 Jun 2026 23:17:47 +0800
From: Guan-Chun Wu <409411716@gms.tku.edu.tw>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Chen Hao Yu <edward062254@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Message-ID: <ah2imxo7xs2+kUEC@wu-Pro-E500-G6-WS720T>
References: <ahl_qMDm5pI8S9xs@sirena.org.uk>
 <704d573d-267f-41b7-8204-5135848ec9c1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <704d573d-267f-41b7-8204-5135848ec9c1@sirena.org.uk>

On Mon, Jun 01, 2026 at 01:43:44PM +0100, Mark Brown wrote:
> On Fri, May 29, 2026 at 12:59:36PM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the ext4 tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > ERROR: modpost: "ext4fs_dirhash" [fs/ext4/ext4-test.ko] undefined!
> > 
> > Caused by commit
> > 
> >    a4841d91a7f57 (ext4: add Kunit coverage for directory hash computation)
> > 
> > I have used the tree from next-20260528 instead.
> 
> This issue is still present today.

Hi Mark,

Thanks for reporting this.

I have sent an updated version of the patch series that should address this
issue:

Link: https://lore.kernel.org/lkml/20260531080019.3794809-1-409411716@gms.tku.edu.tw/

Please let me know if anything else is needed.

Thanks,
Guan-Chun
