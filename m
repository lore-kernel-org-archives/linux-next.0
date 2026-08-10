Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE983F0AB7
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371344; cv=pass; b=J0pnaoDi6Crcz3SZg3nvB2k1vXrhZmofZwtJw+bIaGf4ZRUIZxa+Cb/CYwco0f95oJCFLBE27cBqw7qaTWedPlHl7ZbvKiZ7UhyROfPwfj1Xe0mzQe3jvZ+KYiqM/lqD2xEWLNtMuWe5U7gvdC/HLTJz63ln2Wqg3xX76UFkwkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371344; c=relaxed/simple;
	bh=UuzAuZ1C2/vWPTOSec14sS7/Rm8NbXALiiO7l8/pyKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyDjuT4/upXqFmHGCpy971yfl1+GWWsOj/oEX7Jw3YLjX6aH6uoXw86CNuUM3WEYve3DKpJAC/qFyVbdt0wepnbCkd/eHaa0wJxm79AEmJa0tQsXh/htJYo176rGYmt5gTy0T4prfum9td3w8WTn5zKlF/vxt/CX2lEyq3e3E18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxzB1Z2a; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxzB1Z2a"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cad68425a7so2649365ad.1
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 07:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371342; cv=none;
        d=google.com; s=arc-20260327;
        b=RKk7AXWG7oFe1NTJW1PflEM/MyPZk++yaxaRbVpJ/56oZls5Ee6Nj0nri4fqUYdocx
         Wmp3UcocpwMFEtWIjbl+eyLP3ZLgYmY0EyPdf+Ixd9saO7yQ3H97l+sTn0dGJ/1ZGW9h
         oFV73aaVBQGsKDTGTRFeylMHSdICyinrD98yu0IJ1seL4aejRkdBJpV8zTOyuIqb3IGv
         pA9Nb+dCNlMFretcwvxox8LkAd4DezyDAAKFsa9kB2hrM+mdyKVH1+2K/ArzFq/BGJfN
         8WShYZLWAaORuj0nIJMURTzKMuhS+rvLVaEgVy5WEoM/YMQooH5GPEgucXYrOSPxk6jt
         o82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wmKivrj/rqFtC9iMGpuDry6I3yLLumvfwoXy2NUyKA=;
        fh=Gyc1USb2ectzZZHHWOKQ6MLwamxsvzPLgUmN0l9KIhE=;
        b=eQtKwzkI9S8Ue+omuUaNP3nlL+hZavt1mTdxMpvi1MQtvbJd/KolAT6ZDbV08ZB7Ym
         KHO2i61nXxQNcyDSlZsLNPsBzLCw4P/33sdfjtqvhQ+G4+M3eC8xSaxPIj4TorhCuvgc
         T9rPXIEWmNKrdxaxrWqKa1ZFTIUUEPyDNhpw3lGVBQnHwd59cfyEualHMA39uLOA6PGx
         K7oQ3FjqkKMou2Vx3XzlajQFGhhmrtv58gbkjjAaI7WOCHHl9QuzNbZY9vEjyh1ZDaXt
         CaU7OrUnqq8n2WNSqptCQL9thwO0OGc3Ui7lsfx8QpdbwHB3K58rjs9a0Z166C6Ip40C
         b3bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371342; x=1786976142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wmKivrj/rqFtC9iMGpuDry6I3yLLumvfwoXy2NUyKA=;
        b=KxzB1Z2awHGixc2SICiQFABLgEjOMXv2paSAViV8uhxQstiHQmXle0XpWBHXbP9V2/
         sVsqFbcT+mCJwDpEOo3eZoPhCE4OmqBxNIHFFOup8cPmiztMWstt72RopaW5aobHfkUX
         L13leaEExReoSQSe6HlEHZ8InWRfdrE6hGSj4mhN9Yw8Lxf/Vtenl299fvyDN4Boj1z8
         Lf1OYcfwckZJd5jQYbJS8sL6SUjZuDXIBCBynDu0la5MGzPc2tM8mroQrJhlqWC+5brG
         rR0qAWihxUOxEijlLCyTc645QyfGOPyfSFC2931Lvx2pi0oYLkiF5hBR+1jZbPOhg5IO
         KKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371342; x=1786976142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wmKivrj/rqFtC9iMGpuDry6I3yLLumvfwoXy2NUyKA=;
        b=Am1RNhJ+ZgutmZPh5KjKyHprQHWHIzsq+hVoL5/VJxSUj3PxhNxBL5QkxoZ7YOwS3x
         bYPc54tgMOYQDu2QDCwrUMjXv9TICN9LPSltBmnvYx0oORuin24LyPOJ3W3q4xrcaIQX
         5tqPTdZArPBjSEQj1mAE6Oql4lY7hMDvPCeGVwGlVhVqth32sXPtjJHY0NUIZ0zonYdW
         P3eLxivggZNVA4Ohx0cSS2M7hIoqZb6IDycjazTkgparQYJST3EajHD5kULRwtdZvdw8
         noO5Y0yIXSqEaI7jBldSUIchmDdnJfO6sjKDLOWSttMAAwn9StD/kYpmDH1wgvdxYseC
         Ptwg==
X-Forwarded-Encrypted: i=1; AHgh+Rpbksk9ZOtZBdHwTkISRRxZMKKJ3XySBHWpaEfKnxzVxQjwX8dZnjt3glppokUNSqzL+nlZ6sVn7SkY@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrMvElBZwArg6XZyX+oNHFsxwSbfHEOcsg/T0JLBpMLNZleP4
	wYv7EboPdIEliS+iI7L/U42DdfoPRBYI7VSXBTW1rYWrytgP0hSxZvVETfQcS+h60H6k+FsCKh5
	cJ6ygL3/mOlSSURw0PaYUufFkUi5m7J3d4A==
X-Gm-Gg: AR+sD13g4fbc6zYrt5SAGfLzr/kwlBsdixwhLXBMcQ+fAfBdnhTlrafEy8KcVtGS0Hg
	9faIZbmSewlSHGfMafhjCbNfl/p3cE+asQjkAbWpb++LtKQm/g+1ccTBfuTYiloV4KeEwIDvgOm
	Y6pe7ykJHrJlMmjpAWjFf2vQR9LWJTb6IZ2su9ed1EE7MEHklvmZcQd0S3BhiNe8ItjBM29uhmj
	XMb+o6grgPRMLoB5N5Hh9FlnjPs6tEZjwhBn405V9gZc75ACZ+snkMuyrc48/5hoPNJ21ldeNx9
	vmyxRp30aq00Dy/9vtQArx7LqULNBxnKfxwaX/gKauO9YqhI7651r++I9Ps3JqUsxWWRhGIRxEy
	rj953919EHuSUZMUea9SVUQHtLNm25Fo=
X-Received: by 2002:a17:90b:3a81:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-3903c6e93e6mr29667613a91.2.1786371341337; Mon, 10 Aug 2026
 07:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705003504.31425-1-spasswolf@web.de> <e3b04980fd0bc7a6c3edfcd089e8fb4c559bbf38.camel@web.de>
 <b5f93060955a72a358bf82406eda866f2c5cde56.camel@web.de>
In-Reply-To: <b5f93060955a72a358bf82406eda866f2c5cde56.camel@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Aug 2026 10:15:29 -0400
X-Gm-Features: AUfX_mwROryHi7d7AdMoij38boT3bzzR7WqjIiWSi4Ic1xbDYn4wwGnJPyFKJS0
Message-ID: <CADnq5_Onn1+x_amugN5nBGNHdjM0bKBYr8LLQ_fRWxTNPbaJWQ@mail.gmail.com>
Subject: Re: [Re] GPU reset when running the ROCm hsa runtime tests on gfx12
 and next-20260701
To: Bert Karwatzki <spasswolf@web.de>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, 
	Shaoyun Liu <Shaoyun.Liu@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, 
	Amber Lin <Amber.Lin@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Amber Lin
, @Zhang, Jesse(Jie), @Shaoyun Liu  Can you take a look at the firmware ver=
sion?

Alex

On Mon, Jul 6, 2026 at 9:34=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> wr=
ote:
>
> I found the real cause of my problems:
>
>
> bool amdgpu_mes_queue_reset_by_mes_supported(struct amdgpu_device *adev)
> {
>  u32 ip_maj =3D IP_VERSION_MAJ(amdgpu_ip_version(adev, GC_HWIP, 0));
>  u32 ip_min =3D IP_VERSION_MIN(amdgpu_ip_version(adev, GC_HWIP, 0));
>  u32 mes_sched =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
>  printk(KERN_INFO "%s: ip_maj =3D %u ip_min =3D %u mes_sched =3D 0x%x", _=
_func__, ip_maj, ip_min, mes_sched);
>
>  return (ip_maj =3D=3D 11 && mes_sched >=3D 0x8c) ||
>  ((ip_maj =3D=3D 12 && ip_min =3D=3D 0) && mes_sched >=3D 0x8d) ||
>  ((ip_maj =3D=3D 12 && ip_min =3D=3D 1) && mes_sched >=3D 0x73);
> }
>
> returns false on my machine (because mes_sched is not large enough)
>
> [ T8549] amdgpu_mes_queue_reset_by_mes_supported: ip_maj =3D 12 ip_min =
=3D 0 mes_sched =3D 0x76
>
> So I skipped the call to amdgpu_mes_queue_reset_by_mes_supported()
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driv=
ers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 5c9dfb0c424f..462f20aeb681 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -448,17 +448,22 @@ static int reset_queues_mes(struct device_queue_man=
ager *dqm, struct queue *q)
>         unsigned int num_hung =3D 0;
>         int r =3D 0;
>         struct mes_remove_queue_input queue_input;
> +       printk(KERN_INFO "entering %s", __func__);
>
> +       /*
>         if (!amdgpu_mes_queue_reset_by_mes_supported(adev)) {
>                 r =3D -ENOTRECOVERABLE;
> +               printk(KERN_INFO "%s: reset by mes not supported", __func=
__);
>                 goto fail;
> -       }
> +       }*/
> +       printk(KERN_INFO "%s: skip calling amdgpu_mes_queue_reset_by_mes_=
supported()", __func__);
>
>         /* reset should be used only in dqm locked queue reset */
>         if (WARN_ON(dqm->detect_hang_count > 0))
>                 return 0;
>
>         if (!amdgpu_gpu_recovery) {
> +               printk(KERN_INFO "%s: gpu recovery not enabled", __func__=
);
>                 r =3D -ENOTRECOVERABLE;
>                 goto fail;
>         }
> @@ -470,6 +475,7 @@ static int reset_queues_mes(struct device_queue_manag=
er *dqm, struct queue *q)
>         queue_input.xcc_id =3D ffs(dqm->dev->xcc_mask) - 1;
>         /* pass the known bad queue info to the reset function */
>         r =3D amdgpu_gfx_reset_mes_compute(adev, NULL, NULL, NULL, &num_h=
ung, &queue_input);
> +       printk(KERN_INFO "%s: amdgpu_gfx_reset_mes_compute() returned %d"=
, __func__, r);
>         if (r)
>                 goto fail;
>
> @@ -3231,6 +3237,7 @@ int kfd_dqm_suspend_bad_queue_mes(struct kfd_node *=
knode, u32 pasid, u32 doorbel
>         struct qcm_process_device *qpd;
>         struct queue *q =3D NULL;
>         int ret =3D 0;
> +       printk(KERN_INFO "entering %s", __func__);
>
>         if (!pdd)
>                 return -EINVAL;
> @@ -3242,6 +3249,7 @@ int kfd_dqm_suspend_bad_queue_mes(struct kfd_node *=
knode, u32 pasid, u32 doorbel
>
>                 list_for_each_entry(q, &qpd->queues_list, list) {
>                         if (q->doorbell_id =3D=3D doorbell_id && q->prope=
rties.is_active) {
> +                               printk(KERN_INFO "%s: calling recover_bad=
_queue_mes() for queue %px", __func__, q);
>
> and got this output when running the hsaruntime (which inject illegal opc=
odes into the
> command stream) test:
>
> [  113.811612] [    T645] [drm:gfx_v12_0_bad_op_irq [amdgpu]] *ERROR* Ill=
egal opcode in command stream
> [  113.811675] [   T2558] entering kfd_dqm_suspend_bad_queue_mes
> [  113.811676] [   T2558] kfd_dqm_suspend_bad_queue_mes: calling recover_=
bad_queue_mes() for queue ffffa03160950400
> [  113.811676] [   T2558] entering reset_queues_mes
> [  113.811677] [   T2558] reset_queues_mes: skip calling amdgpu_mes_queue=
_reset_by_mes_supported()
> [  113.811887] [   T2558] reset_queues_mes: amdgpu_gfx_reset_mes_compute(=
) returned 0
>
> So even though  amdgpu_mes_queue_reset_by_mes_supported() reported false,
> amdgpu_gfx_reset_mes_compute() returns 0, suggesting that resetting actua=
lly works here!
>
> Perhaps the minimum required mes_sched version for 12.0 can be relaxed to=
 0x76 to solve this:
>
> From 6d7af652177063963012eb4df228e99caeb03b31 Mon Sep 17 00:00:00 2001
> From: Bert Karwatzki <spasswolf@web.de>
> Date: Mon, 6 Jul 2026 14:36:22 +0200
> Subject: [PATCH] amdgpu: relax required mes_sched version
>
> This mes_sched version is actually enough on this hardware:
> 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [A=
MD/ATI] Navi 44 [Radeon RX 9060 XT] [1002:7590] (rev c0)
>
> [    3.200538] [    T537] amdgpu 0000:03:00.0: initializing kernel modese=
tting (IP DISCOVERY 0x1002:0x7590 0x148C:0x2437 0xC0).
> [    3.200546] [    T537] amdgpu 0000:03:00.0: register mmio base: 0xDFC0=
0000
> [    3.200547] [    T537] amdgpu 0000:03:00.0: register mmio size: 524288
> [    3.203739] [    T537] amdgpu 0000:03:00.0: detected ip block number 0=
 <common_v1_0_0> (soc24_common)
> [    3.203740] [    T537] amdgpu 0000:03:00.0: detected ip block number 1=
 <gmc_v12_0_0> (gmc_v12_0)
> [    3.203741] [    T537] amdgpu 0000:03:00.0: detected ip block number 2=
 <ih_v7_0_0> (ih_v7_0)
> [    3.203741] [    T537] amdgpu 0000:03:00.0: detected ip block number 3=
 <psp_v14_0_0> (psp)
> [    3.203742] [    T537] amdgpu 0000:03:00.0: detected ip block number 4=
 <smu_v14_0_0> (smu)
> [    3.203742] [    T537] amdgpu 0000:03:00.0: detected ip block number 5=
 <dce_v1_0_0> (dm)
> [    3.203743] [    T537] amdgpu 0000:03:00.0: detected ip block number 6=
 <gfx_v12_0_0> (gfx_v12_0)
> [    3.203743] [    T537] amdgpu 0000:03:00.0: detected ip block number 7=
 <sdma_v7_0_0> (sdma_v7_0)
> [    3.203744] [    T537] amdgpu 0000:03:00.0: detected ip block number 8=
 <vcn_v5_0_0> (vcn_v5_0_0)
> [    3.203744] [    T537] amdgpu 0000:03:00.0: detected ip block number 9=
 <jpeg_v5_0_0> (jpeg_v5_0_0)
> [    3.203745] [    T537] amdgpu 0000:03:00.0: detected ip block number 1=
0 <mes_v12_0_0> (mes_v12_0)
>
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mes.c
> index 6c0dde3786e3..c88fdc8a187d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -869,7 +869,7 @@ bool amdgpu_mes_queue_reset_by_mes_supported(struct a=
mdgpu_device *adev)
>  u32 mes_sched =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
>
>  return (ip_maj =3D=3D 11 && mes_sched >=3D 0x8c) ||
> - ((ip_maj =3D=3D 12 && ip_min =3D=3D 0) && mes_sched >=3D 0x8d) ||
> + ((ip_maj =3D=3D 12 && ip_min =3D=3D 0) && mes_sched >=3D 0x76) ||
>  ((ip_maj =3D=3D 12 && ip_min =3D=3D 1) && mes_sched >=3D 0x73);
>  }
>
> --
> 2.53.0
>
>
> Bert Karwatzki
