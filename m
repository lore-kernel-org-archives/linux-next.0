Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB253BD622
	for <linux-next@vger.kernel.org>; Mon,  9 Mar 2026 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063940; cv=none; b=G5pySLSAjbXexF1MjdN5HRbt3MOmYbJbia6G3wYcCBUldnDDlNliI/8+DD32uj8HPKnazO4U3fmhPY6kPV5wy0+1KvuDjsIHMVnF2bhkqnp1ze/u654FStIJFLKHRMkN3onMkRGYVKkbTW5pIoftiMv1/ll7E2Bv4suBAHhcUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063940; c=relaxed/simple;
	bh=uddqbxl+vm4INHVDsFZDsfOhahpG3Eg12WAFVmI6R5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS/RPYQ4N5fewrrQCQyRXxnYmu5rsyAfwpBV63WwLRyIDBLryXyHmXRNTm4na1X4KSjrN6Tn960cZ0izwmM6HHIo8CU+Ezm53PHBhDRUZniJFNMtAPa2O4EBKcfWd2bOE69M67ivOIPZHWaXkpBYyy3+m+Im3OFD11t61iH/fOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=DHm4m0LH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="DHm4m0LH"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd8576a512so106626885a.0
        for <linux-next@vger.kernel.org>; Mon, 09 Mar 2026 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773063937; x=1773668737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Uw8s+Lr/i/CCt0GHJ4/G9MAiFOqPy0SXBt0sEu4lXE=;
        b=DHm4m0LHBVZmvmjAWxaZ2Fvb5gyxKspySCOsxsDuh34DMi8gng88dxJ/rek6VWUhlV
         huODpjPVIhVaRucCVbwTTxlG7vS0NEL+ocncsBm1a/JXN8DH1kgwivrnlUZtdEZViVnQ
         MgS19b575+AhLtWTh/hr4W6wg47klwxhkX1hDbuWBMBtviJY+AvAET5K/HgDhJt/IL71
         k3merj5MqOgBCxpDTHscbWREv8DbBhmr6rZ4YmumaOw5NaYUQxX4rzmVhs5qwj0OVmL9
         +vytZY3kGvx7t3zl7k3r0DKeYN5q3bKvKb1vJDYvdVYJMJ0YgmukP1pEfmN8vsYHbViC
         wptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773063937; x=1773668737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Uw8s+Lr/i/CCt0GHJ4/G9MAiFOqPy0SXBt0sEu4lXE=;
        b=ERhCaCv2ftR3eQJCRJI1BK2qPsYyWcZhmRU7I7lPAo+ol7N8f7uvp53U2fq1qoKbcU
         AKXwocLcpKuTFWwcAXGk2bm8NfSRCnekD9h+7oefw7hrl9/HbML01HTARtheCNVEWQSS
         HqO9vly+eu1sJF2TArn/3N51bWqlmifLcp/pT4fAZ7vjOOnQnN5KK/6+pUaBkdmaaGVj
         xoI2YgaHW+cMpO1Aq7/c2Ecwh2unahCFw05q30F2OUoBSEAuPNT5Cqe/3CuiQkvMP401
         aNShioVpdf8IywBv0E3YEebxLITsWjzpKCPN80pN/ijN04GsHW2keDDlkpgj+i1KHxbN
         YClw==
X-Forwarded-Encrypted: i=1; AJvYcCXCipwdkWx8BA91afwbj1tzJ8FGb6tY6NjTkNifkSOmLBKxHfytcHHCVXYAEowiu2e6iJjxX07/eM5X@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXsiZH2MvuGQHR66761zpKnOavMamqUU0Yqut9BvMDDuZNTpX
	TPCAuiM/R0DjkwNIZG57mRfGcBW7PgBEJ8UraMWAwnKQZeS6BfYFsc0wweaciA4on5Jhyg/uk4F
	P2VjqiF4=
X-Gm-Gg: ATEYQzwZOUfAQuIn08rQ1S+MyNxwNTypzQ2j9ZF5P0KV+Tmxd1j9wSxQwTDcQNQX0de
	M2RUQI3tMhGixv4LrJ5E7Uc014zRAgjBVXOhJ0+/cw9VrBGTX4PKniKoO0G0aY6QJGNQq2hW623
	xA9h6ew9d9WQecX+3GwO3PmqMAIxtIYmQuUz0j8tzVCbKfQvxN8eGG8so5YvKqk3gzmISckchPu
	OMgyJTPYHUCVtmZmHDM8ARnBsl6TYdadWDus7zRKVvRw4LCF/qroaKw0k20LWAfeD3nKdASiF3f
	babAZuOBeZF13Hz+UkfoOY323sHrQZe65+urxw9Nacj3XUXnDLZO1G5oApXV/GeoaD5ceO/8d3l
	VdWJ8Og8hK5uveO0GnaGHX/3XzFBEPd1CMULPZNkiFVzCP0/4j01dotjMUYJx1hK/vUkEjx3Xjp
	Rpw50hRguEgteXJzEfRAWmIpLJN8vOCGXDYJ2jVdYt8s/HDoSP0Q==
X-Received: by 2002:a05:6214:21e7:b0:894:5d38:2e38 with SMTP id 6a1803df08f44-89a246da7c8mr222716366d6.18.1773063937291;
        Mon, 09 Mar 2026 06:45:37 -0700 (PDT)
Received: from [172.19.0.48] ([99.196.133.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316d8936sm83547586d6.28.2026.03.09.06.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 06:45:36 -0700 (PDT)
Message-ID: <fd00969d-15fd-4ace-942f-a2664e317813@kernel.dk>
Date: Mon, 9 Mar 2026 07:45:25 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the vfs-brauner
 tree
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aamIvIWiZDDCmNYG@sirena.org.uk> <20260305145428.GA17884@lst.de>
 <aam-ijUWoOP5hhAr@kbusch-mbp> <20260306142257.GA16612@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260306142257.GA16612@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/26 7:22 AM, Christoph Hellwig wrote:
> On Thu, Mar 05, 2026 at 10:34:02AM -0700, Keith Busch wrote:
>> Yeah, one of us should have to rebase to the other. Since mine is just a
>> single patch on the one colliding file, I think it easiest if I just
>> rebase my data alignment updates to the vfs integrity branch, then send
>> upstream through there. Let me know if there's an alternate preference.
> 
> Yes, I think that would work best.
> 
> Jens: is this okay with you?

I think the mistake here is the fact that the integrity stuff got
ingested wholesale on the VFS side. That should've been split. So
why don't we redo that part? I stage the first 7 in a branch off
-rc1, Christian pulls those in, and stages the ntfs3/iomap/xfs
on top. That's how it should've been done so let's please just do
that now, rather than make an even bigger mess of this.

-- 
Jens Axboe

