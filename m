Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684F413243;
	Fri, 27 Feb 2026 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203834; cv=none; b=cJrj3GaxNYbcvSVgXZq8Q61DnZfMiuJgMOcwbGHfCXWO2iqZIyIsofvM2Q5PPNQZPuEWrigtSMoQHUOyUDgyOcrp6AYov0Pz5t6iEJzGMiXMmQ2Msg9sX2p65BPoRKMNBoFH9VOks+cVDJur+7tsx2EJyQKYPV1jbg3eaU5aciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203834; c=relaxed/simple;
	bh=DGJYVOl25vMbptJjwhZDVTCwekbpTs17oTK5/Yty+fk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gv/NSPHGcCd+GM6hxFqt9whLwDAsYR1nm0Qdp2zPHWMCevdM8MuiNaMqvSwIyB4W55uCe97ch2cVJZkSwLRsQgtY7tUxaSfN5rf7DdeA+YN6B0h6V+3XHRWa7rBuCmt3Fy2oDiDUBTbxEkKO1Vb+w1Uzz93JhiF/7fRk769TMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOm+0ps7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOm+0ps7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EFDC116C6;
	Fri, 27 Feb 2026 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203833;
	bh=DGJYVOl25vMbptJjwhZDVTCwekbpTs17oTK5/Yty+fk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jOm+0ps7Ul+B//g6a+rkVHmBYiCVZmOSngJYeyUaB8qbNdKsMO0PF1GZ6gJWtl5Zq
	 CHYwoBGY/jwmgOzkMYGTOv4vSPEpP49eAlcQYJF79sIxXT7O/eXa8cwzs8EQcqu1gL
	 Ni6hU+qDIzulGiw1I3ueS58XafzwpZcu0MdKeVDbQPnWsHnkyGS7W65opf22Vid8Rs
	 WiL+fyQlOwlPZfUtaFZ8si7hj0GCVPjmKqLC5LQtx1IMa5U9sL+vJa5jRLKDXZv5mN
	 dxU9QJ0VqOiZaX2n1vFgcEZc+sureIuFQRv+T4iPgs6wxkehA7MsBpDurat4OPecFQ
	 pjMOPp498q7HQ==
Date: Fri, 27 Feb 2026 15:50:31 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the hid tree
In-Reply-To: <aaGuzG3rObsjhhDc@sirena.org.uk>
Message-ID: <05979307-r6r8-5q72-91o8-po39o6717ps3@xreary.bet>
References: <aaGuzG3rObsjhhDc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Feb 2026, Mark Brown wrote:

> Hi all,
> 
> After merging the drm-nova tree, today's linux-next build (arm64
> allyesconfig) failed like this:
> 
> ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x840): multiple definition of `rgb_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xb00): first defined here
> ld: drivers/hid/hid-lenovo-go-s.o:(.data+0xa80): multiple definition of `touchpad_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xd00): first defined here
> ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x900): multiple definition of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:(.data+0xb40): first defined here
> ld: drivers/hid/hid-lenovo-go-s.o:(.bss+0x0): multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:(.bss+0x0): first defined here
> 
> Caused by commits:
> 
> b53ccf3f72653c8a843188ffa2edd4bc2443686d HID: hid-lenovo-go: Add OS Mode Toggle
> 1d466a1adbf40e55501d766322d665de3a822b6e HID: hid-lenovo-go: Add Calibration Settings
> 557d5b34d52974bf4e43c459cbf50bed5615ead4 HID: hid-lenovo-go: Add RGB LED control interface
> f0119d450f1d4a5cc2ef2b38c2b522f902698a38 HID: hid-lenovo-go: Add FPS Mode DPI settings
> a8a9ca568ce547634e80e999013ac9f123acff1d HID: hid-lenovo-go: Add Rumble and Haptic Settings
> b2fd12c205b5a533ba2b1c5ffad669d08d52ce12 HID: hid-lenovo-go: Add Feature Status Attributes
> 3bb54f568ecc35be7675eef5303a47e14aba54bc HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver
> 
> I've left them for today but will take more action on Monday, probably
> reverts.

I'll just drop the branch from for-next for now, and will let Mark and 
Derek look into this and send followup fixes.

Thanks,

-- 
Jiri Kosina
SUSE Labs

