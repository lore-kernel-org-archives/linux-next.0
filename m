Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514B47C101
	for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200659; cv=pass; b=iwxWjnJNOGffkLyZecrhXlRztGog2h97OFqaW3ZrWfZWj7DvmImFy8c9ej0OkBuFSo7km/PL0pAciFsB35guNoS3G1Ec+FdejnxsB3Uop9TSaHel/EKTmsp38Y4ike+RdMgA4IX5PRL07w6jPwJqFB4yUSbJHkACRuoaGxtaxzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200659; c=relaxed/simple;
	bh=9lmjTlgara3Ob1PGZGxjXTpEsubidhy6Ci0I81dgSKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLHNYwo+yEp74hFudiCWFyStLFdbFwx8ol4Evpehe7gcak2xHd0AShl+fWvQg/83+iuzqqWq4gdto32/H4J4S7YZJ4nn1vJq9lEgr5MYck9ZlBdrc2ehOizn4/ncSav1R6k0xaIfUJDqyZVB/5wxmqu0SfQ0VuW6Qr1N5BaAJbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMyBogo8; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMyBogo8"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso38760eec.1
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 14:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790200657; cv=none;
        d=google.com; s=arc-20260327;
        b=WIVsEx60VHBzAenVEOtXEgaszwf7aeWbPeo60GWj9ZD+Do1j+boUNHUN47rL/WBqG5
         9+HJloqxZW3Owud5zudhZPBoK0q5PC2t7MXvBlYvunj/iolGveAWahyVnAk8kvZBYDx1
         p71/x3HuJepq+zD+diMDjjJB9IddfA2GWWIr099ULvCA9Luw2hr/+AnHLe117y3MGK2K
         /+hUjBH8XzGOuFR4zqadNkbIfZRftmrOgnQMwpCBjNojtZ2cEC6zAqnVK7/uR+AIYuWd
         imJ8JDou6ZEOVHw+boNf1MWSBjh9rtb2vdIuyYQ+tXGvV98htVooT3544i7uZT4ZKVNm
         00Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
        fh=fMUi8iphDD5DbfGTyGAwvS2TtE6Ph6eZX+Y/Prq4lmc=;
        b=qyeuqCSpXRyduZHfUYqE2hCvO+F4HHymj8oeTdnfCkTxvXETyi88RL5y6Lo6n6pqhK
         E1CVeWcnxlfZf3S0L26PR3lM/nM4Er3x5T2yodZHS+/7BakYLnoFhzxadESZtkii1vbb
         rL0MMeDIqPtAVG3Wt+lMW/HySBHGRDGX1vnt1mkQhG0lmujIQATiD6J8jLFqyonnqn3V
         nPSOvSd1ZUDqeLaN/QXM8ONKUHhQMG5Srvbbs+CDbhxCHCPJTMfLhrMGvT93wxPUJ9nW
         y2gbcHvOZcI7PdkHrJtk/iXfXn4NhUZkk7Kmn8n+YqlZyf61FVchj0sS/3ZRLUNkD4Mh
         VJUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790200657; x=1790805457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
        b=fMyBogo8zqRkDE8O1NjcfKfGeykFFDKBj9/auFya7kA+X48KuDBwHf/Zd7IXrdajPK
         959NoKP24+BZ4okeXETlG3+Lj52nxG9ykR1PzUN2IFiN8fBhMubwXxlpIvU/KWMV01Dm
         9GRBeUOK66ZSVrDcal4BUoQVfFdwPPK695q2JpvWLwStSnM/TluSVbRyS8g28UjX2kx5
         hFHOWvX4OVEHa+krmeEcV2oRcQBvOBiWgk1U89Qf4gRoYfFY8miUijLFmHvY8L7F4vg5
         nz+zF9z48daIoaokOktLCRddUPdVIVn3g1H054A0fm7/kJm6Ds3BXDKHLxi1VQcxXYGc
         Icgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200657; x=1790805457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
        b=jKb9wWip+UWGCotWqVDEMusa4v4ktRU3c/nBodfNdyF0Kuf/hYXAAhz8LhhTniLQzE
         8Dw0jmTkCGgmPKvNjzRN1lQ0htJ02Ncx5KBfQr/5o7zeSDM0sANT0auzfwUvJaM1/4L0
         jzaethTm7IKnF4PfiVkoO8U2OFTM7jc98zrF35LBCrlrGPau68+GEC3TNRjBczAflqCd
         lvH4KMBITDK6JwABvzoqqPww0kSaRiWO+vCYIb/w1cBFVDT70TuORApku98VeRFDowOn
         KaZLXs2uF124UJZOMBqyy4m1qe6uSaZkxOdMjMJNei/Su3jwVf7V5lA92lATM9zT6UbS
         mVEw==
X-Forwarded-Encrypted: i=1; AKwUvBywWOFOZrSpj22IAdnxztgrjrvT0CEBw43ksX8NaknI3rKu0YvvFSyOEowrKOXuHWvAcbgUpOhw3GmI@vger.kernel.org
X-Gm-Message-State: AFuF++nlQqqybnPmDK9nIiKb4YVxklSZOl4Rn5DpQWt2t6YVqZnegsLu
	qMBxT2u853uBfnQSf2MeAK+pHIKTkckiq1nvZ5z9CCnZ6ZaJe18D7zpKDC+rwlJanFKeDin1iho
	G3Vj6oak+KNxsi+MBtEu3wUOxnobTl1A=
X-Gm-Gg: AYBFou3I//KA69OK+8Fj5/jEmpAsb8myB7poyekyGZOm+7r6SXTu61nmkBvDdcpB9Si
	N/LcyaaOdKKnXXHnsUEa2LNRME8JUkXus/tmQ4qqY0glEmOJJDH9BJBRypko8aKHzADXYdPleM+
	tWLNrdGnyUeeHlMOmwNEOc1TS0iCKw/xv53ZmZCB8bzUnK8aG85cDZm1zmHtZ/qzfegIv3DDJXq
	JKXOJcYTWYhhuPCs27LLjnFFEtBvyFw1jRJxFCHdKwpHDDTw2C3d6YMqn4TqQSZlI09lXDCIdib
	KIR8psxBjRwZxQuSwZ4KP889MMbi5f/UhZv4w/mg89ggbOpyYRE7LlcODGVK3+JzyNZvkqq9NNi
	amtT+4qwDAGdQ88bTH86rae7leHkdyDJ3CzdjhMMAlQ==
X-Received: by 2002:a05:7300:7f28:b0:33c:68b:c4d2 with SMTP id
 5a478bee46e88-3400657428emr416140eec.2.1790200657406; Wed, 23 Sep 2026
 14:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
In-Reply-To: <arPhsTaiqXPgCqAU@sirena.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Sep 2026 17:57:24 -0400
X-Gm-Features: AclHuK_Sy6gy_cFQzs494m9ICFUjGa5KnK2eKmqxNuEJb4IKFn6VLWZL6MmQkaA
Message-ID: <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:27=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 09:45:38AM -0400, Alex Deucher wrote:
> > On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > neither of which have had any response at all.  It really seems like
> > > there is some room for improvement in your processes here, currently
> > > that's three drm trees all held out of -next with the same fairly sim=
ple
> > > build issue.  Can I suggest at least check to see if the code you are
> > > trying to merge is in -next, the drm merge was done after amdgpu had
> > > been held out of -next for several days.
>
> > I sent the PR out on Thursday and you reported the issue on Friday,
> > then the weekend happened.  It was investigated and fixed, however
>
> The actual merge still didn't happen until after I'd reported the issue,
> and then as ever things are now starting to propagate through the other
> drm trees.  It seems fairly obvious that there is room for improvement
> here, for example people could check that the code they're merging has
> at least made it into -next.
>
> > Dave reported a different stack frame warning yesterday so we are
> > trying to make sure that is resolved as well.  In addition we've been
> > trying to figure out why our clang builds did not catch it in the
> > first place.  All the patches should be available momentarily.
>
> OK, that sounds more promising than what had been visible to me.  It
> would be helpful if you could be more communicative regarding these
> issues, the drm trees and over the past couple of releases especially
> the amdgpu tree take substantially more of my time than the rest of
> -next.  Between the frequency of the issues, the length of time they
> persist, the way your process will obviously trigger such issues and the
> near total lack of response to my reports it really never feels like
> that time is valued.

Your reports are valuable and we always take them seriously even if I
don't reply as quickly as I should.  For the issues at hand they
should all be fixed with the following patches:
https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2
I'll push a new -next branch with those fixes later today.

Alex
