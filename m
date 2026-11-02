Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638598;
	b=Zl+ptTwi+oNTTvsi1KxCbRkdX9wT0Fgby+ULZaY3LFN8rprixInoPyWOv5Lb7rg4OUO5
	 zGDU2bzHsTMAv28pYOQbgBX+zTeiLaAdOywlJRaV5OC/XS9cn+o92LWi3/1K6V8+VgnuV
	 3Y0Nnzls+mCXDVOfGuiHPFrJQDEzH36jJ5xpQN3lvu62jdqLJx6G88DHJc9U4/jbFIZM6
	 0f/rArcf1OcX7tR10PnsEbn5UXdQaLKdUsRyndRVBErdjMYRG2DSdw48/0qHhRhWaqpKH
	 AzdBCZ66SdmT2DhRKr0bZEPLSEWxzpg5anj+3IB8MvQfg+sgDLHhJY5D8vvCw3TutLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=fwjIWZZN+Xku/wuznq5Djc9dY6oT6GSmRAkG+xrsrHw=;
	b=oETHe/YCU5ZUODycE3E8w9n/8BKYWEGSqf6r0PsGUah80Nxqfme6jPvd0Glqb7NmybpO
	 EEqLvXvJVz4I3BbvqZhXyp/taiu3OHfKCgYIu2mH5i37pUk6yoHS8dEvLm/939Vzld5ee
	 nRsao0nes5oUULvUjKWAbyaafBsKoArKsoWRjDdjZt2QAXrep/efbMEY+XmId8A9kOzBk
	 FkCw5B0Js/OLaZu5tnGwS040a0B8sHZj0wn9w3dg7JIpwyZ3XerzzxSY1dtcReWlLkjXc
	 fo9rJ7Q5My21aTzBtobhWsY+MZNS0nBd4bCYbZu57odOFCSEi/Xuf3KVfVxJZCykzkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQPBCdN0;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A94606A32D
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 16:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A94606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQPBCdN0
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1748280a12.1
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2026 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638598; x=1794243398; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwjIWZZN+Xku/wuznq5Djc9dY6oT6GSmRAkG+xrsrHw=;
        b=gQPBCdN0ky7g6NTtQ3EStf4AoqYXYe0mvkYYWBdgWkEBAAYnEd9QMLgNWRc9w4B4U0
         K3raciejRcckVb6b/RpzthiCzmLRJPgBw7TcktVk1pzWCQYoHoTFP6nE32OkMzCJ6vW/
         40PmJnMenMr3LD94LFviVg89uX0p51VSaHPXIOA9k+T7X9D+DaMg7AbPXuBp6WJDlUxx
         1YjjOmDZ9I6qjaONDe7tdvrT0hRKbXGDb+zzYzRXvjGX5swDjiMeMJULBwNkBlGdL7qi
         BHpTjztF2qgxLxOz1bO1pctvkcD/mXDaRcY9CBbEl3Kc8iSMMjDo+q7At8EfFywjycZ7
         PJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638598; x=1794243398;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwjIWZZN+Xku/wuznq5Djc9dY6oT6GSmRAkG+xrsrHw=;
        b=KmweWYI4WJ5KGgLXU+uhaaSrurWy4zIxgPHa12+k4QRvDiDLF2Uqg4UgAsVZkF9pQ4
         xs2jGSd03tZKrD9WBjBaYZCTa6uhIIEJcjma+84hSkQohDp/u7hsNzp3Ys1XkVa/ACh+
         tqCU6yHOToL4BKns9MAe4ikOTcOtp98POE8X+oS/clcPsNK6mq9L+RfazDzEUMh1+vN0
         uRLCMpbiCErsoxrlqc3nV/8oIjR434U6WMJkhAWKydA8obkdEfGT+/AiuITtVFiVIzF6
         lGbBw+mQTjMTDb2OWyxnxPmGaOrfl72WhXT8Jn7PTe1o8BO1nmSFghPHDvsDafrAyWA/
         gL5w==
X-Forwarded-Encrypted: i=1; AKwUvBximLxl7FxASQdHxLx4f35hXxrQkm+ZkhNuoXwQ0jev+je7jnGFWNp7YP8C5gmByP7/3zRcqh3Na0dj@vger.kernel.org
X-Gm-Message-State: AFq9FYLtpmWaJxtML4U/RyH355No2/g3wx/77hr8Xlk1PjRagrcltzF/
	FRR1Nw0PtGFVaft166awnIhBXVFxEy/G5c6wfXSukOllkj8jn85c4M1XFwv81g==
X-Gm-Gg: AYBFou1WRXIRLSgmh4X6jtvSqv/pkituxVLcWe0Yhl2KYs3d02Ei3+zNF7B6/A2rvYm
	0BIFpSEqaZS0F//TJmPZe8Km2an8Ez0vMzIQDbB0WilnqhkyqFSUhxuqXk+ffiT/LFwIJSoeNm3
	tmtYd0MI+kLWP1DHo2BRRPdsLcIpIxQm5wQx8+RYqToxsP+yX41hFLizI7oq7JRItDiCKf9tCPk
	7kEaTfKG5etUBl7L+wEB0rpLqHDXuXvxYn9JoLvxkbw6OKiWXsnEGSbsWEYf0BxhkIGRBcY0Pe7
	EJGZgSp3MP3T39YhCqFrPoFZxdAg+uVfHirE4tfkE+YduTOKe3Ajr5A/HU4N6X3hDxF2qYhvfx2
	4bAgXof5qymBscg/NmQg87djzp1AWp3NUc+o6WoLOE7Zk6LHACI/7mtgHiDvhjkiCZQLiYpF7Mk
	MXSYpqrVJqpfDAa26yF1nWx82F3iI+h5loLHzyaO9MaChAxf1RbM2ASOHd0aQyE6uFEcW+8BbMN
	88WHDkMyiyNhEwtU4dP8ZeU0C0DOQunAXT8BDJ3tkAfa5j7Ns283MAUantpT/7VyfTAcRunBEnj
	kulRZRUz0vpifZMKufoQxWJalEio0R5mYFjhAzVYuiMvnm1ZuWUtPD/mR2WEl/eOGtUv/gw/dEp
	jHDfQ0m/hYshj/PhsIkWhGD/mGGHq0W8Q4Kst3TBUvgpIavpT/1gv6DSP
X-Received: by 2002:a05:6a21:b91:b0:3e2:ea7:618 with SMTP id adf61e73a8af0-3e928c5ffd7mr9018818637.18.1793638597595;
        Mon, 02 Nov 2026 08:56:37 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6c2c28sm2229529b3a.43.2026.11.02.08.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:56:34 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 16:56:33 +0000
Message-Id: <DMKVTEMTLA43.8R6RXYD1UMWN@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: Fixes tags need work in the bpf-next tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <auiZYnNYLEgcR6TT@sirena.org.uk>
In-Reply-To: <auiZYnNYLEgcR6TT@sirena.org.uk>

On Mon Nov 2, 2026 at 2:08 PM UTC, Mark Brown wrote:
> In commit
>
>   b73855c31c7be ("libbpf: Enforce program limit only for loaded programs"=
)
>
> Fixes tag
>
>   Fixes: c9b2a0975c39 ("libbpf: Reject excessive program counts in genera=
ted loaders")

yeah. it's wrong, but it's too far behind to fix. We don't force push to ad=
dress such mistakes.

