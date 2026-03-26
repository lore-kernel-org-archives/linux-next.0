Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DE2E1EE5;
	Thu, 26 Mar 2026 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532573; cv=none; b=BAMl+mteEEWDetGu33voS/pIKGaSrSuxS9xEhb4UcFASSDpoF9GF9gB2C89Vak8kOkNANdMPEeRwh8q/cJfGAVB3z4WURNmPFCv4ulWUVcxpffrFN9qBy1R5+CP/eMth50JcjjDcDVDQy/PGlSvO3Z/ibpponGCumca+XRuc1zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532573; c=relaxed/simple;
	bh=aNV+AqUpmwgGUfdJfkBONzLUqACYRDlKx4Ms9UzHMUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQw3Zm/ULyREJzz2xIMqUUUieJfdRvRhNI8RISQi0z2pIx3u3uE4owoS2AB0BEidPHzBcaAgVOZqZ31hOuNso0H5+aYT+e9Q0+JuPc6cf2GXGohzhzaRv3ieGOp1kBW6gByW83/+lJPmse+iSetVm296Ty77VvuONXXy3gYYISk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv31ylyI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv31ylyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B26C19423;
	Thu, 26 Mar 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532572;
	bh=aNV+AqUpmwgGUfdJfkBONzLUqACYRDlKx4Ms9UzHMUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv31ylyINM/WZskxrdhFd1JG5Rir/yzx3rfEJ7GVyj1w/MSH7TrYH+ZZAE2r9hLPw
	 1fujAVKJ0lKEo1HepQwbpB8hovWR4hwI5TWQaUl5WqAUTuxAKL/DaXb7v1ScXbNNpC
	 Qyx0w8gDc/59uwIgi0eGyDwrz6rLVxSbkrDhx42Ij7GwxK8NL27mk5lFOpMxYoAee0
	 jTq45rATRt2paeO5JBdltNX+G71CtM8iABILJ1DCdjPyYXeXVzZsE37o16MkA9fzlU
	 gGQeMBVdPLrw9BxTaVOqt+ui1BxrseC1sFs7a2kEPrH442v1aFzEkb2A0UccKzygXb
	 c/J8RFISdS8vw==
Date: Thu, 26 Mar 2026 14:42:48 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20260326-zierlich-gliederung-a9745f2fec3d@brauner>
References: <abQKe58fc13oRFfB@sirena.org.uk>
 <0eb49c98-13cd-4ad9-87f3-7c7b0ace242c@sirena.org.uk>
 <20260323-empfunden-innovation-6caf40d8e6e5@brauner>
 <a9f82835-9caa-4ea1-b676-04bcb1a06a93@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9f82835-9caa-4ea1-b676-04bcb1a06a93@sirena.org.uk>

On Tue, Mar 24, 2026 at 01:28:30PM +0000, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 04:37:25PM +0100, Christian Brauner wrote:
> > On Mon, Mar 23, 2026 at 01:56:59PM +0000, Mark Brown wrote:
> 
> > > This issue is still present in today's -next, the version of the
> > > vfs-brauner tree being merged is currently that from next-20260312.
> 
> > Sorry about this. Fixed now by appended patch.
> 
> > Remove the local static wait_for_pid() definition from
> > statmount_test_ns.c as it conflicts with the extern declaration in
> > utils.h. The identical function is already provided by utils.c.
> 
> Thanks, that looks like it should do it - I didn't see an update to the
> tree today though, did you forget to push or something?

The test-suite hadn't finished so I didn't want to risk it. Pushing in a
bit.
