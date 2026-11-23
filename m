Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469198;
	b=0zVel/zIznqdEtJhh2lqY08S4pUoE1rwcPGwFLe93rPHt1J7A6U/iav7w+NhFbxDeXay
	 G2H6z89E4+IkaIdBPNfHA5Kh2iFnn/1WYIazHe6c7jHwvRybKZ/JSImdYIx48Q6TpAJfg
	 +KfPODsPUwzfNj+3SSNfX2bu9YKnlkPqGT5kf6UycByfgWjXQsPgc45fRZ4vFi+z2Wlsr
	 hIEV4S4vQRgbRZ5jSzIbMBSwci029egupk+nudYKgRnEgD3UAmuDJ1hDGScSILEVIPtPq
	 BGVdEzKjcw+MxTaqMxDObW+yi8ofgj7n2JdGTnZOx9Z8hCeF38N9YKrrBEmGGuONojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469198;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=E62dkVlr6WaF/Khh+HyCkITN6+/dTf7oxStHhWssKHU=;
	b=luYLONFJsBtZDG8atGUvCWwOXwPKNbjjJksjiJI0DJXKbv3Ni5dL37j8qay3ifmvOPwQ
	 mS1h51WdPVbLLXltrgAUqLN9fTv6Tpnk8TDyB9OI12BJbhuS0E2gtaJjqoGY0baEOG39Z
	 U+JmwmD1tHRbHBulHpmpx+GIwm6ybx18sr3CXvvrabo8T0HNJ+o69elmNZpq5Xv08aZwk
	 jk4fMker3hcYKMakqeSaWNY7SVWbzVGJPp3kGZTmrTwcsjxB0zwLyW+34Q98qsXbm47sC
	 /8FNMezzTsbrsLM4qjtrlSNHi9v/1uoWY8ikgG4U5we+WLjZSoEGMtg+2jRRHhFqRVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZijXyvK/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A43606A333;
	Mon, 23 Nov 2026 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZijXyvK/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E161F000C0;
	Mon, 23 Nov 2026 21:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469198;
	bh=E62dkVlr6WaF/Khh+HyCkITN6+/dTf7oxStHhWssKHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZijXyvK/M+aN7jKs9h1iStmhmYPsfN/SQT70bzVaiLhtIhG+DQlkbteXWnUO1tnfb
	 Davg8o4lNznkyidxqofgEeTskhwPakRtcSIXkahAK3lR5Wr6NvhYN7iaFtG2Mo9hMC
	 ZO4Qbx//+ZUROr0dgsmIIwo6LSR/jLR/WKnbySTYoooGVJZ29cOPawJLTTO84t4mSV
	 SYVFC80eLGynleTBeooOx0M3wUdmfnDju5cM2YVzY/lZEh1jAdENPUtQxPi68/ylV2
	 AAX2KjTlyv/l4W3aIIDfH+Zh/q0N2QRiWcQtmSsttG8HeWK48bLxw8gNbq85m7mhF5
	 z/c30tFCtJpCQ==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm-nonmm-unstable tree
Date: Mon, 23 Nov 2026 16:26:36 -0500
Message-ID: <20261123212636.1204307-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117091650.fc2f9558e84f76a5cdbfe7b4@linux-foundation.org>
References: <avx9_c_HWPAl9i1Q@sirena.org.uk> <20261117091650.fc2f9558e84f76a5cdbfe7b4@linux-foundation.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 09:16:50AM -0800, Andrew Morton wrote:
> OK, thanks, I'll make those two go away for now, will take another
> look in the next -rc cycle.

Hi Mark,

Andrew's two patches are gone from mm-nonmm-unstable, but every next
tag since next-20261118 still has their read_profile(). The fs-next
merge applies "profile: Fix up merge" and "profile: More merge fixup",
and those put it back on top of the iov_iter conversion.

Without the two fixups, the merge leaves read_profile() as it is in
79011a80f064 ("proc: give kcore, kmsg, the kpage files and profile their
own file_operations").

-- 
Thanks,
Sasha
