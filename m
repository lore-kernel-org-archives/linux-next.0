Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83366399D0B
	for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668153; cv=none; b=DrlBg42w/OinwJr0QRpcoV1G0Ukw9jP/ZZutiTzqA88Pl5g84X7Y3ZKrmzodiwwg/PtlkdYrXJNuyd2na86ewyeyMLl+apTYTUR8Wd6rF3ecDRPIproM+eV3ovp6S4zCajhxkOAed8LvEz+f28bqpDpaV+0m5u2nJKcdM3EAduE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668153; c=relaxed/simple;
	bh=cxS7Rf5IiMOsBdgURLuM5pIlrTw3/34bzMbKDyP61fw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJrAKRl7JWgPHWym/REUmRYkdN/EEtediPJG/n1+HqgAAA5NKD1lLWVEdg6pdqmTrodAUTPN6pgmZ222VoiNT5qS4987qPBdKfLlms6AlJIFLCZd2wKw48+nNJh9TyStfwtBkzi2iXEx4cczR0dbYKp0ZCdiB68MJNcKWzAmq6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTfrKcog; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTfrKcog"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8623e5d435cso363331b3a.1
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668151; x=1790272951; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cxS7Rf5IiMOsBdgURLuM5pIlrTw3/34bzMbKDyP61fw=;
        b=mTfrKcogLP/NHgwosqLqvbPTpEYZlVOGPVqzaqwuaM9PyXJ5an0NsTMbIfEyuiamy2
         mEMwPgwAGoNEFLJSQpAhMFMuL0DBbYzAacLdxZNyp2iONObf9IAF0MzxtPuc7r+07Fy2
         RF3X46QP2AEhOrvk0hJqAArqR+CxE0aT15Zhe0+iRs09JijhP4ToNDfSEkpx0AA7zKiq
         NckyCARAKEjqRpL8QoGOu9KUTEPZfVsXt+fFC6OM7PJD2CvGndpBn+kIlX3LAG5clxKa
         nhPq0F6b5GsXiTLLS5FDflpxifCtrp0PbXvPXRuXH4nMOY1V5GHws2AMSuz9qyYzRtp1
         xpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668151; x=1790272951;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxS7Rf5IiMOsBdgURLuM5pIlrTw3/34bzMbKDyP61fw=;
        b=iWFGog8uCxeIHJrnUM5NWlLC00DK0CNTnJNpNf6gEYGZlhYIEqXjNFk7zjEpJTAcH3
         u+fAJoDrwWW7pv78GQhr2Tu0dhVCvSWCMdZjq/UZ97mBbQylUcGp50vGes2GF345SPQI
         Ev16CD6xB2FqdiCmiCKHSOgPjaHaBmVAlEVrMXgytsk1Nu4SVeJCEr4coIFvc7NX/oDH
         xlcVgzqb+JPL2D+voBlhbN8O+H5v+XuYmyob37quJN3m3xi4NiTlfUmCVKMI6Rl/GpJr
         1JUC7rSK3CbdfOS5NfnCbEewwNDxWReiaAzn/Ns7HGWbRbgErOcUlRZ9g9i5bS9Q7CES
         U57g==
X-Forwarded-Encrypted: i=1; AKwUvBx7Km21/UbmrWIK1TxAGW9HZdvO9hUyfsBTXKTv3kdj/xw0/3SkQaTFHyPZzENFpVTiG2TdL+q158TX@vger.kernel.org
X-Gm-Message-State: AFuF++mH6dOW+0oo0qqLYGUnOJgfyTmscixuHySZ+tHRaRmXDNrvsf2C
	LPbFCoq3VVVR54SigmQoNrgyTXxpVlCFYC09TomK4LEBe/8ChKteKZHY
X-Gm-Gg: AYBFou26WASXagtNcPcNUHoftNvJl/8PqRQSASxOhEg3LbeA0BZly/yWmZqbta+PMKV
	v6SuOMfdChYj6nbF83JRnzDxAMuUZYycGVgKqo15e3WWT783OydjotbqXWZYxtbsk1vOblKthz3
	J5IZgCZzJRsaDttyf9nMdt1fKayafd/7NSpFvE/xoy1mQr7VJAEk5UpA906XL2QU3I5ZkZ6Po6+
	l7WjtfOi8LAwJke79N4gWqdB3OP3LqTXNkE16gSE94en765oA1pph9QRQKGCfbHZhx0VSzw1m+i
	aiE99AL5HEuu9dcvovRapStnw3zZSzyAOYz+9k304oS9TJQzey800UV8PbE68k0hh55LWQEO1KS
	11C2LLnARhMx0Q9h84dls4yG/JvAgbLYsLDs4Fn8kwNH4HCXrsuNXA8VTFRnVNRdujqQ2yoWCzP
	5DNt1VKxlPUXcBd7eDpqTkgP4FtNOz69kUum7i985QyWM71HsC87fsb5kOxoMX1VUdsXk327lhd
	KFF6lXPG2X0C+TjMy5w0TMBFzQ33q9VILegrg==
X-Received: by 2002:a05:6a21:6086:b0:3dd:85a8:4c4d with SMTP id adf61e73a8af0-3dd85a84db2mr1401112637.17.1789668150742;
        Thu, 17 Sep 2026 11:02:30 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab50d67sm3678139a12.6.2026.09.17.11.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:02:30 -0700 (PDT)
Message-ID: <6a547919d40c858afcd4f8b9c7e970076711b30c.camel@gmail.com>
Subject: Re: Missing signoff in the bpf tree
From: Eduard Zingerman <eddyz87@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>,  Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,  bpf
 <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Thu, 17 Sep 2026 11:02:27 -0700
In-Reply-To: <CAEf4BzYp0YAbhkdkKJn1FR0pjUF3JXUxqXkZtWqKiSVPT4=qOA@mail.gmail.com>
References: <aqvBPVcN__UX8P85@sirena.org.uk>
	 <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
	 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>
	 <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
	 <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk>
	 <DLHK013DCY3J.19Y8X3Z0RTWCI@gmail.com>
	 <9d668d7c-8f85-49ad-bdb9-5cb81fb6f60d@sirena.org.uk>
	 <c80c4e2aee9502d781fb52bcd5c0972ccd3bc7e4.camel@gmail.com>
	 <CAEf4BzYp0YAbhkdkKJn1FR0pjUF3JXUxqXkZtWqKiSVPT4=qOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-17 at 10:27 -0700, Andrii Nakryiko wrote:
> On Thu, Sep 17, 2026 at 10:08=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.=
com> wrote:
> >=20
> > On Thu, 2026-09-17 at 16:03 +0100, Mark Brown wrote:
> > > On Thu, Sep 17, 2026 at 01:27:01PM +0200, Kumar Kartikeya Dwivedi wro=
te:
> > > > On Thu Sep 17, 2026 at 1:23 PM CEST, Mark Brown wrote:
> > >=20
> > > > > Do you have a full list of the current committers, I guess there'=
s been
> > > > > more bitrot than just this?
> > >=20
> > > > It's me and Eduard, apart from Alexei, Daniel, and Andrii.
> > >=20
> > > I've added you and Eduard.
> >=20
> > Apologies, that's on me, some issue with scripts configuration again.
> > What would you like me to do? Force push with SOBs?
>=20
> rebase preserving merges, and add your SOB for all commits that you
> rebased, including "xsk: Use a 32-bit compare in xsk_map_gen_lookup"
> which you didn't apply, you still need to add your SOB

Done.
Apologies for inconvenience.
Andrii, thank you for the instructions.
