Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3BB38737B
	for <linux-next@vger.kernel.org>; Wed,  4 Feb 2026 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232512; cv=none; b=tKIIP9QdO3yHNzhQ5LT2o9MQsdxqnH8lztY4kJXqYVA1rMofGNXXSzlaYaoGUHXWALmyx63D8f5nOvucqT7/HEk/nkkT67h7M7KV2ZRK/RRD6KnU2B+IM3IZUT2wHun31mgAQpxym5UAGmeGV/M2ajB+ztda2jS1z5DozclrXCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232512; c=relaxed/simple;
	bh=QwXMpvEjpmwlx5iZRshD+ibL+awMEH7eTVeraZrvIN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoeD+mHWRXoOFNjs852zvnjFRtGUWGGCsYLHiBO7HSnnpkfoaXyaDJaGToSWpImzHYy8wLMGqztKfPfc+o/+zJEqL5SqGQ8m0kA2HQUKHSowHDaV/OuJQC3ixS7rMIckonI8HPtZ3XiPdjjc5zNELNyEuLHLmCMXbG+2YkNeOjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtajeZwS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJY5bcgn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtajeZwS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJY5bcgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770232511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tqmai0XOq22QbtgtcTu8Te/h8pcU3CnbiTMqhAWwGCo=;
	b=dtajeZwSBy7vVs39zCCbjF5uXrPlP1h8aUPDus8qq0dpWtyQZ9JnjQ0SrdE2d2OUj3uOMN
	ZWpb1iJlB3enbHWLEp9hP0fDDpryRn5i1613dA7qWHDM3K5lM6GExom6OgNW9kE0xXl3tf
	li63wqwGNFKk2jqPLpUUeDWTwrCbn9o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-zidPJHXUP8mnfpPI37UNHw-1; Wed, 04 Feb 2026 14:15:08 -0500
X-MC-Unique: zidPJHXUP8mnfpPI37UNHw-1
X-Mimecast-MFC-AGG-ID: zidPJHXUP8mnfpPI37UNHw_1770232507
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-435af2d3144so103689f8f.3
        for <linux-next@vger.kernel.org>; Wed, 04 Feb 2026 11:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770232507; x=1770837307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqmai0XOq22QbtgtcTu8Te/h8pcU3CnbiTMqhAWwGCo=;
        b=DJY5bcgn8yJNAGZjo9FUL+A3Pcb+WgJcv+9ZPyb6oSMWNvv02lPPOC/zRtlLFw5jrY
         xzTu0hcf/n3bDDgG3bCdqleKtAH2Wx3N9bYqKQ+A8YfF3pGGiegK8TvGyOshK4T1j4/4
         wOQnO5ChF0RHn4Gai0bBFoLpo5m3ZWbiQohRy++aoTrdqFywJQIXwtj+2Td62d7mQRHd
         MsK+e5/NbqL34kS4tae8tlU8NYfzhFwN3EsTzMw+ZauZXWO+KVtCWlNprpHs8/ZIR6mi
         8M6d72EzPTz4luME+wO0wwc2o2w/K2bSxz0G0IoHFYrVLsIywiEmv9Lx90Mh3pBWvZGc
         hCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770232507; x=1770837307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tqmai0XOq22QbtgtcTu8Te/h8pcU3CnbiTMqhAWwGCo=;
        b=XvCGswCY1vG7PLrqhjDj/iTZ4XMoh1lyeLqTyg2FIVk+hMumAqqJySUWzcIumsMhYq
         XK20ex3ZhfFtKz/Yame5q6E8i8WL7i92z0xIgxwUhoxv/PDDRpxn0ObJkvMD762/jAzm
         +FqaHNdgmfZG9k5pWRvafTJHYbxxZ1HXxK2VltEUBsN5EZX47BN1dA1tsCM9s0z70D0L
         WXiW69BJXaCv5WOqVl+2GgeNOXDG86z04gGLRKPTFjbAsgUYisYXJVdf+ROtn1VZtA5I
         5pUnYjKjjlCZo8vH9yIA7RJX/XbG4n0PcWRzpJjxaDIv2L1t06xPkviD/7uDkTZc5Ukm
         6NSw==
X-Forwarded-Encrypted: i=1; AJvYcCUZHe4AxmolkYH/qTrWXULWtr5wGcpDvwMiVOKB+WLbDpK6B8eE2ppgUCx2YtUT4bK1l7nFyHITLjqB@vger.kernel.org
X-Gm-Message-State: AOJu0YxClFcq4B/Z7p2k4K3CjabAqw2mXw5lJs+mG2rd46IouP42qe6C
	feBjJFC3u+dqYtfdB4A3lQE8w7wkexDsHI4EATPlW01ZU6Qf9UveilYNq/PCOzLrAZUYzhYuVae
	sDTiRWITAlo7a5UXixqt5dsW1oHrIhtVGwWan/Vnji4BxXClIazaQ5g0+OnDlxfk=
X-Gm-Gg: AZuq6aLIb0XtrnJzhzvRsUizrL+uqUYorUEZ9Uae2mIjD1Vcq8JrskW7telYiNR3bFJ
	IyHqe+b+5zYG9OFEDMCvXQiSLtxHph6kl/F6B5lRg08fLPPPvyrXlG2gFNDxy5uhulOAopjiDLv
	r+PZqwxchfV7opmbcgt6+5XvzruTNJIRQRVft5APSSrUJooSK1kDpN1fh66Hq0dYio4Y/LozGkD
	yDSuCVezJ76xVQGZXH0I0b9dyYtiYXcfH2MIkkYNYd+iIC9vd7zWX+vsOA1+Dm+A/kz9YmsAWZg
	Er9vHlo+u/3VSPTFB5yCwR+cPdKU3MJHu4goAb3Ogk2va0QcYmhK/Hf+QGvTEE+fds0ZAb+cBUe
	WB7TH5SXi3q5bTTrM2ihF9rovEBm6gaJUWA==
X-Received: by 2002:a05:6000:2881:b0:435:a135:7772 with SMTP id ffacd0b85a97d-43617e35407mr5586045f8f.4.1770232506618;
        Wed, 04 Feb 2026 11:15:06 -0800 (PST)
X-Received: by 2002:a05:6000:2881:b0:435:a135:7772 with SMTP id ffacd0b85a97d-43617e35407mr5586015f8f.4.1770232506117;
        Wed, 04 Feb 2026 11:15:06 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25d0dsm8601974f8f.7.2026.02.04.11.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 11:15:05 -0800 (PST)
Date: Wed, 4 Feb 2026 14:15:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, Li Chen <me@linux.beauty>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the nvdimm tree with the vhost tree
Message-ID: <20260204141450-mutt-send-email-mst@kernel.org>
References: <aYNVXlLl98EbCBBO@sirena.org.uk>
 <69839b4bdf198_58e21100f@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69839b4bdf198_58e21100f@iweiny-mobl.notmuch>

On Wed, Feb 04, 2026 at 01:17:31PM -0600, Ira Weiny wrote:
> Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the nvdimm tree got a conflict in:
> > 
> >   drivers/nvdimm/nd_virtio.c
> > 
> > between commit:
> > 
> >   b381542686726 ("nvdimm: virtio_pmem: serialize flush requests")
> 
> Michael,
> 
> I assume you will drop the v1?
> 
> Ira

just did that.

> > 
> > from the vhost tree and commit:
> > 
> >   c4ae8ec088db0 ("nvdimm: virtio_pmem: serialize flush requests")
> > 
> > from the nvdimm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > (note that the changes to add out_unlock are dropped)
> > 
> > diff --cc drivers/nvdimm/nd_virtio.c
> > index 827a17fe7c710,af82385be7c6a..0000000000000
> > --- a/drivers/nvdimm/nd_virtio.c
> > +++ b/drivers/nvdimm/nd_virtio.c
> > @@@ -44,8 -44,7 +44,8 @@@ static int virtio_pmem_flush(struct nd_
> >   	unsigned long flags;
> >   	int err, err1;
> >   
> >  +	might_sleep();
> > - 	mutex_lock(&vpmem->flush_lock);
> > + 	guard(mutex)(&vpmem->flush_lock);
> >   
> >   	/*
> >   	 * Don't bother to submit the request to the device if the device is
> 

