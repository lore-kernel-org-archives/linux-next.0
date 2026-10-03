Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3723612E8
	for <linux-next@vger.kernel.org>; Sat,  3 Oct 2026 06:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009817; cv=none; b=H3yabJssj9yHO8vtbtOEnDokCTM7XgPceNs3JZ9iNmsS25Fd0seJwdAsTm90awHJGpjv6M83dV/+a1fc18SLeS1h2xwBLqjm/xvuhH6Gz9id5BxmjnvtlkXuurk9JmGt7uM8j6mCGFqF4mMtJeK1o952/ufNlVOwlH5YycVzwGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009817; c=relaxed/simple;
	bh=ryisnPL+d2gzMUjUclobqs/GmZtuvA4REd2ag8z+s6o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hrkG7ia3yQuNqLIZFmAwNZBVlrWE8hoOnQSWMS4nR1G2AUBljozX0vNK+Fo/KK1Ylu1KLD5oO675vVxu+1R5YCOMJmgk+vZo2e6VVuDe2dW07g+E20AcRlZXNq/8+U96zJ3D+XRmQPWrV3Q15uVFFPRTWXlhhaLdqTVdQrpzrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfQ13+5B; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfQ13+5B"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso153686a91.3
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2026 23:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009814; x=1791614614; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hea1toWUP43MAmLnSW9JW60/RDmL9+JiV8rQiXNzb0=;
        b=nfQ13+5B0HEgftrFp+nSVcNUgiZjLXoZD3urM0fouRlujxwYCCbV4l4uozll38Gwx/
         oIUO7JPcQ7T7RUcgiNI/EZgj6ud67A461F77g6JcVFjjvdAq3kuScF34Cbj45oKOXM3Y
         nVw8R1OPlYXCunhugielUpz07o8DNZHPIWjO9u5xDJ+3OddzidBXbdKY56NfV5e73UJq
         Nai+IyrZDyhzFx6pOqCNUDDQ7ECw1KGJl8OjTT6drMIXi8N4eTh+PWBDAONhca/Iut47
         O4xtlNCCWxPf+h3ZaZnwxKjEuGEv2AQjue6CA2USh1D3LH6UMtLOrvr3JJ5Km494M5kX
         FoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009814; x=1791614614;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hea1toWUP43MAmLnSW9JW60/RDmL9+JiV8rQiXNzb0=;
        b=ChG73nTDECESRcdgsy9pVHDxgNBFOH2iTV6D7J2JH2UVa5XgGo1ERx6GNaSp2oOFTg
         SPkhG96dCopXWwc08oWXaAgtjJhqEg3wsfcgM7vh0IY7r1mBu3bm2DHzMkAAGNgoXhE5
         d80hG4KaPLtreoolNeHOoBUxUKMppNMVMD0UQHybrYeHHRsIvlFgYztYPxRGVGbD4fnv
         eUNUFpwW31qz5TF/8QQBWLz5FlPGwmhUXK6mbZCggnI+XL75X42HOZ4Dsy4AhidM08T6
         Xink6wI3JgvVJERYUwBFX2X4mqx7xMANSYC+8LKoA2j1gsIA5CvqpAw3mc3nXWa2uux1
         +wRA==
X-Forwarded-Encrypted: i=1; AKwUvBxqgu43gJKee9qDDwEE/lwbSvg61TzNgaHBgzif3U7U0Dooe0Nvnc3azeVOjQHQcxw+RQwWvfv0/gZ2@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1fw9QIVfjFwqsLUCGRMquS8VW4ef7MA0L+t3kNZepuP1xThIj
	I1zLDITxY80VdpQwD7tWYJ6LoUYlrT2SnBmWD3uYfL3J6BLS515SMn6G
X-Gm-Gg: AYBFou3fxas3oAhu2eeOBomG7wbsBVOV7yMIPQpXeHJ9sh4QEEiUHA7hhjQcX8Z5+yD
	F50fCWIRYL9uef3ZfKSuuab8v02+C7YhlmnkRGjPcEmwbANBLko/iDjHHPsnNlOkBSSgMxP4jFU
	1xAQ6qxfFBSshh0LHx3W0S2DpN+EfhRTUlIR7jP6l3aGvA1cEcVgck/RGhnubWpV7ce0HyFZjh8
	u5bFQRoyfs4SDev3aT1g6EH7aC2CRCrbBdnPTSYd3Hmb8cBgTkN6JyC+pPUVU+xWfw+YdoPaJgB
	T8ZeSb4GbkdcoiUl0VddIVYAyunw9ioQ9jN4AeJklDKkZCJrbbRbntd0vRGvTblLtrVPxuZM2Mv
	Q5zID5vT2iZmzc8kMI+jRgnP1J6/2M2n9TqNqMMe/Fut25UNNMq8BQGP+UIoTKc4Z5+M1wO11hl
	8xIax3m/iYh5/xal85RfCDQbTzOnHN7Ps4bC9tyQtFXWx89NDawUTnZezjFjct/s2tGt5BDql47
	mkbImSQ9oAwbN3xDGEj3BkbnKIYjmxug3yt72p4/lHKSDQrs8eKzIOYmVfjTuUeSbgocW39VkoP
	5FU=
X-Received: by 2002:a17:90b:1c10:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a6ced24dffmr4975882a91.49.1791009813693;
        Fri, 02 Oct 2026 23:43:33 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f73557f2sm1830292a12.8.2026.10.02.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 23:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 06:43:32 +0000
Message-Id: <DLUZZPCXSPYF.1PKXK3MYR3TIU@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, "KBuild Mailing List"
 <linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the kbuild
 tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Nathan Chancellor" <nathan@kernel.org>, "Mark Brown"
 <broonie@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <asAzcgDsbNEFIfKV@sirena.co.uk> <20261002230632.GA314599@ax162>
In-Reply-To: <20261002230632.GA314599@ax162>

On Fri Oct 2, 2026 at 11:06 PM UTC, Nathan Chancellor wrote:
> Hi Mark,
>
> On Sat, Oct 03, 2026 at 12:42:58AM +0200, Mark Brown wrote:
>> Today's linux-next merge of the bpf-next tree got a conflict in:
>>=20
>>   init/Kconfig
>>=20
>> between commit:
>>=20
>>   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig=
.toolchain")
>>=20
>> from the kbuild tree and commit:
>>=20
>>   eb13a1ff271b0 ("random: vDSO: avoid call to memset() when zeroing rese=
rved parameter")
>>=20
>> from the bpf-next tree.
>
> For the record, this change is from Linus's tree, as it was merged in
>
>   ac7445c28e7a ("Merge tag 'random-7.3-rc6-for-linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/crng/random")
>
> but presumably your stable base does not have that merge depending on
> whan you started -next so it comes in from the bpf-next merge of Linus's
> tree in
>
>   2b5440b31caf ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/=
bpf 7.3-rc5")
>
> I just wanted to make sure the bpf folks didn't think they were on the
> hook for this conflict, it is only on me with the Kbuild tree now.

Thanks for the clarification.

The other reported conflict with pci-current is in the same category.
2b5440b31caf is what Linus's tree has. it's not bpf-next specific.

