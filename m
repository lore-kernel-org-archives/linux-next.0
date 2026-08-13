Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43341471252
	for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633801; cv=none; b=TwlWIEvy32LfIhrKFcqE7BZZ61cXqNmOKL/uaEilbCAMW1r1wPiFySiwI18vVyauED5c650eTu8H3JxKq8Ajn+BqbNHlmljmhADTcZTJxhe+S+bXelVOPljMT3wXSX0UHkYr7SI6LIa1VcZ83rpiNoBd/J5/2w4UY+rsKl+bMH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633801; c=relaxed/simple;
	bh=nNwqgQdsbZqEk8Wn+g2DVkGKYUGJWj0KeIk84YPVExM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4iVUqxGPV8sOe4Nw/0ZCjmOF/TrQ00yHej00N/dxqJI3mV1j7HUsmb5kD2rCEaIPIttZZyXKSxZnh6yYWsbCkQW937j4JKn2tZIova9Lmhq/Mi0Ck3uU8PivU+IX9Tfj0mK1Fhf/kyIzmAiSWxaRbpTPr8wr60yY5l+KanspTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zbe7IbjB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zbe7IbjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786633799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hLYHuFhxPv34O7eY6m74dFfiZY8MRmgqAESmGUmVGIg=;
	b=Zbe7IbjBtEMAp0zRm7rIlwCqUBOvZ0RATAoxo1cfj2v8ANdHt8xejKGBZc1hSWPP4YzsUe
	LxAe2CpCcUs2Ial9D0ZDiTI7H/KH4oxBk0pRozgxccfMHKbb+Z40X/NXgRNUn7jzAytCSP
	6SwCsCJ+CLwPRDR4p2XFhtgqG2/8lZw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-FHkhuTcqPDKcZywDECb6yA-1; Thu,
 13 Aug 2026 11:09:46 -0400
X-MC-Unique: FHkhuTcqPDKcZywDECb6yA-1
X-Mimecast-MFC-AGG-ID: FHkhuTcqPDKcZywDECb6yA_1786633784
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AE0A195608A;
	Thu, 13 Aug 2026 15:09:43 +0000 (UTC)
Received: from fedora (unknown [10.44.32.112])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D99E4196B08A;
	Thu, 13 Aug 2026 15:09:35 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 13 Aug 2026 17:09:42 +0200 (CEST)
Date: Thu, 13 Aug 2026 17:09:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Message-ID: <an3eLgSU53Ye86s1@redhat.com>
References: <20260813062039.14567-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813062039.14567-1-kmehltretter@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 08/13, Karl Mehltretter wrote:
>
> --- a/kernel/entry/syscall_user_dispatch.c
> +++ b/kernel/entry/syscall_user_dispatch.c
> @@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
>  					      (char __user *)(uintptr_t)cfg.selector);
>  }
>
> -#ifdef CONFIG_PROC_SYSCTL
> +#ifdef CONFIG_SYSCTL
>  static const struct ctl_table syscall_user_dispatch_sysctls[] = {
>  	{
>  		.procname	= "syscall_user_dispatch",
> @@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(void)
>  	return 0;
>  }
>  late_initcall(syscall_user_dispatch_sysctl_init);
> -#endif /* CONFIG_PROC_SYSCTL */
> +#endif /* CONFIG_SYSCTL */

Thanks!

Acked-by: Oleg Nesterov <oleg@redhat.com>


and just in case... this change is fine even without
8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL")
from sysctl-next.

Oleg.

