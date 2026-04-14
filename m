Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99C3E716F
	for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175800; cv=pass; b=FZ2/p8M6vNPeybhhFeedWBkE2di8J8rapQRFqZ9Sty8RuoNP6iZYU2wX590dGOPZ/STzez92MzR70VeC+RHy7qhwtmapGW00Ej24o19xJ1wqMTOJdDO8+dzOFlz49ffAPZiBvSj7wsZvIMfN+zZWg2Osk1Up5b6M7SrpSw63BVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175800; c=relaxed/simple;
	bh=nvHkXaKy+A4a3zjmlxYTM7ZEfGs/MAzu/4aP88j9k0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuaTT7V2LXRUk+F/e88dnKgcds3z4Zuuwyoou2bOM+/rtbMaqVsSL4AzuqdUYYdkGUUvjtC4AIrk1eSE2KJFUInqLFgbSYthov8ocsDKkdyzYNbxhUp2gYoXGGJCzW+LlYKppPtEYQriRG0ZVBmxwvu6eTdZwNnHvopSVN/eh4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUipLdF+; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUipLdF+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488971db0fdso55974205e9.0
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 07:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175796; cv=none;
        d=google.com; s=arc-20240605;
        b=CDZWR8ViMxwH3ztOyS6mHCfP9MXs4Ft7ubF+JWHN3oKCeWXr+TVEdAXqcEAaadT10p
         8Skqh4WneEUFyTA46xzSoJOxXDSt+Xq0+bFHdX+iIDpjD7knMkfO29GEdnlJZY9igP2T
         jf2XtWLI5emwdOZ+chATdWr6jA9jx+6k7zks7vVlfyE2BNejseFH80lUqkoVNYElCR6H
         BTVoUCYAO/PUc7yvJZnf+s8f8aLgmRw072r5RkHkbyt6mSTVS/HeyKgIOPPiuliGvNpU
         3QmdnGBEshz0N8DKmyvIQdWYKzBkQ1g8utvE2xQG/i9H0q0gdPpsvH45HVyz20Df02A1
         VVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8OdkUuaCi8mFEcW4isBiQRI/EoubzWNeked/wrjNEo=;
        fh=BDoG4SfbDv9J263toas36kN1ne4y46amvGxS7HOCLk0=;
        b=N2tGKtGvdYEgCLONjjxQkho+5/q9Q2BVvf8e3ni1+Le2wSTNbzn8aQ2cqWLpHhTWM0
         N1a1iPxPBQDsM/zO8jTjTh0JysmLDaNoT/NF0l8nOof1htWKXnDMqj08A08XBiuyWyz7
         XZQPjL1wqPny4vh4Cl8rYgyIwDvaYQkguJ0CMLuClVvNAwDU3yGfqeNWpk7E2HYmtE9o
         L+B11t9Gb1OEFIUsr4kGDlGdzVNc/7X1e605e1+53LDUstvN6wYZ4isJOpUny5cAde/Y
         4pwWY6jDI32EPf72Kal+anGxH58Y8cb7E9XDmI5UGhscSYx6cs5QEs1BmRylWslA8AR9
         b3tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776175796; x=1776780596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8OdkUuaCi8mFEcW4isBiQRI/EoubzWNeked/wrjNEo=;
        b=eUipLdF+z7g89ab356OR86U5Ekyr0FCnM4g1xKC3P8S99Biooamez/BjQ48bWBVhV9
         xxEgyg8MZ1LU1uCZ+1dDR54VmNnmAQULNoVioLzx0Bf49J71sSujW1z+/B2W+Vi3ZB5z
         8CzfjrBbrE2qPCzVp7mLvbcPe1BU6rQQDRKoVmisTfzYtXE+6HxQhDyxbdDrP/syx/qP
         5QNXBqbtJE2xdUvOLxj+Qdgd2InmjMj41Cz9BAENmeFu9dmH+nvwlGzoNq2g5diqJD0U
         vi8/osUiwepEuKvn8uUC5gqBQk2RnzCfR7L7gN1W+iMCNf2xHvIdR7Uo6QEz3II25OX4
         HjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175796; x=1776780596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8OdkUuaCi8mFEcW4isBiQRI/EoubzWNeked/wrjNEo=;
        b=Oucf+cgQ55JyaMk5554nxve6HQTmPasC6jBozGKMIWac5PtOwNwGpCOCFjWhio3Qck
         cvysmbvN4rnRKnsa6ofoNDS2kTFA0Jb3IhKRO2+urQzpsl+pEkAR+WVRZ6hinyeTyeuY
         k/gDLbvUTR3laa+TbwCZF9KJ+HkTnG6Y+UmQKet1lLW9LkAR7gxjXSXF80BYD0CPFc3M
         9axDNGxUJPBCIQgpOF5Qa3Cqkr1gDZj5+mMFCa6WXtZLeDin4DUQGjm3zlwy6MJM+wpn
         8J23FgNJiaYQP7MqQA415IfRlmeAzw0/QiZIMJ/Ui+felS/SqPkxTGAwWHv8pqETxe3b
         Cpag==
X-Forwarded-Encrypted: i=1; AFNElJ8MhdDMDTDkcyWAr4AZhCBPmgQdb21GJPKyTp3H+LeLtmegFPsi68NhvkKSZc5cLTYxx60glRUKlubb@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8y0OA3121t1u6YcKd5TMHjbz3A8g95g5Aqnju44EKMqmjHo8
	daTfIkNt3C+pdPgHpHLo73qB5UOaFW1ctHmP12lh7PFHe8wc3v9RrmHYSF0LnOY76xi/ly1UFvi
	kv48zrnIxWc0S6VdYwjWTI0bDJvjBC8w=
X-Gm-Gg: AeBDiev2JGkEa1ZfLTY344n+7FoPjrqD+ujQUXEtWU1x+Gia9qw6tdd+C8kp5i4+ZQ1
	e5Yo43oZovRcM24sAyCLZcE6of/B/8QYgE0uO8KN1/jNA5OlNLl8SoyYIgIBRSGIOJuzEW+tJyi
	4kDkjr2ItxG1Ktz1UKgbgydIs7IuvmEP87Qr4jRJF8EPNqHB+o44T6RxLp87jX+ODpsfHJruwMn
	qB/pxOWJWq/z3xJXtY/sVGhnRYqKyLlU0lrYK4sGz/uQueQsp7Tl/QVrfa8iq5HRBMZVTjXtoKG
	CpcKthwAWWejugbXB7/WiJtTKudFLWcaBYxw2BBhfgynloBs6Vu0yxzuRW/hL3o1XjVkIZuxxo4
	dMX3wVQ6emsITprW3NyQy7jmeHA==
X-Received: by 2002:a05:600d:8449:b0:486:fdba:f5db with SMTP id
 5b1f17b1804b1-488d664f29emr197490795e9.0.1776175796268; Tue, 14 Apr 2026
 07:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ad4whCJuB-viVAae@sirena.org.uk>
In-Reply-To: <ad4whCJuB-viVAae@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:09:44 -0700
X-Gm-Features: AQROBzAq8LwGSoUQB6Tp7PVEnWgUkhAM1WnjY5UlIcDEYXRlptGcA56OQDX1H8w
Message-ID: <CAADnVQLz6-LK4+qad_XqEZXrspttpe4b49jRZ6wUCgEhJeTvgw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 5:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   include/linux/rcupdate.h
>
> between commit:
>
>   ad6ef775cbeff ("rcu-tasks: Document that RCU Tasks Trace grace periods =
now imply RCU grace periods")
>
> from the origin tree and commit:
>
>   57b23c0f612dc ("bpf: Retire rcu_trace_implies_rcu_gp()")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined include/linux/rcupdate.h
> index 18a85c30fd4f3,bfa765132de85..0000000000000
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@@ -205,15 -205,6 +205,6 @@@ static inline void exit_tasks_rcu_start
>   static inline void exit_tasks_rcu_finish(void) { }
>   #endif /* #else #ifdef CONFIG_TASKS_RCU_GENERIC */
>
> - /**
> -  * rcu_trace_implies_rcu_gp - does an RCU Tasks Trace grace period impl=
y an RCU grace period?
> -  *
> -  * Now that RCU Tasks Trace is implemented in terms of SRCU-fast, a
> -  * call to synchronize_rcu_tasks_trace() is guaranteed to imply at leas=
t
> -  * one call to synchronize_rcu().
> -  */
> - static inline bool rcu_trace_implies_rcu_gp(void) { return true; }
> -

Right. I mentioned it in my bpf-next PR.

But how come you're saying it was discovered "today" ?

Paul's commit ad6ef775cbeff was committed to rcu tree on Mar 30,
while Kumar's 57b23c0f612dc was committed to bpf-next on Apr 7.

"today" is April 14.

My only explanation is that rcu tree was not in linux-next until today?!
