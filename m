Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3C1F37D3
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 00:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570256; cv=none; b=jjbSQ+KIIiQ6y+iLxiG0wQCS4LIxPJeeflMHLS7hRFNpd/udBy5+qsO3rsGjjsP6m6x2f6vhYPYB5CZyg+kUks13ucrJCLK/USAVQj1F4FsjTYp2oPwaL3ZSDX2SHplJRUiMnXmIJxIqnnxwK0oaTN0z19oc/YeXEBIxulXUeWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570256; c=relaxed/simple;
	bh=p91yC0380ci6RVyhXJ1kuAXKj9VL+EWnmfNds5Mm5/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRgmpETIOqu2jQX6vKjF9Ttx/OEAXQcFTzTj/KtI+imZ1wA3Nano1TOfFJgT1P/AU7cDcLcHK+S+5xY1JB37GyprN+VN7+gD6vcXdQ4ueev1TLArNsxDCjUDKMPcV8Z/aEn0hPaGYlXUW3LO3t/kGTcuM5byQpVC5uzglsM5nW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXKx2If0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXKx2If0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso29288775e9.1
        for <linux-next@vger.kernel.org>; Mon, 15 Jun 2026 17:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781570253; x=1782175053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFPF4sC2peklNMGORgGTd/4IxXXegAkw7S2lBmPrG1Y=;
        b=cXKx2If0O5uoxGazgOHP2e49iqcvTwTtqYvtYQ9fxEj297PwBpNzV1VGOo+P1bkdGZ
         pL8m/dAJG5/eXlbYJAe4BGkMPFSh7fZJz4GaymjDJVG2iiqVkXPONzbNYNblUaCt9IcO
         3ZPVUlbW/pCjck7mIZNaubCIpo/sWpoKe5YBxE7W+GmPlVgY5Yq4pZuUqcRCHJsZgFfh
         FQuLtOkUOb+zRGi5yMdTORX5WquRPRlKfP9mJi4fBnyLdTpx8lV+dSfDbhxM1yVUJ56d
         yXkQuOJaIe+9pzY1LpC+7WX2iP94q9CkdvyMuevov+StNCINA/hSlxgm0j7bZV/ge2pe
         upqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781570253; x=1782175053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFPF4sC2peklNMGORgGTd/4IxXXegAkw7S2lBmPrG1Y=;
        b=GhWr4uCTb2cx3dleGIhmQh/ZfVWyp63V4z68mOdJ0w6N1P5D//LhRklBR9lGT6/1Jj
         PPt8vB0TGd9LstOw6rSVdJoVqdlxSkNZ8jHSqpiH31JHLXdcOiJXDrrDZmCfoftXia8v
         i6EHZdxR5JJqeu+UYLwZA17iGm25gPag2Rwu9WQ0uZ8/OaoQGWxmtXpSX3DXbLQEaGeO
         8HArf+AaTrwBvFu6SdQkhV4XGLzojx2PzVdNMDXSKRQKnL96lbUgzlgaE9MLPL/UIQnO
         gWbZzIOQd3dnSd3l2PDtV5vSh/5GkSyF0ml7Alva8Achs5TLYMyi4BUMG30pu16mqLcU
         7Sug==
X-Forwarded-Encrypted: i=1; AFNElJ9CYxeNmOUdQKWj9EtJb6RyVAW8RSE7sn7HKjR2iEKcpUsHNeXgGTyMn8/1wYgH3u/xQvyYEbwcfS2F@vger.kernel.org
X-Gm-Message-State: AOJu0YzxcDgqXtRAinow6FhqYRCq7uhukMn3awZsutxVUxuVWQYTqg99
	1fwv2gW4K26WQbXvDMujkLC/B10KurUdhkqns5SgnjtSYQmvv3tKrnG6
X-Gm-Gg: Acq92OGlyZOh3lKcgkEfE1CkgsVGYl5RP6ccl6He/VYrL8/uOXjmkqdT6qiZXEOwMPE
	DtkPQLMA/UD9WZmmuIyVTwKy05PgUu8pW6duEpq1dW4nhqHd9URSGIeq271r32JRy3b5qI6jgRp
	5bL5BDJCWA5/o0f8Pz0KVJdMla/kde7nYY858Thx4X36+BDDoiiKQcnmBT8sqau4vfEIUraz2CD
	A5j0ztycdXW0jzmYwJVn6GRw00OA9qdwdz4m51HIW4gbHFh0j/7USoHFCtTe+Yglv1tHw+BqvEe
	s1J73A1pRAVkkrQINc//6m3oOxKws2E8lblXZD/mtz4GRa/Jbu8hgAhKPsnxkcgzXwovXXIXqj0
	3c+2BAdXJse0Ibx5B0Gjk2gTuq5bApe9DAqpXRrE/IbHFr3WtBoV7t61jd5o2K/MFtUsOwV7Atb
	tNcfp+N4iCFPNUIjDkfoU=
X-Received: by 2002:a05:600c:698c:b0:490:b025:f324 with SMTP id 5b1f17b1804b1-4922ffbdad4mr19600415e9.32.1781570253120;
        Mon, 15 Jun 2026 17:37:33 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490ea4b39e9sm238270495e9.0.2026.06.15.17.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 17:37:32 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: agordeev@linux.ibm.com
Cc: akpm@linux-foundation.org,
	axboe@kernel.dk,
	brauner@kernel.org,
	david@kernel.org,
	dhowells@redhat.com,
	hch@infradead.org,
	jack@suse.cz,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-next@vger.kernel.org,
	linux-s390@vger.kernel.org,
	miklos@szeredi.hu,
	netdev@vger.kernel.org,
	patches@lists.linux.dev,
	pfalcato@suse.de,
	safinaskar@gmail.com,
	torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	willy@infradead.org
Subject: Re: [PATCH 2/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
Date: Tue, 16 Jun 2026 03:36:59 +0300
Message-ID: <20260616003659.4002764-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608171917.3195488Afc-agordeev@linux.ibm.com>
References: <20260608171917.3195488Afc-agordeev@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alexander Gordeev <agordeev@linux.ibm.com>:
> Hi All,
> 
> This patch as commit e2c0b2368081b ("vmsplice: make vmsplice a trivial
> wrapper for preadv2/pwritev2") in linux-next on s390 causes the selftest
> tools/testing/selftests/mm/cow.c to hang:
> 
> # [RUN] vmsplice() + unmap in child ... with PTE-mapped THP (128 kB)
> 
> Recently there has been changes in THP area, so the problem is not
> necessary linked to this patch per se.
> 
> Please, let me know if you need any additional information.
> 
> Thanks!

As well as I understand, this test uses vmsplice to pin pages.
I. e. if my patch lands, then this test should be rewriten to use
some other mechanism.

-- 
Askar Safin
