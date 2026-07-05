Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49B45039;
	Sun,  5 Jul 2026 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783291541; cv=none; b=WsK45gZimTVaUXbIrMC39i2IAYJSGV6Xf/Jl3WZzdZKJlX0dbuOMYuRcv4202R52B+srXpA/MMqrhrVXuuoNogkVwP38XsjLvwHD+RoN5CEEZ90jYl1BaH/StRpziKCkd61iSBBWdan0ws+gb5rv6ImN1Idz1eTiV9h6l/5WDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783291541; c=relaxed/simple;
	bh=PMgJocJC2AIhQXOjXYXpA9XicCapverrGDJmBaFyTAc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEoNzvq3ddffsTjy0ZY5dmDjMazp1R0UFPHnmhv9AfqvAZ5JrZGW9/jRAFI9D/Ka4ZsT98dZxQlBO2jU2Wun4Bvga/slUvMUkECsoCgEfcQgk0hiLazcYxDezp8iEBRJQInexAFv6rqcZw1PZ2IZhhNFXEA/PsC54IGmzaDouV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=ksB63A96; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="ksB63A96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783291532; x=1783896332; i=spasswolf@web.de;
	bh=IU3tSUq2jRftD+6O90sMRzR5hGEK1EC6I4FopZftc9s=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ksB63A96H8pr1dqW/cHDM90sT4IToYExWmVC5WbWLh/CLVeIwVJkzW2/RmpRSI4q
	 9tr5J1HHoEIXm7+E+RCh4cJhTQKZKU44CQAEOJK8kETmDtHufW7pF9pLEAQqn9qaK
	 CR9LvccDpIH5b8HmSrq3Ue/sLkwnkq7YyLYqyqiyBSdmJ0HmIPehv+dlEEfNxBZvD
	 e5MeyvPT1+ja7HiZkGbGpoIlzujrjAcsZKbpXSMdIqWit+iilDKPpWB6iT7v8/Auj
	 7+sY5R/CoBHulz8BXn1bxgXSkdCy5/xOvlGZQTOS2SHNrF7D9fKRKQtDkUjCdW0c9
	 WncVj6qgzEuUUmxxpg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcll-1wbmWd1qdv-00WSKq; Mon, 06
 Jul 2026 00:45:32 +0200
Message-ID: <e3b04980fd0bc7a6c3edfcd089e8fb4c559bbf38.camel@web.de>
Subject: Re: [Re] GPU reset when running the ROCm hsa runtime tests on gfx12
 and next-20260701
From: Bert Karwatzki <spasswolf@web.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-next@vger.kernel.org, Jesse Zhang <jesse.zhang@amd.com>, Amber Lin
	 <Amber.Lin@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	spasswolf@web.de
Date: Mon, 06 Jul 2026 00:45:31 +0200
In-Reply-To: <20260705003504.31425-1-spasswolf@web.de>
References: <20260705003504.31425-1-spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/0Sl+SQ2DLJBteyJ9828v6YpdrH+Hb9TebkksLq2iYnrlDMzgPp
 8W3yWIEcTCLsXtCvdsXafwJg9ZLXR8Z9vT4jufGHp3iorEwAFMggq9fEqHVEBuJlZQSkmH6
 wldX6DMBd79LVmb3zzd7f976NDhUJ+Fen/eX44CVGFl+41Xo725ZCY3bhQRqCOqzxItZZL5
 oUjKHF8JT37qIyOY3jqJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y8Se9m9gMPE=;jUdRhnnU6WfkFrPNMC2dq9gjqkV
 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

Am Sonntag, dem 05.07.2026 um 02:35 +0200 schrieb Bert Karwatzki:
> I identified the problem in =20
> f94bbd648bb4 ("drm/amdgpu: use a single entry point for mes compute rese=
t")
> it's reset_queues_mes() being called unconditionally. f94bbd648bb4 can b=
e fixed
> like this:
>=20
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 6054c8e216b8..ed1ffa8b1743 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -484,15 +484,18 @@ static int suspend_all_queues_mes(struct device_qu=
eue_manager *dqm)
>  	if (!down_read_trylock(&adev->reset_domain->sem))
>  		return -EIO;
> =20
> +	r =3D amdgpu_mes_suspend(adev, ffs(dqm->dev->xcc_mask) - 1);
> =20
> -	if (!reset_queues_mes(dqm)) {
> -		r =3D 0;
> -		goto out;
> -	}
> +	if (r) {
> +		if (!reset_queues_mes(dqm)) {
> +			r =3D 0;
> +			goto out;
> +		}
> =20
> -	dev_err(adev->dev, "failed to suspend gangs from MES\n");
> -	dev_err(adev->dev, "MES might be in unrecoverable state, issue a GPU r=
eset\n");
> -	kfd_hws_hang(dqm);
> +		dev_err(adev->dev, "failed to suspend gangs from MES\n");
> +		dev_err(adev->dev, "MES might be in unrecoverable state, issue a GPU =
reset\n");
> +		kfd_hws_hang(dqm);
> +	}
>  out:
> =20
>  	up_read(&adev->reset_domain->sem);
>=20
>=20
> But when I try to fix next-20260701 like this
>=20
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 5c9dfb0c424f..5a78b1504f8c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -493,7 +493,10 @@ static int recover_bad_queue_mes(struct device_queu=
e_manager *dqm, struct queue
>  	if (!down_read_trylock(&adev->reset_domain->sem))
>  		return -EIO;
> =20
> -	r =3D reset_queues_mes(dqm, q);
> +	r =3D amdgpu_mes_suspend(adev, ffs(dqm->dev->xcc_mask) - 1);
> +
> +	if (r)
> +		r =3D reset_queues_mes(dqm, q);
> =20
>  	up_read(&adev->reset_domain->sem);
>  	return r;
>=20
> I still get GPUVM errors (but no GPU reset) and when running
>=20
> $ /usr/libexec/rocm/libhsa-runtime64-tests/run-tests
>=20
> [  146.577245] [    T418] amdgpu 0000:03:00.0: [gfxhub] page fault (src_=
id:0 ring:157 vmid:0 pasid:0)
> [  146.577247] [    T418] amdgpu 0000:03:00.0:   in page starting at add=
ress 0x00000000002ba000 from client 10
> [  146.577248] [    T418] amdgpu 0000:03:00.0: GCVM_L2_PROTECTION_FAULT_=
STATUS:0x00000B3A
> [  146.577249] [    T418] amdgpu 0000:03:00.0: 	 Faulty UTCL2 client ID:=
 CPC (0x5)
> [  146.577249] [    T418] amdgpu 0000:03:00.0: 	 MORE_FAULTS: 0x0
> [  146.577250] [    T418] amdgpu 0000:03:00.0: 	 WALKER_ERROR: 0x5
> [  146.577250] [    T418] amdgpu 0000:03:00.0: 	 PERMISSION_FAULTS: 0x3
> [  146.577250] [    T418] amdgpu 0000:03:00.0: 	 MAPPING_ERROR: 0x1
> [  146.577251] [    T418] amdgpu 0000:03:00.0: 	 RW: 0x0
> [  146.577606] [    T418] amdgpu 0000:03:00.0: [gfxhub] page fault (src_=
id:0 ring:157 vmid:0 pasid:0)
> [  146.577608] [    T418] amdgpu 0000:03:00.0:   in page starting at add=
ress 0x00000000002ba000 from client 10
> [  146.577609] [    T418] amdgpu 0000:03:00.0: GCVM_L2_PROTECTION_FAULT_=
STATUS:0x00000B3A
> [  146.577609] [    T418] amdgpu 0000:03:00.0: 	 Faulty UTCL2 client ID:=
 CPC (0x5)
> [  146.577610] [    T418] amdgpu 0000:03:00.0: 	 MORE_FAULTS: 0x0
> [  146.577611] [    T418] amdgpu 0000:03:00.0: 	 WALKER_ERROR: 0x5
> [  146.577611] [    T418] amdgpu 0000:03:00.0: 	 PERMISSION_FAULTS: 0x3
> [  146.577611] [    T418] amdgpu 0000:03:00.0: 	 MAPPING_ERROR: 0x1
> [  146.577612] [    T418] amdgpu 0000:03:00.0: 	 RW: 0x0
>=20
> This means there's at least another error in these commits (reverting al=
l these in
> next-20260701 fixes the issue)
>=20
> b789664e3e30 ("drm/amdkfd: Clean up suspend_all and resume_all mes")
> a665d09b10af ("drm/amdkfd: Pass known bad queue info to reset")
> a4e4d945cba8 ("drm/amdgpu/gfx: defer per-queue helper_end until after ME=
S resume")
> f401a2633e02 ("drm/amdgpu: Remove faulty queue before resume")
> f94bbd648bb4 ("drm/amdgpu: use a single entry point for mes compute rese=
t")
>=20
> Bert Karwatzki

These GPUVM error are introduce by=20
a665d09b10af ("drm/amdkfd: Pass known bad queue info to reset")
and can be fixed by a partial revert. a665d09b10af can be fixed by

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drive=
rs/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 0d95dd941129..0c49fe95a75d 100644
=2D-- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -491,15 +491,18 @@ static int suspend_all_queues_mes(struct device_queu=
e_manager *dqm, struct queue
 	if (!down_read_trylock(&adev->reset_domain->sem))
 		return -EIO;
=20
+	r =3D amdgpu_mes_suspend(adev, ffs(dqm->dev->xcc_mask) - 1);
=20
-	if (!reset_queues_mes(dqm, q)) {
-		r =3D 0;
-		goto out;
-	}
+	if (r) {
+		if (!reset_queues_mes(dqm, q)) {
+			r =3D 0;
+			goto out;
+		}
=20
-	dev_err(adev->dev, "failed to suspend gangs from MES\n");
-	dev_err(adev->dev, "MES might be in unrecoverable state, issue a GPU res=
et\n");
-	kfd_hws_hang(dqm);
+		dev_err(adev->dev, "failed to suspend gangs from MES\n");
+		dev_err(adev->dev, "MES might be in unrecoverable state, issue a GPU re=
set\n");
+		kfd_hws_hang(dqm);
+	}
 out:
=20
 	up_read(&adev->reset_domain->sem);
@@ -3239,6 +3242,7 @@ int kfd_dqm_suspend_bad_queue_mes(struct kfd_node *k=
node, u32 pasid, u32 doorbel
 	struct kfd_process_device *pdd =3D NULL;
 	struct kfd_process *p =3D kfd_lookup_process_by_pasid(pasid, &pdd);
 	struct device_queue_manager *dqm =3D knode->dqm;
+	struct device *dev =3D dqm->dev->adev->dev;
 	struct qcm_process_device *qpd;
 	struct queue *q =3D NULL;
 	int ret =3D 0;
@@ -3260,6 +3264,12 @@ int kfd_dqm_suspend_bad_queue_mes(struct kfd_node *=
knode, u32 pasid, u32 doorbel
 				q->properties.is_active =3D false;
 				decrement_queue_count(dqm, qpd, q);
=20
+				/* this will remove the bad queue and sched a GPU reset if needed */
+				ret =3D remove_queue_mes(dqm, q, qpd);
+				if (ret)
+					dev_err(dev, "Removing bad queue failed");
+				/* resume the good queues */
+				resume_all_queues_mes(dqm);
 				break;
 			}
 		}

This does not work in next-20260701 as commit
b789664e3e30 ("drm/amdkfd: Clean up suspend_all and resume_all mes")
removes resume_all_queues_mes().

Bert Karwatzki
