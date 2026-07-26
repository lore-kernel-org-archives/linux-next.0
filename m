Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B710317166;
	Sun, 26 Jul 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090661; cv=none; b=tgRB9/zL33sgE2qCNJn9ReOM8JI5AVNv1/iNjFwXBzAQlYRNBW9kbhrVsTFcqAEbTrHOPZDUvlUmRnMASnRxfHVakFi23JSuSSOxMTwy/QLCdkZ8unkPaGRBKFi1yCt763rYMRYS3XkoQOYh9XoBmy0TB4JrCB2iEOdRFFKelb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090661; c=relaxed/simple;
	bh=bc6EHaedxQ/mGqwUvBiayoU1/RelyaQWPD50rR+IOBA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=XXC4KaHf/dDn0k0XyzTYog1oBsfxDtxtYYbKit2mpaifgfmhLOL/M/pHvJTuHrlnlXa+0n0w4twGpzgpkm71fn1kIPDc+LTAK28AB/xcmy4f0Sc8NsU1ZkMwteTx4QyHbdi2z+acpkW7avOSB0rXClBW+Ubr45jsXV7CTlT/qSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/RO0laa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/RO0laa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69F31F000E9;
	Sun, 26 Jul 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785090659;
	bh=p1ucb1RYC7K8g8+dYtCK+PkysaJ9SqDDbncFQ+YiA7o=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=E/RO0laaC7wHy1A4oCxxZR9c9mNmg4eBVJ0E3eYTW7gpo3n3SdSFycMI7WLRiZssb
	 msevEIGvPYwuPlOV0U12+5dkK+/L+MeXAF73jlzeS0Qa+E338DVI0BCV57IEiUCKaQ
	 kfRC1Nt40w1MYvp+ueVo6t5RA3NbxujHYb4hw+WY38V/H7//ny+xkyy4IvBnDFN3eb
	 BmeHn08LG497xFKy2CBVhenVYuOTHOmsZk8Lu1PLvs62wc5LUb2SrvcGjmtgOFR54E
	 8Ej3kyGXtc+pJ6jnRvWDZpEHj1Xt9bG8Hs7R02NiYq1/6Gd+wVIHWS800Gaft2FuF1
	 lFnV962LZB0Iw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 20:30:57 +0200
Message-Id: <DK8PTQY0VC38.26J99W74ACFTQ@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: Missing signoff in the driver-core tree
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
References: <amZFO8eUhS9xhfCs@sirena.org.uk>
In-Reply-To: <amZFO8eUhS9xhfCs@sirena.org.uk>

On Sun Jul 26, 2026 at 7:34 PM CEST, Mark Brown wrote:
> Commits
>
>   4e63c0582e2ae ("base: Remove unused DMA_FENCE_TRACE Kconfig symbol")
>   45dfa004893df ("driver core: soc: Unregister bus on early device regist=
ration failure")
>   ba3dedcf3bd47 ("software node: Fix software_node_get_reference_args() w=
ith index -1")
>   c3a280ff728a9 ("debugfs: warn if file creation failed due to uninitiali=
zed debugfs")
>   06553566a841c ("kernfs: Replace strcpy(s, "../") with memcpy(s, "../", =
4)")
>   d996995a0ffb8 ("kernfs: simplify kernfs_name_hash()")
>   32e21e9509915 ("docs: ABI: sysfs-uevent: add missing bracket")
>   38f5745f49e44 ("arch_numa: remove redundant nodemask clears in numa_ini=
t()")
>   8cfe7ad274bb4 ("driver core: attribute_container: Unwind device_add() o=
n attr failure")
>   6e328b4a208f7 ("drivers: base: Remove statistics group if encryption gr=
oup not created")
>   c37ab60d55e34 ("device property: Refactor to use RAII approach")
>   1900692555826 ("device property: fix infinite loop in fwnode_for_each_c=
hild_node()")
>   10864921212fc ("driver core: avoid repeatedly printing the same 'Fixed =
dependency' log")
>
> are missing a Signed-off-by from their committers

Ah, that's because an unrelated preceding patch that was reported to break =
the
build by 0-day was dropped from driver-core-testing, so those commits
technically got rebased before they hit driver-core-next. Sorry about that.
