Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B83DC4A4
	for <linux-next@vger.kernel.org>; Mon,  1 Jun 2026 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333487; cv=pass; b=BL1yXYVAgzOHQEcFYUHpy4vn+rwMuLWBElKZIUdkyMVJi/nEBYorkwwpSvvu5ovzugZIVg5um4h48YDf6d6xTly3XTYQbLC0cevanXmT8lf3BzBtfioIzNSVY0lT6JH1cBNeoXNjep7c9tNiDBvcWoQYhtM4eTMRrL+O8/3KAJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333487; c=relaxed/simple;
	bh=X9gPD9JmY4i9Kpjf8CO6+6uJrHV5AC92RCXu6Qx3uG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ee4S72PGNBKG4F+a2Gg/OVS5WL0xHZ76OTHiXC8GHF+VabnyaWvl7NfVA1tyxVB5wIJRP0SOZR9CPtnkSEojhc5zKzyVO9eNzNi5QjaQCMOeVufj4Cyr7ZEsPyBTvSxo5uZnbI40q5UGA3JiseDKxW/d93jHQnx79QOegF0Fp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V8gTveST; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DL/rMisz; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V8gTveST";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DL/rMisz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780333485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWY7+zLcstKVcaBHa6DF3oAjfO/xzJSbuw3Jcm1WeHw=;
	b=V8gTveST4o/Jjb/TDk0QNAAejXxb0l4OBTGS7pynZfaLDMbk2A+H9LSHFxwKLcqMEkob7/
	StrTfuTgrskKzHpXbYxhviPej4OpEGmyoUlr9CysK+z/Aqr6BcmI8d5zBTRuxN7f3BJONn
	X3OsV39AI2KVOPvnRiwWtvZyN7JrJ+A=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-mXMQjVozOnO0cbG7YhW1YQ-1; Mon, 01 Jun 2026 13:04:43 -0400
X-MC-Unique: mXMQjVozOnO0cbG7YhW1YQ-1
X-Mimecast-MFC-AGG-ID: mXMQjVozOnO0cbG7YhW1YQ_1780333483
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7dfe77125eeso48998887b3.0
        for <linux-next@vger.kernel.org>; Mon, 01 Jun 2026 10:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333483; cv=none;
        d=google.com; s=arc-20240605;
        b=ej5QHci7sHBRB+c9buOT1B/WtcVbSO2xHnK0CW+6sQ08bZFMWADbd63wan0QoXQY1B
         UlTIKrRMNUcZmqeMW5qMV4priG03iiLwGK1ZFiQEfMC5kEAgdor6V15FWgsxX5/3DV/l
         /o3fDv7DAC0SyUrSmzzM0s1GYJE8CTZGCZ5HfNBoELpDirZVjYr3fL/KY0c7VSEgQgEo
         JEK9+S2GNka3WwRVkWlax18LH9s9JQyR92OxE5401tR2fjFV8epb8i9sUpBcHz1dY7RL
         s7GPRDLfbF3M0lRxwz8mbX5qNBNqbFHvGDUQVSyJ9AqgIawJBbkgIfCn2OYbRozmkvhs
         RZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pWY7+zLcstKVcaBHa6DF3oAjfO/xzJSbuw3Jcm1WeHw=;
        fh=rBg+gwHDRGOiUBeapQ1w2zcc1GZtU2SJoolsvpvmBYM=;
        b=J24XhEmcSWTFdIi/kk2QlErkCeVtnm2AseUXFny+QcoaJSPhhLFi61GyUZlRrJQoMO
         mOY4nO6x0xrJNbLaEU/wiJIAqBY3+IJ+0jYWVW35PcaAS1YN5XsuTptB2MGwxZTIHIX8
         UPGTPmHSplDmZlXd/dAdJnDyJDYNIeFli4hrUp5HiMKtFGBVmtBIn2xTBBHPDgG/sPUi
         9VE7aLA4LFMaP2GFQDJUZ2obtaURtEB+Rq1X/rxseD0RmG5UKnNO/wdWFXMPduBsco2D
         fyvHIZRi50x1s4OKW0rL6DCaSOogRIUhRXC2zjLW5ceVoWcHMINV7GezkiWBQ55jdgS7
         Qt2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780333483; x=1780938283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWY7+zLcstKVcaBHa6DF3oAjfO/xzJSbuw3Jcm1WeHw=;
        b=DL/rMiszEPFopA2Yw5dj/tWQZCegcj87JsEj7AsmMELg8s5AA+UdusyvoTER2ydtfk
         WGTOMXkrs0oZGtJmds4PwYQA56eJFrhKCnzso9WUoIkZuIFyf2C5LlNUgUEkVnM0flv2
         3mECAANL1kG7FJb4PHIOMFO6G5tzOSrP3vXPApkIqoeG/V86/t3ycca437pcMGfetaR6
         mc0h9doBvmO1/4vp/x/MBdjjtaEEvtACeqiU/VVCK4fKAjr1TXKDmOXwRT60xOYS2cBK
         oL2Z2X9w6wW5pzRWpBc4NSsjH5ILr8VFBmjIiHQxKreQ2BJ2Sofzb17KuFsx63MS44k4
         9CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333483; x=1780938283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWY7+zLcstKVcaBHa6DF3oAjfO/xzJSbuw3Jcm1WeHw=;
        b=XDBi3XeIFbAKazeu/ZysNrFu8ZMcD0s0btlS0fev9H78MrSRRh6ogc6B3wjysWAj1+
         hucVjLkt79qz/J2QpakUCR4sBHc355PPYBy3MI+L9dtMRfwgPQByWD7BOYJ9JVKX+qS7
         E7XG7ME5LVvD3+MOlkipjRVQdfNAr/ARDTttVhCqUQQFSnGH5gMIufOWS5O/XcMDouo3
         5ZSf3frLKYifgKDS/gL/we8T+h08oGmkH9mrzFEUEqLU5RyWKjGOjxuTMrHGskUPwFSE
         YlqJTTKK+oF5Z/OT/32BfnqpRDD9gfUaIIoIkwqK+hiVSN2QPA9nYoomynymumlqTjs/
         8Akw==
X-Forwarded-Encrypted: i=1; AFNElJ/HYohJ4sESVdSiZ6FCpTo6R6/isjDBro4dRNhkm4paSskFBaxv04pd2Mk9Anq1gK3UuBykcnvGD0Kf@vger.kernel.org
X-Gm-Message-State: AOJu0YygktcHKAlAEGqop3eAFBnJsUFYjsN1TzHE56VIF8iBTNPOglOP
	+S20cfbJYkZOo4S1duphNk3Dmf76fsXg7DVifFwi1/pciIMPeG/ZXBNCWgenpCTtTMMZ0o1bzMS
	iA41NAqBWC7GrgKbQ1ycEhfuawdm8EwOm70MhTyQScyiCJ+7j32arZ8wf/zHt9UDrw6myP4Navp
	4gdDMy/TTqdlcP6BLN1ZWTyoMB0+2zyM6a1ca+ug==
X-Gm-Gg: Acq92OF9wD08UbDzwcpK5GBErT5BrY4Vzg+NAVq+Fpd+wl21SR2S1pbP54beyypQeFD
	vQbslM6BSGlLmazFsolDoLhEnvj3jvPY5E2rcy4O57d0QKeIWAxxV011p4l5jUn0h1aTNQbC4UE
	h0TdK5Cqe9GBIZLNYXavOifd4hTab4J9NEFDLPTR2lgf8ukEWGJFnkbCqMglHkcAMmov+zGiNz9
	c2WbdM2ze6A559Nsw==
X-Received: by 2002:a05:690c:c50f:b0:7d3:cf30:ef91 with SMTP id 00721157ae682-7e05a1907d0mr108660087b3.19.1780333482362;
        Mon, 01 Jun 2026 10:04:42 -0700 (PDT)
X-Received: by 2002:a05:690c:c50f:b0:7d3:cf30:ef91 with SMTP id
 00721157ae682-7e05a1907d0mr108658977b3.19.1780333481712; Mon, 01 Jun 2026
 10:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522134724.f4f11941a85ef18b307d16ae@linux-foundation.org>
 <20260601155808.2755103A59-agordeev@linux.ibm.com>
In-Reply-To: <20260601155808.2755103A59-agordeev@linux.ibm.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 1 Jun 2026 11:05:20 -0600
X-Gm-Features: AVHnY4LWX34RPOrSLZQKCFADp8MRh-hRHO-69bPjowu85AkTudvs-SlZUCsWfOs
Message-ID: <CAA1CXcAd-uQD0LgUzWAAkFKt13eFfaP3TfG9KED2RzYGhHoqpg@mail.gmail.com>
Subject: Re: [PATCH mm-hotfixes-unstable v18 00/14] khugepaged: add mTHP
 collapse support
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, 
	cl@gentwo.org, corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com, linux-s390@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 9:58=E2=80=AFAM Alexander Gordeev <agordeev@linux.ib=
m.com> wrote:
>
> On Fri, May 22, 2026 at 01:47:24PM -0700, Andrew Morton wrote:
>
> Hi Andrew et al,
>
> > On Fri, 22 May 2026 08:59:55 -0600 Nico Pache <npache@redhat.com> wrote=
:
> >
> > > The following series provides khugepaged with the capability to colla=
pse
> > > anonymous memory regions to mTHPs.
> >
> > Thanks, I've update mm.git's mm-unstable branch to this version.
> >
> > It sounds like I might be dropping it soon, haven't started looking at
> > that yet.  But let's at least eyeball the latest version at this time.
> >
> > Sashiko was able to apply this, so the base-it-on-hotfixes thing worked
> > well, thanks.  The AI checking made a few allegations:
>
> This series appears to cause hangs on s390 in linux-next.
> The issue is not easily reproducible, so it is not yet confirmed.
> Any ideas for a reliable reproducer that exercises the code path below?

Hi,

Thanks for the report!

was this caught by syzbot? If so, can you provide a link?

Also can you provide whether any of the mTHP sysfs settings were enabled?

Based on the report, it looks like we are either dealing with more
lock contention (due to holding the write lock longer). We could
switch to a trylock but that might cause us to lose some collapse
attempts (which will be retried later, so probably fine). I'm ok with
that approach if it prevents these potential regressions.

Cheers,
-- Nico

>
>     [ 2749.385719] sysrq: Show Blocked State
>     [ 2749.385730] task:khugepaged      state:D stack:0     pid:209   tgi=
d:209   ppid:2      task_flags:0x200040 flags:0x00000000
>     [ 2749.385735] Call Trace:
>     [ 2749.385736]  [<0000017f63c8b226>] __schedule+0x316/0x890
>     [ 2749.385740]  [<0000017f63c8b7dc>] schedule+0x3c/0xc0
>     [ 2749.385743]  [<0000017f63c8b888>] schedule_preempt_disabled+0x28/0=
x40
>     [ 2749.385746]  [<0000017f63c902ea>] rwsem_down_write_slowpath+0x2fa/=
0x8b0
>     [ 2749.385749]  [<0000017f63c90910>] down_write+0x70/0x80
>     [ 2749.385752]  [<0000017f6313407a>] collapse_huge_page+0x2ea/0x9e0
>     [ 2749.385755]  [<0000017f6313491e>] mthp_collapse+0x1ae/0x1f0
>     [ 2749.385757]  [<0000017f63134fda>] collapse_scan_pmd+0x67a/0x8f0
>     [ 2749.385760]  [<0000017f6313751a>] collapse_single_pmd+0x15a/0x260
>     [ 2749.385762]  [<0000017f6313792c>] collapse_scan_mm_slot.constprop.=
0+0x30c/0x470
>     [ 2749.385765]  [<0000017f63137cb6>] khugepaged+0x226/0x240
>     [ 2749.385768]  [<0000017f62db3128>] kthread+0x148/0x170
>     [ 2749.385770]  [<0000017f62d2c238>] __ret_from_fork+0x48/0x220
>     [ 2749.385772]  [<0000017f63c95d0a>] ret_from_fork+0xa/0x30
>
> Thanks!
>

