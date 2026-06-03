Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2C2B9A4
	for <linux-next@vger.kernel.org>; Wed,  3 Jun 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497855; cv=pass; b=UhVGlapemopbUi/I3u1PRWQHMCls4V0iI6fbpfFjocaXuRk8sCJS3vQ44wi90mmKBMhsOQfHwHHn/kN37xD8HK+IqkhA9hyNCJmjWf3b8CGFUdpFSGAsY2ah4/ECWw7bAY6WkCff/ztpK3ex25oafiTed92iER5XU6XEYP9OgX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497855; c=relaxed/simple;
	bh=2OkasJ0ndKZfg6cpcJo7yWgVLndNvCdeEQG7xxbqLK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXaF3Ct4y7plxr0Q1a59sXALXNnJHj6vu94X+EcAWWvklYPVqsUYXDXAoiw15h5G+4eXh6mD3fwHesj2zyS9zZ8fAPbKGs70xk9HFtbOuVe7KtgWgEhEaa0p853BFT2bI9VkCHwqqqOZ0Sd7i82Ytq0GZKCiXNNXOwHOqC5e4XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=K7D5f+wx; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="K7D5f+wx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso3475991a91.3
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 07:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780497853; cv=none;
        d=google.com; s=arc-20240605;
        b=FTwFSjFCUP+GJ6046QsVHAFukJOo6785mHbfWQAVWxLb2yiBQqjC7+s50nNQy45lXm
         1M7uKMmwdZGZuGCK+b0vu3iKqsOOIrUDPEE/bmShn54uU/NjS6CUAtkkXsrgHwroajOf
         V/GpNMEhciOfYjy0F5p3Uqv9I8uTwu3BLv+y1pjxcM2XLKHsleIn+bVqCgqcPS+DEhdZ
         Vom3nEUjjXzx+kJPpo3N4IIQdvPhWsl9aV/JtxpmBailytA9xmVHxtteDSwTlngGwn4r
         ax//rlFqh6PT2+GrLxGBj0hSWaG3aBtAxtbpu//jQc5ZmGywrRw3/czj7h1lPW37x6XY
         67SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y5JjMZYEtQz+6ik+uw6aiCOF6sKgKEkR5ogTnZvnVt0=;
        fh=qBQRK3OCzPT2nds5tUPq2EWimpTNvJZkPe8lh4DJmyA=;
        b=jdXJ6v/wh3T96aeCbAiYa5g+xniuFQyvTOL5C+HzNKhxqOCFZFSKEZLITuVP/GQOsH
         Hu9LBq1zeFm+ypAw2iF1okjVR8o+rRWmcLd7BSKXQq3LxPF1txyN2Cq4+xFHGbspURjJ
         JcEJEGXjzNISZfB6up4TVffm8bS4nzqOKti/Bqv8y+uEqgt/PZUma/X3n8t1b2ipPBMM
         brn4ZMevKkGCih7Om8z3pkhKdx11zzb7UjljI7WafFLkofH5l8SdaDxtdfjlDJ+ZDf1S
         D2Xg/gqybxZfkl+j3WPrUqIikhphcnKEcMcMO8RrECTMVR3F/IeR2fvlsp1HjGr05pSL
         19iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780497853; x=1781102653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5JjMZYEtQz+6ik+uw6aiCOF6sKgKEkR5ogTnZvnVt0=;
        b=K7D5f+wxF8jERGEb36Ms0OO4m+9Fq0hFqokg0cc/mIe6f0adFu2IYc5qQhRMZtXZbo
         pYvyvR/AEHzCCdFP2qNPsBqN8HHt0YKQzvy5TLrFSuokRHsD6sYOc8KrthK3gVHRHmLG
         aJfQ7VIK3oh18o8tj3DvLr9YXhwnBfS+6F/l33cKn7Ux0qcvgzzYqCqEAxEhIG4iX/No
         66kkJd70ctGAG0yysuDInWJWr7gBdbAJ5QaM5ZPB1rCQz6WWysVhBAWyFeV+VVKr9R9b
         OECQC8asSoRgfC9w8GuRmhULjIm+omSKKVfyFaM2/3yu3fnr5++/8/i9nD+k+dmevIFs
         u51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497853; x=1781102653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y5JjMZYEtQz+6ik+uw6aiCOF6sKgKEkR5ogTnZvnVt0=;
        b=Evsi1oHNoEdgMzHV6nNT3rV6liMf8spZ9Ot9nxUvJztH1DOoBeouvn0G7LHgSH+4zI
         NIQ/K/Uuht7eOmKsji57SGx3pGN4xFvm/FfTm5JuYtTSSiqXLaNMiZG+kqR/SDKmG2N9
         N6ethmgfy+ExzCrssEpX7zBPe9AdsgcYztEz1h15Kw/Y0eIqmVRXkReZVk2vBvFC9Kbx
         LI0qeZJSd+xkRFIkP9Br0kAH4UKg/Uq+JUgJi85V9MLHdrBegVQaGDntA8z/XqLtwAJy
         zGguhimc8DFEVCsUT3N/X20GHAWaqaB1JD2er34aonrQKpa4nvYfPubfVg5q25ErlJpr
         77FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9USjtMHPutoCTHYSuCCaTztwPcdiGNM4D8Ov4p31M4eEjPkx+Lw6HSjC4grQJY/DQx2r6gCAInqQwN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxii4QP1mbBb/IRRrvTmzWc5pSvw+LZ/nLEoLoP9TVOkxEiZ2N8
	mn4mdU/xmPtOQ/+r7Zx1i9ZS5fZUq1rjeBGJy3dWBZSxdK7V7owAwBdcybNb6ZOUo9z7hiEv5nh
	QhVMfZhv0ox3F3oHeuhlBP5O5+x//XZV2OGvUS3rBQEPsOdd+ERJ2gA==
X-Gm-Gg: Acq92OEz+C6cEtQia7hLBahEVHX6ElGwXBRq8dIrWX7WLa7aP2mCs9BDR6CXR/JxysL
	m1uZbkhbjl9K77G+8IYagV08wzX/xE8nqY3ryeHTCTWXVfEdJJeBY7ocEt4tC5C2T6er2HLrrwm
	IermBohfrOfvqgrQ0BbY68w9AfyyaeSKZHKOkXfY+PwXoXQ1WZSRXzWXaEUca5Gy8MtZsc+z1oI
	QdRooRtavGWkGi3Wy18WEAVALJS+ecmgaYBcl1tiL+PDau19yzEN8pkA9uQnbO20vxdBLE5i8xx
	b567yp+ULhMyHh8wQg==
X-Received: by 2002:a05:6a20:d4b:b0:3b4:895f:6ac7 with SMTP id
 adf61e73a8af0-3b4978a23d7mr4133938637.22.1780497853207; Wed, 03 Jun 2026
 07:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah8BzqSmZO40xYhS@sirena.org.uk> <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
 <CAHC9VhRPbkVYAMec0KG55er6GOPdKqMXKdpC8rrHgiAodSv-sw@mail.gmail.com>
 <9d34218f-abbf-4a23-8b35-b305873ffae3@sirena.org.uk> <CAHC9VhQnBi55hjwTATA_tgKNZ=StFYTKu2Av5R8N4yDJwsFswQ@mail.gmail.com>
 <6565c4a4-3102-4521-9c84-48c7c7f0117f@sirena.org.uk>
In-Reply-To: <6565c4a4-3102-4521-9c84-48c7c7f0117f@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 3 Jun 2026 10:43:59 -0400
X-Gm-Features: AVHnY4JIW8gQBYMOr8fggrJDG2mD4293Ofq_rtsFtHA031eqjcjZT-6N6e7Vah8
Message-ID: <CAHC9VhR9R-wBAj64aO60pSUb7f5Tmfj6gprrHQB3g+=WYF14mA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Mark Brown <broonie@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 8:42=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
> On Tue, Jun 02, 2026 at 05:45:04PM -0400, Paul Moore wrote:
> > On Tue, Jun 2, 2026 at 3:16=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > Can you ping me when that goes in (or things are otherwise resolved)
> > > please so I know to drop the revert from -next?
>
> > You shouldn't see a conflict with lsm/next now, but if you do let me kn=
ow.
>
> It's still there today, but seeing Linus' comment about not merging
> hornet I marked it as BROKEN instead.

My apologies, I forgot to push my local tree to kernel.org.  It should
be all set now.

--=20
paul-moore.com
