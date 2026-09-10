Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79003DAAA0
	for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054201; cv=pass; b=SFSefJf4j3k+1orEK2rfkoCSqJiwQBl8rVLyOgLTYA7mGzETtFpgRm3fATt8xNFsRdT/L1f6px37VZEKGJDvj26w0EG5Qc6mWS1vtpseIH24/633FIpsGjRZbpeKUCMeazD5lXHaZVgk/lVZnSV2M5cvY6OJkWtm8WcRiKtXzZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054201; c=relaxed/simple;
	bh=9VQjJt6a+185GkYjPMQmDeyCxl5xt0e29jz5LgzWiBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zww0KI4hYTfbr0K5ckNxCU6KfxJnCohtvSaQGloPoRRdRvsEav2+X2Ddnoj+VUGgnRA7dSzfXfXg6eSYrIa493tf76ZdC5ApK1RN0frKxGEkS+IoSARNf42kR7hgbCdWk3oHONt4Ndmpd9MVXDgUT4bK89C576uvPSpLQxtqKIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBePQ+e1; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBePQ+e1"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so2679962a12.2
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 08:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789054198; cv=none;
        d=google.com; s=arc-20260327;
        b=GIwE/85Pqb02uwI8jatZXigf1H1JSWNlIa3+3x7qMzA4vXeWv9suTyY3qG+oBTSqf4
         wA9qGTB8XnGOEuEJPMWkDUYj8qBxVWjnFg8gPIEAr14annQ2OTYcgCqqvPsp+JSiOPaR
         5HFmXPa3H6Od3p66JMGYqlSNx27tfEY70QQ6ZIUbWYVjzMx0xuwgVLG6DfBav4uZEauP
         Jz9qSiyTuxquBHoXogCddA8ucTjxrXem5lMyFNvvmJgTegs3Id1blESR2+D6S0ntUDHq
         Cck2FtPq3QTCPJdoKyeuA+fWTAyRfpUJx5kV70atUs8uDGDJUIHEQk1WCSm0DLiB2vlQ
         0N6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W02XYVTB0Nl5fojAG5hBMBTOksfDYePfH5xC6TePd8A=;
        fh=bmaNQf5c+uukfuCuEt8X83P547g5M1dMsFUfFKrHZ+M=;
        b=Xon/Fa8T4HUZag1oMzFB2uXhvdapWHpAYYqtf+vPdavTNA4AGMHtHeHMe9eWVpU4Xu
         UMjYEphM2nZZ6aSaQJsIOPzXCnERjbpkO0J0YDV+nzjLK3p4aeaSA5AXAjvZJYEn9uBz
         rNLrqcyclVOaAvWRfXoKjD5AKHIJvuxYWfGjbyaUAi945an10fdgGlavz5FdJ8wY8V8V
         vP2FBbQjfmPChVpjDo7kwcGkBp5TyU2qRTP2641KsHZFvfuDkWFqAR7PflGu2gubR3l/
         hSPCr26CYBPYjfShp0BEJqpItIPKzWNCze3RutI4U2wWERShRUg6sKgFpMbV5Eu/E0lb
         R/8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054198; x=1789658998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W02XYVTB0Nl5fojAG5hBMBTOksfDYePfH5xC6TePd8A=;
        b=OBePQ+e1czq6QI8vuL8LfipB4LwCWVa1X93Zc46eOOw5Su0F2keYGp3v2CQOJ5H83s
         94VyoZdW3ph4hAgyTUoqz9ZazCTK/+XRoV9scPSMeZ0zLtRJKIVmr13JEk33GWOdL+5+
         b+EZrGSbCNGLRX5JmNHN6PNBcZvIDVckvCDRA5pDT36TWKoM/mqdquwr85qDJqjYotgH
         FDIB55uhPLeIhOlLVUP+NPKeKkRhRaB9ktSyKS6WVpbXFcfx/Yyj909/8N7hx4OWEg0R
         XyNq/tk0Fnw1jMsnxBebjybEEoeFvBU0W2MelbHD5JX54/aS0DTGpqI7Qxyimz5ReGNN
         sFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054198; x=1789658998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W02XYVTB0Nl5fojAG5hBMBTOksfDYePfH5xC6TePd8A=;
        b=LkCHAKawIXD21ABeIocG/f0NCV8Mkbl2qpIqonkNWsD8mPd1GDxyFEFltvPsB7CjPW
         qy+hq3XkH4m2IdcbUdf23dJOMZ6dLYgWtmb8lxiJpEvJVmaS2kImq/mD+FBnA+8TjRLn
         DzmY6CyJokFwXu528epnPjPTNlXTgeo7tLhykmzwXRV6XBpKnT3bzwqkaterdC8YdkXO
         HcpzAUYYm18nXgDa0OiDXD16c4eP3g56q8VLCNMBSXrqWG76oP/RqoQLvuSeH0XKvJi9
         ZjmYAX1tVslXpM6e2pqfeMNmdotcvN9OwltpRh2qG5z4OA9nAxztn3P2yWK5zDWQMLTt
         PXGA==
X-Forwarded-Encrypted: i=1; AKwUvByTNtTxv3cB0CqjC9fs7ELIPIauNmjwvYH8D9lpH+ySdQ09q5BCPhEMEUkyU8xkVC0NV9YAzPbWX6uB@vger.kernel.org
X-Gm-Message-State: AFuF++nffqhlLF1yG0QZLV9svrWshCkJ8JjwxLkn8hK05wK6BpS8ri/Z
	vmM0euCg7KI/jDKKejEwE7xwI0j1XJngbHL5MmVigNuvGX+oB+Ezim5S4mXil796qmgq8UgHKdf
	QbI2T9UWX51USHRlkATFc7XdRFXczZY+unVZ4Y8g=
X-Gm-Gg: AYBFou2ibW05DY0BH3G92FeYne1ZIo6foV3SPXdgp16x41pHgvPhLnlVca1kg0z0aUP
	RWM9zGM37OddjqcMbOjHJPbN6muXdfTQypKKfTWnE4sZI12dUphLGGYI3M9w4fBTC3f9nMiTFRd
	T5ToN5+nib4bs6X0KD8PAV7h69ng5f6ThvKiji5BMXS+4DE98oSiEtie8tEO+JFJnwwQTF7ODuE
	v1Hu4n+dCP4CoyXpZfqGw3pK8qilNmQqV19i1Z9GTYm4wZJ6bWnNL3YfhDDGaFGYHgWUzJxjoxe
	7LNppbcxjxhRMbbQMQZPFQokJgREYGjR5Vv7o8yiXQi2RzDEvKI5eBQ=
X-Received: by 2002:a05:6402:3512:b0:6a8:451:32b4 with SMTP id
 4fb4d7f45d1cf-6a99ccf0837mr3371397a12.23.1789053870395; Thu, 10 Sep 2026
 08:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9CC2EE8A-9F67-408A-87A1-62AF671B4BFB@linux.ibm.com> <20260910141524.12362-1-spasswolf@web.de>
In-Reply-To: <20260910141524.12362-1-spasswolf@web.de>
From: Chris S <coshi036@gmail.com>
Date: Thu, 10 Sep 2026 11:24:19 -0400
X-Gm-Features: AcwNN1XO9GRsWlKpqFSX7PpQbLAxVz7EBaLMtD1MZCmQjL9KwHLULMUzhoKDyzc
Message-ID: <CACd_6n2cPqmqs=Ao6yKGSzW8WxUPPsHaLJBOHGeMtKPkk6aR_Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] jbd2: point the shadow buffer at the frozen data directly
To: Bert Karwatzki <spasswolf@web.de>
Cc: Joseph Qi <jiangqi903@gmail.com>, Jan Kara <jack@suse.cz>, Venkat <venkat88@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>, 
	linux-fsdevel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Zhang Yi <yi.zhang@huawei.com>, Zhang Yi <yi.zhang@huaweicloud.com>, 
	Bob Copeland <me@bobcopeland.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, linux-ext4@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Weidong Zhu <weizhu@fiu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right - I checked rather than taking my own word for it,
next-20260909 still has the unguarded dereference.

The fix is in, just not where linux-next takes its vfs branch from yet.
Christian folded the b_folio check into the commit that introduces the
folio-less buffer rather than carrying a separate patch, so on vfs.git's
vfs-7.4.bh branch 781bf9c7e307 ("buffer: allow a buffer_head to point at
memory outside the page cache") now reads

if (bh->b_folio && folio_test_dropbehind(bh->b_folio) &&
   op_is_write(opf))

That finished this morning.  linux-next merges vfs.all with tip is still
2026-09-02, so it carries the series without the fix - which is exactly
what you are hitting.  Should go away once vfs.all is regenerated.

Thanks,
Chao

On Thu, Sep 10, 2026 at 10:16=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> =
wrote:
>
> Just a quick reminder, in linux next-20260909 this has not been
> fixed, yet.
>
> Bert Karwatzki
