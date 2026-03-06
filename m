Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B302206AC
	for <linux-next@vger.kernel.org>; Fri,  6 Mar 2026 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776191; cv=pass; b=J0C+K0YRnVPwc7F7uP6uFxldt8H9UWrK8vUSS9Icq/a70lmkCOnE+eya+nYSbPVcyTQMC5RjBj2/3Se3jTi237or98+VjLsUxZS1IqJ4KwUSlyZJTlb3ylD5V7kla8OmnmyaAdhuFlYjACT8h7ypk4eQn2y0ApCzhhnHYNQKylw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776191; c=relaxed/simple;
	bh=My4UrUJqDg/V9Ee5SJn9mzlYfZcKJVf2gNHQVX28abE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiVPLh61sgt3r2R62K13JIubQ8prlLwG7vP74ZmPi/rmL2z0xgJEnqN6AK87hAErppn0e3WfBayBnlSQgrgnq7wAFFANczvH+57qplSkRulrL7VBrK4RfHMdzhshfpVawD1/XUAFD7lqLXmEbXsLN/nHfC31SyU8oJoOMct2Pzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyK0p6iA; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyK0p6iA"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a0ece9f14so52494436d6.3
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2026 21:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772776189; cv=none;
        d=google.com; s=arc-20240605;
        b=h5hsIc3tXUr2a168GWLzyeWAwYpO+/AHzTB1mNSq7qa+uQ91QWnyMZswbzhk9sTXLM
         tm+OfVI1BW8G5oZ292cpfNV/oznPdqVi+2wfgMfKIdsbPBBRBmBo33kJILXL2uLvQX7m
         xum5c0h42AwLTRAvHlyTzHa6KeJNNOgOI7NrgjtlltTk6MNaamssK/jkER07MqajurZt
         6gEXwRnX3S3olsmTBDpzudM5ijqvYjbflkBYIh6QOpC0KqOVnD/jKJGKaKJSiTqGmfH4
         8lnOUDhS+8RgRZpjKh7MOMoAbyuWDEQGb4k0y2uXFmNk+xwnw+H9x/BS4Zx5TcgbCaM3
         t+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=My4UrUJqDg/V9Ee5SJn9mzlYfZcKJVf2gNHQVX28abE=;
        fh=OMytXtYBx477Mp+1lfK5rBcfH/wF6rhhyzq+Jl+PF/w=;
        b=ItDzGLBFOaUhhZsU8sWRB1jOGr85Hpxt/MZXLGQF4tEGLQY9r4w+xvdtTv6V5HKoxQ
         MfrYIxqOradIcyLJKjqWyPYnHdhpxdAXNCyVoX4kTJndVnUr+b3Ewc/UATQ3+CUcAqDz
         MakLLkdie91fPqZ+1pHjFed0h/dNU8ngmq4XwPml6KmRtYzo512SLVB7cb6tmim2iIEu
         gNBN7Ao/3RytpyONoXHluZXxntq27fogO4KyogMi5JT62Z73L/PjaZi4qbm4uajavvwj
         iy2LSLnG1ApXju00eWJaB6AONkwkJh6uvzwdRapSvS0/3SwOmGTof5t8J68HHOAhfe86
         7HEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772776189; x=1773380989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My4UrUJqDg/V9Ee5SJn9mzlYfZcKJVf2gNHQVX28abE=;
        b=DyK0p6iAWP4okGZmvRs+Of5blGbCpiEZwDhJnTyYYUAgZpABhV5srU+sAoG6Vp64GG
         ypBS9bcGV2ULKnveiuLlG/5kC6jUIEBNzZUp+OuVjZJHi6ORxZGdP1mHVLNp/+09c70V
         WC7kJLfTwVqo2mU243hRzd8og8d0dE8Fj/PJMY+GMZujWbCKeyMbhe0fl5jK0m7H8Dgh
         bzdqp/m7ZjPKojFdd+0blMjfC57x2koUlQ43/HkMq1vzz9ULqIy9hSVQUzG4MgMevp7c
         F+qgIJj9ppTRMtSfewN/HUTU1z+EHJerdeBsRB+NmCWp1mT7C3vcd1jgTtgdKr7eLxJ7
         X3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776189; x=1773380989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=My4UrUJqDg/V9Ee5SJn9mzlYfZcKJVf2gNHQVX28abE=;
        b=wD46bzxWapQTGDoCDfWmRPDcNtsDS0rskEzFLj1NLYMQIp9gFctU/3z/HljJeOc5VI
         EfwubGWNQVrzf5WBVllak3k0W0OiAc7cPwstTl2T72ZwBxrq845m4OLI8jP2+fl4kzQk
         cpYkAiB4mewbHKEH4ABwkj66NiNrmc5IGtZLY3oT/l+KkVGiILR04fAtDGdcUW5hvRFo
         HfZoAMMh8yHAVhEdWPPPgAwm03JeXj9S1cl7i0c16/3EK4oTl04qtdToLljj5zlMqX1Z
         u37pExhUyQBf3uwt/m8Pc/Fr7EvezZkI5yS+YvKI+G8obwetm9C+Py6BIiJ9TsGeYDKm
         QAgA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Cn4qgxBwYdUKmmZpU5/dovuhR6FJR7b93PI6DmYlXMj/NxSNMLjiktvRVdp2z6lb/C7RdxYYG0Zo@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCoJcihN7RjM8kOAeaqcqbgQn0LBI2AwHEQNOXi6XMjKjRir+
	33UjmE3QcOOS/ltYXPIFkMx7g8HUf6SPt/Uw/ctQKpok7PFv9oGxHDfDu2nlkNU9GA9nvZmqMLu
	XLxLI2GK6Joo+7IEiQlv1ErUQ3knr48+i4tmk
X-Gm-Gg: ATEYQzxQ7pZMBS4SXF12h07qrF2gfZMYSxAMcWV3zKcannboRBPYEe5gXS7rtQpbdZj
	EDUp6VbHa2kFmwnqD5UG9iwC07Kb9HbwppmJrq5j7ZRSbBYP/haILb5MjPa2+U/4ocd96La4DP+
	KoP/jP4Qabwfzoj+BvkWSXtgygfSSlkRQCmq4lo2om8HFkcwZjtJA0XdoUB/MkB+VXf7kRTdas/
	j/AI7BGoW//4LuwMTzB5TbodkHvmFZvxS8nlRkHOoEra2ZHkhIP4EwV8GhcDVCZeAGEwsS1LHtR
	n6LLTZ4=
X-Received: by 2002:a05:6214:c2a:b0:89a:1536:2529 with SMTP id
 6a1803df08f44-89a30a31b87mr10320206d6.15.1772776189333; Thu, 05 Mar 2026
 21:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aaGuzG3rObsjhhDc@sirena.org.uk> <05979307-r6r8-5q72-91o8-po39o6717ps3@xreary.bet>
 <05q1sn9q-0075-303n-5q49-707o5p208083@xreary.bet>
In-Reply-To: <05q1sn9q-0075-303n-5q49-707o5p208083@xreary.bet>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 5 Mar 2026 21:49:38 -0800
X-Gm-Features: AaiRm51Oc9W2CR2J3vb33KA0_GYDx4XRNJ0lhCh5SEq5U3tDundFyE_qYjo6m2o
Message-ID: <CAFqHKTmvmkz5Qrk4rC7TfYuuPas7aK15=6devnhJw=CigbSJ0g@mail.gmail.com>
Subject: Re: linux-next: build failure in the hid tree
To: Jiri Kosina <jikos@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 7:28=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Fri, 27 Feb 2026, Jiri Kosina wrote:
>
> > > After merging the drm-nova tree, today's linux-next build (arm64
> > > allyesconfig) failed like this:
> > >
> > > ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x840): multiple definition =
of `rgb_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xb00): first defined =
here
> > > ld: drivers/hid/hid-lenovo-go-s.o:(.data+0xa80): multiple definition =
of `touchpad_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xd00): first def=
ined here
> > > ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x900): multiple definition =
of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:(.data+0xb40): first defined=
 here
> > > ld: drivers/hid/hid-lenovo-go-s.o:(.bss+0x0): multiple definition of =
`drvdata'; drivers/hid/hid-lenovo-go.o:(.bss+0x0): first defined here
> > >
> > > Caused by commits:
> > >
> > > b53ccf3f72653c8a843188ffa2edd4bc2443686d HID: hid-lenovo-go: Add OS M=
ode Toggle
> > > 1d466a1adbf40e55501d766322d665de3a822b6e HID: hid-lenovo-go: Add Cali=
bration Settings
> > > 557d5b34d52974bf4e43c459cbf50bed5615ead4 HID: hid-lenovo-go: Add RGB =
LED control interface
> > > f0119d450f1d4a5cc2ef2b38c2b522f902698a38 HID: hid-lenovo-go: Add FPS =
Mode DPI settings
> > > a8a9ca568ce547634e80e999013ac9f123acff1d HID: hid-lenovo-go: Add Rumb=
le and Haptic Settings
> > > b2fd12c205b5a533ba2b1c5ffad669d08d52ce12 HID: hid-lenovo-go: Add Feat=
ure Status Attributes
> > > 3bb54f568ecc35be7675eef5303a47e14aba54bc HID: hid-lenovo-go: Add Leno=
vo Legion Go Series HID Driver
> > >
> > > I've left them for today but will take more action on Monday, probabl=
y
> > > reverts.
> >
> > I'll just drop the branch from for-next for now, and will let Mark and
> > Derek look into this and send followup fixes.
>
> Seems like both drivers are polluting a lot of global namespace actually.
> I normally catch this using sparse, but my installation doesn't work
> currently because of [1], so I missed it.
>
> Derek, Mark -- you need to add a lot of 'static' all over the place :) Th=
e
> for-7.1/lenovo branch stays out of for-next for now, please send a fixed
> version and we'll put it in for-7.1/lenovo-v2.
>
> [1] https://lwn.net/Articles/1006379/
>
> Thanks,

Jiri,

Sorry for the delayed response. Since your email there has been a lot
of activity from other contributors on top of my latest version in the
HID tree, so I'm looking for guidance on the best way forward. I can
either add a patch after those to keep attribution identical while
fixing the issues, or I can include the changes in a new version of
the series and add co-developed-by tags. The changes are fairly minor,
but from multiple people. I had planned on just doing a new version
originally.

Thanks,
Derek

> --
> Jiri Kosina
> SUSE Labs
>
