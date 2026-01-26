Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA3634C124
	for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448779; cv=pass; b=hC0gM6nAJjZZEfLtyv624FqfMeA+57M1t915NvdjJPR7gkC3Pn0okqpWdudV33QJnyE8nZfqqUkgtqxPK9coiWnmULFkIy5BMiCEQRl4NyIVPkM3d369hCFjBqe8zbKpX3Ye0raTkekwtPs9D7J3bapeEkY1BnFcNMocM8GK+sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448779; c=relaxed/simple;
	bh=j00/Os78UBfYVsz1SyezoqO/zHdq/VpIh+6M3/JRjLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGWUpxaue11zAQePMeoe6eTg38h/kAra4WrfoOYFcp3siKNx5RIMH7mlzJe+EKwxx9Y1hlcaDfH8cyFsDnbFWfUB0BxjHO6AN1zZLIE/TvI84Hid5TgmrzGex6sKF18mjdG4NEgFrgHylfFWhPwLaCsTzoaDUcaHgYIKZM59ulI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pj/cAfSX; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pj/cAfSX"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-501502318b1so48523611cf.3
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 09:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769448777; cv=none;
        d=google.com; s=arc-20240605;
        b=XIbiWVfjVlforworM+DratgIxuwO4Wvgt+o8vN76H8229+1lGwgSZymfNEc7va1Z/9
         1oEHTM4mWKlLaszQ0cMazaIeKO7Ofx389hVaD+5PO2DLvBRYVA9+oNZZ7RFiaziNGOO/
         mUET7f1dAM8UfaNuM9L/hZCmJeMrZku9/JLCpKjTy0E1yCe7XmToCfJTLJScW6JDOj8n
         Hm1bNtosvtzaCZ789powqXPiWft9QC9tVW35IGq91Bk7a76E8bQuikrLF8Yda7TcFVYk
         qbVkm6q6KMMoXaH1Xm5Rq46E5IUnbztn7lkoq0RxbVdXhybwa4XHQ9v/Y2BaAjpDcw7U
         Iixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mZeqaRnbISXit2kE4h2QnQgXueXMnyOi4SzhL+ieQ0g=;
        fh=VzLNkvWX2lR+DX/D5I78XFpNL88e4tpSP5mwHs1+w8s=;
        b=VHjNnUkZp59i1CGY2q1bu7p1f6e1HV3v6GPAP1XcboJPcxtC7ktbC0jOw2+rrl9FO2
         04FRQLdpshsWlxPYCFdBCUXKYPk6LIvQ1NSJILXqN0QwN3wJPDBEvbIMMQKeGezreNMr
         Yb63R8XaZu35n5XpKKYgLDNBZNKLCwii0QLXGKe7uu3OFW6Rvd6IH8jjQNzjbKQl19cr
         wvL5XVpD6dNkUY85zxvoe6mw0YL2RSTofvEb9Nnyg6oAL5fAOqlSOos3L7QeqBuRskgz
         TOe0TYoH8u0Jq1dYSoZKAN/1GhzmMW43oQo87485rD3W+k2scT0YK2EqYqXPXQXkhlFF
         Z/Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769448777; x=1770053577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZeqaRnbISXit2kE4h2QnQgXueXMnyOi4SzhL+ieQ0g=;
        b=pj/cAfSXz3y41qNgzUTlEGyNYeenee17PGYhvIVwCrrHQYmDvawewrk6ql3MQZpcZw
         9yXn+iTPZGSW8XC4jVbDw20Wt2xGPwVu+Kh7A7MWAnaWSvk9HYOvJZXDKSJoBUEreoR1
         vNOI+dfyKHTY2G/OSYk7u1kVi9YDhrbY7YZyPIt9n7JQ/6waCaUMNnWv21KY+xjZj0lO
         EBu2fFQZ8orwZqBK+KZjVZnzPK2QwKbtjlp44mVGOECecj1oxJfOcbJoIiDdPO7QvLg6
         8wCTSWr5YcPXqubMk14RjT18NOpk8NIpVon43lCyniFmGkP78FhhP+uvmAgRit1r3Em+
         Fz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448777; x=1770053577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZeqaRnbISXit2kE4h2QnQgXueXMnyOi4SzhL+ieQ0g=;
        b=R8Ll/9tcVkbYGkt9Axhb7tvE2QWAWR7F/LbjzGjfDLplN3AvMatEyx2YI5/U5ipjwO
         m8bn/UJzwXYEcqW9n/1Q4Cui3V8tu6jTw/LO/o9yChOEKarQopvHCrppaUr5WvfecBsi
         FGSfYTA21ZoZazyoQVbGHhONCDkNTmunDHmax12zy14OBxVunPIQ9Dpglp8dQbmUS/ER
         q+sG+AVSKjrhzFDq05Bz29PAUpZ/qolwoDE+BTbRv8KPKWd7pewgOa7xNNgC9vMwuRpk
         id5GVHLpKCmmAAAyeRbz66Y2VzZSXEUQ2DVR7tOQXAWz+aHu9yvfcSLVKr/XUQoaPDkv
         UJww==
X-Forwarded-Encrypted: i=1; AJvYcCUlqjM33G644pgRjQDs84bCY1zjgF54veZ6HG8G0e7L1/R6iUKvSVSkE4lR8Do+zbbt30h5TG199R8P@vger.kernel.org
X-Gm-Message-State: AOJu0YzlbpXtQ0FQ4vNvi2uXZTYP9gWCMO5JXZMJzboSnxfg0GWvKeto
	PT+N5YnGSkBJsR7UWpUQLQFOgK05oD5kU+568Uou7Jupozo+tUiT6qxKaAwyJFYM+5+4rV4yfRL
	GVqJXUfzcCEGTsHByRaiz6lgjtl5T64DTYJ7VdnCm
X-Gm-Gg: AZuq6aI590M6HMEnO8A6zfqeImv0VGbXuYuSX/8SleeyeNnfd/L1hzhhVjaHhSd/UZ6
	wBt28x6+ob/GBvgOgMi9rt2Q4yMqNAO4K+lhhH58JuSa9InEV6vyKKWZpYJnKWxnP6SyXSM7188
	t2kkF1tVb+Xp1ir3b03WPldhKICeqNo7YlWlpzZcNjCS6aq6npIPykJOPeXBT95BEkMk5BRUAVU
	tJnK+OiEdAjJ/dADfDf+ds2XLKB2nCrJTSWZp+v+OW/TfmMFU5Yaw0ZJOWx4bEjG1wtfG0V1WLi
	/jzi
X-Received: by 2002:a05:622a:54d:b0:4ee:61f8:68d6 with SMTP id
 d75a77b69052e-50314c22e5amr69977351cf.6.1769448776554; Mon, 26 Jan 2026
 09:32:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXeka0KYBnrkwUcF@sirena.org.uk>
In-Reply-To: <aXeka0KYBnrkwUcF@sirena.org.uk>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 26 Jan 2026 18:32:45 +0100
X-Gm-Features: AZwV_QhJ1XWOboa8QHh50biVQXbAZiTroOGuwAauoOwEjG7FYW3G6KdVCm6ZYus
Message-ID: <CANn89iKf_4g=nT5YeVNbMBrLeXvhc6fJF9G_njoz=ZiqVfJYpQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Mark Brown <broonie@kernel.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 6:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the net-next tree, today's linux-next build (arm64
> defconfig) failed like this:
>
> /tmp/next/build/net/core/sysctl_net_core.c: In function 'proc_do_rss_key'=
:
> /tmp/next/build/net/core/sysctl_net_core.c:333:23: error: implicit declar=
ation of function 'hex_byte_pack' [-Wimplicit-function-declaration]
>   333 |                 pos =3D hex_byte_pack(pos, netdev_rss_key[i]);
>       |                       ^~~~~~~~~~~~~
> /tmp/next/build/net/core/sysctl_net_core.c:333:21: error: assignment to '=
char *' from 'int' makes pointer from integer without a cast [-Wint-convers=
ion]
>   333 |                 pos =3D hex_byte_pack(pos, netdev_rss_key[i]);
>       |                     ^
>
> Caused by commit
>
>    37b0ea8fef56c (net: expand NETDEV_RSS_KEY_LEN to 256 bytes)
>
> I have used the tree from 20260123 instead.

I will send this fix then, thank you

diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index 0f761d4b9447..03aea10073f0 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/sched/isolation.h>
+#include <linux/hex.h>

 #include <net/ip.h>
 #include <net/sock.h>
