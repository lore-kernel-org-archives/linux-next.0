Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE4940FDB0;
	Fri, 27 Feb 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206104; cv=none; b=V99trSssj6tFxmVlOoC4V6pR7vOyejXqRpeOSohXGsbgysYgrWcEcSVzN24oKDpsPSqKn8ya0GvVy83bgYu4zlqcqIT0dvRd8LkJgnuNKj5NtWQBosBop1xXVxn31VZcHHWqu5czJPcgGla+62euwn5UmQR8HPuV+t+7D3+Bekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206104; c=relaxed/simple;
	bh=EuTQVI6EVwmSpjuNlIMDTsDGNJi0iO6MtB5bJ746/o8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oAYnZbellK3w1tMiAO5XGdRZPkgT5GCGFjDQzWrkzdHdy1NIoLSPacRfVgkBjMsZtRz46HgCsYetEvVFiJYZ8MCLF8Vtd6CoxQjN9CsykhFdYhSpLzKDtMXE8Qyp0rsfCAeRp82h2UCvXZLEebP+yt4DsSPVF9awN7hGcnGn+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWTatk6l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWTatk6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96245C116C6;
	Fri, 27 Feb 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206104;
	bh=EuTQVI6EVwmSpjuNlIMDTsDGNJi0iO6MtB5bJ746/o8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MWTatk6l4/c6JJxWFdIyshmoqnFeKYO1nArgRSaVagvpnF48atHsfaf5rArmUVdnY
	 mGIagkdrvzfr+16naM7Zo80V0RCXMdfIdfuqk0HmelmRgcXnifYCx2nsaSm8I1MJ7l
	 6nGNfK2d5b9TRNAa+7Hh+zsZvVDSLAEILhIWMRILW6DrsKMrkUvpRMbGoet/rBJoMt
	 pryFEEVY9WZnUdpUK0JtJU3lfENSZKsvxJYtEBAR2Rx7P3zwULGwMU2sy3b/Yxj+aL
	 P+YO5jnQBFQCiXr3gq1toTcq781jZBpnd4rbW502a4fHc0rtmf+Z/2s9fYjTlRijYw
	 rQYY1ccUId9Sw==
Date: Fri, 27 Feb 2026 16:28:21 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the hid tree
In-Reply-To: <05979307-r6r8-5q72-91o8-po39o6717ps3@xreary.bet>
Message-ID: <05q1sn9q-0075-303n-5q49-707o5p208083@xreary.bet>
References: <aaGuzG3rObsjhhDc@sirena.org.uk> <05979307-r6r8-5q72-91o8-po39o6717ps3@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Feb 2026, Jiri Kosina wrote:

> > After merging the drm-nova tree, today's linux-next build (arm64
> > allyesconfig) failed like this:
> > 
> > ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x840): multiple definition of `rgb_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xb00): first defined here
> > ld: drivers/hid/hid-lenovo-go-s.o:(.data+0xa80): multiple definition of `touchpad_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xd00): first defined here
> > ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x900): multiple definition of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:(.data+0xb40): first defined here
> > ld: drivers/hid/hid-lenovo-go-s.o:(.bss+0x0): multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:(.bss+0x0): first defined here
> > 
> > Caused by commits:
> > 
> > b53ccf3f72653c8a843188ffa2edd4bc2443686d HID: hid-lenovo-go: Add OS Mode Toggle
> > 1d466a1adbf40e55501d766322d665de3a822b6e HID: hid-lenovo-go: Add Calibration Settings
> > 557d5b34d52974bf4e43c459cbf50bed5615ead4 HID: hid-lenovo-go: Add RGB LED control interface
> > f0119d450f1d4a5cc2ef2b38c2b522f902698a38 HID: hid-lenovo-go: Add FPS Mode DPI settings
> > a8a9ca568ce547634e80e999013ac9f123acff1d HID: hid-lenovo-go: Add Rumble and Haptic Settings
> > b2fd12c205b5a533ba2b1c5ffad669d08d52ce12 HID: hid-lenovo-go: Add Feature Status Attributes
> > 3bb54f568ecc35be7675eef5303a47e14aba54bc HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver
> > 
> > I've left them for today but will take more action on Monday, probably
> > reverts.
> 
> I'll just drop the branch from for-next for now, and will let Mark and 
> Derek look into this and send followup fixes.

Seems like both drivers are polluting a lot of global namespace actually. 
I normally catch this using sparse, but my installation doesn't work 
currently because of [1], so I missed it.

Derek, Mark -- you need to add a lot of 'static' all over the place :) The 
for-7.1/lenovo branch stays out of for-next for now, please send a fixed 
version and we'll put it in for-7.1/lenovo-v2.

[1] https://lwn.net/Articles/1006379/

Thanks,

-- 
Jiri Kosina
SUSE Labs

