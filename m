Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA8382298
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123979; cv=pass; b=HSAJN+gL7iSfxFIcSVmeGlJI8rRQ9TmW401/eEWpJAC05iH6JJMbwf8LFKmuRgU6MBJantCd4x/NspE6ttCznmkl7imiV4b9JJClHpOadtmV6Gyo7FjREHw8fsT9gsBswrcpf2WmGPhzgCEBi0MZoR44XkJCE7c/01FY3K1E03w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123979; c=relaxed/simple;
	bh=UFNLv6r54uqWW6U46gGoL9XPlXktIDRb6OuF6ns+XYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQQCiaHJayxrswGcLc+e/XxcmlcutcY3ici9zmxS3vHJgvWBCYnlXT69HvffrfYZc+U64Wk474OT/Qbux+zSlkZ7F1pSRQFZnvoInydIT298f3DMQxsJ3CGQ5JHPBPjWab3ERB+BARR793IqSdMBj81rM560pxHKCh09QDVan/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmZwfJFg; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmZwfJFg"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56f75445470so2015717e0c.2
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 10:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779123977; cv=none;
        d=google.com; s=arc-20240605;
        b=RnM0+4PjQy9TAYV9oYBuiPaHCFbWCZFZOB+byaXUQBK43zWAwwS1CI5UIJK7qcTX3Y
         s8WVO/HEpecphd7SinpZs/HQqrUDZp7r7XzJtQXJY+xfppO8ry+7wlJJzK6286tsNlET
         A+ayroQHPL6bDvLAVddq6Nksim/dTgHitLWZ5eoqLTuoLRRcZqy1urILYfGR7cvEg9ub
         KdZM+GbMr9Ove6D2kuRwChmdiT8heVAu+oZvS66j3KWJTcsRxN4XoxYcsFGzH3DmFOmT
         8PRDBYeq9//91JREMkgozauxWWHY3PcS7DMJHk8eTkDSpb4YkxFHx8iCWqR1315FHg03
         o/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OEZLHWwgcY0oLPff/TfJag4EkKkcK97s5amBcBv2PHA=;
        fh=qXc+30oLtjcRoPhG4gmlV7mVDdYRp22Ht2pWLXGV4nQ=;
        b=AijhrcDF943YU6N9RUgL1r9SyuZD9z02YKTCMh4r1rYOmYYDVXF/MsSWyN17Kbrgzx
         x52AVNcpEqIeg9YRegypAAsLGNJLyOyBwJqz8wmQIUtwCVJFOaDWDGm0AJBqOj3qqwth
         GVOrnhG0AF0l2r3+uUmsv8aWLECR5pUXlTZYfT0Mpbw/Hhd1Upqg259mZmDW05970k8/
         eijgjzniJArPYzqArPKHIs1U7CwVs50WM1CClmv99aRIit4qHqVrqhZoM1jYLpoZ2RRU
         aOiSTfN2fqBF6w9CIQSYfAixV8cR4c3lTQIpXJzMy6G6OIQcUSaRSMgpUffPFfYpQJ9+
         J8Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779123977; x=1779728777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEZLHWwgcY0oLPff/TfJag4EkKkcK97s5amBcBv2PHA=;
        b=lmZwfJFgAwkN8XCbUR+mUj/3PrtQAxQTd4w4xOaoYDKYpViMp2HIpnJNkHUhgmLFSm
         7QjElqt49TxV8IUe3DQaWrkhHsjhF5Xbx9/FWCGMjEew0RnAkJtMSBzVxdAhtZ38anJt
         DAjKXjp+SUx1ByWVSySpXPabILuaalgBvN7p8HHZowH8Tn0C4p5c/akCNYgmxaDsXs+D
         nkvYPGZwwJD3kvnLz5pPhR5RIZsHUv/ODjCa1eqY8WB5R9W9Vv8i48QtOJbmT20xgZDY
         lLeOzKSVd0Ixx7uHonSvHQyxtglco2j6w85Z4mQwk6H8PRx6QNu0C+JtZ1X0Myj/Uu1u
         IdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123977; x=1779728777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OEZLHWwgcY0oLPff/TfJag4EkKkcK97s5amBcBv2PHA=;
        b=SGy+CwEhhTxeklFf54UuGuBt0fJknh8/FeafHgUXRbWtWMCuNUgOmrPlP6uVQnVakd
         d+NwQG3cSfMer+R2oKySvp/Jy5Uo7d3Qn/FGtPo2V6d806MoTikprcwDidfA54BRlc2H
         3o2EcL1+iksyYTMftmiI+HAO/9Vy+yCeuu0BoXLUny53nx7STub3mfQJnFFMIlnTxkn/
         Hyjr/LAavIhfpQ8lMB9Zyn2ajCm7cJJt7g9CVLOPON1oTLJrY+CPD4mDuAtXTFUJcXkX
         SVjiBrsclSbPA2qywxmP4bey2ikAV+lb5JWTkHl01Sz/zhE5369gnOQ5sfob+bzGJTYT
         Z+kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LsjVTmm2Vx93QAaponnpuaeD0/bm0EgyS2xV3bsyyJvJl2YVbmBSyYuVhvZqZZAoQVkNw5QGylPxB@vger.kernel.org
X-Gm-Message-State: AOJu0YzL52cs/QAniSclF3Po+in23IM0etEvPic2+ugPjYXubzo66yNR
	M9qt7f/i8xBdpl8Q3xsBBXSyDNlm/KJfIXJNUm53r9M7V/EnMY9UxkrOVIb97zNV7TNofW6QZTv
	Yy0pHyNTYq2ER2edPHDqrUd/40KhYngc=
X-Gm-Gg: Acq92OGOKTYYnnucgJf+wgOXXq2TjxlcttUUwg/pEs8J4/SSlqpBaVxsaDnUynQbB0d
	+GjEmY2ocg6hhIiijkE6hrpfe3M8ErMTu/0LWGzlvzcO0iMziDXHnW3IXBAiYdkH/BXSZT4FZ3V
	K40l8mW7d07TP8WYLb4TLQKndDuyFJJgkN8GK5jePV8OKkCiUxUU0d4WDHZE7jUmfefUWD9hPpw
	DMz2ZeJlKR8XoZfKTF3ug5dABZlrnVYKLuNt5WMcdiVpfM/AT7UD/inMjO7z19P5DuWPhtQyYBk
	vJO6P9kbuXVDb7LRBpiHjQ8oJrWOffKfQcSNz6yMWms=
X-Received: by 2002:a05:6122:3287:b0:56f:22ad:f5c9 with SMTP id
 71dfb90a1353d-5760be34515mr9673193e0c.2.1779123976595; Mon, 18 May 2026
 10:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <agruPPybCx8q2XcJ@sirena.org.uk> <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
In-Reply-To: <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Mon, 18 May 2026 23:06:05 +0600
X-Gm-Features: AVHnY4K4s80sT1NJfSLyxiZZfO_OdEd31CPwsv-qt8piAMAS-pUEeeDey3Qyj5I
Message-ID: <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Aleksa Sarai <aleksa@amutable.com>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, May 18, 2026 at 10:32=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, May 18, 2026 at 11:47:24AM +0100, Mark Brown wrote:
> > Hi all,
> >
> > After merging the vfs-brauner tree, today's linux-next build (arm64
> > allnoconfig) failed like this:
>
> > Caused by commits
>
> >   3adfed795a99d (openat2: new OPENAT2_REGULAR flag support)
> >   6703991ad3a35 (vfs: add O_EMPTYPATH to openat(2)/openat2(2))
>
> > interacting with each other.  Due to complex conflcits with netfs on th=
e
> > old vfs-brauner tree I have applied the following fixup but since both
> > commits are coming from the vfs-brauner tree it's really not a merge
> > fixup:
>
> ...and my fixup fails to build on sparc64_defconfig :/

(1 << 26) doesn't seem to be  0100000000 rather 0400000000 .
0100000000 conflicts with O_PATH in
arch/sparc/include/uapi/asm/fcntl.h

dorjoy@desktop:~$ python3
Python 3.14.4 (main, Apr 16 2026, 00:00:00) [GCC 16.0.1 20260321 (Red
Hat 16.0.1-0)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> a =3D (1 << 26)
>>> oct(a)
'0o400000000'

I looked at the O_EMPTYPATH changes in git.kernel.org and it defines
O_EMPTYPATH only in include/uapi/asm-generic/fcntl.h . That is why it
was probably chosen to be (1 << 26) i.e., 0400000000  since at that
time this value did not conflict with the other explicit values in
architecture specific fcnl.h files. But as far as I see, I defined
0400000000 as OPENAT2_REGULAR in arch/sparc/include/uapi/asm/fcntl.h
during my work. So this value probably needs to be something else, for
example, (1 << 27) i.e., 01000000000 to avoid conflict after merging?

Regards,
Dorjoy
