Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3263128B0
	for <linux-next@vger.kernel.org>; Sun,  8 Mar 2026 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772990426; cv=pass; b=oGWpMm4R5V/LkYbMmDarXIpo3ZhqvAw5oDa9r5efBJEUN/piHnsrzeFheM0CQaRd6/twjyqClahhfzorxumaDG70FXfTIMnKnkI5kQisQecEJY3dYiCeBL7bZ6CuUcNQCQqTsnEzBBnnts0HlSj1367jCg+u4yhcg8tgNVte2P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772990426; c=relaxed/simple;
	bh=bqxF0fiS35PYgcWdyZdHTsbykYGUxuegxr6MzCrJSWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsCPG2jBwsZXi+AVvYYA3vl1GTv+sjr+9MBwE3Sn0qslkg4QC73rEDKhJGxg6hiNGWPiaLncE6RTvOAhsLoF9R5i/P/R/2a2Xf4lDK4uPES3RhPqWzexEMxoKkH+MGd+A/hBWYRwMR2Yukt43BUuInlQS2lU6NRZB24uCYIx2DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jij3e94w; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jij3e94w"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899fb030812so105556636d6.2
        for <linux-next@vger.kernel.org>; Sun, 08 Mar 2026 10:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772990423; cv=none;
        d=google.com; s=arc-20240605;
        b=d89N8yzCG8CYSP5T7+anybpHah/1CmQsatSvpcyyB7zu1FqPx2nKhVDBTLA3nxC0xb
         8uqTNZ8jByFHrWAUNpUPCtZ0Ks+Jzc6YQbKHfShmvx2MtgtpmpKzC8yTmTryfoL16xuA
         Ihcga6wSQypXF1//z7aMKwtt81HTFF+vlL8M1gKbZuS6Qibwct2qt9p1h+oVsXBinpny
         QCv/PcKLcZQBWHygXLHxEd44HUwLA4agM1ME1j24vp7eAPD568KwG4BKCRkW6Og76fFK
         EF+oCav9hXDuZ/O+toBCBPAdkJFK3+fbjvrNpiNV//7aBfv6r98EF/Uj8WNpxX14CLGx
         OViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqxF0fiS35PYgcWdyZdHTsbykYGUxuegxr6MzCrJSWc=;
        fh=EQThLhzu727xia9Q68R1w46fWyV4DcxQuSGbPIr1Zbo=;
        b=ZUgv7wZZqPhg7f4GKM3ztLRcTtyXmTm+ORjD7HIGSBNe2kHlhqEy6WPHlp6XeQXS/O
         YmIs26Qn6mnGdy5W45wpsl4gtA01uC9ooqfWiwSy0195hu7ohKXwjNmidjOWyvFZruDx
         uR8AJGppE3MGESYhgh40MLu2dFE1GHG2poVLTCQBvtS31VqQGNpFAqPKbdXjdXEKAay9
         N41vKtoVIqUutUtep7MNu44qV0Y38xSSggs9wdu+wDT3pl/QgcyoyLTkMLEJ7dsGISoN
         8rEg1HOF/XCoOhhRDM9/rxA/bucJ5yI7SxOWKM5PWDS0S/YiVZDO5U+b3ffzQKeByw/j
         Phcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772990423; x=1773595223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqxF0fiS35PYgcWdyZdHTsbykYGUxuegxr6MzCrJSWc=;
        b=Jij3e94wzLqQ8Gv0TR2OTny76Z1LtTL8gf3/0t090a37fPSxYAsdtcDGDSLpSXttTy
         E6HmNdli7jDImtgNSwtNd6Qr2pytBmoEEGupqzZDWzIOQOcgxzAdu9nKktNjCOIgU5ww
         Mcqudwy7SKt20gA2tXP+izbV+kXUdDSsMR/BpM3Nxe4fwTcKD3X6L/aqPrYW4QispxQh
         3uMBLy7b5yIHdAs2XUDyVf7fp6OLSO96Ut/yTke514bxW3TpfYs0Hmz711W57TF+e6BQ
         d4BNQ13p9TUeCxr4o0oZQGzSahB+Plh+VWblu3xD2WRmwNgoMcpPLCj+NHhWQiSY1AzY
         wrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772990423; x=1773595223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bqxF0fiS35PYgcWdyZdHTsbykYGUxuegxr6MzCrJSWc=;
        b=B5yq7KDUkfB6yyrPO71q+qkU0PvqhrSp0rTI4OxXR+qFQaatGAtq1i8AEti8ERVBQZ
         BjOoD2x/RDnq1pv9mVXde26sBd6Xd4VRzICrjbpsBb+3Pc05OtzOKYDzdD4h5XUev5V7
         gSb+UdaTjvMZUS3q//jwFAJwrSx0Cfv7Y5Z+gLe4fKzGUPoy1SYT85ZAlh10A2JzcZwc
         QOm1Z1YpZOdTmn6ORxZjJzoC9UjF+XT6gIZMs44z0wv+OMzTKS7zssupFTqyDqyXZKmM
         Kg4A1D5HsKoDnwk/tW4SxL+Pm2p6/KAAsejBD1b1vDI5hUGsp9mvd1IzZvmdKfmXwRwG
         KYTA==
X-Forwarded-Encrypted: i=1; AJvYcCWjuYezoWwPYACkm5Aj5DM/lAPDl+TKusV4kttBrmejmCJ7tGiiccNLwy0C1uvjxN0jk88EfI2iWFrK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDfhf2YbhMZjwJ4nKq8ZKaYFeyvcTZ4puHUYr7lC7WwpBEQVm
	XL9IPZGnPOugXdHOivbbMcjx1VmYjU1gWJ4q0jePEB7uMRjsWxg9kOBZpBoZLowbw60UDy/BG9f
	2KRlSfiZ1qd6BmmRLjxmdt72WRD7POVFZVA==
X-Gm-Gg: ATEYQzzhrf4YuZJgFtObPUpoDflVQS37jyKAgNf7mRoXs2LVDytUFxLe4uvtbWNDmMm
	ylr/UTPpyJCMB5geidvOoG8f1S8+xuWnFSm5fIj6k39OLJBgTQkS7k44NOO8W+S/j7G/4782lFX
	6TmyiXK1trMmVntlNMDmmdJzi5gWUAeh4g6+NKT0IqhyrxPYJTGR3KYVx/EEWCx9YS7sfUC1b9l
	NOrGwe4mtGvzumb7FFiKg7TnPJO8dkeqJXqeNRo0mCZaBA1AqKbTLZfX1RVa/2sbRexp4Cheycu
	EA==
X-Received: by 2002:ad4:574f:0:b0:899:fb4e:47aa with SMTP id
 6a1803df08f44-89a30aa3cfemr125066706d6.39.1772990423107; Sun, 08 Mar 2026
 10:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aaGuzG3rObsjhhDc@sirena.org.uk> <05979307-r6r8-5q72-91o8-po39o6717ps3@xreary.bet>
 <05q1sn9q-0075-303n-5q49-707o5p208083@xreary.bet> <CAFqHKTmvmkz5Qrk4rC7TfYuuPas7aK15=6devnhJw=CigbSJ0g@mail.gmail.com>
 <53776242-p3op-3373-s134-20790qq46q07@xreary.bet>
In-Reply-To: <53776242-p3op-3373-s134-20790qq46q07@xreary.bet>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sun, 8 Mar 2026 10:20:12 -0700
X-Gm-Features: AaiRm52nhRJ6T90O_-C-SnrSHhXOms02Cq-uUVLczuEiS5d3kIpPKZ8riF5xy4k
Message-ID: <CAFqHKT=PWFmVBzzQo97q+Z5KbG1fAoLqAMqPE7RAObrZPBRmfQ@mail.gmail.com>
Subject: Re: linux-next: build failure in the hid tree
To: Jiri Kosina <jikos@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 3:09=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Thu, 5 Mar 2026, Derek John Clark wrote:
>
> > > > > b53ccf3f72653c8a843188ffa2edd4bc2443686d HID: hid-lenovo-go: Add =
OS Mode Toggle
> > > > > 1d466a1adbf40e55501d766322d665de3a822b6e HID: hid-lenovo-go: Add =
Calibration Settings
> > > > > 557d5b34d52974bf4e43c459cbf50bed5615ead4 HID: hid-lenovo-go: Add =
RGB LED control interface
> > > > > f0119d450f1d4a5cc2ef2b38c2b522f902698a38 HID: hid-lenovo-go: Add =
FPS Mode DPI settings
> > > > > a8a9ca568ce547634e80e999013ac9f123acff1d HID: hid-lenovo-go: Add =
Rumble and Haptic Settings
> > > > > b2fd12c205b5a533ba2b1c5ffad669d08d52ce12 HID: hid-lenovo-go: Add =
Feature Status Attributes
> > > > > 3bb54f568ecc35be7675eef5303a47e14aba54bc HID: hid-lenovo-go: Add =
Lenovo Legion Go Series HID Driver
> > > > >
> > > > > I've left them for today but will take more action on Monday, pro=
bably
> > > > > reverts.
> > > >
> > > > I'll just drop the branch from for-next for now, and will let Mark =
and
> > > > Derek look into this and send followup fixes.
> > >
> > > Seems like both drivers are polluting a lot of global namespace actua=
lly.
> > > I normally catch this using sparse, but my installation doesn't work
> > > currently because of [1], so I missed it.
> > >
> > > Derek, Mark -- you need to add a lot of 'static' all over the place :=
) The
> > > for-7.1/lenovo branch stays out of for-next for now, please send a fi=
xed
> > > version and we'll put it in for-7.1/lenovo-v2.
> > >
> > > [1] https://lwn.net/Articles/1006379/
> > >
> > > Thanks,
> >
> > Jiri,
> >
> > Sorry for the delayed response. Since your email there has been a lot
> > of activity from other contributors on top of my latest version in the
> > HID tree,
>
> Hi Derek,
>
> sorry for belated response, I was off for a week.
>
> Also there was a lot of warnings coming out of the kernel test robot, hop=
e
> you've seen them?

Yes, I'm very motivated to push the fixes so I can stop getting them
at this point.

> > so I'm looking for guidance on the best way forward. I can either add a
> > patch after those to keep attribution identical while fixing the issues=
,
> > or I can include the changes in a new version of the series and add
> > co-developed-by tags.
>
> For the ones that really do break build (like many of the allyesconfig
> ones), I'd suggest you just incorporate the changes and use Reported-by:
> or Co-developed-by: tags in the name of bisectability.
>
> Other fixes can be put on top of the series.

Sounds good, that should be simple enough to do. I'll submit the
cosmetic ones as part of the next series version then so I can handle
and rebasing conflicts.

Thanks,
Derek

> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
