Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37637D138;
	Wed,  8 Apr 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775661693; cv=none; b=SaY+ulVr8w6qg0xRMKOpWhajrxG/ivjevL14KT2Werjoc2Iu6VUbHas/CQ3r0xjb27UABZWuqAW6+z5sJkNsGLSjG65mHmShHXlRyJ0W7MP3le0BrvWoq1NcK1bQAm0B8SmMOIXpZ9Djks5y7EoAhhRcL4m8HxAibyeV3uKk7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775661693; c=relaxed/simple;
	bh=bj+845SGtTH4MYB1zWWDHYnD71eUCEaVnXSuSenddGY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hVuCwZ4tVSP6zfzGWIzCxkj04Csq1hzzdLjUQArcWCOSNSAZWrZSa4ljeuAjxbAwAneyT5ShoCJEqhynZtlsmwTrGSDZkMfidi7hEOiys0e6KSFLkPcxm811lLZ3+8ezodtv2PAOkhZGWxUV2BX0k430i4qy79t0tHTJZ8mEgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHUCsO8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHUCsO8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFC0C19421;
	Wed,  8 Apr 2026 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775661693;
	bh=bj+845SGtTH4MYB1zWWDHYnD71eUCEaVnXSuSenddGY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sHUCsO8l06Yvobn01iwDq4C8qlxFpyRfktu0KrfM0FFT0PdkMjWe4ItPJfI10P7AT
	 jiB52XTsI0Y13pcFpHbbWtFEJokpFB7JiTL3cMH2QVuLQjIkox0cmEnzOZVWAuyA2v
	 17d4Kmu7LWKwxhkFvR5cpaIf2r70xqElP9dGPHNV3wKkaE5FQ/0zlPfCw95ZQZvaew
	 VOXSj76j6FKsl5+uapJ49dSUhfaFKuhva/bv908w+2I0L/HqIx5tfyqb2cDFpbS/93
	 unhUi8r1har0elfQ7k/8HEYoTD6krC1sVa98F1n+Yx1xFcWOnOAW4pp/E96iymWmzr
	 pXdxLymfewF6A==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Brown <broonie@kernel.org>, Ingo Molnar <mingo@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Snyder
 <josh@code406.com>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip-fixes tree
In-Reply-To: <adZNmIpSOkd6P5c7@sirena.org.uk>
References: <adZNmIpSOkd6P5c7@sirena.org.uk>
Date: Wed, 08 Apr 2026 17:21:29 +0200
Message-ID: <87wlyh32bq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 08 2026 at 13:44, Mark Brown wrote:

It's a boot not a build fail, right?

> After merging the tip-fixes tree, today's linux-next build (arm64 kunit)
> failed like this:
> which isn't super helpful.  I haven't isolated which commit but it'll be
> one of the three:
>
>   b81207470caf ("clockevents: Prevent timer interrupt starvation")
>   82b915051d32 ("tick/nohz: Fix inverted return value in check_tick_dependency() fast path")
>   105c42566a55 ("ata: ahci: force 32-bit DMA for JMicron JMB582/JMB585")

Found it with qemu and pushed out an updated version. Delta patch
below. It restores the behaviour for !force and delta <= 0 which is
required under certain circumstances to get through the tick_periodic()
boot stage.

Thanks,

        tglx
---
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -324,6 +324,8 @@ int clockevents_program_event(struct clo
 		return dev->set_next_ktime(expires, dev);
 
 	delta = ktime_to_ns(ktime_sub(expires, ktime_get()));
+	if (delta <= 0 && !force)
+		return -ETIME;
 
 	if (delta > (int64_t)dev->min_delta_ns) {
 		delta = min(delta, (int64_t) dev->max_delta_ns);
