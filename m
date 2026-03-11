Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8A7261A
	for <linux-next@vger.kernel.org>; Wed, 11 Mar 2026 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244665; cv=pass; b=RH1QUgT30cFAIwYeq2rZcYtgH/vtdEtAvd5TAuIAcYSK2dCPdRFVWJ7urTcX98OZQlzkMwqaXP4itsPy4Ff4w9ZTzEBto9prso9Ute87fwmTTrml1Vt6NMps2oI1aQj9IXZoYhdnPygjVmYaUtznVYWQlp0Ww+vMtwz1Su+Unic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244665; c=relaxed/simple;
	bh=fiSsOTO5YIWpFPGnljLnQwS9BMbtKhkuIsBCUE2pgzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbtMlKw0Pw3Fm83pU5gVCZgQOPP1ZYepZoPrBdPmvnfz9eFd71BhSDZuQGdXAtEwX5krQ/rmTQXPkMvEMWnh0gm5sByCZQSak+vtJxMXeOukzr+EDq6L5jwbSaL08QEYrH//jD9SQXc01NurWsaAH5R4EzI7YeMT/iiEQ4YTlHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=e2e3aJEs; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="e2e3aJEs"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35980423087so5417146a91.3
        for <linux-next@vger.kernel.org>; Wed, 11 Mar 2026 08:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773244664; cv=none;
        d=google.com; s=arc-20240605;
        b=lW9/9g6yPKj2IrkJI2E8NBj/JFOG6HFzfAKghdNTv7M5x1PbJDZdp4FK6oDllyL/2C
         iiNWwxvj3Y4GgAM4mGCT44hyqTK65LhNcJIg9zJNyD4v1gJUp5zOUf39oV9CoWh5+5Qb
         Bvc4dbTHfBhV69MqQSVCGiJFCqWYzJbXEKp4G1CZ+zyEiYXaWUJhKTHfUIgeCKcV2Za4
         qZARKIoeT8FBt6o44eCn6tGaNPivKZYQgpKpgo9g5q+78kYvCzSjiQHofrxuN+17PUsH
         QVUYPqpahVjy7NWFIJwSKj3TKUtuWFRKeMn4x9kTsMGlRJWc8oNDKA5PoqZvEHsSSATz
         tS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85bNr93+TgX278eUKFxfX2YCZZttBPI3CKaN7k9lFIM=;
        fh=sXRf/quO+2TYvDRnHIAJruzYp2Miiq0itK0GjsVf5+Y=;
        b=Zd6dwTOcs11crzrnCa+M2L+SbepeINSACiI9ACuY3YGKC9Ep70mooFBle/Txz+yHik
         FH1rNgvRp9LqHPLRn0xE2zPOtLJLApqv+aOKobzkWBT3CnTQoiy5aPTvDW1kw2p7/rVN
         tb0Xg6AOVaQyk8ooZLjUrMshpsLwmkksPvQVkjzmek6atVxrEaktMjS7NjVr9VHuzEw/
         7qukzjtqNqkqBOV0pVdpu44CpPUlSOTNm0wGo4IwXdOo/fbkgcp4wwpVLQvdJviQM8p+
         uHLU3o2l60+/1zbqqg8qdHiQfKszXlfzPXHWbX9tVvy7zMlRX1oqnm1HQo71Kt/dQR6k
         dTSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773244664; x=1773849464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85bNr93+TgX278eUKFxfX2YCZZttBPI3CKaN7k9lFIM=;
        b=e2e3aJEsuIe1xrFVFriSPMBEu48A6fn7pVOZhkr/zJESj4KIP4oefelasP7vyapfWU
         IOdEWUwtB2cZeAO2BPHenZlxdjCVSf+AMBMXpgh5JdXwnTcp9Vdyr45kAaiiEDEc1vXh
         7Lm2P/umOaJ6ecphMUr/+d6gbF5cpBe4kUDgVQIL5bqFTCRow4k9Vms7Ma73wqar4yRw
         plJrJp4qr1Rcug5LA1qDKoQqF9r8+2h39H5rNgEG1zT7yccuFFKwD0cUdfAW8CKSm0+a
         /XaLuJmEkJveeXdIA7Fx9Oh5i2Zdzq2oyuURsineWGRSKMoIj/GNlw/7xlstwpRQ/DUx
         LFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244664; x=1773849464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85bNr93+TgX278eUKFxfX2YCZZttBPI3CKaN7k9lFIM=;
        b=Fz5MTvfnmRZa148GKPzdhlR0/cvq4mmrBMZP2PLC9AGpqzJoMXflBNYE1g0CqGl0p4
         mIt4uuza1jzmpe+KvWrFXksAT8+NCLEJDyLxGO52Lfc5KLwCB4f3g3V66Ui1EzKTcLLn
         0So/UQq3fAkkNLw7HysVpo19zRkiCIat9XpqgzIX3b04fnNF0fFZurByiWohtPcL1VRd
         KB+4q5Jl8ZK+x1hljSodbLtRvM1gyJNt7K5BlW1ATkZhjozROAH+ENl9y+vEfPaQAuIF
         cgF8faTaN8HvEUsT/Su0YEmH8qeTsqZlC/+29ES+8iiELNZxdXGZgfnKetWXzFaL2btV
         5sdw==
X-Forwarded-Encrypted: i=1; AJvYcCV5gBCGzzUwj+7mwvTQODFyd+sz6vqE/jO98EOzd02KB860GBWCv89PQFCM7xY8Koq3j/j28HATXZLi@vger.kernel.org
X-Gm-Message-State: AOJu0YxciDcnR+yVIUNM1NoroL679dDZOD6UuvmibASUaLBhLE1YPpJ1
	TbkYzveQrC9X4yIIIiBZCsfiRobA7mmZS1eOZOWtjfP8Ofp4fBx6enc+JqJVj5avOoXnUlxgRSh
	t/vqdm9GFRg5NZOY/U87H51vcN2DiPM8gAquMKrj6
X-Gm-Gg: ATEYQzyEaLLn2JNoddXROPKCjS/iFwZq9tu8iR+/o0+QB7qiWQD3cXF0Vw8EjDvq82T
	D7iZ95h9/N8l2pnL7SLGT61fFH2jDBGu5HSiwUutr3cFxKBF9a/BhoR6cqcWSdcdvXM3sRqcPXi
	LbaWUkCVIgcbkKzOj3qGBVt3GLh+PJK0mfCVvuKA/1R4rfc7c0NY6wzZz+OaLR96PFCe+Pgm5To
	1QYH6Cfa2w5PAN/qVRl2BZQ8XstGM0lZ+qRExleZXqVE29zrMXVT1EF508J1ts4E9b0hXv5WZVH
	zeB1IW4=
X-Received: by 2002:a17:90b:540c:b0:34e:63c1:4a08 with SMTP id
 98e67ed59e1d1-35a012eebc5mr2787013a91.20.1773244663657; Wed, 11 Mar 2026
 08:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <abFeUpxZzjZBdsSx@sirena.org.uk>
In-Reply-To: <abFeUpxZzjZBdsSx@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 11 Mar 2026 11:57:32 -0400
X-Gm-Features: AaiRm52LUH2HGDfJTNDC0ZIP-bvjbF8YPLMO6N7oi72kkaTcSCnDm6_SSq_kUkE
Message-ID: <CAHC9VhRndi9kMUNQFA9J1exr2G0uQ-A-wKDqJLhUntMYdnUrsQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the vfs-brauner tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Ricardo Robaina <rrobaina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:21=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the audit tree got a conflict in:
>
>   include/linux/audit.h
>
> between commit:
>
>   125dfa218134d ("audit: widen ino fields to u64")
>
> from the vfs-brauner tree and commit:
>
>   360160f75592b ("audit: handle unknown status requests in audit_receive_=
msg()")
>
> from the audit tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc include/linux/audit.h
> index b915aaa7ed739,d79218bf075a0..0000000000000
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@@ -15,7 -15,16 +15,16 @@@
>   #include <uapi/linux/audit.h>
>   #include <uapi/linux/fanotify.h>
>
> + #define AUDIT_STATUS_ALL (AUDIT_STATUS_ENABLED | \
> +                         AUDIT_STATUS_FAILURE | \
> +                         AUDIT_STATUS_PID | \
> +                         AUDIT_STATUS_RATE_LIMIT | \
> +                         AUDIT_STATUS_BACKLOG_LIMIT | \
> +                         AUDIT_STATUS_BACKLOG_WAIT_TIME | \
> +                         AUDIT_STATUS_LOST | \
> +                         AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL)
> +
>  -#define AUDIT_INO_UNSET ((unsigned long)-1)
>  +#define AUDIT_INO_UNSET ((u64)-1)
>   #define AUDIT_DEV_UNSET ((dev_t)-1)
>
>   struct audit_sig_info {

That looks correct, thanks Mark.

--=20
paul-moore.com
