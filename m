Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E946D095
	for <linux-next@vger.kernel.org>; Mon,  7 Sep 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779838; cv=pass; b=X2SycLXmqqG4LJozCA8WAc1VxLCVyB0q8LBTmhMbLJhu0iFfFMDlf022dRmhZmrkV3kEQNTwZ7kI45iBOOI233znvnCHTj5Lajv+eVWvadiqFy7Ctu7FFWJkr+b41gYAodOKvFECw/dWsn1Vc2fLuuFJIUvn4Ne9a8M/6a6DF2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779838; c=relaxed/simple;
	bh=NRIOJ7LdHSiFoCy4s5VPIFe11Z/c9wcns1PStTsWpYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+8NHxvdkwQ3X5lpUppAjgp+WaKBXUQhUTXEfkRmYF76dxcukjbUCRzmqcz9kpNcoOHvmD7aoGirogIOPN+jTBhrHmgvPoD/4R314SfCt+M2QAMKl7hSs0ITGaLQGYum19DLQvkfw99RRUkzKr7JJWnNJskeTpIv9qu4TbSQwgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JTk3B7kI; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JTk3B7kI"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b12d146e6fso1511367eaf.0
        for <linux-next@vger.kernel.org>; Mon, 07 Sep 2026 04:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788779834; cv=none;
        d=google.com; s=arc-20260327;
        b=IXkNsrUros+oT720J7gN8GB3Bdk5tzPZDuw0cL47XBExiwdhMEvdTFn0Fh9zzucIOp
         pUMlOBLcbsqXWoS64JWdwRl8i5/0jttmJW5FeNgvmS9WGejJoEgeiyDQhO80p65aanhH
         5HiZdA50MF0i6AompE3P0oQh7KOhqllbbdvKH6dptWPqCH/5SXTRjgNNpE6W37fpTheA
         de0AQWUPV72IX3vjWLQDpGiXKBB7DPMWY3XJV5RyipVWzRuuHesxudRwrFNKqZGUwq1n
         KoGm1H+c8eFeFO9er9/kz7YVz9i7/7INUyKsJVomxobPbQm0xbvZHRGxvfnPuMeuDQJE
         25aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        fh=cOSO9kRTqzFribYvEa5pH2YoX0kLuoRGYj+/TTcUf4c=;
        b=ghy/Sca/4YK9CVQRH1/5jPGg5FU1AL0yJYzY7eFySXcCixxt8oES6F1TUAVdlQ30uV
         6SJiBClDVkt/XiitrLBSTMc8GS1vp1I9y0lN2X5n4EK2V+7bVTd6dF5tRtnm4MuJkjBT
         SmObGvIBUvOs+1nlCRuLY4ZjFtGiYjRcP53TBSLP8443ljepgsFC/b0vgrpD7FAkiRd+
         kZjXSxw1ZIdkAIOx1e5K2bx154RJxiuGP77PSV10CcSXBmXsKqP5i+th98wEXFGeB6bE
         /tjzxCGpg6akJAuL+ZreZoj20jf2A9RGyOgXmjoWz1w3Q/tTwJ03m82N9whyMpvdLjhV
         kqMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788779834; x=1789384634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        b=JTk3B7kIT/O2NHmbAYbIfXtgNJlqMsTFHBu18yPLQtnGiOlJMJ504Nfyj0lz8WRLjU
         sP/SOSggyu7UJKZd61Yfc47aASI2/X6tbn6VN4jWK0prVV0CIxAGZGI7DVF7VgWfborv
         8XvfmYzv3HKGfXrWfBLluBC+Y6gr0BkkFv+Z7bUl1E+OWEgYnT8k+WjWFZ13eTMStaN8
         XPBEts67if/LnB7oDnRTyf+aTWq4n8fHBz/mrz0zzqNjsSv+mhcReSAnjbmwRfd8BcEq
         fIuQxxMJ3rlo0BcZRQPX6iFYRcVo9CixytXy6zS9UIyjIhBklhVh1vkPaRgHQDDofH8K
         oBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779834; x=1789384634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        b=kkl9b0KxDH5QjOJZHlQuihv5QVNiQVQgcX/+Ds1XU8jcNS658SLljR/VlR1GMntR96
         iv/38MzuSfSGmuMJ88FrQTy0RbfOM2ARKsycWTbVvGdM3gOTw/nNfEY+DPMxlCQhVs8G
         NAbGaKf52Kr6MKPfe6kcj85L149WZ9DJGWJovzx+3juXsqqufsEW6kv45k2mgXyp6Ivz
         7GqoylXT13Rt//xuULZ80ScC0/aQH8jAtB6eZWwvGAB9uaI9HRGCezGfohRWg0cIJbVM
         uGTeEnmvwy75jZeaPSoOO3aFPWUYj9rJHt6xt4PjRk7kB4NKMaS4Cme9xTK0IZlChJiG
         qFyA==
X-Forwarded-Encrypted: i=1; AKwUvByEGCh5dtgjFCQqwNb8rLoD9y89hQqJWtn+cS7YSbY8Mluwq8rdXSAu75Qry/udQRcPc4J740C8kcRS@vger.kernel.org
X-Gm-Message-State: AFuF++m47tIVazUvTK29uYkuWi78+SXa5vWcAj5f2Gutwx4gvjq+1syM
	HY+0whPsaycQTdW4DBaFhjsWaVVxNEWghBRR+xy9cIvEMM1fbWTzZxMLklRwGtMW8gl3cafLuXT
	8Zoi02q0MnW6Vs/RVaVcOx9YeaOX+dcVZqv8NJoLL5A==
X-Gm-Gg: AYBFou30CA23gDaBC7I6pCqWUM4WzR1xkFrsgS/Rd+QdjQT/178S23yBFBPo3YO3oH2
	JnUnt6ZGJre0+diussPY7KrgLNAYF/wpogsmdIZw85db5VPiUBJwbHjvGVu8ptuu0diAyxRyQBQ
	61AyUxqn0OLFnMwxZwVL/zmQ17bRYW0W0bazL3wb667oTMvzVyiebcqbLuArlMUzRf9QXn9th/T
	r+mQ7LE57YOBxptSbnK0G79am44XLwD1ibryvKSI2rUDfsH7t9HuxqWbJUTs6bIhdoOCJoV4XKF
	iDI5R9aA2uHTg+gJ/hV0CDpksTgwmZT/vVnElfdGp7JjaRt/EKjfP/4R5dbSSAgyq5gButzbpA=
	=
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id
 006d021491bc7-6b6fa7e183amr13654410eaf.3.1788779834482; Mon, 07 Sep 2026
 04:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813062039.14567-1-kmehltretter@gmail.com> <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
In-Reply-To: <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
From: Karl Mehltretter <kmehltretter@googlemail.com>
Date: Mon, 7 Sep 2026 13:17:02 +0200
X-Gm-Features: AcwNN1UczZjMW4p4EYJlnlzfPEBGVu9_4lKAUmRz_TMoKp6TJFSsoOPV9Fyqs_0
Message-ID: <CACzUYvRVi+XW2piwsBE1Lhe1Pg7Z_mNvFq2HX+da8RDpzTXxQw@mail.gmail.com>
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 7. Sept. 2026 um 12:37 Uhr schrieb Joel Granados
<joel.granados@kernel.org>:
> I don't see this in 7.3-rc2. Did we miss pushing this in? At the moment
> I see that syscall_user_dispatch.c is still using CONFIG_PROC_SYSCTL
> which is never defined anywhere.
>
> Two questions:
>
> 1. Did I miss anything. Is this not supposed to be upstreamed at the
>    end?

I already sent an updated v2 rebased on mainline with an adjusted
commit message:

https://lore.kernel.org/r/20260822072325.51994-1-kmehltretter@gmail.com/

Thanks,
Karl
