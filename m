Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED229405;
	Sun,  1 Feb 2026 00:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769905502; cv=none; b=lZxKoIlv3NVZAUmX1BvCbBrqcR919A+f49A5ZjyX9X7FmWpEPSmd2VjrbE4/wnHTJA54GQg1s5vc1QQ6Hfv5Vxlm4h164xfr8v4uQDBqDgDtGdi5gUBO+fb40MrbtcTuOJ41b+wvvgYNBgyRkIJpQVdxhFk4E042kQRxLX98kWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769905502; c=relaxed/simple;
	bh=Ukx8E4ed/zAeFj5RT6QwKqbf1wBp9lsIBteVROFMYf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Opid8Oya7y3KaOTJ8t0o3MecYMwlzSGB7BTeqhs+mjqp7hx3+hvu8ib6Tttm0U2N7louf6OyB0UFyq99O9Lgl0830a05siVlV+HnJQ+raDGVrp/P4EyBa7je4A+LZXMiGXXHueVKPOSmVsxoMpd4GX92VrvQboXJuu2OH5BobWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=PGe7Hp1G; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="PGe7Hp1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769905489; x=1770510289; i=spasswolf@web.de;
	bh=y0V9evUWCSrc36tGmZkyA+MaUew9cEUr5/Zz2d8SD/4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PGe7Hp1GevPsp2/Z8bflGiozAauHpcEQiPvWgNDGJUpVZSNKFE73ED+yr3sON+wj
	 77l16Xnhto4USvqqhvGfubdWRiEKd40vtReQziuSqejiNx45FS621vBE7WU4TfbDS
	 Ywl8X5P8ylLcH8tqRHYV73mtDkpIvbltFfXjGXiB6OTgUE33WRY8bkhMiTF7yC9Th
	 i5Bqu5Hv7VLInANdavZ4T9q2agXIyVqUxUPjgY0ucc4TTmlei3XSuH/zrJcMuGXci
	 K+yHQaAsBbBQLWryMAH5YnpS4Yrc153F/eMyhbm6da63ae+QoA/OHx5MWeOdPDK0C
	 d4yCn4nw6ck67C9ckA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MpU1w-1w4uNR1TYK-00be1z; Sun, 01 Feb 2026 01:24:49 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"
Date: Sun,  1 Feb 2026 01:24:45 +0100
Message-ID: <20260201002446.1293486-1-spasswolf@web.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sn8qE80Gv/XGh35Mtij6Yfr923Y6MWZEmL1cr19ydeNwDae6HlA
 V0tlzMngsUmFXyhX2FNRjuqmMPMPAbMHAeNk59JNFJIMmzD0UHnt2RKSY7CkJyv0WojkPgu
 ACDGq7mX547b1BhyVq2qyTukH8tZnCMWs3ywN3LWkJE3cNdiqNjGuxESaI0gOjO+SK5kZwy
 UHOoGXfChalPBAK1udsEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qm+Fr8jbReU=;hSO66Ijx9/ojW8PGhEsw5tno1gd
 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

This reverts commit 7294863a6f01248d72b61d38478978d638641bee.

This commit was erroneously applied again after commit 0ab5d711ec74=20
("drm/amd: Refactor `amdgpu_aspm` to be evaluated per device")
removed it, leading to very hard to debug crashes, when used with a system=
 with two
AMD GPUs of which only one supports ASPM.

Link: https://lore.kernel.org/linux-acpi/20251006120944.7880-1-spasswolf@w=
eb.de/
Link: https://github.com/acpica/acpica/issues/1060
Fixes: 0ab5d711ec74 ("drm/amd: Refactor `amdgpu_aspm` to be evaluated per =
device")

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_drv.c
index d6d0a6e34c6b..95d26f086d54 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2405,9 +2405,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 			return -ENODEV;
 	}
=20
-	if (amdgpu_aspm =3D=3D -1 && !pcie_aspm_enabled(pdev))
-		amdgpu_aspm =3D 0;
-
 	if (amdgpu_virtual_display ||
 	    amdgpu_device_asic_has_dc_support(pdev, flags & AMD_ASIC_MASK))
 		supports_atomic =3D true;
=2D-=20
2.47.3
