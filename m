Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489224;
	b=fx0FHQfdT5v1S+OTrQIYQu9igxfwtP4xdK77lhXFQxknHfMLqQagLTPHl7aF4lK2PU6i
	 Nsf6DMajwI4qqcISn10vPWia+P11zBIjuln81h4Z78hBsxxI1467AoYF07TVpOilWrbZw
	 QFRtopacnKMm8TEltk8xpNp85BZ9vN6Xoy1n4FeC1d8ieg8xriIThGXCJSS+bvO5ZEJo8
	 wfYmV72Q1ZKexoiC5ymCLI0Zzb0hPUWNT+D8ES9jAyoXL23+bDatHh/G4o8mvNE+azuLQ
	 mFzxi3ZugXnl4yuwDnQJYzsrVMLkpF+0AvXo11AqJvH1ZeJzBkSbCbCwD6YSP4OBVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489224;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=tXlQoa63mc0Tao3dTUby6YfxVwOOPUnmbpD1nQxV4oM=;
	b=QKViU5KLc4j37l4fKc4fGpvTOBsWqhsDPB2OqKu2PuNGlX7GIEhyRa/y2Ct2qu2Gd+/q
	 +geRkNPktLQxmdswUAShkxjYUHJGyFWmbym7ORwPEAU0xqeKbj+ArvnWEDYP3RJNejc43
	 iTaC9Fx6A+XHa7YMOKSGb0qKq8Hk38j4DGLU/FqUVAxRIE6WehG+aSUb0MlOH7ECdTRFi
	 BvqcLQL1Mn8YR21XmsaFQ31B5vBiJhDYbiYybdoJVVjDAVmC46zT9SHT9bzKZFZrQzeFO
	 w116MmhPdQhEMARGuF3BjF9EcbNWDAZS5mcoqIwA3l7uHxVpNfUGhDmDUPdBsDfI9VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6t3P+WV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567E9606A333
	for <linux-next@vger.kernel.org>; Thu, 12 Nov 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6t3P+WV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFB31F00A0E;
	Thu, 12 Nov 2026 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489223;
	bh=tXlQoa63mc0Tao3dTUby6YfxVwOOPUnmbpD1nQxV4oM=;
	h=Date:From:To:Cc:Subject;
	b=g6t3P+WVxNzN3sdMdSZFqdixRjx+DVo+8ViWBdZ30cRqN14KkPvqSUZ0J/CcHoLYT
	 I8wSqHFcHnOW36OJSN9VVOmchvCoSqUvdr6pWGM45dvsQIlMDxDVMI5DBDNQo6GalC
	 Er7OtkhFa6pZh7Gg3fLquZoA2zeFApulzV2IRljBpR3cUCwFjUiMVToKvUu/qMVmbF
	 6TUFolrbodoLrU18oPqYSRK10biU+2+8IribdnmnJWZR+hlaP3v+jgbkvkRA8nMQWn
	 OKvlpule7PwdkrbZKVtI2/WZ7Ha1125K8k5lSKhbavfsSbuzPDgRDKf83fzl0TqK4U
	 NAvBupZ91xB7g==
Date: Thu, 12 Nov 2026 14:13:39 +0100
From: Thorsten Blum <blum@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: linux-next: Add blum/linux.git for-next
Message-ID: <avW7g6pH3ILcSAkq@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

Could you please add

  https://git.kernel.org/pub/scm/linux/kernel/git/blum/linux.git for-next

to linux-next?

Thanks,
Thorsten
