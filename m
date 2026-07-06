Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE07432BD2;
	Mon,  6 Jul 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342025; cv=none; b=ADbTqfY7kYUTDqysi+tCPPvWkXgj9mVpoKGbsWCtF6fl3b72xlpdxXV3Rrven/Os+DulPJfsl/t29FegrMXYaxfDexIS0v9TmZ2U3SlAawD2JLcsXc/SgtDNQ1a7qtZQCWhEqbmlPLFj8YxGop4ZWLxi6vfwX39bI4B6RsjnXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342025; c=relaxed/simple;
	bh=QKLfJxWAuH0e7NeY8eZ+BkWQGLr0OPNxL40MLNEit48=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t2F5C9bXoLbAKm6SwGxU1Ckea+l7hcwoRZxuvWuzzQwtqzd8lYJDIy436X6fkjnW43/FKHEgUjctllw71K151ZqhIgjUrRZc2gtEaz8Wp/T3YCYM3hVZ1hVfwy0kCPX0MAeGcgtXr4UUvbNeRBMXMi73bbLDpESLEnHoJ1eIAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=YD989Gca; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="YD989Gca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783342014; x=1783946814; i=spasswolf@web.de;
	bh=qSQIkj6dO39Yjk3sHi29N3d7bi12JxChcPNUH5flV8s=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YD989GcaNVIfoF/+p5YUpVCaX03WjOP6UCdKGDz8K6utLHGW39DYVDoxJ3PtQxw7
	 tA7cQ2nLJ9vN7yTcM2SsYmL9v6BmIkPCBCpcpq9Z7vMubBdZiURRnHgQ0Ypwj95e6
	 wS1zlCpMfduPoZqZsBf2KKx6UPl/oPhOMXMgNPAHPb3uvzJCQxA72Eiub1aGuPjqx
	 SxzQjuYPWQHwmlFC/zulvuh8AR2GIhrYmp71wn5MMugS1tV11gWF6sZmWQVpqllVq
	 cbVknpFvO7Q6BrGn+TBJ3J7y/CXBMOmNnRMv5VU2i+UbNvumgXEiOq+cSeZVkVlon
	 DHExl9ZkmXC8npYxzQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N45xz-1x6jsq47Bx-010rTr; Mon, 06
 Jul 2026 14:46:54 +0200
Message-ID: <b5f93060955a72a358bf82406eda866f2c5cde56.camel@web.de>
Subject: Re: [Re] GPU reset when running the ROCm hsa runtime tests on gfx12
 and next-20260701
From: Bert Karwatzki <spasswolf@web.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-next@vger.kernel.org, Jesse Zhang <jesse.zhang@amd.com>, Amber Lin
	 <Amber.Lin@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	spasswolf@web.de
Date: Mon, 06 Jul 2026 14:46:53 +0200
In-Reply-To: <e3b04980fd0bc7a6c3edfcd089e8fb4c559bbf38.camel@web.de>
References: <20260705003504.31425-1-spasswolf@web.de>
		 <e3b04980fd0bc7a6c3edfcd089e8fb4c559bbf38.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YZA8JEdp8F6Oj+geMQVHSLVa5F8g2ErHdSqAem60FVyUgMl3QQL
 KKQBfg7FCautuCJSH/gUEsAB+iUu35F+aTOBS0ljfX1mrA8Z0C6qQZ0um5chxf0ddlBVe8R
 ug+3PGjYlgKTJf5h4vUGi895tqfCnPkUDcUCHRf18zosBg5rK2pXj4DAroe7PAnR/E2W7sQ
 9jIewv6F7HtWdRvQbdi2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D2dZszLEruc=;UKBcpGIu28qcAG3wQZ+1BAaA+ug
 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

I found the real cause of my problems:


bool amdgpu_mes_queue_reset_by_mes_supported(struct amdgpu_device *adev)
{
 u32 ip_maj =3D IP_VERSION_MAJ(amdgpu_ip_version(adev, GC_HWIP, 0));
 u32 ip_min =3D IP_VERSION_MIN(amdgpu_ip_version(adev, GC_HWIP, 0));
 u32 mes_sched =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
 printk(KERN_INFO "%s: ip_maj =3D %u ip_min =3D %u mes_sched =3D 0x%x", __=
func__, ip_maj, ip_min, mes_sched);

 return (ip_maj =3D=3D 11 && mes_sched >=3D 0x8c) ||
 ((ip_maj =3D=3D 12 && ip_min =3D=3D 0) && mes_sched >=3D 0x8d) ||
 ((ip_maj =3D=3D 12 && ip_min =3D=3D 1) && mes_sched >=3D 0x73);
}

returns false on my machine (because mes_sched is not large enough)

[ T8549] amdgpu_mes_queue_reset_by_mes_supported: ip_maj =3D 12 ip_min =3D=
 0 mes_sched =3D 0x76

So I skipped the call to amdgpu_mes_queue_reset_by_mes_supported()

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drive=
rs/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 5c9dfb0c424f..462f20aeb681 100644
=2D-- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -448,17 +448,22 @@ static int reset_queues_mes(struct device_queue_mana=
ger *dqm, struct queue *q)
        unsigned int num_hung =3D 0;
        int r =3D 0;
        struct mes_remove_queue_input queue_input;
+       printk(KERN_INFO "entering %s", __func__);
=20
+       /*
        if (!amdgpu_mes_queue_reset_by_mes_supported(adev)) {
                r =3D -ENOTRECOVERABLE;
+               printk(KERN_INFO "%s: reset by mes not supported", __func_=
_);
                goto fail;
-       }
+       }*/
+       printk(KERN_INFO "%s: skip calling amdgpu_mes_queue_reset_by_mes_s=
upported()", __func__);
=20
        /* reset should be used only in dqm locked queue reset */
        if (WARN_ON(dqm->detect_hang_count > 0))
                return 0;
=20
        if (!amdgpu_gpu_recovery) {
+               printk(KERN_INFO "%s: gpu recovery not enabled", __func__)=
;
                r =3D -ENOTRECOVERABLE;
                goto fail;
        }
@@ -470,6 +475,7 @@ static int reset_queues_mes(struct device_queue_manage=
r *dqm, struct queue *q)
        queue_input.xcc_id =3D ffs(dqm->dev->xcc_mask) - 1;
        /* pass the known bad queue info to the reset function */
        r =3D amdgpu_gfx_reset_mes_compute(adev, NULL, NULL, NULL, &num_hu=
ng, &queue_input);
+       printk(KERN_INFO "%s: amdgpu_gfx_reset_mes_compute() returned %d",=
 __func__, r);
        if (r)
                goto fail;
=20
@@ -3231,6 +3237,7 @@ int kfd_dqm_suspend_bad_queue_mes(struct kfd_node *k=
node, u32 pasid, u32 doorbel
        struct qcm_process_device *qpd;
        struct queue *q =3D NULL;
        int ret =3D 0;
+       printk(KERN_INFO "entering %s", __func__);
=20
        if (!pdd)
                return -EINVAL;
@@ -3242,6 +3249,7 @@ int kfd_dqm_suspend_bad_queue_mes(struct kfd_node *k=
node, u32 pasid, u32 doorbel
=20
                list_for_each_entry(q, &qpd->queues_list, list) {
                        if (q->doorbell_id =3D=3D doorbell_id && q->proper=
ties.is_active) {
+                               printk(KERN_INFO "%s: calling recover_bad_=
queue_mes() for queue %px", __func__, q);

and got this output when running the hsaruntime (which inject illegal opco=
des into the
command stream) test:

[  113.811612] [    T645] [drm:gfx_v12_0_bad_op_irq [amdgpu]] *ERROR* Ille=
gal opcode in command stream
[  113.811675] [   T2558] entering kfd_dqm_suspend_bad_queue_mes
[  113.811676] [   T2558] kfd_dqm_suspend_bad_queue_mes: calling recover_b=
ad_queue_mes() for queue ffffa03160950400
[  113.811676] [   T2558] entering reset_queues_mes
[  113.811677] [   T2558] reset_queues_mes: skip calling amdgpu_mes_queue_=
reset_by_mes_supported()
[  113.811887] [   T2558] reset_queues_mes: amdgpu_gfx_reset_mes_compute()=
 returned 0

So even though  amdgpu_mes_queue_reset_by_mes_supported() reported false,
amdgpu_gfx_reset_mes_compute() returns 0, suggesting that resetting actual=
ly works here!

Perhaps the minimum required mes_sched version for 12.0 can be relaxed to =
0x76 to solve this:

=46rom 6d7af652177063963012eb4df228e99caeb03b31 Mon Sep 17 00:00:00 2001
From: Bert Karwatzki <spasswolf@web.de>
Date: Mon, 6 Jul 2026 14:36:22 +0200
Subject: [PATCH] amdgpu: relax required mes_sched version

This mes_sched version is actually enough on this hardware:
03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AM=
D/ATI] Navi 44 [Radeon RX 9060 XT] [1002:7590] (rev c0)

[    3.200538] [    T537] amdgpu 0000:03:00.0: initializing kernel modeset=
ting (IP DISCOVERY 0x1002:0x7590 0x148C:0x2437 0xC0).
[    3.200546] [    T537] amdgpu 0000:03:00.0: register mmio base: 0xDFC00=
000
[    3.200547] [    T537] amdgpu 0000:03:00.0: register mmio size: 524288
[    3.203739] [    T537] amdgpu 0000:03:00.0: detected ip block number 0 =
<common_v1_0_0> (soc24_common)
[    3.203740] [    T537] amdgpu 0000:03:00.0: detected ip block number 1 =
<gmc_v12_0_0> (gmc_v12_0)
[    3.203741] [    T537] amdgpu 0000:03:00.0: detected ip block number 2 =
<ih_v7_0_0> (ih_v7_0)
[    3.203741] [    T537] amdgpu 0000:03:00.0: detected ip block number 3 =
<psp_v14_0_0> (psp)
[    3.203742] [    T537] amdgpu 0000:03:00.0: detected ip block number 4 =
<smu_v14_0_0> (smu)
[    3.203742] [    T537] amdgpu 0000:03:00.0: detected ip block number 5 =
<dce_v1_0_0> (dm)
[    3.203743] [    T537] amdgpu 0000:03:00.0: detected ip block number 6 =
<gfx_v12_0_0> (gfx_v12_0)
[    3.203743] [    T537] amdgpu 0000:03:00.0: detected ip block number 7 =
<sdma_v7_0_0> (sdma_v7_0)
[    3.203744] [    T537] amdgpu 0000:03:00.0: detected ip block number 8 =
<vcn_v5_0_0> (vcn_v5_0_0)
[    3.203744] [    T537] amdgpu 0000:03:00.0: detected ip block number 9 =
<jpeg_v5_0_0> (jpeg_v5_0_0)
[    3.203745] [    T537] amdgpu 0000:03:00.0: detected ip block number 10=
 <mes_v12_0_0> (mes_v12_0)

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_mes.c
index 6c0dde3786e3..c88fdc8a187d 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -869,7 +869,7 @@ bool amdgpu_mes_queue_reset_by_mes_supported(struct am=
dgpu_device *adev)
 u32 mes_sched =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
=20
 return (ip_maj =3D=3D 11 && mes_sched >=3D 0x8c) ||
- ((ip_maj =3D=3D 12 && ip_min =3D=3D 0) && mes_sched >=3D 0x8d) ||
+ ((ip_maj =3D=3D 12 && ip_min =3D=3D 0) && mes_sched >=3D 0x76) ||
 ((ip_maj =3D=3D 12 && ip_min =3D=3D 1) && mes_sched >=3D 0x73);
 }
=20
=2D-=20
2.53.0


Bert Karwatzki
