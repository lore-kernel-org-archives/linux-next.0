Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F347D920
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 16:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071224; cv=none; b=RZVP45mq/kvF7llA8BERy5tJuRoi6P22WGYrZtgPlWPCbC07pV3EbeQEOBymxRsikv6qg69jlqFG8Xqf+yWH+WDQO7fZXPA1Xa5F2TLpfyxo3iHIOW1MCPaQPVAgcKj0z5TSGX/ujUzG4vTCgko2nj4leTNFyYTD6szWWl7M9OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071224; c=relaxed/simple;
	bh=gTY+h/NuzpesmGErL1qEJZmI24+CMD4bb6jK5BtcFDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZwVEEt1ge3DJwPvEEec8lfkE5RnzL0kp6FPVJeiUjFaPaWARPhBFXG4lNkgCgXbmTsSWx6AJgqyuaEjTJZDbISlVK7j9R3cSKhTVL/S5IYi5qYwm7HIQsIBAkF4IjN+PxmKTzgMIB4BTzc6cVkcto1sV8hgY1D7OySqC9tgHMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuwFGLSg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vpj41EIO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuwFGLSg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vpj41EIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787071222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrmIobcbrx92GsvO+nwW8lBGJJA3WTKLpLDzWnDMpwU=;
	b=TuwFGLSgvcaM/QJqEnmnk/BQXaiWMchbefDddU9jvtpuaoDpH4p0YCNe7VLJAsnvUGNHJE
	2m1dRExWrCeftpOZU//nGNgTl95bq47HCb+BLODwYh2lrNfgNMU3FDSFIdgFdEPD+eX6Q7
	63c58Nd9LnyBymnP+Zn/NuaaHqgzzuw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-c4VNxNQAOPW2i-kqApKtcQ-1; Tue, 18 Aug 2026 12:40:15 -0400
X-MC-Unique: c4VNxNQAOPW2i-kqApKtcQ-1
X-Mimecast-MFC-AGG-ID: c4VNxNQAOPW2i-kqApKtcQ_1787071215
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47faa02f707so938858f8f.1
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787071214; x=1787676014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrmIobcbrx92GsvO+nwW8lBGJJA3WTKLpLDzWnDMpwU=;
        b=Vpj41EIO4ZJ94Pz9mPMCNXdK/Q6SZy6U1Z/EgAWbEdWLUuNJVRnmud/dQWOnB7JFtD
         WnIgd9AKvBeVMFgZg0Ralt5qFy+YQI5Hsq2Ud6vOK0haQryfsKVqGKWh2tssxFDJnZjD
         UEanqQe4D+wIYnBF1itosIzw2Hn1HHF3k8/ZXz8WuXoW4rvX5iYBuB0JwGoyeKHqagYQ
         Acthr5axJqcZgD/HitjsNW1asLLupSgK+VDfBlKehioiovC9eig0WAYvvZMwL6A/vPYa
         0A09OKt1sMt+TOFyyY5xeuCSYF6aqnubdl5twfu6YldnR/Zb/NAhhMu055J2lhe0nk9Q
         hudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787071214; x=1787676014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrmIobcbrx92GsvO+nwW8lBGJJA3WTKLpLDzWnDMpwU=;
        b=mY3gn8P3UvbrY2Rpd+Sgs1NQ5VHPSoyHyAPjHd99ZH12Lzkp8FyOtwpxhooAAHbetT
         MVdYITTWqeeCcBAi2ygAHKE3v4u2XEiI5uTljzFv9qurHbZM+L427Z0BgwDfEuEPtO+l
         uEFlcnjn5/tySb/ID1D7sciTB3zI2ojjKnEAsoHPUjCcjgNsIY6YLEaVF4yDKjbz7WKx
         zPFUEl8zhX7/h9zD9ZrFwauzH5jxt1ZNSNUGbpq9IRVChT/EAbxuVDftZiulooccn1T0
         xSGXTAB7OzhPemlcHMS2BmTaCm5Wgms7PsG6dKxZ5UKTFXt+aBA42pA8YbTJ9BBNujO2
         QErA==
X-Forwarded-Encrypted: i=1; AHgh+RruPV5qR3j8e7qq4jUPcAHpTgXW5iPRiI3hN4MIqhD3thQjIjPfkvdGK2gX3VPTWk/RtfN/jp+Jfibl@vger.kernel.org
X-Gm-Message-State: AOJu0YxPu69pbRKfheELz8eeVdQMD77ngT5NnA0rDb9bnsOPII9GXahZ
	qNFzjF+N57P5NLc5QHExL0akPuPNoGyTGtlTQQVdY1ptC6wZFJXdhGCG2g5h+8F2nvbDrIWzOjR
	tMwDBOzNZ57Y1VSovTK4zBmy/6x9LWLFF+8MFngdZmxFV/UV/vb9aXW5RbNb2D8s=
X-Gm-Gg: AR+sD12hFZszMF/kwIIY9iksuDVyHpDw5Sbw8jT0ZofvNCV/qq0/Dg057eaBlonFxwC
	Y95E8OzmY+/ACaht3b1o8uwz4bUXAYj3A8EGLj1vjHtb13wkDtT9jdwEwEja6iVn42XMeH3jHyO
	gxwz+F9RfGRz2eyCOZkq/POQhXF6Xo5voQnhLwyxE7eh52z1lSS1Hi4iKvMqM+c6G4gZV2vOQVS
	PA+8IElLS0TfEQAz/ZTtYgkggx4goAgGi8fkmYu22omghEHNv/Ct4qz8zUUlLGcWD640uwbbQDm
	ZNnhbr/adk/GjppHQgPxYMo7LRbdVaAzAFOINYl2g9/Zkmq4vNv3WgamwhbwFcOkgEO69GKNkA=
	=
X-Received: by 2002:a05:6000:1888:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-482aaa695demr11693951f8f.5.1787071214618;
        Tue, 18 Aug 2026 09:40:14 -0700 (PDT)
X-Received: by 2002:a05:6000:1888:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-482aaa695demr11693852f8f.5.1787071214158;
        Tue, 18 Aug 2026 09:40:14 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b77f41sm12399020f8f.27.2026.08.18.09.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 09:40:12 -0700 (PDT)
Message-ID: <f84733fe-72e4-40fa-ad6c-0915aca9e204@redhat.com>
Date: Tue, 18 Aug 2026 18:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
To: Mark Brown <broonie@kernel.org>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Networking <netdev@vger.kernel.org>
Cc: Ivan Vecera <ivecera@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aoR9YYY2P5--3x0N@sirena.org.uk>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <aoR9YYY2P5--3x0N@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/26 17:42, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>    drivers/dpll/dpll_netlink.c
>
> between commit:
>
>    33f016b23a219 ("dpll: fix NULL deref in dpll_device_ops() during teardown race")
>
> from the net tree and commit:
>
>    84e85c325e5ed ("dpll: use pin owner's dpll ref for pin-level attribute setting")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
Your resolution is correct, thanks for handling it.

Regards,

Petr

>
> diff --cc drivers/dpll/dpll_netlink.c
> index 9e55745e33e4f,a909cd4451b00..0000000000000
> --- a/drivers/dpll/dpll_netlink.c
> +++ b/drivers/dpll/dpll_netlink.c
> @@@ -1109,20 -1089,8 +1108,8 @@@ dpll_pin_freq_set(struct dpll_pin *pin
>    		return -EINVAL;
>    	}
>    
> - 	xa_for_each(&pin->dpll_refs, i, ref) {
> - 		if (!dpll_device_registered(ref->dpll))
> - 			continue;
> - 		ops = dpll_pin_ops(ref);
> - 		if ((!ops->frequency_set || !ops->frequency_get) &&
> - 		    ref->dpll->module == pin->module &&
> - 		    ref->dpll->clock_id == pin->clock_id) {
> - 			NL_SET_ERR_MSG(extack,
> - 				       "frequency set not supported by the device");
> - 			return -EOPNOTSUPP;
> - 		}
> - 	}
>    	ref = dpll_pin_own_dpll_ref_first(pin);
>   -	if (!ref) {
>   +	if (!ref || !dpll_device_registered(ref->dpll)) {
>    		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
>    		return -ENODEV;
>    	}
> @@@ -1181,26 -1130,13 +1149,13 @@@ dpll_pin_esync_set(struct dpll_pin *pin
>    	const struct dpll_pin_ops *ops;
>    	struct dpll_pin_esync esync;
>    	u64 freq = nla_get_u64(a);
> + 	struct dpll_pin_ref *ref;
>    	struct dpll_device *dpll;
>    	bool supported = false;
> - 	unsigned long i;
> - 	int ret;
> + 	int ret, i;
>    
> - 	xa_for_each(&pin->dpll_refs, i, ref) {
> - 		if (!dpll_device_registered(ref->dpll))
> - 			continue;
> - 		ops = dpll_pin_ops(ref);
> - 		if ((!ops->esync_set || !ops->esync_get) &&
> - 		    ref->dpll->module == pin->module &&
> - 		    ref->dpll->clock_id == pin->clock_id) {
> - 			NL_SET_ERR_MSG(extack,
> - 				       "embedded sync feature is not supported by this device");
> - 			return -EOPNOTSUPP;
> - 		}
> - 	}
>    	ref = dpll_pin_own_dpll_ref_first(pin);
>   -	if (!ref) {
>   +	if (!ref || !dpll_device_registered(ref->dpll)) {
>    		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
>    		return -ENODEV;
>    	}
> @@@ -1313,24 -1221,16 +1240,15 @@@ dpll_pin_ref_sync_state_set(struct dpll
>    	}
>    	if (state == old_state)
>    		return 0;
> - 	xa_for_each(&pin->dpll_refs, i, ref) {
> - 		if (!dpll_device_registered(ref->dpll))
> - 			continue;
> - 		ops = dpll_pin_ops(ref);
> - 		if (!ops->ref_sync_set)
> - 			continue;
> - 		dpll = ref->dpll;
> - 		ret = ops->ref_sync_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
> - 					ref_sync_pin,
> - 					dpll_pin_on_dpll_priv(dpll,
> - 							      ref_sync_pin),
> - 					state, extack);
> - 		if (ret) {
> - 			failed = ref;
> - 			NL_SET_ERR_MSG_FMT(extack, "reference sync set failed for dpll_id:%u",
> - 					   dpll->id);
> - 			goto rollback;
> - 		}
>   -
> + 	ret = ops->ref_sync_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
> + 				ref_sync_pin,
> + 				dpll_pin_on_dpll_priv(dpll, ref_sync_pin),
> + 				state, extack);
> + 	if (ret) {
> + 		NL_SET_ERR_MSG_FMT(extack,
> + 				   "reference sync set failed for dpll_id:%u",
> + 				   dpll->id);
> + 		return ret;
>    	}
>    	__dpll_pin_change_ntf(pin);
>    
> @@@ -1534,19 -1415,8 +1433,8 @@@ dpll_pin_phase_adj_set(struct dpll_pin
>    		return -EINVAL;
>    	}
>    
> - 	xa_for_each(&pin->dpll_refs, i, ref) {
> - 		if (!dpll_device_registered(ref->dpll))
> - 			continue;
> - 		ops = dpll_pin_ops(ref);
> - 		if ((!ops->phase_adjust_set || !ops->phase_adjust_get) &&
> - 		    ref->dpll->module == pin->module &&
> - 		    ref->dpll->clock_id == pin->clock_id) {
> - 			NL_SET_ERR_MSG(extack, "phase adjust not supported");
> - 			return -EOPNOTSUPP;
> - 		}
> - 	}
>    	ref = dpll_pin_own_dpll_ref_first(pin);
>   -	if (!ref) {
>   +	if (!ref || !dpll_device_registered(ref->dpll)) {
>    		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
>    		return -ENODEV;
>    	}

