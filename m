Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7891DFFB
	for <linux-next@vger.kernel.org>; Mon, 16 Mar 2026 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677804; cv=none; b=oC5GLAm4v3NirnCc7ni8JmD/eDY/q0qPvoqOIOwBbXWGL1OyTr+6Chx0y3jWjeSxyLzaFWZDQl/wQLCFFVkP5sMWv+yOLRYRkoczV8VbEpCU/jdMpZ3IBYWLwB+AY32lnkgsPBQA0/CHrp0XJvEqXDCMx2mC7/fjKRgxqSWU5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677804; c=relaxed/simple;
	bh=XwMJB8RHHvUhH/cZpiA4UN/3HmQRSD+owhzGHAnIW5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o3ZQpZHaFmJiiid9TFAUiaEkxYAjOkHu4Lk33xpq7slYy6d0BTI/uHC2jnVWHQKK8BmKxxNvSajwlLwxZxkRIUNrXN4WTGBKStxO3i4YxJwz8U26qDOVZlqEPLlS21SKZer9tgZrNTajUJvWokxidJN8OnDM3M1/Ug5Hkx5ZxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fEhzCv2N; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fEhzCv2N"
Message-ID: <6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773677790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YfUyA8FXap7FNQKwzw+IyJSbOMuEyJIojfw+PE3m8/I=;
	b=fEhzCv2NC7ppyGlL+Dh0AsoUcCFzfEjoWteogjOIfI2Ka5M/pVgAa/MWCmBScQJFBaGpHH
	Nq//NXTy5/1cethqEl6YNO7RgzXEqhWZFe9TC+3Ovfnl0S/9czc0pi+ZKqarKWIBC3tMpa
	YXmBKnSshXDGusv1WqcEHpGC6qHhGHY=
Date: Mon, 16 Mar 2026 09:16:26 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: build failure after merge of the kbuild tree
Content-Language: en-GB
To: Nicolas Schier <nsc@kernel.org>, Mark Brown <broonie@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 KBuild Mailing List <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <abgRRX3PH9IaExi8@sirena.org.uk> <abgph5Gk1G8UgG2E@levanger>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <abgph5Gk1G8UgG2E@levanger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 3/16/26 9:02 AM, Nicolas Schier wrote:
> Hi Mark,
>
> On Mon, Mar 16, 2026 at 02:18:45PM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the kbuild tree, today's linux-next build (arm64 perf)
>> failed like this:
>>
>> Auto-detecting system features:
>> ...                                   libdw: [ on  ]
>> ...                                   glibc: [ on  ]
>> ...                                  libelf: [ on  ]
>> ...                                 libnuma: [ on  ]
>> ...                  numa_num_possible_cpus: [ on  ]
>> ...                               libpython: [ on  ]
>> ...                             libcapstone: [ on  ]
>> ...                               llvm-perf: [ on  ]
>> ...                                    zlib: [ on  ]
>> ...                                    lzma: [ on  ]
>> ...                                     bpf: [ on  ]
>> ...                                  libaio: [ on  ]
>> ...                                 libzstd: [ on  ]
>> ...                              libopenssl: [ on  ]
>> ...                                    rust: [ on  ]
>>
>> Makefile:2254: *** extraneous 'endif'.  Stop.
>> Makefile:2254: *** extraneous 'endif'.  Stop.
>>    PERF_VERSION = .gbc1f864a1976
>> 52.34user 4.91system 0:56.88elapsed 100%CPU (0avgtext+0avgdata 140840maxresident)k
>> 0inputs+0outputs (0major+1379795minor)pagefaults 0swaps
>> Building: arm64 allnoconfig
>> Makefile:2254: *** extraneous 'endif'.  Stop.
>>
>> Presumably caused by commit
>>
>>    6a76b3c06a1d3 (kbuild: Reduce the number of compiler-generated suffixes for clang thin-lto build)
>>
>> though I don't immediately see how.  I have used the version from
>> next-20260313 instead.
> thanks for the report.  Unfortunately, I cannot reproduce that anyhow;
> but I pushed to kbuild/kbuild-for-next at 12:36 UTC, might that have
> been a bad point in time?  Do you have your merge somewhere around where
> I can fetch it for investigation?

I guess it probably due to my bad suggestions (sorry I should have tested before
sending out).

else
CC_FLAGS_LTO := -flto=thin -fsplit-lto-unit
+if CONFIG_LTO_CLANG_THIN
+KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility
-mllvm -always-rename-promoted-locals=false)
+endif
endifIt should be else
CC_FLAGS_LTO := -flto=thin -fsplit-lto-unit
+ifdef CONFIG_LTO_CLANG_THIN
+KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility
-mllvm -always-rename-promoted-locals=false)
+endif
endif

>
> Kind regards,
> Nicolas

