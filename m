Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48583411A1B
	for <linux-next@vger.kernel.org>; Tue,  1 Sep 2026 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276628; cv=pass; b=sr5s4LRoe+s1meE9gv5lWar9zKb5IeBzaMKOwEPbcfn2Vbzk1VbJd+6TP7iRw8KoqEVgRUxRGUzjElIjpvCsoED4p3bQQ+hah0UxzHL/saU7Y9uuYw/8s1V9BrTPU5Oo7iLDjWjeMLraa58Z2ufQvDcVhXaF3Qa/kzI5Cs0YLwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276628; c=relaxed/simple;
	bh=oGeNoOa+p9ZzuwZnVouBlcSvBe+Jh3Gib2Kiy0uoXuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snOqVuxklMws6N3b6fTuwvAh4RWJVvB3GzVA3RkS1IKfS9/S3LB1KCYxQ6+mnSTpbo0ibVhTA8yEX5HSjaVu87Bpa/fNtfuZS9NN5hMFxG6ulp01Cko1DQ/3JMYXzdtYt2L1GuHERlbTvh9A/Zs9c3rAIE6x+Zl4jSAyfg0fhjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=R8esj2ZC; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="R8esj2ZC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so4381507a12.3
        for <linux-next@vger.kernel.org>; Tue, 01 Sep 2026 08:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276627; cv=none;
        d=google.com; s=arc-20260327;
        b=pxI9Bpji9jbJjV3ChDqaxV6iLDZ4wYWdJzMg4szXfctLflAkS1lkr9lX/8ruOJXwx/
         hCN7QM2veZxZQUgmd5RgOzYJ8jXI+yfFhxpdc3A5+can4ykKAPn2Ya69jn0t3cDIhCf+
         Zu4VVNHjSPAr+kvtmed7AoFpMU/8M5fmbRn7KHXznpBKnKbfGBcXPA3/gd8D7me4c4Zk
         sCtUAMWf86+nGthRFmVNNle6uG8/WSmWEQ58RLrQW0LHu4YbK0AbdADZuw/iDuwqgSAJ
         XV1Xk3785agflIqWEejVgqVrMxCOz6jYdEBrVc5zvNm0wOQy3sl8tlc6gOaiGGEa3YnV
         CvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5rWp6/FMPiff7KV5XUE+nXFQ+JqVYy4oIJa29s1gF8=;
        fh=Z0vKaNSHrpi5VhdCYuaK4dPv/jnRzb1TF5fgFT7/YxU=;
        b=IT/f2E6rICx/FeS8+sDM83YCdeF3zAFoEp6k9/8bePDvUjzIbTJVOoN8giDDrfJ/VP
         8NAnywytcq1XQK7a/HOeKSQxpWK+c3UYMAHksIsyftcyE0+jP/54eJTCz8zkcydybLbs
         1jvEWcy7ppDKygdikr8cmDpjhkxPfwnOhACpJwIhE38kZSN7LTlrNAOv+sGXb8Do8/NZ
         nhKmbPCvrXFsNqGyepaSFbhXEvBskd1+g077Y5rWrljJe2O+rZ0QzRJ0+TgsjyAaovj5
         tYgUauaPyK2l3nPEEWln8c8zAAjVoajNSzHhUB6AJLF/SloFyQGhAXNbR19BnJuTCpij
         bwqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788276627; x=1788881427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z5rWp6/FMPiff7KV5XUE+nXFQ+JqVYy4oIJa29s1gF8=;
        b=R8esj2ZC1MQ3zauvBv9MGbowj5sTEI6PjKk72+RbINZVnrRd7qXe0OU7lzUPFvgCEM
         svxpC4pk2DVJIA/Dv4M2cazo9rdXMPv1gVGJr0Inf9fQgb6S5iaA+3w27NYjVK3G1rGV
         Jgg96YDlxIQueCYFcyS0PyPzSp9ZY64sBFgOjxxpiMIi+i8NgkOQ71w53c5ecix62sQ8
         CrAS8Wl8t5/E4FZN3WJKf9eWly6hqs3WZh7F2DkkEdAupUX8NrZuEqtvCrznK3ogfXNN
         aJsgFa0fuUAGlJHg5wTSgSp821QfmoNyPGLWWvW43qRe/pegIXkG+e8xvOS9CR9cE0Hc
         rUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276627; x=1788881427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5rWp6/FMPiff7KV5XUE+nXFQ+JqVYy4oIJa29s1gF8=;
        b=ALWLvRV2lLSyatPcvQFoSr89d9pzZh2alZhB/iHfwTF+1j6v8o9WxMGu+S9YtB5h17
         xcRZw6BGfDcIO5TkCXCsHbE6IZJ0n5FBz7q4SzW75AIUlGjtSuJ5Z1O/pkpUZVWb9Rqc
         71PCVvKb4g2hDQnmHyLSAt9sNaenUIGUl7yzAybWedolbty0DkXE2Uh0SdxiY9cTxERE
         K5uUDuOeuVEs+YE0nt3zYamURvvCqKCdaax5E7T7AefvFgoM6dtS3D6mJ/fYOjlvuyX7
         nrgdU04zl2sJFKVbTaV3kee/UEW7tTXYQ6IeU54XL38iMoZ6YmUyGRtA4B5LoBM1NcLl
         ECUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+79SM+bg/UhFG7D7ArNClAVbfxlM+LTctipki1vo6QOhzPiR59CNvBItDyAO0TtDMTJf6elE+/s5i@vger.kernel.org
X-Gm-Message-State: AFuF++kFHoYChoFfaiQ1dOgUwKmpts/FXWDlWTcwJ26nq38T7w8Jiyie
	q6R8jd1mG79/Qs6Ll6cHGUQjmq9jFpqrD5P5yo6GIKDbhINNKPynDdBeMJEWN11UiH5eU+ZUI89
	8w+uW2c+cX7a7tafQAhy+QU7T582pSQUXKw/HXn+z
X-Gm-Gg: AR+sD12SaXQEHr81onqXQPYm/jlU7zhcRdmFvF4z1xBpdtC/Yu5371I/pYQsZLHvRvB
	dWd3Gpn9Py4FPLeAfnsInVTXQDkxIh/97+h33xctz9uHs44PscsHc6qw1ZZLxO1qu2WWSUhEM6Z
	nebf8cvli/aQ9eOGHPVMByMPRkHlBsATTUPi5Pl60VEwL43nl+1cGOXrl+SrfKHtetjjZ97SLp2
	TUIu3GCABbq7cuQ/R4q4wTS53BgX1BUpld1ozfWdUwyNGddEupuGIdbBnhHAPotHKHewy2AoPN3
	ZA096M3esUpyJzzIv2o5WqHucg9i2ixzD59WGnp9NmZx
X-Received: by 2002:a05:6a21:a8a:b0:3d3:ad3c:49a5 with SMTP id
 adf61e73a8af0-3d3ad3c6457mr43951622637.19.1788276626517; Tue, 01 Sep 2026
 08:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apbYZsfaO9BnB8nm@sirena.org.uk>
In-Reply-To: <apbYZsfaO9BnB8nm@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Sep 2026 11:30:14 -0400
X-Gm-Features: AcwNN1Xq90Ba1WRvtyU8kMeoJcWIIGgbEGSH8V_oysbwx7BB9WV_M54j0vbNtas
Message-ID: <CAHC9VhQQGcKJU_HF78cMSuCPf=2tj8xW78ELOYwb1xJJU8tuRA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the
 vfs-brauner-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:51=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Hi all,
>
> Today's linux-next merge of the security tree got a conflict in:
>
>   include/linux/ns/ns_common_types.h
>
> between commit:
>
>   82e9343260dfc ("nsfs: keep namespace tree fields stable until after RCU=
 grace period")
>
> from the vfs-brauner-fixes tree and commit:
>
>   f675d2e955696 ("lsm: add LSM blob and hooks for namespaces")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc include/linux/ns/ns_common_types.h
> index 6ed6b497831c7,5cfe0ce3c8818..0000000000000
> --- a/include/linux/ns/ns_common_types.h
> +++ b/include/linux/ns/ns_common_types.h
> @@@ -116,8 -116,13 +116,11 @@@ struct ns_common
>         struct dentry *stashed;
>         const struct proc_ns_operations *ops;
>         unsigned int inum;
>  +      struct ns_tree;
>  +      struct rcu_head ns_rcu;
> + #ifdef CONFIG_SECURITY
> +       void *ns_security;
> + #endif
>  -      union {
>  -              struct ns_tree;
>  -              struct rcu_head ns_rcu;
>  -      };
>   };
                                \
Looks reasonable, thanks Mark.

--=20
paul-moore.com
