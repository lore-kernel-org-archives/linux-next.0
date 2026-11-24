Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504826;
	b=kBxZmSMPsUZu5DwZLxTnJ7Lg99LizcWzxSJlDSUWt2MWLeRNEQUkNMnHeUFh1SCBDqe1
	 5Vr+TQdGp/BOs9Y7noZfbQpeyIjQ8C2zVymNz4t1SHwyKUy/457sR598bxOl362Y4XXbN
	 po2Phq9lu1exZCsdRIM1OBlZknPEbu/V1xntFYpujCSVTiuoIAB1MeJ6KQPt8NpZom92W
	 fBdjrclFD2R5jwL3amhvlOtAUjEgaOmzLCDRKwzLVmQzLVALxqF22QUpuMY3vFuZtNavx
	 Z62AuLXqmgvZrY0ZoCpCCmnSZC6Khv1QYlJdQd0cnBSeMoCc4SmM5103gfL1Gur6h7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=zxTLm5lJGRMPxpsJjM7sJqqCXC6eU9hPG2t9xFY1cv4=;
	b=ZaOue7vluJWTuOQnwfYLT+cONHtr2nCZfpOeTBoB0H2TpsYjg40LBEVjDZqDifKi3eGR
	 0ZGrI19B1TZJCa/ntcY27c5TatrRryDGP2en/zlXrDOQ3QluYHBdpJY9fweRz4cEgUiNX
	 UZHxljZpJf/DxX+ES+zc2mvuIJesDuutJiws92YWjSWfxJqsQIg2K5JQL6rp11mjv9xv6
	 T8gNq66AYofuhwkbS+5pPfSwx3gRsQ3yim4iw/slKrscsVBSz58tx/b0ru4jnMUIxp5A5
	 A0w4rXVVMTuyykQq/3s4iP/YchTuleBvfR0AYYocjTjrdY5Lg22A73tprdSri3T+QWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilbhi57f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740E606A31E;
	Tue, 24 Nov 2026 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilbhi57f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18271F000C6;
	Tue, 24 Nov 2026 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795504825;
	bh=zxTLm5lJGRMPxpsJjM7sJqqCXC6eU9hPG2t9xFY1cv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ilbhi57fNFUpkGZ+JIoxoqI0lk8jEp3HLMD3uJVYpZJnuONnN0Fmsz8VkO4WGMVeq
	 aNcpOUtJD81qsFOHAv1+zojV+p/PNPWdRQH05DVSx43672VGg5gSBus998w2oF3LLQ
	 mi3RWAgT+7UOh8xwpiOk96Cgps46R7yHbe71UonGv486IOdH/rxSB/N5FnKmw5r8h/
	 kpXJjaH5iy56+7ED+DeMCB6TlSB12TGBV3oDjpr9t6RCkFnMT+91gZmbWQJGpHwhzp
	 gFfCUm0FVqO0i+C8oi2NzeMvZ36V3c3ke1cz8YoJ19n8usWNp8i5M9BLC5xKFvKpY1
	 8ty8ORRfChtuQ==
Date: Tue, 24 Nov 2026 12:50:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <awU6tez-f_pEi0Ag@parshuram>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
 <b7fda918-8355-46da-b7f4-40e1a104279b@sirena.org.uk>
 <2fd6f05a-6dfe-40c9-a7ad-44c28af8584b@kernel.org>
 <0af7abff-2c33-4920-835f-9c5abe73b143@sirena.org.uk>
 <7ee4f5c9-58cd-4238-be2e-f092acf3c137@kernel.org>
 <680fcf4e-4e5f-41fd-868a-a0ce58ed77d5@oss.qualcomm.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680fcf4e-4e5f-41fd-868a-a0ce58ed77d5@oss.qualcomm.com>

On 24-11-26, 03:08, Krishna Kurapati wrote:
> 
> 
> On Tue, Nov 24, 2026 at 12:31 AM Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
> > 
> > On 23/11/2026 19:58, Mark Brown wrote:
> > > helpful to have better compile test coverage for these drivers to help
> > > avoid such issues, the easier it is to get the code built the better.
> > 
> > I'll fix the missing compile test for that driver.
> > 
> 
> Apologies. I didn't build it for allyesconfig. I did uncover this issue
> recently when testing on a different branch where the said driver was
> enabled. I was planning on sending a proper fix along with v9.  There were
> some fresh comments that came up from maintainer Vinod last week [1].
> 
> I was planning on doing two things:
> 1) Fix up the build error when sending v9.
> 2) Send on top of phy next [2].
> 
> I will take care not to let such things happen from next time from my end.
> Sorry for the inconvenience caused.
> 
> As per mixing phy and usb patches, I know that usb subsystem prefers not
> mixing up usb patches with others, but in this case, I thought that we must
> send a complete series instead of sending 4 phy patches and then sending a
> separate usb patch marking the dependency on phy patches. In that case, I
> would have had to send usb patch once phy patch was in linux next so that no
> build error would come up when Greg would have picked usb patch into his
> tree. Let me know what is preferable in this case.
> 
> In case Vinod is fine with the implementation and comments replied to on
> [1], then this series need not be reverted and the build error can be fixed
> by Sasha's patch sent today [3]. Else, Greg, please do help revert the
> series from usb tree. I will rebase v9 on top of phy next after addressing
> the comments from Vinod.

No i dont think I am fine with the approach surprised that it got picked
up (I guess with usb).

IF there is no dependencies please split the stuff... It just make it
harder.
I guess if Greg can drop offending commit, that might be better way


> 
> [1]: https://lore.kernel.org/all/6ed0793c-76ce-4d04-af5f-8987311c5c0f@oss.qualcomm.com/
> [2]: https://lore.kernel.org/all/6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com/
> [3]: https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/
> 
> Regards,
> Krishna

-- 
~Vinod
