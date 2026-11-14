Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684979;
	b=pUlGKrhFKFAUkIWvHaiTTviA3bs0lHx48rTK2Fno5Yujf67FcHHfQj6TTE51KCdYFtvf
	 chb2bMJT4gWK6XbQYF3LxtVf0tYjgEG6Pz/GcSFY8MbWAJF0Ns/6sZnKZQXt91jzn9jHC
	 D/0xX+3SzDX6hwt4do8rlss6CdWq2BeKu+yLp7k6uVde/DmOL17+pRC20xh/RqElMB+1J
	 8+OuH8CwszIQdJZu5J3X4xMJtcdLooQ2X7hmyYcRqnnneymrp51ZRsjMAGpZpr+NORyHk
	 93qmH2OQyph7HWi3PECUpOM2tK7yl/Nu9uYjjS8xXITlSI1jevr/gBhsYPtjoh3kM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
	b=kAx6yVI4XOv+XM/CzvIhJiDU1yIG455yQK8jplIAL7kwCPHXzS63+s6PZerTQqIWe0lA
	 5XMp2LY0GzRtwCq3uvtrP2ziTgfyjLxV0ytYUP2ahG5fM/kf7YtqfbY//jku4KARrrfCU
	 b5AEQRceJ3HeVNOGhU5GTaE/ezNybKub2jg4CNZnmsBQz3Y61PxaLgl5YULtZx8F8af2k
	 pZuB4FJWLm0dv6Y17BijFpbUTdVv0zAu0qNc6In1+zpaqhI7QF4dLij4GsHF05NqY1oM3
	 yJgmUoQD+RVkfWA8IiLJ/z7gcMcNWGIVIeVA9KOrJJF/TlldsnxHi9EwR0pBSODiv6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZLxnZCh;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD14606A329
	for <linux-next@vger.kernel.org>; Sat, 14 Nov 2026 19:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD14606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZLxnZCh
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2793081a91.2
        for <linux-next@vger.kernel.org>; Sat, 14 Nov 2026 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684978; x=1795289778; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
        b=FZLxnZChQdyk+y/moM6mcBlLd9ZNuBhzt+gBd6Ols7VyBVMrSNtdAkaKCydZLm4B22
         ICuUw3eK91GGD4OKs5+ktA4ssURexzME56B4NihRNiC1LOxfvZoAYle1rhZIbFivaJu7
         Czn8mFXFNCxYt1mzJWwixcgMfWdYAynr0PqRdRwswhq9LYt4zcgfR8rWJqBBvYL8tK6N
         CxkwQl+3hLLGYadKwqsKLA6/xFDoBWwRD/TPGiSTGPTOQ+dR/UweDP0Nhp+uRTR6gs8K
         prGyDJbJkDZe8EJIFSo/glcotCm4LOHr+cuCkyz3RFMrcBIqVCR/ij8hj3Y8eyH7jOHh
         jETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684978; x=1795289778;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zVUItnPHFNIUP4Z+vabblcyhI1ThNWFGye2ryxOmnY=;
        b=ZwrOtfXuLWEkvBc08uLeCK9R4q7bVZgu205OmTovojKBAsRq/pFq02HGiDJ+oiCtMs
         aNGhyD0dB+j4HvTbeGb0nqMsToN2y49E8jpY9LccneyFcyuHQRG40WAgX8X+SzfNmz3O
         pY/2RKHcMAyltlbWhmGxzZSfkPKmZTqjhTjKi2VBKzUhdlWOf2ANHLUrL8BvvI3puOIA
         klYUm3FfS/0WLeqiHBys8xHCpjzfnP5/r9mxHTFW9XAl2jYPtvNnebABY0iA1hy1jKVl
         sNDZV6QOGQSJ+ipXgiS+FWd/SEIOrRXrk8YZ5sLp+Xe/3Ojb6pw4rY0sZ/QR4ess4w6N
         LP0A==
X-Forwarded-Encrypted: i=1; AL+hErHlEtOqx8RIjO2hu/3pl6WyweMPxV98JObhOa7nUMGHBq5jjCGMpmoN9QnV4f6Im6oqP9+ZmxXSZGJy@vger.kernel.org
X-Gm-Message-State: APuU4Z94jBVL9nYnGtSS22TkXjHyHXo/1bDTUdOLRrzGBbzUVlRuoiHn
	DFSauQOigUHViQesVlqBdFApkiy3ZjORqRrfXlavJH4WvTeoDw1s0wcN
X-Gm-Gg: AYBFou3mQb950+D8AwPHug6THLd6/AfDi8Ms/3bvncldnudRkQDlSHnnn36dCTyL5Bv
	tx9tGqoIiq+t9pCq83JREe5kvgFWYZYgfSaHoyWClCLjZlRrl36N9ol8lNmntWej8dhNZlg6xfb
	0mvgK3OjZsLY6y04aqKtHRL+thBVXkZpMsiPjuz35PvLRDpGauIO5QWSZkFa78WncYAb+OZD+U+
	mUt+zLsCIbRqnnQrvx+JDliKU4fXmaMHbQ10bnkzInTQtNXaV04Zj85o8Tj0Zv8pMUjMzYrgbNp
	TdedAvdbwA6jJWIzdUHOz9KJeEq2DlA369Jj5nBmshEE49wiWxbOkgEh2zuUUiYXeSJfKcVfKnU
	2xdoFStX6lAYNsLq+4iKtCY/oqpHVVOannEo5dHXqqE0m76njgEn61cyTy8LPBEAskH7UbCGxhC
	JXB6GThMfBfvkEPTZWJHx5Frf5njjNm1RGCkpY9UGXui8yo++MtipMsZ1dlSRffB4JqfUt/Oc0R
	ppZA4XMpvkhUNjMmipgaA2C73McbZ2q5WxFfM0+zXTu1DJP9AGYH29+NQllkTpd/wNIKOdZ6BvG
	QEEblZZF36jxpcUzyCI2C4OyBC9xjDr0broPaHxnys7QC51nBlelbbCfMcgHrXjyczo460+bgnJ
	idaIerFPtcK25SrbsoVbs4lpkDCS/We0rEFyR+V9JJuu4BXOViUmqSYs=
X-Received: by 2002:a17:90b:4ccc:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b1b0b6676fmr5703275a91.11.1794684978409;
        Sat, 14 Nov 2026 11:36:18 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm9924002a91.4.2026.11.14.11.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 11:36:17 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 19:36:17 +0000
Message-Id: <DMV6Q8SFLQ72.2AIN7VRB1JJOW@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Kees Cook" <kees+treewide@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the origin
 tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <avNO8cuAdnwv9D_5@sirena.org.uk>
In-Reply-To: <avNO8cuAdnwv9D_5@sirena.org.uk>

On Tue Nov 10, 2026 at 5:05 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/cfg.c
>
> between commit:
>
>   0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")
>
> from the origin tree and commit:
>
>   6771f70a47332 ("bpf: Remove is_state_visited(), bpf_compute_scc() and i=
ter.depth")
>
> from the bpf-next tree.

Thanks. It's resolved now.

