Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519892;
	b=wOjnB7gjA2Je9570xud+j2671+tBeUz/IAU/r40+BYPx1LacTBOmFa8uWyvDfl6w+S4f
	 xBXNihLzKVXglbzwGCHNBzMNUKStMH01RcLm+i/umev7oEG3L/hA5/li4jP/2YLNLsTTz
	 OIeAdqAWtAy944aqaBoErd76WWzKcHnaIJR6J/83nTnVRfsrwozhnK/6GpqJQMRzNWH15
	 /5kpxGFdgNstmgeT9rlYYq4bK/z0TUOxkbaWu8kNsaqFQp6B5u9QORSu00b4GY+3uk3fc
	 sG5Ydop1dM8ozgFyYHJlbtrVcMCZeul4wRQ9a2iipZbClyVAUhyFrDYEFolh0iyoSlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519892;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QRZ2OHv+W/MZtU5x/SLd86H93qWbQcIzkOUoCRAkJG0=;
	b=zzxOBJjPzUCDQcrvFx/R4r7XmGkt5YOrU17610dEOND/aKwj1IW53IkYrr98k5cj7Yrf
	 9rj1vd3SmV4wcT0zcRWaH/n+RcU3zAObV7HqsSA9JLTUI3wiRtBXb2/sDzY6aIHmo05Gp
	 6kOByRKjuvAWYGZKjbjteBOgq3vPicAkrP1PiKvHDIE3hjQWH8LcXvbJodjNuVE4JS0DQ
	 eY4aAnAPSTG8Kekd201MKRCOHwuoCBqjidBrp47J6bbntc6tbDHJUUOmAUK/lfjrPV6Vg
	 IO6rhumlVQSSaFnWZrnxAXyWqy3ppiLUw2z58Fnztl7ET9roP00pJRCZWwPU2cipYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiK4nVSp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE5606A321
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiK4nVSp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520031F000C6
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519892;
	bh=QRZ2OHv+W/MZtU5x/SLd86H93qWbQcIzkOUoCRAkJG0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IiK4nVSpepM8ljJG69Rd4H14xhmxeode27C9O0WPN2TGbFT9Z51V/45CalYe+3T1a
	 72UsfkaPt3CBbgu66RCIVR8VNstPEa3xH9pt9nPcnaAoE7GSQ9ug0B35/HWOBunLNU
	 bzEo9tQZpmQG3feJfWaycRosXIirkUj5hQApvTN5mJjiZf95lBR1vt0tU3w8qWeK3J
	 oFzakZs4rnNTXDRfwaeil6ztGMZvo4v9YrC7Ov5vp7yDSYs136Mu3N6hRXtrGbYJpS
	 H2IbYIxJAXhy27z1fcV6M0W8vS38Koli8L58q/3N4vjMVQhlc+20gBnGD4c2HgxU4A
	 baB5wf4ug0dAw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so2725300e87.0
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 03:31:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHpTnJ7a5mwQ89qDH/EQ2ZBPm+odCLAvIiNeNQmuFZKS3uGS9TEWO45wz3Am2J7H4RRfpCwM5/qEJR4@vger.kernel.org
X-Gm-Message-State: APuU4Z/sI7gOgDNYb776DZMyGK52aW253EX0njkgmeCwT3E6Ni98Zus2
	TdpYBjoYZEsMe8+o8aMLqhBgiCT4EMWZLiAIRSpuv7kX6zHvNDNABODCApVFy4Rqhk/5SLsBLOe
	ZUF3ICUrrg0Z6HIvFMEdBWZNXNQnhRQw=
X-Received: by 2002:a05:6512:304a:b0:5c1:c4d4:2f53 with SMTP id
 2adb3069b0e04-5c1c4d430b3mr3666407e87.58.1795519890796; Tue, 24 Nov 2026
 03:31:30 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120194507.593601-1-sashal@kernel.org> <20261123212630.1203859-1-sashal@kernel.org>
In-Reply-To: <20261123212630.1203859-1-sashal@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 24 Nov 2026 12:31:17 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gAwqHNkLGkoKx=mSxeC4UuHdpY=71O3UDxBK99WshULQ@mail.gmail.com>
X-Gm-Features: Aa3M54qy4cxI7h6w5kV70lvkD1UYd-Ukiv2kA4FJCRoVK3wUJleTkb0zlDrtIJs
Message-ID: <CAJZ5v0gAwqHNkLGkoKx=mSxeC4UuHdpY=71O3UDxBK99WshULQ@mail.gmail.com>
Subject: Re: linux-next: semantic conflict between the hid and pm trees
To: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jikos@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Joshua Leivenzon <hacker1024@users.sourceforge.net>, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:26=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> On Fri, Nov 20, 2026 at 02:45:07PM -0500, Sasha Levin wrote:
> > d220bf485598 ("HID: asus: Cycle the platform profile from the Zenbook
> > Duo profile key") in the hid tree checks
> > IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE), and 699041135f75 ("platform
> > profile: Extract the core from ACPI") in the pm tree renames that symbo=
l
> > to PLATFORM_PROFILE. With both, the check is always false and the
> > profile key does nothing.
>
> Ping. next-20261123 has the hid tree again, and hid-asus.c still checks
> CONFIG_ACPI_PLATFORM_PROFILE in both places. The fix in my first mail
> still applies.

I think I'll create an immutable branch with platform profile changes,
so that the hid-asus can be rebased on it.

Will that work?
