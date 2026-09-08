Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5A534458
	for <linux-next@vger.kernel.org>; Tue,  8 Sep 2026 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880557; cv=pass; b=mY0VGFyPoVcrd1K9YVpzcxLMB64NTwjeLEHPrUCLMLhj8dvqLXZwZj0SR5jH92cGirPrGwKE5sZcAkstY8tis51g81q7f6kMV4IDLpGaOGQubhpWZdosXyc5p6OdZXv9P4hjF04cQ6yFDpbfe3y6f8J+bEPgk1cQ9PTaptNsQ6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880557; c=relaxed/simple;
	bh=CwgTXRyt6y4ZSmfmvQpYiUTiFQ8bOpJfy6S0oEkKA2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVKBjm7Nw0qyX9pnz1U0yvNzeqUr2s51V99nYS3p4VzDtU5ipXOh2esGpnJzUQTD6fm4lk6Tr5nfzjfWPiYZw2v91uJ9tQ7EB7HPWgQHs85gjEV1cWrXD6zeJBqCdGDV6/OXQ9z5LB54/MkPBAakZqzIwzktx3oA/L+gKKdu/os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCB6PChy; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCB6PChy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2566so876394a91.2
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2026 08:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880549; cv=none;
        d=google.com; s=arc-20260327;
        b=ra5JvBC6KpuUp6B/+CM/MnROqQ/QXMIMPSWGoqZOmS8MODbAH+tcHnzwmuWQ5mpJwJ
         ydteKarp3U4mYM/SR/oCrcz8ra6WpRFqAby4jAf81qVssCSqnYNo6umYYnj0AqL6yxIZ
         ejR8XpG75TGY99gJ8cqRO85g1I+G6Ujs1fgLjYFYHvOoZz+UnZspdNYqyKJov7X/57a4
         3iXWPEUJFxUzPyUqt0pkaMRlJ7nTWDFQt4OtnUO/6ahN5r0MJfuYlvL2wBqJfvgHzmqQ
         Qglf/v0PIFNIHJLsDR6qxrX/Wf2Np0rqc/Lsi4tXiwHZWCXA5v1CKsVYSGyuAbRghnme
         Ydkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
        fh=yAVFr1j3dZ8Gu9xzmZ5kL/BRIMbSijrnEKnZ5MWaIL4=;
        b=E7XnFpN1cHc6vhBmaNp4zhQR8JppSgLu2ShTuCv20f1jwN9TP8t1ujgF1hMdXQbP1+
         kSVQ3MDaUTMKpruU5YfEZ6ec5KBdF2YZU37U6lyuM1YxJfBMQ+fxd9tzBnz/+jEo/Q7j
         fevFHxx3ErCWdnKaBuCtWsZYFYJb52Bsb17QXg0qmqAa1fxv/8krXyFHcURIqO6t2N4T
         PdTaQQIv2E1ogidmXkqd6GE1llrNByBkqy+ZX8BR1KCgpknArYKymLgeUSW0t0F2D9Mf
         jk/Egw6YW9ekqeo4M69R+Ye3dRZKTXJKqhdh8OdBfFsIYIl6ot++iTO8AhUV/ocTvQDL
         HCHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880549; x=1789485349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
        b=TCB6PChyZ7w2s5+u+dxkHVUnCPzlnA8mA3sUxkUH625PqZQd+zNfGkRddUbbLhFBcb
         oV8rX86MfPh5V2inN+9cW+i4CT8KcvalPWlZCTE3wdQcp76m9OmCthDJWQYt5SQdo8Fj
         F6Zj2a8zGeQrGeRjMnUv1lahFwr9suRt4qULQ+zrZIktx/+uh54aIP9slBgkp9QxAo3b
         9+OQgNPTPHHipBykwV+3LcSS8yTvwuP5UaAk+cZ6Rho8XOo2A/JrUdM3dCR6208M/n+y
         QbRUOvtPwyrBwQL3JXag7e9ftbnqiITsJs7JaSL+1AaLaaWbF5kC3awqLLxFLA8M4/Rf
         V9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880549; x=1789485349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
        b=r/IksL7M85wHB5Swb1JP+5YfBfDK8HWDK8+hbXA8Brp2pdXYsuD00WGG/7iI4eb+Cq
         PyQkFnBKDbe8G8ulyY+wCBCJhx/n4xjtXzmBQTAkisqsdj093TYW9MW+iifqMxRlq9qj
         cAKE5a4yPykw7DhTBSUG62Ddn6y22bIgVigbMAFOclIysRXyJHuZPIzaooGixwIMqsq0
         8xOUoOwSGLcsx5Wzm8N/6Orb2Jqp/0HWT6v+5WrSUMFRL9hNIhcxuU15Rp5MjVnhDtrk
         UTlh7HY/95MiLLWjlZ8Eq7+JOlIqdew11FiYZdSitTbrwtbkqP+p2z0kyUpWHrDTtdMS
         DCNQ==
X-Forwarded-Encrypted: i=1; AKwUvByj+UVY4wbu69T34UyGRP/vyKHnxWq47SULS7KNX6SXsdmDUlczUcfC3+9y/OS2f43GUSODjeON4Lhz@vger.kernel.org
X-Gm-Message-State: AFuF++l/T2Db6pXg9PrsAcd582eE0X74+Aq222cOKbj6xhWJOUvrE+Lc
	L9uix/HE2qxM3PqqJdgUXQclZhviaNRXss/BuQKXaQJzXi/aHAX2MABu2g7rj4zDIF1ZVISvRYY
	NZk7YuozfISu+gYOE17hDRF022lp0UPU=
X-Gm-Gg: AYBFou1fQ7Fanv3WPAWoEpMu6KyKvC481mL+ZWfEydOQ62XjQbaBIGl8Yn4LiL80tvp
	cQalPDOYcX8DVxfA5LKdhTpzfQoS591XP1L1ZQ3WTYuTlDH9CS5r25LmO4AsCOPp7gE6Sx8a2h1
	+qqJHN7Kg5+VNpUuk80/5/ecteoSMNaluNfgY/QD3cAIM1inF2me7DlkO5OqeELUj4jhmJTTK5L
	hkNUs6hOEU6W8+zXJj9QpYtdRCw7d6mS6RJYTyWlFYtNHuPZSj0ZmUGilj19Kbvyueq6dx/pqCM
	wYYIF7FCPPQJntEN5bJS12VayH9UBputvXfn/jexDTyvi0AhHuUm39IypvcytZMUvPLg0QcSOQY
	fkbdFqBBUamOlt5OsZgwv5Pfg5tELqBA=
X-Received: by 2002:a17:90b:2dc5:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39b9a99459fmr4622408a91.3.1788880548969; Tue, 08 Sep 2026
 08:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqAVSgsypMch2c0v@sirena.org.uk> <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
In-Reply-To: <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 11:15:36 -0400
X-Gm-Features: AcwNN1VnTXeV8V659QiKMCwYI-2o7Ug_RreQwrzcUErxFzh7ylh_yBH27lIHOHY
Message-ID: <CADnq5_MiNmzkDqZRk70_RmJaJWTEXFtu0c+eV3TJ_At=uvJ54Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Alex Huang <Alex.Huang2@amd.com>, Mario Limonciello <superm1@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:07=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 08, 2026 at 03:01:50PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/a=
mdgpu_dm_connector_test.ko: symbol 'parse_hdmi_amd_vsdb' undefined!
> >
> > Caused by commit
> >
> >    65198b3d0738 (drm/amd/display: Use HDMI FreeSync range from common E=
DID parser)
>
> Sorry, that should be f65198b3d07389afdcb48e4ad00fea2aded95dfd.
>
> > I have continued to use the version from next-20260831 instead.
>

Fixed here:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/730c6d8072d8d9a6dbf=
d06c7c5ab4479167a792a

Alex
