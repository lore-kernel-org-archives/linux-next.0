Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB2526B764;
	Fri, 17 Jul 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296986; cv=none; b=JN0kzP7zFifn7hCSK/R6ZsApqaDnmwHE7y3NQXrMqLs1Ls9V0wQBvAcdBBk3e01apsV1yHgeLyFyZ2xRlLfHL8CZ/DtN84fmq3pDRoiNk9e61OiTXm+o0v8a9zU/ZOINk5Jme+5tFN6uq++E6knnh7Qfo6y5Teh+7JvhXH7ryug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296986; c=relaxed/simple;
	bh=9cqjFSDmt4fTosbmuexEmUtczkBMbUBBdNSS1jNH3To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyP6pL+eT/Fh3+mqJg7en9wFSbRQL8AOXS66Sdb2sIBxNNyjA3zwFyY29337G/ESI13upunbYbjM7HhkAfpS+paPxKpoV5uAVaj7HSzRp0jNVvJXx84FjuJO7Baw5rPUeuLdpAVvYkccBb90kTMoYgG+wueIUZ0wWCxAg2GHx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfXz6cKc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfXz6cKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4491F000E9;
	Fri, 17 Jul 2026 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296985;
	bh=5HDZ5sskg+q7tfPtYb5BKyTBEg0RLgBXvlNEYWJGAv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lfXz6cKcGFTHE8eEpx7Gt9PY7z2YzvigOzwC07YznU5wfs8u3hCqQcNxtAHKxd65X
	 zQtz4RaA+I7FbBMqvDquKpn/d2WwBqG/2RDPGppsCG6EnEEDgUjTsE0mFJ2nFDMidW
	 o9s29QjvZTQPqjpmAmf3SdXHfTAOOSQBJn7Lel3p/R6FHhEE/T3XLrr2iDbMnhbhC2
	 mwxB2ZEyMiCbf2n3Dl49+Qnbs49HaPQD7QeNsLiXhUDwj9OgKyP/TRMKR1swaELvH+
	 mV0CeNoqbxpAVhcpGOyZjVXadIwf9zPxbzVOP8h0xRz4YGFSFvNunYiKlvI+U3DFvh
	 9b3PcQljB6tfw==
Message-ID: <57a7c9ae-6a33-41a9-b97e-ad1309f0df74@kernel.org>
Date: Fri, 17 Jul 2026 16:03:00 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the qcom tree
To: Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aloumm-rrofkrmxT@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <aloumm-rrofkrmxT@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/26 3:31 PM, Mark Brown wrote:
> Hi all,
> 
> After merging the qcom tree, today's linux-next build (arm64 defconfig)
> failed like this:
> 
> Lexical error: /tmp/next/build/arch/arm64/boot/dts/qcom/purwa.dtsi:169.14-35 Unexpected 'VIDEO_CC_MVS0_BSE_CLK' 
> 
> Caused by commit
> 
>   43899c55d79ba (arm64: dts: qcom: purwa: Override Iris clocks and operating points)
> 
> possibly interacting with something else that changes implicit includes
> or something.  I have used the tree from next-20260716 instead.

Rebase mess. for-next is missing:

+#include <dt-bindings/clock/qcom,x1p42100-videocc.h> in purwa.dtsi

which was previously mistakengly squashed into:

	arm64: dts: qcom: x1e80100: Add CAMCC block definition

which added the nodes for *CAM*CC..

Konrad
