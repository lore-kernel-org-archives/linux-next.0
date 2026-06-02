Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DB368D68
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417887; cv=pass; b=nhLsz7aFPjkzZNlenf1/Y8w4Z3ePD6UkJGitFY/dlmpbm+13E5VqXbrTmZ65NGCHIPDKDYUGcDa/AqCGCThbdCoF0dH2GYzGrhW0d7x0KRnefM/4CkXC20/7xYBEzgK7yqgC0y7aC8rCPDyCbE6e1J0AFrW5ZbLMPCuks43D+xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417887; c=relaxed/simple;
	bh=Ow0EB3J7+I7AGIfOsEF2tfgPQ9JCehdz3H6Y23trGbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3rv12n3cVPH/bn1Hg09ADWv8BeqgowUf4Ezf9VW+J5+YyNEy1kqHRiiCMNRJdvdV3gYjynwF1hUqSXjZNzlffjly89zwCapxjWDpSuTTabvTl8bdAXD9/tYu/0LrPuk5zgimFT8bbBZRdw0pfFGcX/7B08WYgH+klH/+AdAxUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cceUl1y0; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cceUl1y0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf18c30bb2so37173825ad.0
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 09:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780417885; cv=none;
        d=google.com; s=arc-20240605;
        b=Hbfc63/CscNzrIroovKdzkizFigYHQhA1i+xLsdOXjRRsd0iXkgyeF6PsRS94LH9Mt
         ue+wI7/l6+EjyNrMrkkW1Neay93gdO1EXOB7ZhtdplGQnp/eqak/1d/SrdCWe4O8nxeS
         WebCs8uv9e/LK61tsy93bYOiaUyMvGdn1BwnKHj6Xb8BYmcxIs26n5M2A000H9sR0vfW
         3XDUBynQeTGSOygy+C8RaUfvudThqO6Gc+gmU8k7uHrRKZdS/M/5Pg5WG9W2Wuc+rNHo
         OHziR2HxPobtW9yWn/mndsy6MA+/anLgfLtLnOzaukgEPM3kYcJF1nQ7S8CygJOb0w8+
         /B1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fscMndvS/RdN8pzUO4KhsRbHP0McUSVYTdx8doi4pUw=;
        fh=EgISFHW49B2NgzDzzfGoItsx9Kt9ZQj09K/d1ObTAHM=;
        b=g0d1fBEeJHbnwn3SOEhsOcEyLUE0qmqQ6jQTDj/NP7p1gYb1C1JbzYaqclrJf91QAF
         pwfNSnLCJiGvp4uXrf/6843KxMy7YBgL2hXfAclYKFe6aYyMh3G/Fw5zrkcg+klpuhzS
         auC7wQsar7iYHZaJpPeNmVpJqnVJ128IB9gIYS1f5q2loSVXDpXvcT11YRdMrZsSn49P
         ZpGzHJKVNRh7DfolziEWwCQX4UwBFse6HW3Zx1T6wSLTlZJLTjsuy5JSzAOzJ5BovQvD
         SDQjLj5h5pZ6vZk9hsanz38imY8bR0Vky0gzADpeqYskNu9SOQBcZ+t1Fy0zPjT9fzO9
         oPLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780417885; x=1781022685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fscMndvS/RdN8pzUO4KhsRbHP0McUSVYTdx8doi4pUw=;
        b=cceUl1y0mYkHv+w4JiO/kkYE2NJvjvN6RKdO1Mix2W60CY9ZdeOc0+OB1VUY2EgHUo
         ysSpjtTIW9XVA0kQVoguOH6RqL3j7C+PYHnEwG03KkhWVLCvWJBmnB8AVBzNsjM2ehOf
         HI/ZO30m4IFiZe3x9v4JIg86BMvXxGM/cMTs79qE2pdXwvdjo3fu/cWRB44YIS1m9h1E
         kQGeC2f+3C18UsjDoGn3LZnLzOyEpZLWlqmBdmHiDf1rVetbH7anana3HsWy+NSMfGF8
         v/R8yGYloSM4BYRssgO4icoM4+oTrFMZM8oTd3y4X+OHfCn1laooeRYmN0IV03nAdqS2
         o/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417885; x=1781022685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fscMndvS/RdN8pzUO4KhsRbHP0McUSVYTdx8doi4pUw=;
        b=FKapucaceO3PGsP9vO/3aGsIhDSVpoRCws1UpYhrnRodglINXi/LEebuvu3+N+B+yy
         uo5lTHCICAf4IQBgIIi15WXA4FrxzAlSrHWkQ1aDiFmBLVnah9+J81xJ5MG6jiTsgkfq
         M9Su3F1LatoboQ9SdjZU9WYGlNvs8yCU/a+ilKeHxmLa5AyrVonmcPQwEHWVMgpO17UA
         DMyPlA7m0IgttK1hGZCz1PviWzwLcw3ata6xLkAT1j38sBRFK93UJpjz9w/5JMpLDdsm
         3KVlor7mqUVMvHHZiiakrd6QF6JTHAB/26G1jI+hpUJ83yDB6D1TmrLsh8UnXjVR+yUu
         s7VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fFF5cx+aa2V/InZ9tAv+JqPSgM1tIk65TFfqhVqrFg9/bP3K09SMRxKWk5W+OsI7FKm239JfRG7aV@vger.kernel.org
X-Gm-Message-State: AOJu0YyXsIkIXMPDLfuJMU1jm/Xa51apxnGrLjo6/cxt1HFXkCii7GCk
	ibtWZ9k5YHFSsmnupvzIi0s0SowpiV1zrUqClEyuzNn3Pa19iysGHdCXMrmxLfCOunnVdVC1dxs
	lcLr26lVmFWxSmW42RVmIIBhdhbRf93546d6MU7S8Y82wMfhw2MmWaQ==
X-Gm-Gg: Acq92OFUlnKciIB2PwGAXi+YwdRo079bgbaVMd2OsXPrLioNzUMc8No/EELeRLTM5NT
	Y3z58gUhsN8h7YizxqrlIlRcGrXvbxn93B8ktzSzUks85N0Wvrv+oKUf4l1M3ukDq7OfZntBcuy
	FvIg3e5BmPvFBbsXwedsyZ+AnqV0O69BWSKGH2phpw2Vy4yiiiZfSSxTjE6SROCjVfTNkc8dWPi
	DxZWH6DZ89LobViQVHUKimqKMzjU1UPa+5KTa2eH/7uPJhctQEJJM4xS7kxb2WOiJ4X/DQHyhvf
	IrALRx1+TskaJAg6LQ==
X-Received: by 2002:a17:902:e5ce:b0:2c0:ab82:6ba9 with SMTP id
 d9443c01a7336-2c0ab826cfbmr164171135ad.33.1780417885398; Tue, 02 Jun 2026
 09:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah8BzqSmZO40xYhS@sirena.org.uk>
In-Reply-To: <ah8BzqSmZO40xYhS@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Jun 2026 12:31:13 -0400
X-Gm-Features: AVHnY4IjB4rzIJ_BZRsLHOWTBgQXVWkilvI4MqI_CH17d78U1aoUDdF7OL0mWL8
Message-ID: <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Mark Brown <broonie@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 12:16=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the security tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/security/hornet/hornet_lsm.c:212:36: error: too many argu=
ments to function call, expected 1, have 3
>   212 |                         if (map->ops->map_get_hash(map, SHA256_DI=
GEST_SIZE, hash))
>       |                             ~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~=
~~~~~~~~~~~~~~~
> /tmp/next/build/include/crypto/sha2.h:14:33: note: expanded from macro 'S=
HA256_DIGEST_SIZE'
>    14 | #define SHA256_DIGEST_SIZE      32
>       |                                 ^
>
>
> Caused by commit
>
>   c62310df81899 (lsm: introduce the Hornet LSM)
>
> interacting with
>
>   c48c3a7e7d5be (bpf: Drop redundant hash_buf from map_get_hash operation=
)
>
> from the bpf-next tree.  I have reverted the latter commit, the new LSM
> means that the assumption in the changelog that there is only one caller
> isn't true and it seems like the most straightforward approach.

Thanks Mark, we're taking a look at it now and should have a
fix/answer later today.

--=20
paul-moore.com
