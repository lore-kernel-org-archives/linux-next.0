Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E43914E5
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134786; cv=none; b=YsdFsBUQ6+ynXWdPqDAJIThe2SQ/IxQoOvRd7+PW5s6m8Y+XhyVevyPBgGXHP+q+T+DHks3ikDXyia3xVxWqba/Mr/Yzl+TZBug2fEu2BAvoXO2hr7Z5mLrSgpYzrGo9za3i4h/mg8K1M5/jCTjpw2knVmc0W+Znb5aX2IQ7kdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134786; c=relaxed/simple;
	bh=xpL0mHYiqbzxrpdnPUSu6eGtIyaaWFU/WkpGz8xgy1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmqR4ttSayxzdsQL3zUJKL3U9rscT0AwyIQGWyzeNm4/UyKMiKkGVq1wtT7laKST9+XOjDuSXqdrR/TY4rjTmTNfmsI2tHm1GTO96zbzdZxg1MkFhekYquT/uzF+nIxb/mUxJue6RawKmWE0TPBlnnvu1+HLkRBI3L814Q9rR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V463OjVv; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V463OjVv"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso4766158a12.3
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1779134783; x=1779739583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T+Iag8WXKpIwL8mTbl0N8p2f+FBzjv5jGFSgcF9g6/s=;
        b=V463OjVv4eLbrSHlYP4yr6wfii9S5WI4nr0gaOeCMkwG3OIMLCy5xl555glFBzCvFG
         C1uZuA0JugA/Z/5w3rm+30VsJpMzcGLmc+C5hhc1jDvQLWr/SR4FwVXjlOabFNMFiEgV
         sIUQDMYQsJJiAqwBQ2o7d9ohkIvx1Y0VF25JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134783; x=1779739583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+Iag8WXKpIwL8mTbl0N8p2f+FBzjv5jGFSgcF9g6/s=;
        b=Fo+7UsOhf8Qjk6ED424Db4jjYEvV/kh4c1dmPxBvtqRnzG/pBgeb/P8TNPquY776rh
         0c+mhymkvF7PaVIZ99tOt25i0rQ2NLRYOP7IYdlBbaqoxgaAAdiedtTFUFwxsT9G+ip4
         nwf3BMIqL5l1N/y6+ZqrlOzxdEBv+wUiOUpJvLfeT0B5ppPNAuBSxiXCzqppOCXdTHNu
         NPmkZGoHtE29TinIMo4pCIRin3DK6FmZaE+u6Oo5uAVGbGKGHTE3KZP6PykRoRJUL7TW
         1nhegZgsgCMP1H9WFxGWiUmdAw7asoP3y+skmnj46UMgESvQ6zoc3wtP8NmJbxL5rNIx
         llTg==
X-Forwarded-Encrypted: i=1; AFNElJ/utS98GwXTBHih6z+I1+6mwOCdeQSi5N/P74370ZsbSUz4H6iTqW5oJ2D9DiXBw/Flgk/9DGeAV/0p@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2oqngZQWgOyxyt3RNQB3IOV+etmgc7fAZOC4Fjy4A1lO+a9QI
	wJUDUB7z3fYaWfOgMkv7FYre8HeI5+dkSquQnvgodQJ5aDf9q3enkWeY1G0xcWh27tB4EG58G2O
	EfhHwhrw=
X-Gm-Gg: Acq92OFL2cTnAK2ig12DuK+99Dy03OyQ6lbiJ+EfaYiZQmHweuCs++EYUU29TTLkMU3
	/r/4vrVYrdrtOq6IU8/Vf0io09o35xufXyizOCxvHGSh9OI2kWkloBy6f/cX0CVLDJRXFIoWYvq
	PANk+LT3BrqcR1vwUPnjCElLKzarHQcflxOQahQdCxihdNx8ix2xSRYIFGyo1VlcJXXZKqWwMbf
	Ys/eIHskFR2aCFME2kYEmEN8fWF/sYgHMtSoKwiD9g4dpTiPGFE/oQQKfwVEYSFubiXVyaTXm/F
	6fn32Brt7zseiWz2LsXdirPt00qs4DjerQim8OqmahlccvsyzFWY4Gv0vsJVi0QDORQrOJxCbBw
	NnBKVCvOHp228ZszozTPV7GQAY2yUGAkhT16cf5IeXuXR4w/K+Qdg5r56jk11fHcizrFHgk/kVi
	Qp6d97YV0KTYger//jYrrZ5WaeJa4vrDM85QgEmJKqi3I/NfohroWQPepw28rfVAdpg1088yF1
X-Received: by 2002:a17:907:6d04:b0:ba7:fbfb:4caf with SMTP id a640c23a62f3a-bd517aba010mr886256966b.43.1779134783299;
        Mon, 18 May 2026 13:06:23 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec855sm610121766b.37.2026.05.18.13.06.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 13:06:22 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso4766120a12.3
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 13:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fpZpQMl3ZSMU5t9Ws6KrPzvT6qtEalVJcbCgPrmNugWG+2eDAGhDiBpmQf1PIvkGSWb5F6Mogl8+H@vger.kernel.org
X-Received: by 2002:a05:6402:46d6:b0:676:988e:8eb6 with SMTP id
 4fb4d7f45d1cf-683bd488f28mr7867497a12.26.1779134781995; Mon, 18 May 2026
 13:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ags8osqoMATFBslZ@sirena.org.uk> <20260518192408.GA2744985@ax162>
In-Reply-To: <20260518192408.GA2744985@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 May 2026 13:06:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVZ7Wv2UNZyAQbVHQ-yz5_-_9dOa8Pxt3nLRhoMPyOuQ@mail.gmail.com>
X-Gm-Features: AVHnY4K7sKlyJQZ4fie3dgg_T-2p15OxiIVPvaNIZ2oWiO9BQsSfLKMRKNNo8b4
Message-ID: <CAHk-=whVZ7Wv2UNZyAQbVHQ-yz5_-_9dOa8Pxt3nLRhoMPyOuQ@mail.gmail.com>
Subject: Re: linux-next: build failure in final build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Kosina <jkosina@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 May 2026 at 12:24, Nathan Chancellor <nathan@kernel.org> wrote:
>
> I submitted
>
>   https://lore.kernel.org/20260517-hid-core-fix-size_t-specifier-v1-1-bfdd959ec383@kernel.org/
>
> for this, which you could apply instead of the revert. Given how simple
> it is, maybe Linus could just apply it directly to unbreak both trees?

Done.

                Linus
