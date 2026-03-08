Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C41D5CFB;
	Sun,  8 Mar 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772964593; cv=none; b=RvJjzrRKzM8yenScjxKuc2pZTItcmohfweC3fPy4nWxGkwSaV+b9bb0twliHFJRO958vdYNdUb7xspbw+qKyEqAyO+anHIccCSZfQy0fmVw4KV0Au4KutWVCJGXL87bSiqq2CK9M9edgL9NxOWLh80xEETm9ayoetULJDz39V8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772964593; c=relaxed/simple;
	bh=4qjbewh9L9SN/voeoAB28v0RBfkSPgK/tGG1XGSrio8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WfpLfBpX+VAotKzcSA8zh5hfvIB2fznFzPHROtXHasFmKR1MtlpQAesMRnMRtU2WuK9LfenHgBSSVzmdPqbhkW95fxI6amBqxU1n2QpecOOdFrc3w75ezy0eri1rjibv9lSZwSJNmp39MscgH7CPp52Kpeuq/dBO/RjHBcQugFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEHIM/WO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEHIM/WO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265CFC116C6;
	Sun,  8 Mar 2026 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772964593;
	bh=4qjbewh9L9SN/voeoAB28v0RBfkSPgK/tGG1XGSrio8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KEHIM/WOSzvr7Qc/iOw43ZxdJGJXd72PPDEp1uzY5sUf0QCQgAj+t97LeaxvS2Gd7
	 p9YGdokz8qsfRO+vVXqZH4slsuFxe773Gu/VypYoTcjelAenofnp4t4oqGFdQhENEo
	 IJkFQwNhe7+N9zMosgXc8aNxXMIij0AfoB0h/hAB7Rt1oGToANRBOOzo4tGod6VCrO
	 D16jASlmjJsJmKhw2RepgTUL8pLMLuLq8ed4cYIZJ9hn0Pn8CdyBnjl/YdI+pZNBqp
	 pNCgHPzFoPIx58KWQo0N4qfOR0/+hcRq/y+PiCtnMnmSGeKOvJdUMR2rv5Uw0WVSob
	 jjcmB1PcavZRQ==
Date: Sun, 8 Mar 2026 11:09:50 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Derek John Clark <derekjohn.clark@gmail.com>
cc: Mark Brown <broonie@kernel.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the hid tree
In-Reply-To: <CAFqHKTmvmkz5Qrk4rC7TfYuuPas7aK15=6devnhJw=CigbSJ0g@mail.gmail.com>
Message-ID: <53776242-p3op-3373-s134-20790qq46q07@xreary.bet>
References: <aaGuzG3rObsjhhDc@sirena.org.uk> <05979307-r6r8-5q72-91o8-po39o6717ps3@xreary.bet> <05q1sn9q-0075-303n-5q49-707o5p208083@xreary.bet> <CAFqHKTmvmkz5Qrk4rC7TfYuuPas7aK15=6devnhJw=CigbSJ0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Mar 2026, Derek John Clark wrote:

> > > > b53ccf3f72653c8a843188ffa2edd4bc2443686d HID: hid-lenovo-go: Add OS Mode Toggle
> > > > 1d466a1adbf40e55501d766322d665de3a822b6e HID: hid-lenovo-go: Add Calibration Settings
> > > > 557d5b34d52974bf4e43c459cbf50bed5615ead4 HID: hid-lenovo-go: Add RGB LED control interface
> > > > f0119d450f1d4a5cc2ef2b38c2b522f902698a38 HID: hid-lenovo-go: Add FPS Mode DPI settings
> > > > a8a9ca568ce547634e80e999013ac9f123acff1d HID: hid-lenovo-go: Add Rumble and Haptic Settings
> > > > b2fd12c205b5a533ba2b1c5ffad669d08d52ce12 HID: hid-lenovo-go: Add Feature Status Attributes
> > > > 3bb54f568ecc35be7675eef5303a47e14aba54bc HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver
> > > >
> > > > I've left them for today but will take more action on Monday, probably
> > > > reverts.
> > >
> > > I'll just drop the branch from for-next for now, and will let Mark and
> > > Derek look into this and send followup fixes.
> >
> > Seems like both drivers are polluting a lot of global namespace actually.
> > I normally catch this using sparse, but my installation doesn't work
> > currently because of [1], so I missed it.
> >
> > Derek, Mark -- you need to add a lot of 'static' all over the place :) The
> > for-7.1/lenovo branch stays out of for-next for now, please send a fixed
> > version and we'll put it in for-7.1/lenovo-v2.
> >
> > [1] https://lwn.net/Articles/1006379/
> >
> > Thanks,
> 
> Jiri,
> 
> Sorry for the delayed response. Since your email there has been a lot
> of activity from other contributors on top of my latest version in the
> HID tree, 

Hi Derek,

sorry for belated response, I was off for a week.

Also there was a lot of warnings coming out of the kernel test robot, hope 
you've seen them?

> so I'm looking for guidance on the best way forward. I can either add a 
> patch after those to keep attribution identical while fixing the issues, 
> or I can include the changes in a new version of the series and add 
> co-developed-by tags. 

For the ones that really do break build (like many of the allyesconfig 
ones), I'd suggest you just incorporate the changes and use Reported-by: 
or Co-developed-by: tags in the name of bisectability.

Other fixes can be put on top of the series.

Thanks,

-- 
Jiri Kosina
SUSE Labs

