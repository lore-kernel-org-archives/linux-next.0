Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792593636;
	b=dZnM3uRSkD7XSQan2sJnOUT40icbGqpkLjQI+dBtIrXxNSj6+89h8/xgnHfeCpkzt0xQ
	 IvXfJv3J4f60RgQ00T0Jcmx9uSiq1K8Y/sjdRQZuGxK3bvHNL2nIDyw+vKl/exxGnAaH8
	 t7+SFRSr5v5muXm1DnRfNKLVONF1gaCGgUnLRwzHn7moBLsIYr3J+oGG2HIt1UeUQTpQE
	 8eF1ZJNvsCjb7ASRnuRrqZZaEuhA7IwCKTQmn7iQxV93VZ2RH1tcD0myEeT/FZ1cYjm+T
	 e/neqSFox6MSRMNqPov/Zh1gdyHFPVN517chqWk6K8Jyxrmvth3/Ag0njOPhHB9UeUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
	b=LQ9XPWRL00J2fBnnKIHngiYsYBQZW4tfgEmiUlnxPXC+YACzZ2QZI90tqp8mhioZI29l
	 Kp2xNxlICNHdKcFx20o/vrVeOIo+0vgTNOF6e02Tn4GeWqfyFImEkhdKd3zEYL/Au4Wqm
	 iV3ZZF2gwPoTuxT/a1AZxw3/gX4peNfgmpypFzU2e5jjoiTsfBy/drgXqJF2T9JYsEEHp
	 snbkNatpJjDkJ7jmSVuls/V8B58ulxORBcuvvXBiapqZ5fcT5gdT8BZOrqz/IJNbd1msU
	 xsxuj08wpcg79FG7bl7AwH35xlz0U0IPEnKsaSGa8JLvNgH+5TY/wNj4IAK/92IBf6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YOtiR39o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91352606A319
	for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 14:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91352606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YOtiR39o
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso98293266b.1
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 07:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792593634; cv=none;
        d=google.com; s=arc-20260327;
        b=Xg9sdlU8sZ1NKrbrOFUHo339W3PF8KDY6yCO8Qzbv2e6woL1CAmJgqvCd2EIj0xPcd
         l7scna/PuuU2FfbJhts39V+64kHH2WdMZBult/KnVzxO9P2vJpfmTeVyrDT8tfnc2w4n
         nZgygzqa0YW/nH2o9ejAuuBW+I1NplW/UWGVxkxsKrZRQtPudDpJEspkHIIc8EWnC2vd
         MxN3Vyw+6wJDv2tSm3UCjtWS9Rq2Rp49/fMzBcWVbx46lpTc2gSkGL/1XS3qok+5O5vx
         2bPb4Tjwh+HiC/igoPRVVfTQhjmQjbaubbh3+QR8JccfxHrA7ClkIrEDCWJWCYqvGcOa
         KuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        fh=6/W3rDxwhLhGapxXsNve74yf5tJdG41WARkW2PR9cP4=;
        b=bazLZ0BN45Zr8GrNohYmE/hxb4Wk+4X4+HlEkMl90ORkGWHZftRnxj/t/2SVh+EInn
         3LTSj01sz/mjywuiw+PSUq34bCe79sZJzmdm0wEzzAF4wbbXGNMWG6YISB+/UlF4g6os
         6hTA3gEl7r9t4Q/dFANIwx+DptIzosWFSjAoztIcLjYbgikD2OZbXUQlkBTWwPMBUB59
         pUl5V2w0+L4kbilQ+8btkNWbDD4T9w9EkeCdUYpiJWfZQ1yjf18MUggNIOGmGWVLT+ji
         Z/w5YP97pzHWFMHPiT1xv8Npgv+3956MkaObA6rBHHiwDadkRXp1cBflg8BrJJ3gCPkA
         Sp3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593634; x=1793198434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        b=YOtiR39oWEq1NTpzYsD+O/moSozbEa3Eg4RSnKJy49DnFb+9W1tBNxOPOsrLRow/rt
         BKBrrgzC9CPN/ElxyNzs3dFY/pPyqRQE4CoqEPDfMQ8Ils4ANla9wilhdGn5zr2VUBsh
         XDClU5phi6C7HW5g7q4x4E+4fhhH+VQbFfTlKkYhue2wVkIqODpirKs7DYiD9NHgOAD1
         weJZNd0fgXEY46TQzfKEp2ZOQ9bKLcvHSgTAooQyE4W6vR0n3dycaUcgNAy5MwJJwboQ
         hopm5fU9nBm0YxyruqOpnDGw+OptacQuZQVNU+r0yL5AcOfOgY2vsxeMhNU33b82YSYu
         dbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593634; x=1793198434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        b=MaxrbyxtA3xlqjjHUh8uKpFp0GFG3B1J3sv2AB4kMQKZCb4+IC9Ok1HybkEabo+MuQ
         iYUXFhIFDE3FtX4BBskz2JTqtxcOY6FVHHCAff6UTrY/CKJFZ0KZtq5xlUlfChoHHLIs
         L5BXukZR5bZ09zrGJyhqhSml9LQ5uj0F2fFpcfHXDvF9JCjpSwtdwxbWVpNye+qYFvuy
         lYld9YXewU/z/fF9bbu3kH/YLkExwK7cMLAdnCeN6uJTo/g4RiKAQ2PCtEBeNRuYDMF1
         XQnEaA+Fs+nhWPJ8gwjb0dBGK+jGaiXhF9v1sEiRm7XV+FD7xIZR4B6RyPQQR+w143dX
         Cmzg==
X-Forwarded-Encrypted: i=1; AKwUvBx1l7zOOCtoPJOSfwdDz+wQMxRhPh48N/lmE6RzixoT7RKZmncr/eBm2kH8T7CXRrZG/FC4aAUxLfIb@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Nc9MG/fQOkwP12hNuyfgo+8r7Ts7WKzvgCRDJR+OATaVpFVb
	44fkkC1EQ9ot4iY+0///59S9tmdRsAGDgm3zccC4/cXWsGOsbTUJ2Qrh9zWfynDN9tH7aYTdq+T
	k4S1lDvlOKF3R9X56moQQf4ktvmUdLd0=
X-Gm-Gg: AYBFou2Bhi0r9hjBw2TKqz/cTxsyT0S4eXPX68e98wnryI+Qe4z2981zsYHH0U5Agdu
	eBVtmTgxduvdHMehifoBL9RbYQ34MaP8sAt99yAQqyrTyN3hBTfxGC9r1Cdl1xjtJEQladHRxXm
	gioQQb+rstY/GZfyPZJtsPZgwWtn79IJuJ9HYziFtgaJoad9xbzuv5C4H/gCtGG/tTK8JzaV1vv
	l3koYqNTHAEy4h0bW53sDeo9d4ikpVpuSO48dfK2OgA7CoOfboWzU+uzvPM+zg4Lopm3dVJEL6q
	/wMU+HkmZiGuyHJ88zRYhjwomHIByWtZ2S79LmRnfhBQ/rIZUXjKrEWnhkJtiPVO85hO+xauKNe
	4PsFHz+UEEqtyFtxV+piW5dVKpD2OpCd/WS9la33fmC/cBRD0LVerDUCBGA60OftiEgftlg==
X-Received: by 2002:a17:907:cd07:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4679a0ad6cmr205617466b.44.1792593633650; Wed, 21 Oct 2026
 07:40:33 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atibhAMcgKle37-g@sirena.co.uk>
In-Reply-To: <atibhAMcgKle37-g@sirena.co.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 16:40:22 +0200
X-Gm-Features: AclHuK9P_pXHpQjeIJNu3hhCsP1EXBsiHMxAkTG5K31baLilLfCNdBeEfFXeaCo
Message-ID: <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Oct 21, 2026 at 1:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the kbuild-current tree got a conflict in:
>
>   arch/alpha/boot/Makefile
>
> between commit:
>
>   c437950dceb88 ("alpha: add self-extracting compressed kernel boot stub"=
)
>
> from the origin tree and commit:
>
>   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
>
> from the kbuild-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/alpha/boot/Makefile
> index 7c2a41c1e2a06,b050753e90157..0000000000000
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@@ -39,14 -38,9 +39,14 @@@ ifdef INITR
>         cat $(INITRD) >> $@
>   endif
>
>  -# Compressed kernel image
>  -$(obj)/vmlinux.gz: $(obj)/vmlinux FORCE
>  -      +$(call if_changed,gzip)
>  +# Self-extracting compressed kernel image: a small ELF stub (see
>  +# compressed/) with the real vmlinux linked in compressed, which aboot
>  +# loads and enters like a plain vmlinux.
>  +$(obj)/compressed/vmlinux: vmlinux FORCE
>  +      $(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
>  +
>  +$(obj)/vmlinuz: $(obj)/compressed/vmlinux FORCE
> -       $(call if_changed,copy)
> ++      +$(call if_changed,copy)
>         @echo '  Kernel $@ is ready'
>

Thanks for resolving this.

This recipe now only copies the completed image, so I think it
should stay without '+'. Matt's series moved compression into
arch/alpha/boot/compressed/Makefile, where the change should be:

 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
- $(call if_changed,gzip)
+ +$(call if_changed,gzip)

The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
still needs the '+' from the kbuild patch.

Maybe adjust the resolution accordingly?

Thanks,
Magnus

>   $(obj)/main.o: $(obj)/ksize.h
