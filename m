Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA833E5A30;
	Sun, 26 Jul 2026 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785105041; cv=none; b=ac11rWsFxSkT+jlUbPCdH3NuOrhe8o0x8V3scKGVLbxQASd9oZ99fRe3tBAqzsdlPOKTP2aVUfB8HSZBtUfRSfqdDSOOluAQozFU95IyXAmEKcvxz3NjP1QMhR5SeID9saJxeuQ4IeDcbb1fcKFq2z1+qUpn57ZbpdtfKucxF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785105041; c=relaxed/simple;
	bh=y0u7sXF9GVjlsISfbOQd3wTqedv4AKVgdi0ZDSwta9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EjXzyiw/HPfSLCkve88YKqwiB3II4HQKdAVQcFgS1AU6ZMDRASN/3Y7ZYtThZu+Fkt8TpYaRiJTipn1C2rhgNPxY9hIfgHLAm0u9vlP9h6ff1YjTrq9x2eKVDCaxm8g5sMHra4EaAsH5VH0U4J7IU8ZlTI+AQJl4sBSTO8Mzb9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHCGeIfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHCGeIfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A551F0155D;
	Sun, 26 Jul 2026 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785105038;
	bh=h//FcmezIo2MlaA76cM5nb2aMlNo/sOZ+Qd2zyKMUIg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ZHCGeIfyqYloWQ9JGK5Q4l/TILh9y4KM74zLBOP/2+nznSYW+DW846wrhPLZCq0Rp
	 6xouyaziy+eob4/SXoGmKEJtId6OyLe3j0rRRdNmPVX45SHcbOPNepxkQvog1XnqV6
	 T3EGAPics/4IiatcOx1guO3IaDpMJOVYi8/ncexSJUZX5mn+vTy7Z62Z8KuEV/WZ4y
	 Lw/7bGw90I/7AI35h/ldC6L8BC6rSQTKVFDUrxNP9XnUEqpUL2LCDM55yVJbz4WtON
	 Wf5bzGk9BJ8pDude+HWqAbdFwlMXHis8KD2cATBkh4ii93t3jBmBxGmp1MvS+WuimV
	 MpqSt5dqBf4HA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:30:34 +0200
Message-Id: <DK8UX7VAVTSN.2N7WV86AMAI5P@kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drm-rust tree
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <amaCtUBUZZ400yf3@sirena.org.uk>
In-Reply-To: <amaCtUBUZZ400yf3@sirena.org.uk>

On Sun Jul 26, 2026 at 11:57 PM CEST, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>
>   drivers/gpu/nova-core/gpu.rs
>
> between commit:
>
>   f1aab4b1ab829 ("gpu: nova-core: avoid repeated calls to pci::Device::as=
_ref")
>
> from the drm-rust tree and commit:
>
>   f7acb19abcd86 ("rust: device: make lifetime on `Core` and `CoreInternal=
` invariant")
>
> from the driver-core tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

LGTM, thanks!
