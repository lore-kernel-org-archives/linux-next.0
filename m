Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414464;
	b=FcipSiHtQ9AKXvqlRoIYJxenQwbZ9luXYRtY5DEGV8s+QafNFA0d/BTrrcfE9BCRiB1e
	 PqV/ot1n7P/PcuRmww8rTQzGgTtIgC4OeiXjHCbDb9qs4rxK8J44UWtDHWw0gWxbn2jqI
	 x40jqC+EVLhDWjak2OsoO8AgwMaOB+lpSpTv+GD9VKrnVbLuBs8LPBYR0sDTxLqF0fIEh
	 WC6JYhODh1potyNbBxByjOpIZHxwYJfVep0PXIE2RmtNCV9p0pS5Xa5TlwkoKqtWsXl8N
	 LJCfxiP3v7vhV0s9H2G3fO0+H24EQp/L2HCdcaC1rXJiNbBZoNx38DwQEvJ+R54rRAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
	b=ym7yKxUJWUtN9fffJVxyNjSl/TJ8ET5JUWtPUfbYG7dy1yd3Re+ltGQdmFWINeCSvy4t
	 gOkgF14hI2miXt7/CSXNu/qUFIlctWdlqI60t/30pNomYyTHWb2GNs9xaWcrImd+27/3f
	 yeWUbHm3SxU+8EPSCX5Lk5DEx1melZvg3I7Ptwl0Qx5T+Vai1FE9pCjqz4LeUVgeUtn1v
	 CYJq2B7ro8cZuZFu5zC+Q2jg+Lg3JA7doVqw6fj+YD7CReWLpejY7XHhPzg4Zs9V9ggr7
	 qx3wqutre3m/42UTHnCPEPurnGbhfFN9D4x0SHl1RlzVVL6fpr6La+pBFcThy/JhfNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVdq0ZL3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ABE606A324
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 16:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57ABE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVdq0ZL3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bb5afa736so93024eec.1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 08:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794414463; cv=none;
        d=google.com; s=arc-20260327;
        b=n4P2jlA8pxDOOU3udEvvp2oeDjTP7uglKy5C5B7OZP50i1WTrYtU2Sf0lvOn4qXAiG
         Meu5LQ2UhxZ39aXrB40M2LHWAXRCiYDoeGt7ZYw8BTnhYXdHn9hMf0jAAY+uCyeY0TB4
         O2b/KVwORTIMMTyCSHhsGnrnPuLGgyyjb1vHTauThzcPW7CCbAuCY4j52xzpy+k8ak4q
         vOMrCHqV5+Mm+mRZFSIGVCd6OCSosnlzPzNDGZuu8ktOGFRpiGhwmlXaeykiswh4T12a
         X4aD/UmZfyt19mhtuy7McYIExvZC2ExPUDOR32AgrP1EyhbEY/PCgFvfw5f/tb2Ui8rQ
         KhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        fh=09EEqmhJisUpcYZ53rrb2iUTXKBI75AiC6LH/mUCdcA=;
        b=UCgdls/EudxVkoIWauXVNHnrkDR0Ho2RW14JQF9YgNRt3PvWnhFzZUWfZ50UDjooj4
         Nx2IxlTBYVB+PzZPcIzf7llIAcxAfdmtBS44fpqvJWh8cCHMoiSZNVsnbWNsGm2Ctdlk
         eAtFLSC8+ld7Fn4+fYeujiXUP5mShNpVNgIRMCKrbuNBkBu5vKaVng4S6PPFp5LQLrbR
         GdxBK7mj3UrCcZz4/hFPkemQZpdQfSrjHRd+6sLN6hhMvsDD4hTz5sbMHeF8uIUkgdWK
         KQCl45m2yQBRNckfaJYV/6isfNCEQcN9R8Oe+4s0zSBG1Cv7BGs2MOxs0v3I1PTdK7Q8
         +Wxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414463; x=1795019263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        b=LVdq0ZL3sZPzYW1pLPrV0cLEj3jwdj2Zg7RoE2RuOl2Hhv3wgcEiaJO901riGgUhRp
         IRmN3MLywL9Pn7R2fVW8nhJVR+LInKI2Qr5BxzQDfDshUwk+yGiqksCMb7nETFstAL0t
         aYyyQGr/YToFkc71VnaALv9merv+obCMqfGTJQeotkpUrl9b0/WwXHs7DrLaktruuqtx
         rS3+69M9Qm3zNCI6D1TF1zXhsnBD2CbJv+rFim55I9GGur6FBs5ZrHlYQ9NKw6Kh71n3
         O+4cIuAANTLZPxlzg4y+yM++fGnOwYdoJRQG8fWa3t99az16xcQ60brbYKgNLRNuKF4R
         momA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414463; x=1795019263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        b=Wurb+kTbIAn13u1rmp0l5LoiZeMhEt1ZWp8SHcdXrINX/QP0SplBXwHqytBFBcbisI
         sh/DwKFzvIbu9EILrvYbv+Rh6C8daqX2EbazOUqKi4L/ZvfpartRns4oc3aeVP9yDh6C
         mIbFLphpGRyLAs3uv6RHyzARdOXyKcYsKzmzPj3fZcVnZ8zn/Bb7miqX2k++/l5At7Vh
         uZT0ZfT83TdOhEuf18gSHhf0H9VMxJeZqRz0Zao68kDwCGVE11WalXI+L3d/n5oo/mDS
         n5N1mkmJmiijdKkhYq9TLsAqn9fNF6ANURztTIKXMPJwrlbvwSrYvyyJWKN/IgQ9CvRW
         7dAg==
X-Forwarded-Encrypted: i=1; AL+hErH0F1YUbfWqGXkdMemtLarA0XNOiXOhM97BYaI8dkPQyG5JHe59wGvgDaZhT+DlOQZ/0kg2lOVovCkY@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wd6mQ6UE7B/P+gTBXZE0nYtpDsg8DUlgmMoheyMDpTuLBpG8T
	/+T+5ipbFs2ESeVuTsw1XdFi0KIqzolo/RzIvfrl0L3qdOjLxRE6Y3HYDT7yESioZcs5GMNBt84
	ek/Ovi2Iw6qYbttpjsKtW7+x+7MLDY6Y=
X-Gm-Gg: AYBFou3b8Io8WKbxrGzreJuCF8PJx+HbJ2rH0v96ZnxKC0BjDxRdWuYLEggzTRtsTFz
	96P14KiSgHhDwZJjP9BvS3QON9E2bzxnsyvbrVJ2Hhr2BarasSxnzJCkruicpMadkdQdX+mgV4y
	ix1V3PV5Vwaa2UBRYbQfeJ0pcSIBPNHV9uRvrjhO5N0Z9hw1g54NoNDIwqRjW5zGMOTtis4lgoc
	1NR3gOmO3aTX1bfNeABss4b6jNf3+Tk3g6MpTc+psJ7fFF8i1gTgYBTl5WJcPlY0aq8YvWoGXYt
	7bWIie/SXHt/WH8sjdQk/MmLwBr4a8w488Jb+WqTCmpIpQedspPP3X7ezisxzMJfmnRbldF4yn7
	Dbh1PvKHPzmK0BFlKnANTBoWXHf7B4kL13O8F0ux2H+YYzjl+zFS2Erx8n8LY9QJP/8nlsgfQur
	QL8ggjaE5faspcFNuiO7y5z0dm+0ZPFYGs7fNZHYXtO2hV+To6uvmNGgSBUm/sDGwkIU5N3/lbJ
	9eG/EgKnoEhGyGG4JYrwSQlnEEbdvC+wA4=
X-Received: by 2002:a05:7300:7aa5:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-37685c76d17mr4975850eec.2.1794414463417; Wed, 11 Nov 2026
 08:27:43 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avSC7GXOwnbuycR8@sirena.org.uk>
In-Reply-To: <avSC7GXOwnbuycR8@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 17:27:28 +0100
X-Gm-Features: AclHuK8AgFv2RXK-XtwjJ8NP3w2QWHz_WEO_LIt_zbf7rr4iTP2nvLvmm5WOtgA
Message-ID: <CANiq72nu0CQtZxODepvZOEoD0biE56Jx_2-exBvB8psL_Ynk8g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-fixes tree with the
 kbuild-current tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks fine of course, thanks!

Cheers,
Miguel
